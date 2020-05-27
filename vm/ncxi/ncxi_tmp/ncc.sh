#!/bin/bash
touch $1.s
./nc $1 $2
nasm -F dwarf -g -f elf64 $1.s -o $1_$2.o
gcc $1_$2.o -nostartfiles -no-pie -pg -g -o $1_$2.exe
time ./$1_$2.exe
gprof $1_$2.exe > $1_$2.prof
