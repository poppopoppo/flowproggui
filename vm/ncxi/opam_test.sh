# environment setup
opam init
eval `opam env`
# install given version of the compiler
opam switch create 4.09.0
eval `opam env`
# check you got what you want
which ocaml
ocaml -version

