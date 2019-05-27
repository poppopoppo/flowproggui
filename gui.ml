
let font_name = "DejaVu Sans Mono 12"

let cols = new GTree.column_list
let str_col = cols#add Gobject.Data.string

open StdLabels
let file_dialog ~title ~callback filename =
  let sel =
    GWindow.file_selection ~title ~modal:true ?filename:filename () in
  sel#cancel_button#connect#clicked ~callback:sel#destroy;
  sel#ok_button#connect#clicked ~callback:
    begin fun () ->
      let name = sel#filename in
      sel#destroy ();
      callback name
    end;
  sel#show ()

let input_channel b ic =
  let buf = Bytes.create 1024 and len = ref 0 in
  while len := input ic buf 0 1024; !len > 0 do
    Buffer.add_subbytes b buf 0 !len
  done

let with_file name ~f =
  let ic = open_in name in
  try f ic; close_in ic with exn -> close_in ic; raise exn

open GdkKeysyms

(* Create the list of "messages" *)
let create_list () =
  (* Create a new scrolled window, with scrollbars only if needed *)
  let scrolled_window = GBin.scrolled_window
      ~hpolicy:`AUTOMATIC ~vpolicy:`ALWAYS () in

  let model = GTree.list_store cols in
  let treeview = GTree.view ~model ~packing:(scrolled_window#add_with_viewport) () in

  for i = 0 to 10 do
    let iter = model#append () in
    model#set ~row:iter ~column:str_col (Printf.sprintf "Message #%d" i)
  done;
  let renderer = GTree.cell_renderer_text [] in
  let column = GTree.view_column ~title:"Messages"
      ~renderer:(renderer, ["text", str_col]) () in
  ignore (treeview#append_column column);
  scrolled_window#coerce

(* Add some text to our text widget - this is a callback that is invoked
 * when our window is realized. We could also force our window to be
 * realized with #misc#realize, but it would have to be part of
 * a hierarchy first *)
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

let create_navigate_view theme =
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
  source_view

let scrolled v =
  let scrolled_window = GBin.scrolled_window
      ~hpolicy:`ALWAYS  ~vpolicy:`ALWAYS () in
  scrolled_window#add v;
  scrolled_window

let radio_event toolbar style () =
  toolbar#set_style style

(* just check given toggle button and enable/disable
 * tooltips *)
let toggle_event toolbar button () =
  toolbar#set_tooltips button#active

let main () =
  let filename = Hashtbl.create 10 in

  let window = GWindow.window ~title:"Paned Windows"
      ~width:800 ~height:500 () in

  ignore (window#connect#destroy ~callback:GMain.Main.quit);
  window#maximize ();


  let vbox = GPack.vbox ~packing:window#add () in
  let menubar = GMenu.menu_bar ~packing:vbox#pack () in

  let toolbar = GButton.toolbar
      ~orientation:`HORIZONTAL
      ~style:`BOTH
      ~border_width:5 (* ~space_size:5 *)
      ~packing:vbox#pack () in

  let icon () =
    (* let info = GDraw.pixmap_from_xpm ~file:"gtk.xpm" () in
       (GMisc.pixmap ~width:3 ~height:3 info ())#coerce *)
    (*  (GMisc.image ~pixbuf:(GdkPixbuf.from_file_at_size "gtk.xpm" 20 20) ())#coerce *)
    (GMisc.image ~icon_size:`MENU ~stock:`REFRESH ())#coerce
  in

  (* our first item is "close" button *)
  let button = toolbar#insert_button
      ~text:"Close"
      ~tooltip:"Close this app"
      ~tooltip_private:"Private"
      ~icon:(icon ())
      ~callback:GMain.Main.quit () in
  toolbar#insert_space (); (* space after item *)

  (* now, lets make our radio buttons group... *)
  let icon_button = toolbar#insert_radio_button
      ~text:"Icon"
      ~tooltip:"Only icons in toolbar"
      ~tooltip_private:"Private"
      ~icon:(icon ())
      ~callback:(radio_event toolbar `ICONS) () in
  toolbar#insert_space ();

  (* following radio buttons refer to previous ones *)
  let text_button = toolbar#insert_radio_button
      ~text:"Text"
      ~tooltip:"Only texts in toolbar"
      ~tooltip_private:"Private"
      ~icon:(icon ())
      ~callback:(radio_event toolbar `TEXT) () in
  text_button#set_group icon_button#group;
  toolbar#insert_space ();


  let both_button = toolbar#insert_radio_button
      ~text:"Both"
      ~tooltip:"Icons and text in toolbar"
      ~tooltip_private:"Private"
      ~icon:(icon ())
      ~callback:(radio_event toolbar `BOTH) () in
  both_button#set_group text_button#group;
  both_button#set_active true;
  toolbar#insert_space ();

  (* here we have just a simple toggle button *)
  let tooltip_button = toolbar#insert_toggle_button
      ~text:"Tooltips"
      ~tooltip:"Toolbar with or without tips"
      ~tooltip_private:"Private"
      ~icon:(icon ()) () in
  ignore (tooltip_button#connect#clicked ~callback:(toggle_event toolbar tooltip_button));
  tooltip_button#set_active true;
  toolbar#insert_space ();

  (* to pack a widget into toolbar, we only have to
   * create it and append it with appropriate tooltip *)
  let entry = GEdit.entry () in
  toolbar#insert_widget
    ~tooltip:"This is just an entry"
    ~tooltip_private:"Private"
    entry#coerce;

  let factory = new GMenu.factory ~accel_path:"<EDITOR2>/" menubar  in
  let accel_group = factory#accel_group in
  let file_menu = factory#add_submenu "File" in
  let edit_menu = factory#add_submenu "Edit" in


  let hpaned = GPack.paned `HORIZONTAL  ~packing:(vbox#pack ~expand:true) () in

  let notebook = GPack.notebook ~packing:(hpaned#pack1 ~resize:true ~shrink:true) () in
  let current_view () =
    let v = Hashtbl.find filename notebook#current_page in
    v in
  let mgr =
    GSourceView2.source_style_scheme_manager ~default:true in
  let theme =
    (match mgr#style_scheme "oblivion" with
     | Some x -> x
     | None -> raise @@ Failure "not found style_scheme"
    ) in

  let create_code_view f =
    let text =
      ( match f with
        | Some name ->
          ( try
              let b = Buffer.create 1024 in
              with_file name ~f:(input_channel b);
              let s = Glib.Convert.locale_to_utf8 (Buffer.contents b) in
              s
            with _ -> prerr_endline "Load failed"; raise @@ Failure "Load failed"
          )
        | None -> "" ) in
    let buffer = GSourceView2.source_buffer ~style_scheme:theme ~text:text () in
    let source_view =
      GSourceView2.source_view
        ~source_buffer:buffer
        ~auto_indent:true
        ~insert_spaces_instead_of_tabs:false ~tab_width:2
        ~show_line_numbers:true
        (* ~show_line_marks:true *)
        ~highlight_current_line:true
        ~indent_width:2
        (* ~right_margin_position:80 ~show_right_margin:true  *)
        (* ~smart_home_end:true *)
        ~width:300
        () in
    (* source_view#misc#set_size_request ~height:578 (); *)
    source_view#set_draw_spaces [`SPACE; `NEWLINE; `TAB];
    source_view#misc#modify_font_by_name font_name;
    let i = notebook#append_page (scrolled source_view#coerce)#coerce in
    Hashtbl.add filename i (f,source_view);
    notebook#goto_page i;
    () in
  let _ = create_code_view None in

  let vpaned = GPack.paned `VERTICAL ~width:220 ~packing:(hpaned#pack2 ~resize:true ~shrink:true) () in


  let create_shell_view theme =
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
    let (b0,b1) = source_view#source_buffer#bounds in
    let iter = ref b1 in
    let iter_start = ref b1 in
    source_view#source_buffer#create_tag ~name:"not_editable" [`EDITABLE false];
    let key_press k =
      let (b0,b1) = source_view#source_buffer#bounds in
      iter := b1;
      source_view#source_buffer#place_cursor ~where:!iter;
      if (GdkEvent.Key.keyval k)=GdkKeysyms._Return
      then
        (print_string "escape pressed\n";flush stdout;
         source_view#source_buffer#insert ~iter:!iter ~tag_names:["not_editable"] "\n» ";
         true)
      else  (* let iter = source_view#source_buffer#start_iter in *)
        (* if (!iter#compare !iter_start)>=0
           then (source_view#source_buffer#insert ~iter:!iter "█!?";
              false)
           else false *) false
    in
    source_view#event#connect#key_press ~callback:(fun k -> key_press k);
    source_view#event#connect#after#key_release
      ~callback:(fun _ ->
          (* let (b0,b1) = source_view#source_buffer#bounds in
             iter := b1;
             source_view#source_buffer#insert ~iter:!iter "█"; *)
          false);
    source_view#misc#modify_font_by_name font_name;
    source_view in

  let navi_view = create_navigate_view theme in
  let shell_view = create_shell_view theme in

  let open_file () = file_dialog ~title:"Open" ~callback:(fun s -> create_code_view (Some s)) None in

  let output ~file () =
    try
      if Sys.file_exists file then Sys.rename file (file ^ "~");
      let cv = current_view () in
      let s = (snd cv)#source_buffer#get_text () in
      let oc = open_out file in
      output_string oc (Glib.Convert.locale_from_utf8 s);
      close_out oc;
      Hashtbl.add filename notebook#current_page (Some file,snd cv);
      print_string ("\'"^file^"\' is saved\n");flush stdout
    with _ -> prerr_endline "Save failed"
  in
  let save_dialog () =
    file_dialog ~title:"Save"
      ~callback:(fun file -> output ~file:file ()) None in

  let save_file () =
    match fst (current_view ()) with
      Some file -> output ~file ()
    | None -> save_dialog ()  in

  let quit _ =
    let flg =
      let b = ref [] in
      Hashtbl.iter (fun _ v -> if (snd v)#source_buffer#modified then b:=((fst v)::!b)) filename;
      !b in
    match flg with
    | [] -> window#destroy ()
    | hd::tl ->
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
          | `QUIT -> dialog#destroy (); window#destroy ()
          | `CANCEL | `DELETE_EVENT -> dialog#destroy ());
      dialog#show () in

  ignore @@ window#event#connect#delete
    ~callback:(fun _ -> quit ();true);
  vpaned#pack1 ~resize:true ~shrink:true (scrolled navi_view#coerce)#coerce;
  vpaned#pack2 ~resize:true ~shrink:true (scrolled shell_view#coerce)#coerce;

  let file_factory = new GMenu.factory ~accel_path:"<EDITOR2 File>/////" file_menu ~accel_group
  in
  file_factory#add_item "Open" ~key:_O ~callback:(open_file);
  file_factory#add_item "Save" ~key:_S ~callback:(save_file);
  file_factory#add_item "Save as..." ~callback:(save_dialog);
  file_factory#add_separator ();
  file_factory#add_item "Quit" ~key:_Q ~callback:window#destroy;

  let edit_factory = new GMenu.factory ~accel_path:"<EDITOR2 File>///" edit_menu ~accel_group in
  edit_factory#add_item "Copy" ~key:_C ~callback:
    (fun () -> (snd @@ current_view ())#source_buffer#copy_clipboard GMain.clipboard);
  edit_factory#add_item "Cut" ~key:_X ~callback:
    (fun () -> GtkSignal.emit_unit
        (snd @@ current_view ())#as_view GtkText.View.S.cut_clipboard);
  edit_factory#add_item "Paste" ~key:_V ~callback:
    (fun () -> GtkSignal.emit_unit
        (snd @@ current_view ())#as_view GtkText.View.S.paste_clipboard);
  edit_factory#add_separator ();

  edit_factory#add_check_item "Read only" ~active:false
    ~callback:(fun b -> (snd @@ current_view ())#set_editable (not b));
  edit_factory#add_item "Save accels"
    ~callback:(fun () -> GtkData.AccelMap.save "test.accel");

  window#add_accel_group accel_group;
  (snd @@ current_view ())#event#connect#button_press
    ~callback:(fun ev ->
        let button = GdkEvent.Button.button ev in
        if button = 3 then begin
          file_menu#popup ~button ~time:(GdkEvent.Button.time ev); true
        end else false);

  let () = GtkData.AccelMap.load "test.accel" in
  GtkData.AccelMap.foreach
    (fun ~path ~key ~modi ~changed ->
       if modi = [`CONTROL] then
         if GtkData.AccelMap.change_entry path ~key ~modi:[`MOD1]
         then prerr_endline ("Changed " ^ path)
         else prerr_endline ("Could not change "^path));

  let iter_shell = shell_view#source_buffer#get_iter_at_char 0 in
  (*  shell_view#source_buffer#insert ~iter:iter_shell "shell view\n"; *)
  shell_view#source_buffer#insert ~iter:iter_shell ~tag_names:["not_editable"] "» ";

  let iter_navi = navi_view#source_buffer#get_iter_at_char 0 in
  navi_view#source_buffer#insert ~iter:iter_navi "Theshowing the same buffer in two places.\n\n";

  (* shell_view#misc#set_size_request ~height:250 (); *)
  window#show ();
  GMain.Main.main ()

let _ = Printexc.print main ()
