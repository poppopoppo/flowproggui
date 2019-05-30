
open GdkKeysyms
open StdLabels

let dbg = true
let pnt s = if dbg then print_string s; flush stdout
let font_name = "DejaVu Sans Mono 12"

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

(* Create the list of "messages" *)

let insert_text (buffer: GText.buffer) =
  let iter = buffer#get_iter `START in
  buffer#insert ~iter (
    "From: pathfinder@nasa.gov\n" ^
    "To: mom@nasa.gov\n" ^
    "Subject: Made it!\n" ^
    "\n" ^
    "We just got in this morning. The weather has been\n" ^
    "great - clear but cold, and there are lots of fun sights.\n" ^
    "Sojourner says hi. See you soon.\n" ^
    " -Path\n")

(* Create a scrolled text area that displays a "message" *)
let create_text () =
  let scrolled_window = GBin.scrolled_window
      ~hpolicy:`AUTOMATIC  ~vpolicy:`ALWAYS () in
  let view = GText.view  ~packing:scrolled_window#add () in
  let buffer = view#buffer in
  insert_text buffer;
  scrolled_window#coerce

let scrolled v =
  let scrolled_window = GBin.scrolled_window
      ~hpolicy:`ALWAYS  ~vpolicy:`ALWAYS () in
  scrolled_window#add v;
  scrolled_window

let radio_event toolbar style () =
  toolbar#set_style style

let toggle_event toolbar button () =
  toolbar#set_tooltips button#active


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

let st = ref Implib.init_st
let mdl = ref ()
let code_view_list = Hashtbl.create 10

let init_ide = ([],Implib.init_st)
let get_ide =
  let st = !st in
  let filenames = ref [] in
  Hashtbl.iter (fun i ((n,l),v) -> filenames:=n::!filenames) code_view_list;
  (!filenames,st)

