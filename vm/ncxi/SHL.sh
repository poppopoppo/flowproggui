./SHX main_sh.mdls syntax.mdls start_sh.mdls 
yasm -g dwarf2 -f elf64 SH.mdls.s -o out.o
clang  -Wall stub.c out.o -nostartfiles -no-pie -pg -g -O0 -o SH.mdls.exe
ln -f SH.mdls.exe SHX
