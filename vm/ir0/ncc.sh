#!/bin/bash
./nc inc.mdls $1
nasm -F dwarf -g -f elf64 Inc.s
gcc Inc.o -nostartfiles -no-pie -pg -g -o Inc
./Inc
gprof Inc > Inc.prof