let main () =
  pnt "gui main\n";

  let ide = ref
    (try
       Implib.load_from_file "default.st"
     with _ -> init_ide) in
  st := (snd !ide);

  let cols = new GTree.column_list in
  let str_col = cols#add Gobject.Data.string in

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

  let notebook = GPack.notebook ~packing:(hpaned#pack1 ~resize:true ~shrink:true) () in
  let current_view () =
    pnt ("current_view:"^(string_of_int notebook#current_page)^"\n");
    let v = Hashtbl.find code_view_list notebook#current_page in
    v in
  let mgr =
    GSourceView2.source_style_scheme_manager ~default:true in
  let theme =
    (match mgr#style_scheme "oblivion" with
     | Some x -> x
     | None -> raise @@ Failure "not found style_scheme"
    ) in

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

    let source_view =
      GSourceView2.source_view
        ~source_buffer:buffer ~auto_indent:true
        ~insert_spaces_instead_of_tabs:false ~tab_width:2
        ~show_line_numbers:true ~highlight_current_line:true ~indent_width:2 ~width:300
        () in

    (* source_view#misc#set_size_request ~height:578 (); *)
    let _ = source_view#event#connect#focus_in
        ~callback:(fun _ -> navi_signal#call ENTER_CODE;false) in

    source_view#set_draw_spaces [`SPACE; `NEWLINE; `TAB];
    source_view#misc#modify_font_by_name font_name;
    let label = (GMisc.label ~text:name ()) in
    let i = notebook#append_page ~tab_label:label#coerce (scrolled source_view#coerce)#coerce in
    Hashtbl.add code_view_list i ((f,label),source_view);
    notebook#goto_page i;
    pnt ("new file(name="^(match f with |None -> "" | Some s -> s)^",page="^(string_of_int i)^") is created\n");
    () in

  let _ =
    ( match (fst !ide) with
      | [] -> create_code_view None
      | x -> List.map (fun a -> create_code_view (Some a)) x; ()
    ) in

  let vpaned = GPack.paned `VERTICAL ~width:220 ~packing:(hpaned#pack2 ~resize:true ~shrink:true) () in

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
    let mark_start = ref (buffer#create_mark !iter) in
    let _ = buffer#create_tag ~name:"not_editable" [`EDITABLE false] in
    let key_press k =
      let (_,b1) = buffer#bounds in
      iter := b1;
      buffer#place_cursor ~where:!iter;
      if (GdkEvent.Key.keyval k)=GdkKeysyms._Return
      then
        let line = (buffer#get_text ~start:(buffer#get_iter_at_mark (`MARK !mark_start)) ~stop:!iter ())^"\n" in
        st:=
          (try
             Implib.evo !st (Implib.ast_from_string line)
           with | _ -> pnt "parsing error\n"; !st);
        buffer#insert ~iter:!iter ("\n"^(Imp.string_of_st (snd !st)));
        buffer#insert ~iter:!iter ~tag_names:["not_editable"] "\n» ";
        mark_start:=buffer#create_mark !iter;

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
    let source_view =
      GSourceView2.source_view
        ~source_buffer:buffer
        ~tab_width:2
        (* ~show_line_marks:true *)
        ~indent_width:2
        ~editable:false
        ~cursor_visible:false

        (* ~right_margin_position:80 ~show_right_margin:true  *)
        (* ~smart_home_end:true *)
        ~width:300
        () in
    source_view#misc#modify_font_by_name font_name;
    source_view in

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
    match flg with
    | [] -> window#destroy ()
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
            Implib.save_to_file !ide;
            window#destroy ()
          | `CANCEL | `DELETE_EVENT -> dialog#destroy ());
      dialog#show () in

  ignore @@ window#event#connect#delete
    ~callback:(fun _ -> quit ();true);
  vpaned#pack1 ~resize:true ~shrink:true (scrolled navi_view#coerce)#coerce;
  vpaned#pack2 ~resize:true ~shrink:true (scrolled shell_view#coerce)#coerce;

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

  let iter_shell = shell_view#source_buffer#get_iter_at_char 0 in
  (*  shell_view#source_buffer#insert ~iter:iter_shell "shell view\n"; *)
  let _ = shell_view#source_buffer#insert ~iter:iter_shell ~tag_names:["not_editable"] "» " in

  let _ = navi_view#source_buffer#get_iter_at_char 0 in
  (* navi_view#source_buffer#insert ~iter:iter_navi "Theshowing the same buffer in two places.\n\n"; *)

  let _ = toolbar#insert_button
      ~text:"New"
      ~tooltip:"create new file"
      ~tooltip_private:"Private"
      ~icon:(GMisc.image ~icon_size:`MENU ~stock:`NEW ())#coerce
      ~callback:(fun _ -> pnt "new button is pressed\n"; create_code_view None) () in
  toolbar#insert_space ();

  let _ = toolbar#insert_button
      ~text:"Open"
      ~tooltip:"open file"
      ~tooltip_private:"Private"
      ~icon:(GMisc.image ~icon_size:`MENU ~stock:`OPEN ())#coerce
      ~callback:(open_file) () in
  let _ = toolbar#insert_space () in

  let _ = toolbar#insert_button
      ~text:"Save"
      ~tooltip:"save file"
      ~tooltip_private:"Private"
      ~icon:(GMisc.image ~icon_size:`MENU ~stock:`SAVE ())#coerce
      ~callback:(save_file) () in
  toolbar#insert_space ();

  let _ = toolbar#insert_button
      ~text:"Import"
      ~tooltip:"import file"
      ~tooltip_private:"Private"
      ~icon:(GMisc.image ~icon_size:`MENU ~stock:`MEDIA_PLAY ())#coerce
      ~callback:(fun _ ->
          mdl :=
            (try
               Implib.mdl_from_string @@ (snd @@ current_view ())#source_buffer#get_text ();
               pnt "module is imported\n"
             with _ -> pnt "error:module import:parsing error\n"; !mdl);
          pnt "import button pressed\n") () in
  toolbar#insert_space ();

  let _ = toolbar#insert_button
      ~text:"Close"
      ~tooltip:"Close current view"
      ~tooltip_private:"Private"
      ~icon:(GMisc.image ~icon_size:`MENU ~stock:`CLOSE ())#coerce
      ~callback:close_page () in
  toolbar#insert_space ();

  let _ = toolbar#insert_button
      ~text:"Quit"
      ~tooltip:"quit from app"
      ~tooltip_private:"Private"
      ~icon:(GMisc.image ~icon_size:`MENU ~stock:`QUIT ())#coerce
      ~callback:quit () in
  toolbar#insert_space ();

  (*
let engine () =
  in *)

  window#show ();
  GMain.Main.main ()

let _ = main ()
