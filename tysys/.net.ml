open Types
type trs_plg = Trs_Mno of Sgn.t | Trs_Twn of trs_plg * trs_plg
and cyc_n = Sgn.t list
and path = bool list
type net_p = Sgn.t * cyc_n
module NetMap = Map.Make(struct type t = net_p let compare = compare end)
module CycMap = Map.Make(struct type t = cyc_n let compare = compare end)
type c_tkn =
  | Tkn_Z of int
  | Tkn_Exn of string
  | Tkn_Prm of string
  | Tkn_Plg of trs_plg
  | Tkn_App of c_tkn * c_tkn
type c_net = c_tkn NetMap.t
type c_trs =
  | Trs_Id of Sgn.t * Sgn.t
  | Trs_App of Sgn.t * trs_plg * trs_plg
  | Trs_Agl of trs_plg * path * (trs_plg list)
  | Trs_Pls of Sgn.t * Sgn.t * Sgn.t
  | Trs_Mlt of Sgn.t * Sgn.t * Sgn.t
  | Trs_Eq of Sgn.t * Sgn.t * Sgn.t
  | Trs_Inj of trs_plg * int * Sgn.t
  | Trs_Cho of Sgn.t * Sgn.t * trs_plg
  | Trs_F  of Sgn.t * trs_plg * trs_plg
let get v0 p0 =
  NetMap.fold
    (fun (p,c) x r ->
       if p=p0 then NetMap.add c x r else r)
    NetMap.empty
let get_c w c =
  (try Some (NetMap.find c w) with None)
let put v0 (p0,i0) k0 =
  NetMap.add (p0,i0) k0 v0
let mrg_net v0 v1 =
  NetMap.merge
    (fun k o0 o1 -> (o0,o1))
    v0 v1
let mrg_c c0 c1 =
  NetMap.merge
    (fun k o0 o1 -> (o0,o1))
    c0 c1
let puts v0 l = NetMap.fold (fun k x r -> put r k x) v0
let fire c v0 o0 =
  ( match o0 with
    | Trs_Id (p0,p1) ->
      let ks = get v0 (p0,None) in
      let v1 = puts v0 ks in
      v1
    | Trs_Pls (p1,p2,p3) ->
      let (c1,c2) = (get v0 p1,get v1 p2) in
      let cp = mrg_c c1 c2 in
      NetMap.fold
        (fun c (o1,o2) v1 ->
           ( match o1,o2 with
             | Some(Tkn_Z z1),Some(Tkn_Z z2) -> put v1 (c,p3) (Tkn_Z z1+z2)
             | Some(Tkn_Exn s),_ -> put v1 (c,p3) (Tkn_Exn s)
             | _,Some(Tkn_Exn s) -> put v1 (c,p3) (Tkn_Exn s)
             | _ -> v1
           ))
        cp
    | Trs_Mlt (p1,p2,p3) ->
      let (c1,c2) = (get v0 p1,get v1 p2) in
      let cp = mrg_c c1 c2 in
      NetMap.fold
        (fun c (o1,o2) v1 ->
           ( match o1,o2 with
             | Some(Tkn_Z 0),_ -> put v1 (c,p3) (Tkn_Z 0)
             | _,Some(Tkn_Z 0) -> put v1 (c,p3) (Tkn_Z 0)
             | Some(Tkn_Z z1),Some(Tkn_Z z2) -> put v1 (c,p3) (Tkn_Z z1*z2)
             | Some(Tkn_Exn s),_ -> put v1 (c,p3) (Tkn_Exn s)
             | _,Some(Tkn_Exn s) -> put v1 (c,p3) (Tkn_Exn s)
             | _ -> v1
           ))
        cp
    | Trs_Eq (p1,p2,p3) ->
      let (c1,c2) = (get v0 p1,get v0 p2) in
      let cp = mrg_c c1 c2 in
      NetMap.fold
        (fun c (o1,o2) v1 ->
           ( match o1,o2 with
             | Some k1,Some k2 ->
               if k1=k2 then put v1 (c,p3) (Tkn_Z 1)
               else put v1 (c,p3) (Tkn_Z 0)
             | Some(Tkn_Exn s),_ -> put v1 (c,p3) (Tkn_Exn s)
             | _,Some(Tkn_Exn s) -> put v1 (c,p3) (Tkn_Exn s)
             | _ -> v1
           ))
        cp
    | Trs_Inj (q1,i1,p1) ->
      put v0 (c,p1) (TknApp(Tkn_Z i1,Tkn_Plg q1))
    | Trs_App (p1,q1,q2) ->
      let k1 = get_c (get v0 p1) c in
      ( match k1 with
        | None -> v0
        | Some(Tkn_App(Tkn_Plg q3,Tkn_Plg q4)) ->
          let v1 = ids v0 q1 q3 in
          let v2 = ids v1 p4 p2 in
          v2
        | _ -> v0
          )
    | Trs_Agl of trs_plg * path * (trs_plg list)
    | Trs_Cho of Sgn.t * Sgn.t * trs_plg
    | Trs_F of trs_plg * trs_plg
  )
