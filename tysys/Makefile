gui: ty.ml print.ml imp_parser_header.ml imp_lexer.mll imp_parser.mly imp.ml implib.ml util.ml gui.ml
	rm -f imp_parser.ml imp_parser.cmi imp_parser.mli imp.cmi
	ocamllex imp_lexer.mll
	menhir --explain imp_parser.mly
	dune build gui.exe
	rm -f gui
	ln -s ../_build/default/tysys/gui.exe gui
