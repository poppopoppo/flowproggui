all: gui evo
gui: ty.ml print.ml imp_parser_header.ml imp_lexer.mll imp_parser.mly imp.ml implib.ml util.ml gui.ml types.ml
	rm -f imp_parser.ml imp_parser.cmi imp_parser.mli imp.cmi
	ocamllex imp_lexer.mll
	menhir --explain imp_parser.mly
	dune build gui.exe
	rm -f gui
	ln -s ../_build/default/tysys/gui.exe gui
evo: evo_tkn.ml
	ocamlfind ocamlopt -p -o evo_tkn.exe -linkpkg \
	-package batteries \
	util.ml types.ml print.ml ty.ml imp.ml evo_tkn.ml
run: gui evo
	./gui
	gprof ./evo_tkn.exe > evo_tkn.prf.txt
