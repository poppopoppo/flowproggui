
open GdkKeysyms
open StdLabels

let font_name = "DejaVu Sans Mono 12"
let theme_name = "tomorrownightbright" (* "cobalt" *)
let lang_file = "test"
let space_mark = false

let file_dialog ~title ~callback filename =
  let sel =
    GWindow.file_selection ~title ~modal:true ?filename:filename () in
  let _ = sel#cancel_button#connect#clicked ~callback:sel#destroy in
  let _ = sel#ok_button#connect#clicked ~callback:
      begin fun () ->
        let name = sel#filename in
        sel#destroy ();
        callback name
      end in
  sel#show ()

let input_channel b ic =
  let buf = Bytes.create 1024 and len = ref 0 in
  while len := input ic buf 0 1024; !len > 0 do
    Buffer.add_subbytes b buf 0 !len
  done

let with_file name ~f =
  let ic = open_in name in
  try f ic; close_in ic with exn -> close_in ic; raise exn

let scrolled v =
  let scrolled_window = GBin.scrolled_window
      ~hpolicy:`ALWAYS  ~vpolicy:`AUTOMATIC () in
  scrolled_window#add v;
  scrolled_window

type log_signal = LOG of string
let log_signal:(log_signal GUtil.signal) = new GUtil.signal ()

let dbg = true
let pnt s =
  if dbg
  then (print_string s; flush stdout)
  else log_signal#call (LOG s)

let shell_global = ref ""
let shell_signal = new GUtil.signal ()
let _ =
  shell_signal#connect ~after:false
    ~callback:(fun s ->
        shell_global:=s;
        pnt ("signal called:"^(!shell_global)^"\n"))
let code_global = ref 0
let code_signal:(unit GUtil.signal) = new GUtil.signal ()

let navi_global = ref ""
type navi_signal = ENTER_SHELL | ENTER_CODE
let navi_signal:(navi_signal GUtil.signal) = new GUtil.signal ()
type engine_signal = MODULE_IMPORT
let global_signal:([< `MODULE_IMPORT ] GUtil.signal) = new GUtil.signal ()
let engine_signal:([< `MODULE_IMPORT ] GUtil.signal) = new GUtil.signal ()

let st = ref Implib.init_st
let mdl = ref []
let code_view_list = Hashtbl.create 10

let init_ide = ([],Implib.init_st)
let get_ide () =
  let st = !st in
  let filenames = ref [] in
  Hashtbl.iter (fun i ((n,l),v) ->
      match n with
      | None -> ()
      | Some n -> filenames:=n::!filenames) code_view_list;
  (!filenames,st)

