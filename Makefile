all: calc.exe
run: calc.exe
	./calc -s default.st -d default.st
calc.exe: util.ml imp.ml imp_parser.mly imp_lexer.mll repl.ml calc.ml Makefile
	ocamllex imp_lexer.mll
	menhir --explain imp_parser.mly
	dune build calc.exe
	rm -f calc
	ln -s _build/default/calc.exe calc
imp.o: util.ml imp.ml
	ocamlc -c util.ml imp.ml -o imp.ml
lib: Makefile imp.ml util.ml parser.mly lexer.mll implib.ml
	ocamllex imp_lexer.mll
	menhir --explain imp_parser.mly
	dune build util.cma
	dune build imp_parser.cma
	dune build imp_lexer.cma
	dune build implib.cma
toplevel:
	dune build mytoplevel.exe
	rm -f mytoplevel.exe
	ln -s _build/default/mytoplevel.exe mytoplevel
ide: gui.ml
	lablgtk2 lablgtksourceview2.cma gui.ml
