./nc inc.mdls $1
intel2gas -o Inc_gas.s Inc.s
gcc Inc.s -nostartfiles -no-pie -pg -g -o Inc
./Inc
gprof Inc > Inc.prof
