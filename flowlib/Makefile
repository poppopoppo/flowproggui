all: implib.cma

implib.cma: Makefile imp.ml util.ml imp_parser.mly imp_lexer.mll implib.ml
	ocamllex imp_lexer.mll
	menhir --explain imp_parser.mly
	rm -f ../_build/default/flowlib/implib.cma 
	dune build implib.cma
	rm -f implib.cma 
	ln -s ../_build/default/flowlib/implib.cma

