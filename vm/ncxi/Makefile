all: gui evo nc
gui: peg.ml lang.ml imp_parser_header.ml imp_lexer.mll imp_parser.mly implib.ml util.ml gui.ml
	rm -f imp_parser.ml imp_parser.cmi imp_parser.mli imp.cmi
	ocamllex imp_lexer.mll
	menhir --explain imp_parser.mly
	dune build gui.exe
	rm -f gui
	ln -s /home/kohe/git-repos/flow/_build/default/vm/ncxi/gui.exe gui
evo: util.ml evo_tkn.ml
	ocamlfind ocamlopt -thread -p -o evo_tkn.exe -linkpkg \
	-package core,batteries,threads \
	util.ml peg.ml lang.ml evo_tkn.ml
run: gui evo
	./gui
	gprof ./evo_tkn.exe > evo_tkn.prf.txt
nc: util.ml lang.ml nc.ml imp_lexer.mll imp_parser.mly
	ocamllex imp_lexer.mll
	menhir --explain imp_parser.mly
	ocamlc -c imp_parser.mli
	ocamlfind ocamlopt -thread -p -o nc -linkpkg \
	-package core,batteries,threads \
	util.ml peg.ml lang.ml imp_lexer.ml imp_parser.ml implib.ml nc.ml
	gcc -o test test.s
run_nc: nc
	./test
	echo $?
bench: bench.ml
	ocamlopt -p -o bench bench.ml
	./bench
	gprof ./bench > bench.prof.txt
ncc:
	./nc inc.mdls test0
	nasm -gdwarf -f elf64 Inc.s
	gcc Inc.o -nostartfiles -no-pie -g -o Inc
test: mem.s
	nasm -f elf64 mem.s
	gcc mem.o -g -nostartfiles -no-pie -o mem
