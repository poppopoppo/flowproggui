yasm -g dwarf2 -f elf64 EMT.mdls.s -o out.o
clang  -Wall stub.c out.o -nostartfiles -no-pie -pg -g -O0 -o EMT.mdls.exe
ln -f EMT.mdls.exe EMT 
