yasm -g dwarf2 -f elf64 TEST.s -o out.o
gcc -Wall out.o -nostartfiles -no-pie -pg -g -O0 -o out.exe 
				
