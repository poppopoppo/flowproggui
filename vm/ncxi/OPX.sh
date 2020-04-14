rm -f EMT.mdls.s 
rm -f SGN.txt 
touch EMT.mdls.s 
touch SGN.txt 
chmod +rw EMT.mdls.s 
chmod +rw SGN.txt
./opx main_sh.mdls syntax.mdls start_sh.mdls

yasm -g dwarf2 -f elf64 EMT.mdls.s -o out.o 
clang -Wall stub.c out.o -nostartfiles -no-pie -pg -g -O0 -o EMT.mdls.exe 
ln -f EMT.mdls.exe EMT 
