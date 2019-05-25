
let font_name = "DejaVu Sans Mono 12"

let cols = new GTree.column_list
let str_col = cols#add Gobject.Data.string

open StdLabels
let filename = ref None
let buf = ref None
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

let load_file v theme (name:string) =
  try
    let b = Buffer.create 1024 in
    with_file name ~f:(input_channel b);
    let s = Glib.Convert.locale_to_utf8 (Buffer.contents b) in
    v#source_buffer#set_text s;
    filename := Some name; ()
  with _ -> prerr_endline "Load failed"

let open_file v theme () = file_dialog ~title:"Open" ~callback:(load_file v theme) None


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

let create_code_view theme =
  let buffer = GSourceView2.source_buffer ~style_scheme:theme () in
  let source_view =
    GSourceView2.source_view
      ~source_buffer:buffer
      ~auto_indent:true
      ~insert_spaces_instead_of_tabs:true ~tab_width:2
      ~show_line_numbers:true
      (* ~show_line_marks:true *)
      ~highlight_current_line:true
      ~indent_width:2
      (* ~right_margin_position:80 ~show_right_margin:true  *)
      (* ~smart_home_end:true *)
      ~height:500 ~width:300
      () in
  source_view#set_draw_spaces [`SPACE; `NEWLINE];
  source_view#misc#modify_font_by_name font_name;
  source_view
let create_navigate_view theme =
  let buffer = GSourceView2.source_buffer ~style_scheme:theme () in
  let source_view =
    GSourceView2.source_view
      ~source_buffer:buffer
      ~auto_indent:true
      ~insert_spaces_instead_of_tabs:true ~tab_width:2
      (* ~show_line_marks:true *)
      ~indent_width:2
      ~editable:false
      (* ~right_margin_position:80 ~show_right_margin:true  *)
      (* ~smart_home_end:true *)
      ~height:500 ~width:300
      () in
  source_view#set_draw_spaces [`SPACE; `NEWLINE];
  source_view#misc#modify_font_by_name font_name;
  source_view
let create_shell_view theme =
  let buffer = GSourceView2.source_buffer ~style_scheme:theme () in
  let source_view =
    GSourceView2.source_view
      ~source_buffer:buffer
      ~auto_indent:true
      ~insert_spaces_instead_of_tabs:true ~tab_width:2
      (* ~show_line_marks:true *)
      ~indent_width:2
      ~editable:false
      (* ~right_margin_position:80 ~show_right_margin:true  *)
      (* ~smart_home_end:true *)
      ~height:500 ~width:300
      () in
  source_view#set_draw_spaces [`SPACE; `NEWLINE];
  source_view#misc#modify_font_by_name font_name;
  source_view
let scrolled v =
  let scrolled_window = GBin.scrolled_window
      ~hpolicy:`AUTOMATIC  ~vpolicy:`ALWAYS () in
  scrolled_window#add v;
  scrolled_window
let main () =
  (* Create a new window; set title and border width *)
  let window = GWindow.window ~title:"Paned Windows"
      ~width:800 ~height:500 () in

  (* Set a handler for destroy event that immediately exits GTK. *)
  ignore (window#connect#destroy ~callback:GMain.Main.quit);

  (* create a vpaned widget and add it to our toplevel window *)
  let vbox = GPack.vbox ~packing:window#add () in
  let menubar = GMenu.menu_bar ~packing:vbox#pack () in
  let factory = new GMenu.factory ~accel_path:"<EDITOR2>/" menubar  in
  let accel_group = factory#accel_group in

  let file_menu = factory#add_submenu "File" in
  let edit_menu = factory#add_submenu "Edit" in

  let hpaned = GPack.paned `HORIZONTAL  ~packing:vbox#add () in

  let mgr =
    GSourceView2.source_style_scheme_manager ~default:true in
  let theme =
    (match mgr#style_scheme "oblivion" with
     | Some x -> x
     | None -> raise @@ Failure "not found style_scheme"
    ) in
  let code_view = create_code_view theme in
  hpaned#pack1 ~resize:true (scrolled code_view#coerce)#coerce;

  let vpaned = GPack.paned `VERTICAL ~width:220 ~packing:(hpaned#pack2 ~resize:true) () in
  let navi_view = create_navigate_view theme in
  let shell_view = create_shell_view theme in


  let output ~file () =
    (*try*)
    if Sys.file_exists file then Sys.rename file (file ^ "~");
    let s = code_view#source_buffer#get_text () in ()
    (*
      let oc = open_out file in
      output_string oc (Glib.Convert.locale_from_utf8 s);
      close_out oc;
      filename := Some file
    with _ -> prerr_endline "Save failed"
      *) in
  let save_dialog () =
    file_dialog ~title:"Save"
      ~callback:(fun file -> output ~file:file ()) None in

  let save_file () =
    match !filename with
      Some file -> (* output v ~file () *) ()
    | None -> (* save_dialog v theme () *) () in

  vpaned#pack1 ~resize:true ~shrink:true (scrolled navi_view#coerce)#coerce;
  vpaned#pack2 ~resize:true ~shrink:true (scrolled shell_view#coerce)#coerce;

  let file_factory = new GMenu.factory ~accel_path:"<EDITOR2 File>/////" file_menu ~accel_group
  in
  file_factory#add_item "Open" ~key:_O ~callback:(open_file code_view theme);
  file_factory#add_item "Save" ~key:_S ~callback:(save_file);
  file_factory#add_item "Save as..." ~callback:(save_dialog);
  file_factory#add_separator ();
  file_factory#add_item "Quit" ~key:_Q ~callback:window#destroy;

  let edit_factory = new GMenu.factory ~accel_path:"<EDITOR2 File>///" edit_menu ~accel_group in
  edit_factory#add_item "Copy" ~key:_C ~callback:
    (fun () -> code_view#source_buffer#copy_clipboard GMain.clipboard);
  edit_factory#add_item "Cut" ~key:_X ~callback:
    (fun () -> GtkSignal.emit_unit
        code_view#as_view GtkText.View.S.cut_clipboard);
  edit_factory#add_item "Paste" ~key:_V ~callback:
    (fun () -> GtkSignal.emit_unit
        code_view#as_view GtkText.View.S.paste_clipboard);
  edit_factory#add_separator ();

  edit_factory#add_check_item "Read only" ~active:false
    ~callback:(fun b -> code_view#set_editable (not b));
  edit_factory#add_item "Save accels"
    ~callback:(fun () -> GtkData.AccelMap.save "test.accel");

  window#add_accel_group accel_group;
  code_view#event#connect#button_press
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

  window#show ();
  GMain.Main.main ()

let _ = Printexc.print main ()
