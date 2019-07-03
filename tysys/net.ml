open Types
type trs_plg = Trs_Mno of Sgn.t | Trs_Twn of trs_plg * trs_plg
and cyc_n = Sgn.t list
and net = ((trs_plg * trs * trs_plg) ref) SgnMap.t
and trs_pls =
  | Trs_Std of trs_plg * trs * trs_plg
  | Trs_CoPrd of trs_plg * trs * path * (trs_plg list)
  | Trs_Prd of (trs_plg list) * Sgn.t * trs * trs_plg
and trs =
  | Trs_Rt
  | Trs_Const of lst
  | Trs_App
  | Trs_PrjL
  | Trs_PrjR
  | Trs_Axm of string
  | Trs_Inj of int
  | Trs_Cho of int
  | Trs_F of int
and gst = ((lst * Sgn.t) list) SgnMap.t
and lst =
  | Lst_Unt
  | Lst_TnsL of lst
  | Lst_TnsR of lst
  | Lst_Exn of string
  | Lst_CoPrd of int * lst
  | Lst_Prd of Sgn.t * Sgn.t
  | Lst_Code of Sgn.t * Sgn.t
  | Lst_Sgn of Sgn.t
  | Lst_Z of int * int
  | Lst_Stg of string
and path = bool list
let get v0 p = (try SgnMap.find p v0 with _ -> [])
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
let evo (o:net) (v0:gst) : (net * gst) =
  SgnMap.fold
    (fun _ r (o1,v1) ->
       let (src,f,dst) = !r in
       match f with
       | Trs_Rt -> (o,id src dst v0)
       | Trs_Const c -> (o,const c src dst v0)
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
             (o1,v2)
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
       | Trs_A (f,p,l) ->
       | Trs_P of trs * (trs list)
       | Trs_F of trs * int * trs)
