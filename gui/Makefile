gui: print.ml imp_parser_header.ml imp_lexer.mll imp_parser.mly imp.ml implib.ml util.ml gui.ml ocaml.lang ocaml.lang
	rm -f imp_parser.ml imp_parser.cmi imp_parser.mli imp.cmi
	ocamllex imp_lexer.mll
	menhir --explain imp_parser.mly
	dune build gui.exe
	rm -f gui
	ln -s ../_build/default/gui/gui.exe gui
tmp:
	ocamlc -I +lablgtk2 -I +batteries -o gui nums.cma batteries.cma lablgtksourceview2.cma lablgtk.cma gtkInit.cmo imp_parser.ml util.ml imp.ml imp_lexer.ml implib.ml gui.ml
run: gui
	./gui
debug: gui
	ocamldebug gui
