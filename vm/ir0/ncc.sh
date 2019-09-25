#!/bin/bash
./nc inc.mdls $1
nasm -f elf64 Inc.s
gcc Inc.o -nostartfiles -no-pie -g -o Inc
