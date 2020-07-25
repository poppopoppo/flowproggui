yasm -g dwarf2 -f elf64 SH.mdls.s -o out.o
gcc -Wall stub.c out.o -nostartfiles -no-pie -pg -g -O0 -o out.exe 
				
