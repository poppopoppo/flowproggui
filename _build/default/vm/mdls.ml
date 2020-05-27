open Types
let concat (m0:mdl) (m1:mdl) =
  let ((_,a0,g0),(n1,a1,g1)) = (m0,m1) in
  (n1,a0@a1,g0@g1)
