all: calc.exe
run: calc.exe
	./calc -s default.st -d default.st
calc.exe: flow.ml parser.mly lexer.mll repl.ml calc.ml Makefile
	ocamllex lexer.mll
	menhir --explain parser.mly
	dune build calc.exe
	rm -f calc
	ln -s _build/default/calc.exe calc
