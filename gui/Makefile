gui: imp_lexer.mll imp_parser.mly imp.ml implib.ml util.ml gui.ml ocaml.lang ocaml.lang
	rm -f imp_parser.cmi imp_parser.mli imp.cmi
	ocamllex imp_lexer.mll
	menhir --explain imp_parser.mly
	ocamlfind ocamlc -c -package batteries imp.ml
	ocamlc -c imp_parser.mli
	ocamlc -c imp_lexer.ml
	ocamlc -c imp_parser.ml
	ocamlfind ocamlc -g -package lablgtk2,lablgtk2.sourceview2,batteries -linkpkg util.ml imp.ml imp_parser.ml  imp_lexer.ml implib.ml gui.ml -o gui
tmp:
	ocamlc -I +lablgtk2 -I +batteries -o gui nums.cma batteries.cma lablgtksourceview2.cma lablgtk.cma gtkInit.cmo imp_parser.ml util.ml imp.ml imp_lexer.ml implib.ml gui.ml
