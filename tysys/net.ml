open Types
type trs_plg = Trs_Mno of Sgn.t | Trs_Twn of trs_plg * trs_plg
and net = ((trs_plg * trs * trs_plg) ref) SgnMap.t
and trs =
  | Trs_Rt
  | Trs_Const of lst
  | Trs_App
  | Trs_PrjL
  | Trs_PrjR
  | Trs_Inj of int
  | Trs_Cho of int
  | Trs_A of path * (trs list)
  | Trs_P of (trs list)
  | Trs_F of int * trs
and gst = ((lst Sgn.t) list) SgnMap.t
and lst =
  | Lst_Unt
  | Lst_Tns of lst * lst
  | Lst_Exn of string
  | Lst_CoPrd of int * lst
  | Lst_Prd of Sgn.t * Sgn.t
  | Lst_Code of Sgn.t * Sgn.t
  | Lst_Sgn of Sgn.t
  | Lst_Z of int * int
  | Lst_Stg of string
and path = bool list
let get v0 p = (try SgnMap.find p v0 with _ -> [])
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
       | Trs_PrjL
       | Trs_PrjR
       | Trs_Inj of int
       | Trs_Cho of int
       | Trs_A of trs * path * (trs list)
       | Trs_P of trs * (trs list)
       | Trs_F of trs * int * trs)
