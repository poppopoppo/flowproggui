all: gui evo
gui: lang.ml imp_parser_header.ml imp_lexer.mll imp_parser.mly implib.ml util.ml gui.ml
	rm -f imp_parser.ml imp_parser.cmi imp_parser.mli imp.cmi
	ocamllex imp_lexer.mll
	menhir --explain imp_parser.mly
	dune build gui.exe
	rm -f gui
	ln -s /home/kohe/git-repos/flow/_build/default/vm/ir/gui.exe gui
evo: evo_tkn.ml
	ocamlfind ocamlopt -thread -p -o evo_tkn.exe -linkpkg \
	-package core,batteries,threads \
	peg.ml util.ml lang.ml evo_tkn.ml
run: gui evo
	./gui
	gprof ./evo_tkn.exe > evo_tkn.prf.txt
bench: bench.ml
	ocamlopt -p -o bench bench.ml
	./bench
	gprof ./bench > bench.prof.txt