let main () =

  let mgr =
    GSourceView2.source_style_scheme_manager ~default:true in
  mgr#set_search_path ([Sys.getcwd ()]@mgr#search_path);
  let theme =
    (match mgr#style_scheme theme_name with
     | Some x -> x
     | None -> raise @@ Failure "not found style_scheme"
    ) in

  let lang_mime_type = "text/x-ocaml" in
  let lang_mgr = GSourceView2.source_language_manager ~default:true in
  lang_mgr#set_search_path ([Sys.getcwd ()]@lang_mgr#search_path);
  let lang = lang_mgr#language lang_file in
  ( match lang with
    | None -> pnt "can't find language file\n"
    | Some s -> pnt ("language "^lang_file^" is loaded\n")
  );

  let (fn,st0) =
    let fn =
      (try
         (Str.split (Str.regexp_string ",")
            (Util.open_in_close "default.cfg" (fun c -> input_line c))
         )
       with _ -> []) in
    ( try
        (fn,Implib.load_from_file "default.st")
      with _ -> pnt "initial load failed\n";init_ide
    ) in
  pnt ("⟦"^(Util.string_of_list "," (fun x -> x) fn)^"⟧ is loaded\n");
  st := st0;

  let _ = GMain.Main.init () in


  let window = GWindow.window ~title:"Paned Windows"
      ~width:800 ~height:500 () in
  let _ = window#connect#destroy ~callback:GMain.Main.quit in
  let _ = window#maximize () in

  let vbox = GPack.vbox ~packing:window#add () in
  let menubar = GMenu.menu_bar ~packing:vbox#pack () in
  let toolbar = GButton.toolbar
      ~orientation:`HORIZONTAL
      ~style:`ICONS
      ~border_width:5 (* ~space_size:5 *)
      ~packing:vbox#pack () in
  let factory = new GMenu.factory ~accel_path:"<EDITOR2>/" menubar  in
  let accel_group = factory#accel_group in
  let file_menu = factory#add_submenu "File" in
  let edit_menu = factory#add_submenu "Edit" in

  let hpaned = GPack.paned `HORIZONTAL  ~packing:(vbox#pack ~expand:true) () in
  let statusbar = GMisc.statusbar ~packing:vbox#pack () in

  let notebook = GPack.notebook ~packing:(hpaned#pack1 ~resize:true ~shrink:true) () in
  let current_view () =
    pnt ("current_view:"^(string_of_int notebook#current_page)^"\n");
    let v = Hashtbl.find code_view_list notebook#current_page in
    v in

  let create_code_view f =
    let (name,text) =
      ( match f with
        | Some name ->
          ( try
              let b = Buffer.create 1024 in
              with_file name ~f:(input_channel b);
              let s = Glib.Convert.locale_to_utf8 (Buffer.contents b) in
              (Filename.basename name,s)
            with _ -> prerr_endline "Load failed"; raise @@ Failure "Load failed"
          )
        | None -> ("*unsaved","")) in
    let buffer = GSourceView2.source_buffer ~style_scheme:theme ~text:text () in
    buffer#set_language lang;
    buffer#set_highlight_syntax true;

    let source_view =
      GSourceView2.source_view
        ~source_buffer:buffer ~auto_indent:true
        ~insert_spaces_instead_of_tabs:false ~tab_width:2
        ~show_line_numbers:true ~highlight_current_line:true ~indent_width:2 ~width:300
        () in

    let _ = source_view#event#connect#focus_in
        ~callback:(fun _ -> navi_signal#call ENTER_CODE;false) in

    (if space_mark then source_view#set_draw_spaces [`SPACE; `NEWLINE; `TAB]);
    source_view#misc#modify_font_by_name font_name;
    let label = (GMisc.label ~text:name ()) in
    let i = notebook#append_page ~tab_label:label#coerce (scrolled source_view#coerce)#coerce in
    Hashtbl.add code_view_list i ((f,label),source_view);
    notebook#goto_page i;
    pnt ("new file(name="^(match f with |None -> "" | Some s -> s)^",page="^(string_of_int i)^") is created\n");
    () in

  let vpaned = GPack.paned `VERTICAL ~width:220 ~packing:(hpaned#pack2 ~resize:true ~shrink:true) () in
  let notebook_shell = GPack.notebook ~packing:(vpaned#pack2 ~resize:true ~shrink:true) () in

  let  shell_view =
    let buffer = GSourceView2.source_buffer  ~style_scheme:theme () in
    let source_view =
      GSourceView2.source_view
        ~source_buffer:buffer
        ~tab_width:2
        (* ~show_line_marks:true *)
        ~indent_width:2
        ~editable:true
        ~cursor_visible:true
        (* ~right_margin_position:80 ~show_right_margin:true  *)
        (* ~smart_home_end:true *)
        ~width:300
        () in
    let (_,b1) = buffer#bounds in
    let iter = ref b1 in
    let _ = buffer#create_tag ~name:"not_editable" [`EDITABLE false] in
    let insert s = buffer#insert ~iter:!iter s in
    let insert_arr () = buffer#insert ~iter:!iter ~tag_names:["not_editable"] "\n» " in
    insert (Imp.string_of_st (snd !st));
    insert_arr ();
    let mark_start = ref (buffer#create_mark !iter) in
    let key_press k =
      let (_,b1) = buffer#bounds in
      iter := b1;
      buffer#place_cursor ~where:!iter;
      if (GdkEvent.Key.keyval k)=GdkKeysyms._Return
      then
        let _ = (insert "\n") in
        let line = (buffer#get_text ~start:(buffer#get_iter_at_mark (`MARK !mark_start)) ~stop:!iter ()) in
        st:=
          (try
             Implib.evo !st (Implib.ast_from_string line)
           with
           | Failure s -> pnt ("error:"^s^"\n");
             buffer#insert ~iter:!iter ("error:parsing error:"^s^"\n");
             !st );
        insert ("~~~~~~~~~~~~~~~~~~~\n"^(Imp.string_of_st (snd !st)));
        insert_arr ();
        mark_start:=buffer#create_mark !iter;
        source_view#scroll_mark_onscreen (`MARK !mark_start);
        (pnt "enter pressed\n";
         shell_signal#call line;
         true)
      else false
    in
    let _ = source_view#event#connect#key_press ~callback:(fun k -> key_press k) in
    let _ = source_view#event#connect#focus_in
        ~callback:(fun _ -> navi_signal#call ENTER_SHELL;false) in
    let _ = source_view#event#connect#after#key_release
        ~callback:(fun _ ->
            (* let (b0,b1) = source_view#source_buffer#bounds in
               iter := b1;
               source_view#source_buffer#insert ~iter:!iter "█"; *)
            false) in
    source_view#misc#modify_font_by_name font_name;
    source_view in
  let navi_view =
    let buffer = GSourceView2.source_buffer ~text:"navigate view \n" ~style_scheme:theme () in
    let source_view = GSourceView2.source_view
        ~source_buffer:buffer ~tab_width:2
        ~indent_width:2 ~editable:false ~cursor_visible:false
        ~width:300
        () in
    source_view#misc#modify_font_by_name font_name;
    source_view in
  let iter_shell = shell_view#source_buffer#get_iter_at_char 0 in

  let global_view =
    let buffer = GSourceView2.source_buffer ~style_scheme:theme () in
    let source_view = GSourceView2.source_view
        ~source_buffer:buffer ~tab_width:2
        ~indent_width:2 ~editable:false ~cursor_visible:false
        () in
    source_view#misc#modify_font_by_name font_name;
    let iter_global = source_view#source_buffer#get_iter_at_char 0 in
    global_signal#connect ~after:false
      ~callback:(fun s ->
          match s with `MODULE_IMPORT -> buffer#insert ~iter:iter_global (Imp.string_of_gl_st (fst !st)));
    source_view in

  let log_view =
    let buffer = GSourceView2.source_buffer ~style_scheme:theme () in
    let source_view = GSourceView2.source_view
        ~source_buffer:buffer ~tab_width:2
        ~indent_width:2 ~editable:false ~cursor_visible:false
        () in
    source_view#misc#modify_font_by_name font_name;
    let iter_log = source_view#source_buffer#get_iter_at_char 0 in
    log_signal#connect ~after:false
      ~callback:(fun s ->
          match s with
          | LOG s ->
            let end_mark = source_view#source_buffer#create_mark source_view#source_buffer#end_iter in
            source_view#source_buffer#insert ~iter:iter_log s;
            source_view#source_buffer#move_mark (`MARK end_mark) ~where:iter_log;
            source_view#scroll_mark_onscreen (`MARK end_mark);
            ()
        );
    source_view in

  let _ =
    ( match fn with
      | [] -> create_code_view None
      | x -> List.map (fun a -> create_code_view (Some a)) x; ()
    ) in

  let _ =
    navi_signal#connect ~after:false
      ~callback:(fun s ->
          (match s with
           | ENTER_SHELL ->
             pnt ("entering shell view\n");
             navi_view#source_buffer#set_text "entering shell view\n"
           | ENTER_CODE ->
             pnt ("entering code view\n");
             navi_view#source_buffer#set_text "entering code view\n"
          ))
  in

  let open_file () = file_dialog ~title:"Open" ~callback:(fun s -> create_code_view (Some s)) None in

  let output ~file () =
    try
      if Sys.file_exists file then Sys.rename file (file ^ "~");
      let cv = current_view () in
      let s = (snd cv)#source_buffer#get_text () in
      let oc = open_out file in
      output_string oc (Glib.Convert.locale_from_utf8 s);
      close_out oc;
      (snd (fst cv))#set_label (Filename.basename file);
      Hashtbl.add code_view_list notebook#current_page ((Some file,(snd (fst cv))),snd cv);
      (snd cv)#source_buffer#set_modified false;
      print_string ("\'"^file^"\' is saved\n");flush stdout
    with _ -> prerr_endline "Save failed"
  in
  let save_dialog () =
    file_dialog ~title:"Save"
      ~callback:(fun file -> output ~file:file ()) None in

  let save_file () =
    match fst (fst (current_view ())) with
      Some file -> output ~file ()
    | None -> save_dialog ()  in

  let close_page _ =
    pnt "close_page\n";
    let (i,((name,label),cv)) = (notebook#current_page,current_view ()) in
    let b = cv#source_buffer#modified in
    if b
    then notebook#remove_page i
    else
      let file_name =
        match name with
        | Some f -> Printf.sprintf "File %S" f
        | None -> "Current buffer"
      in
      let dialog = GWindow.dialog ~title:"Close" () in
      let txt =
        let frame = GBin.frame ~border_width:40 ~shadow_type:`NONE () in
        frame#add
          (GMisc.label
             ~markup:(file_name^" contains unsaved changes. What to do ?") ()
           :> GObj.widget);
        (frame :> GObj.widget)
      in
      dialog#vbox#add txt;
      dialog#add_button_stock `CLOSE `CLOSE;
      dialog#add_button_stock `CANCEL `CANCEL;
      ignore @@ dialog#connect#response ~callback:(function
          | `CLOSE -> dialog#destroy (); notebook#remove_page i
          | `CANCEL | `DELETE_EVENT -> dialog#destroy ());
      dialog#show () in

  let quit _ =
    pnt "quit\n";
    let flg =
      let b = ref [] in
      Hashtbl.iter (fun _ v -> if (snd v)#source_buffer#modified then b:=((fst (fst v))::!b)) code_view_list;
      !b in
    let (fn,st) = get_ide () in
    match flg with
    | [] ->
      Implib.save_to_file st "default.st";
      let _ = Util.open_out_close "default.cfg" (fun c -> output_string c (Util.string_of_list "," (fun x -> x) fn)) in
      window#destroy ()
    | hd::_ ->
      let file_name = match hd with
        | Some f -> Printf.sprintf "File %S" f
        | None -> "Current buffer"
      in
      let dialog = GWindow.dialog ~title:"Quit" () in
      let txt =
        let frame = GBin.frame ~border_width:40 ~shadow_type:`NONE () in
        frame#add
          (GMisc.label
             ~markup:(file_name^" contains unsaved changes. What to do ?") ()
           :> GObj.widget);
        (frame :> GObj.widget)
      in
      dialog#vbox#add txt;
      dialog#add_button_stock `QUIT `QUIT;
      dialog#add_button_stock `CANCEL `CANCEL;
      ignore @@ dialog#connect#response ~callback:(function
          | `QUIT ->
            dialog#destroy ();
            let _ = Util.open_out_close "default.cfg" (fun c -> output_string c (Util.string_of_list "," (fun x -> x) fn)) in
            Implib.save_to_file st "default.st";
            window#destroy ()
          | `CANCEL | `DELETE_EVENT -> dialog#destroy ());
      dialog#show () in

  ignore @@ window#event#connect#delete
    ~callback:(fun _ -> quit ();true);
  vpaned#pack1 ~resize:true ~shrink:true (scrolled navi_view#coerce)#coerce;

  notebook_shell#append_page ~tab_label:(GMisc.label ~text:"shell" ())#coerce (scrolled shell_view#coerce)#coerce;
  notebook_shell#append_page ~tab_label:(GMisc.label ~text:"log" ())#coerce (scrolled log_view#coerce)#coerce;
  notebook_shell#append_page ~tab_label:(GMisc.label ~text:"global" ())#coerce (scrolled global_view#coerce)#coerce;

  let file_factory = new GMenu.factory ~accel_path:"<EDITOR2 File>/////" file_menu ~accel_group
  in
  let _ = file_factory#add_item "Open" ~key:_O ~callback:(open_file) in
  let _ = file_factory#add_item "Save" ~key:_S ~callback:(save_file) in
  let _ = file_factory#add_item "Save as..." ~callback:(save_dialog) in
  let _ = file_factory#add_separator () in
  let _ = file_factory#add_item "Quit" ~key:_Q ~callback:window#destroy in

  let edit_factory = new GMenu.factory ~accel_path:"<EDITOR2 File>///" edit_menu ~accel_group in
  let _ = edit_factory#add_item "Copy" ~key:_C ~callback:
      (fun () -> (snd @@ current_view ())#source_buffer#copy_clipboard GMain.clipboard) in
  let _ = edit_factory#add_item "Cut" ~key:_X ~callback:
      (fun () -> GtkSignal.emit_unit
          (snd @@ current_view ())#as_view ~sgn:GtkText.View.S.cut_clipboard) in
  let _ = edit_factory#add_item "Paste" ~key:_V ~callback:
      (fun () -> GtkSignal.emit_unit
          (snd @@ current_view ())#as_view ~sgn:GtkText.View.S.paste_clipboard) in
  let _ = edit_factory#add_separator () in

  let _ = edit_factory#add_check_item "Read only" ~active:false
      ~callback:(fun b -> (snd @@ current_view ())#set_editable (not b)) in
  let _ = edit_factory#add_item "Save accels"
      ~callback:(fun () -> GtkData.AccelMap.save "test.accel") in

  let _ = window#add_accel_group accel_group in
  let _ = (snd @@ current_view ())#event#connect#button_press
      ~callback:(fun ev ->
          let button = GdkEvent.Button.button ev in
          if button = 3 then begin
            file_menu#popup ~button ~time:(GdkEvent.Button.time ev); true
          end else false) in

  let () = GtkData.AccelMap.load "test.accel" in
  GtkData.AccelMap.foreach
    (fun ~path ~key ~modi ~changed ->
       let _ = changed in
       if modi = [`CONTROL] then
         if GtkData.AccelMap.change_entry path ~key ~modi:[`MOD1]
         then prerr_endline ("Changed " ^ path)
         else prerr_endline ("Could not change "^path));


  let _ = navi_view#source_buffer#get_iter_at_char 0 in

  let _ = toolbar#insert_button
      ~text:"New" ~tooltip:"create new file" ~tooltip_private:"Private"
      ~icon:(GMisc.image ~icon_size:`MENU ~stock:`NEW ())#coerce
      ~callback:(fun _ -> pnt "new button is pressed\n"; create_code_view None) () in
  toolbar#insert_space ();

  let _ = toolbar#insert_button
      ~text:"Open" ~tooltip:"open file"
      ~tooltip_private:"Private"
      ~icon:(GMisc.image ~icon_size:`MENU ~stock:`OPEN ())#coerce
      ~callback:(open_file) () in
  let _ = toolbar#insert_space () in

  let _ = toolbar#insert_button
      ~text:"Save" ~tooltip:"save file"
      ~tooltip_private:"Private"
      ~icon:(GMisc.image ~icon_size:`MENU ~stock:`SAVE ())#coerce
      ~callback:(save_file) () in
  toolbar#insert_space ();

  let _ = toolbar#insert_button
      ~text:"Import" ~tooltip:"import file"
      ~tooltip_private:"Private"
      ~icon:(GMisc.image ~icon_size:`MENU ~stock:`MEDIA_PLAY ())#coerce
      ~callback:(fun _ ->
          ( try
              pnt "import button pressed\n";
              let mdl0 =
                Implib.mdl_from_string @@
                (snd @@ current_view ())#source_buffer#get_text ()
              in
              mdl := (snd mdl0) @ !mdl;
              pnt "module is imported\n";
              engine_signal#call `MODULE_IMPORT;
              ()
            with | Failure s -> pnt ("error:module import:"^s^"\n")
                 | err -> pnt "error:module import:parsing error\n";raise err
          )
        ) () in
  toolbar#insert_space ();

  let _ = toolbar#insert_button
      ~text:"Close" ~tooltip:"Close current view"
      ~tooltip_private:"Private"
      ~icon:(GMisc.image ~icon_size:`MENU ~stock:`CLOSE ())#coerce
      ~callback:close_page () in
  toolbar#insert_space ();

  let _ = toolbar#insert_button
      ~text:"Quit" ~tooltip:"quit from app"
      ~tooltip_private:"Private"
      ~icon:(GMisc.image ~icon_size:`MENU ~stock:`QUIT ())#coerce
      ~callback:quit () in
  toolbar#insert_space ();

  engine_signal#connect
    ~after:false
    ~callback:(fun s ->
        match s with
        | `MODULE_IMPORT ->
          st := (!mdl@(fst !st),snd !st);
          global_signal#call `MODULE_IMPORT
        | _ -> ());
  (*
let engine () =
  in *)

  window#show ();
  GMain.Main.main ()

let _ = main ()
