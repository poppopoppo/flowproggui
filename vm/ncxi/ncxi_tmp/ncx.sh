#!/bin/bash
nasm -F dwarf -g -f elf64 EMT.mdls.s -o EMT.mdls.o
gcc EMT.mdls.o -nostartfiles -no-pie -pg -g -o EMT.mdls.exe
time ./EMT.mdls.exe