let rec get_plg v0 g =
  ( match g with
    | Trs_Mno p -> get v0 p
    | Trs_Twn (g1,g2) ->
      (List.map (fun x -> Lst_TnsL x) (get_plg v0 g1))@
      (List.map (fun x -> Lst_TnsR x) (get_plg v0 g2)))
let put (v0:gst) (p:Sgn.t) ((a,c):(lst*Sgn.t)) : gst =
  let a1 = get v0 p in
  let a2 = SgnMap.add p ((a,c)::a1) v0 in
  a2
let puts v0 p l = List.fold_left (fun v1 x -> put v1 p x) v0 l
type net_op = trs_plg * trs * trs_plg
let cmpH (s1,n1,d1) (s2,n2,d2) =
  let n3 = SgnMap.merge
      (fun _ d1 d2 ->
         ( match d1,d2 with
           | Some x,_ -> Some x
           | _,Some x -> Some x ))
      n1 n2 in
  (Trs_Twn (s1,s2),n3,Trs_Twn(d1,d2))
let cmpV v1 v2 =
  let ((s1,n1,d1),(s2,n2,d2)) = (v1,v2) in
  let n3 = cmpH v1 v2 in
  let n4 = SgnMap.add
      (sgn()) (ref (d1,Trs_Rt,s2)) n3 in
  n4
let rec net_of_vh c0 =
  ( match c with
    | V (c1,c2) ->
      let v1 = net_of_vh c1 in
      let v2 = net_of_vh c2 in
      cmpV v1 v2
    | H (c1,c2) ->
      let v1 = net_of_vh c1 in
      let v2 = net_of_vh c2 in
      cmpH v1 v2
    | E e1 -> net_of_nd e1
    | P (e1,l) ->
      let v1 = net_of_nd e1 in
      let vl = List.map net_of_vh l in
      v1
    | A (e1,p,l) -> net_of_nd e1
  )
let get v0 p = (try SgnMap.find p v0 with _ -> [])
let evo (o:net) (v0:gst) : gst =
  SgnMap.fold
    (fun _ r v1 ->
       ( match !r with
         | Trs_Std(src,f,dst) ->
           ( match f with
             | Trs_Rt -> puts v1 dst (gets src)
             | Trs_Const a ->
               puts v1 dst
                 (List.map
                    (fun (c1,k1) -> (c1,lst_Const a))
                    (gets src))
             | Trs_App ->
               ( match src with
                 | Trs_Twn(Trs_Mno f,Trs_Mno x) ->
                   let (k1,k2) = (get f v1,get x v1) in
                   let v2 =
                     List.fold_left
                       (fun v1 (c1,k1) ->
                          ( match k1 with
                            | Lst_Code(s1,d1) ->
                              let v2 =
                                List.fold_left
                                  (fun v2 (c2,k2) ->
                                     if c1=c2 then put v2 s1 (c2,k2)
                                     else v2)
                                  v1 k2 in
                              let k3 = get v2 d1 in
                              let v3 =
                                List.fold_left
                                  (fun v3 x -> put v3 dst x)
                                  v2 k3 in
                              v3
                            | Lst_Exn s -> Lst_Exn ("? 0:"^s)
                            | _ -> Lst_Exn "? 1" ))
                       v1 k1 in
                   v2
                 | _ -> raise (Failure "net.evo:0")
               )
             | Trs_PrjL ->
               ( match src with
                 | Trs_Twn(x,y) ->
                   let kl = get_plg x v1 in
                   let v2 = pus v1 dst kl in
                   v2
                 | _ -> raise (Failure "net.evo:1"))
             | Trs_PrjR ->
               ( match src with
                 | Trs_Twn(x,y) ->
                   let kl = get_plg y v1 in
                   let v2 = pus v1 dst kl in
                   v2
                 | _ -> raise (Failure "net.evo:2"))
             | Trs_Inj i ->
               let kl = get_plg src v1 in
               let kl2 = List.map (fun (k,c) -> (Lst_CoPrd(i,k),c)) in
               let v2 = puts v1 dst kl2 in
               v2
             | Trs_Cho i ->
               let kl = get_plg src v1 in
               let v2 =
                 List.fold_left
                   (fun v1 (c1,k1) ->
                      ( match k1 with
                        | Lst_Prd(s1,d1) ->
                          let v2 =
                            put v1 s1 (c2,Lst_Exn ("Cho["^(string_of_int i)^"]")) in
                          let k3 = get v2 d1 in
                          let v3 =
                            List.fold_left
                              (fun v3 x -> put v3 dst x)
                              v2 k3 in
                          v3
                        | Lst_Exn s -> Lst_Exn ("? 2.0:"^s)
                        | _ -> Lst_Exn "? 2.1" ))
                   v1 kl in
               (o1,v2)
             | Trs_F ->
               ( match src with
                 | Trs_Twn(g1,g2) -> Lst_Code(g2,dst)
                 | _ -> Lst_Exn "? 3.1" )
           )
       )
    )
    v0
