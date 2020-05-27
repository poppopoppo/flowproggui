module PZ = struct
  type 'p t = int * int
  let rec gcd a b =
    if a>=b then
      let r = a mod b in
      if r=0 then b
      else gcd b r
  let lcm a b = (a*b)/(gcd a b)
  let (+) (z1,r1) (z2,r2) : 'p t =
    (z1+z2,lcm r1 r2)
  let ( * ) (z1,r1) (z2,r2) : 'p t = (z1*z2,lcm r1 r2)
end
