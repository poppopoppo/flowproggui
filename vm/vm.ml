(*
type net = ptr SgnMap.t
and ptr =
  | Atm_Unt
  | Atm_Int of int
  | Atm_Char of char
  | Atm_Sgn of Sgn.t
  | Tns of Sgn.t * Sgn.t
type r_typ = RT_Int | RT_Sgn | RT_Char | RT_Net | RT_Bol
type k =
  | K_Int of int
  | K_Sgn of Sgn.t
  | K_Char of char
  | K_Bol of bool
type regs =
  (int array) * (Sgn.t array) * (char array)
  * (Sgn.t array) * (bool array)
type cs =
  | CS of Sgn.t * int
  | CSp of Sgn.t * Sgn.t
type st =
  regs * Sgn.t * ((Sgn.t , ptr) Hashtbl.t) * (cs Stack.t)
type op =
  | Id
  | Call of bool * src_sgn
  | Jmp of int * src_sgn
  | Eq of r_typ * int * int * int
  | Mov of int * src
  | Cmp of int * int * int
  | Atm of r_typ * int * int
  | Cns of int * int
  | Spt of int * int * src_sgn
  | Add of int * int
  | Mul of int * int
  | Sub of int * int
  | Inc of int
  | Dec of int
and src_sgn = C_Sgn of Sgn.t | D_Sgn of int
and src =
  | S_CInt of int
  | S_DInt of int
  | S_CChar of char
  | S_DChar of int
  | S_CBol of bool
  | S_DBol of int
  | S_CSgn
  | S_DSgn of int
  | S_Net of int
let src_sgn rs p =
  ( match p with
    | C_Sgn p -> p
    | D_Sgn d -> rs.(d) )
type asm = cdp SgnMap.t
and cdp =
  | Ret
  | Op of op * Sgn.t
let set_ptr nt p v =
  Hashtbl.remove nt p;
  Hashtbl.add nt p v
let find_ptr nt p = Hashtbl.find nt p
let get rs y i =
  let (r_int,r_sgn,r_char,r_net,r_bol) = rs in
  ( match y with
    | RT_Int -> K_Int r_int.(i)
    | RT_Sgn -> K_Sgn r_sgn.(i)
    | RT_Char -> K_Char r_char.(i)
    | RT_Net -> K_Net r_net.(i)
    | RT_Bol -> K_Bol r_bol.(i) )
let set rs i k =
  let (r_int,r_sgn,r_char,r_net,r_bol) = rs in
  ( match k with
    | K_Int z -> (r_int.(i)<-z)
    | K_Sgn p -> (r_sgn.(i)<-p)
    | K_Char c -> (r_char.(i)<-c)
    | K_Net n -> r_net.(i)<-n
    | K_Bol b -> r_bol.(i)<-b )
let rec run a p v =
  let (rs,ep,nt,cs) = v in
  let (r_int,r_sgn,r_char,r_net,r_bool) = rs in
  let d0 = SgnMap.find p a in
  ( match d0 with
    | Ret ->
      if (Stack.is_empty cs) then v
      else
        let hd = Stack.pop cs in
        run c hd (rs,nt,cs)
    | Op (o0,np) ->
      ( match o0 with
        | Eq (y,r0,r1,b1) ->
          let b =
            ( match y with
              | RT_Int -> r_int(r0)=r_int(r1)
              | RT_Char -> r_char(r0)=r_char(r1)
              | RT_Sgn -> r_sgn(r0)=r_sgn(r1)
              | RT_Net -> true ) in
          r_bol.(b1)<-b;
          run c np (rs,nt,cs)
        | Jmp (b0,p) ->
          let p = src_sgn r_sgn p in
          if r_bol.(b0) then run c p (rs,nt,cs)
          else run c n (rs,nt,cs)
        | Cmp (r0,r1,r2) ->
          if r_int.(r0)<=r_int.(r1) then r_bol.(r2)<-true
          else r_bol.(r2)<-false
        | Call (b,p1) ->
          let p1 = src_sgn r_sgn p1 in
          if b then
            let v = CSp(p,ep) in ( try

              ( match (Stack.pop cs) with
                | CS (p,i) ->
                  if np=p then
                    (Stack.push (CS(p,i+1));
                     run c p1 (rs,ep,nt,cs))
                  else
                    (Stack.puth (CS(p,i));
                     Stack.push (CS(np,0));
                     run c p1 (rs,ep,nt,cs)) )
            with _ -> (Stack.push (CS(np,0)); run c p1 (rs,ep,nt,cs)))

        | Mov (r0,s1) ->
          ( match s1 with
            | S_CInt i ->
              r_int.(r0)<-i;
              run c np (rs,nt,cs)
            | S_DInt d ->
              r_int.(r0)<-(r_int.(d));
              run c np (rs,nt,cs)
            | S_CChar i ->
              r_char.(r0)<-i;
              run c np (rs,nt,cs)
            | S_DChar d ->
              r_char.(r0)<-(r_char.(d));
              run c np (rs,nt,cs)
            | S_CBol i ->
              r_bol.(r0)<-i;
              run c np (rs,nt,cs)
            | S_DBol d ->
              r_bol.(r0)<-(r_bol.(d));
              run c np (rs,nt,cs)
            | S_CSgn ->
              r_sgn.(r0)<-(sgn ());
              run c np (rs,nt,cs)
            | S_DSgn d ->
              r_sgn.(r0)<-(r_sgn.(d));
              run c np (rs,nt,cs)
            | S_Net i ->
              r_net.(r0)<-(r_net.(i));
              run c np (rs,nt,cs) )
        | Add (r0,r1) ->
          r_int.(r1)<-(r_int.(r0)+r_int.(r1));
          run c np (rs,nt,cs)
        | Mul (r0,r1) ->
          r_int.(r1)<-(r_int.(r0)*r_int.(r1));
          run c np (rs,nt,cs)
        | Sub (r0,r1) ->
          r_int.(r1)<-(r_int.(r0)-r_int.(r1));
          run c np (rs,nt,cs)
        | Int (r0,z) ->
          r_int.(r0)<-z;
          run c np (rs,nt,cs)
        | Atm (y,r0,r1) ->
          let k = get rs y r0 in
          ( match k with
            | K_Int z -> set_net nt r1 (Atm_Int z)
            | K_Char c -> set_net nt r1 (Atm_Char c)
            | K_Sgn p -> set_net nt r1 (Atm_Sgn p)
            | K_Bol b -> set_net nt r1 (Atm_Bol b)
            | _ -> raise (Failure "vm.run:0") );
          run c np (rs,nt,cs)
        | Cns (r0,r1) ->
          let (p0,p1) = (r_net.(r0),r_net.(r1)) in
          let p2 = sgn () in
          set_ptr nt p2 (Tns(p0,p1));
          r_net.(r1)<-p2;
          run c np (rs,nt,cs)
        | Spt (r0,r1,p) ->
          let p = src_sgn r_sgn p in
          let p0 = r_net.(r0) in
          let n = find_ptr p0 in
          ( match n with
            | Tns(p1,p2) ->
              r_net.(r0)<-p1; r_net.(r1)<-p2;
              run c np (rs,nt,cs)
            | Atm_Int z ->
              r_int.(0)<-z;
              run c p (rs,nt,cs)
            | Atm_Sgn p ->
              r_sgn.(0)<-p;
              run c p (rs,nt,cs)
            | Atm_Char c ->
              r_char.(0)<-c;
              run c p (rs,nt,cs)
            | Atm_Bol b ->
              r_bol.(0)<-b;
              run c p (rs,nt,cs)
          )
      )
  )
let asm_of_ops m p_src p_dst l =
  let (m1,p1) =
    List.fold_left
      (fun (m1,p1) o1 ->
         let np = sgn () in
         let m2 = SgnMap.add p1 (Op(o1,np)) m1 in
         (m2,np))
      (m,p_src) l in
  SgnMap.add p1 (Op(Id,p_dst)) m1
let rec asm_of_tkn a0 src v =

  let rec net_of_tkn n0 p0 v =
    ( match v with
      | TknS_Tns (v1,v2) ->
        let (n1,p1) = net_of_tkn n0 v1 in
        let (n2,p2) = net_of_tkn n1 v2 in
        let p0 = sgn () in
        (SgnMap.add p0 (Tns(p1,p2)) n2,p0)
      | TknS_Z z ->
        let p0 = sgn () in
        (SgnMap.add p0 (Atm(Atm_Int z)) n0,p0)
      | TknS_Plg q ->
        let p0 = sgn () in
        (SgnMap.add p0 (Atm(Atm_Sgn q)) n0,p0)
      | TknS_Stg s -> set_of_string n0 s )
let net_of_string n0 s =
  let l = BatList.to_list s in
  let pn = sgn () in
  let n1 = SgnMap.add pn (Atm(Atm_Unt)) n0 in
  List.fold_right
    (fun c (n1,p) ->
       let (pn,pa) = (sgn (),sgn ()) in
       SgnMap.add pa (Atm(Atm_Char c)) n1;
       SgnMap.add pn (Tns(pa,p)) n1;
       (n1,pn))
    (n0,pn)
let asm_of_code m p_src p_dst c pc =
  let e = SgnMap.find c pc in
  ( match e with
    | V_S (p1,p2) ->
      let q1 = sgn () in
      let m1 = m_t_of_code m p_src q1 c p1 in
      let m2 = m_t_of_code m1 q1 p_dst c p2 in
      m2
    | H_S (p1,p2) ->
      let m1 = m_t_of_code m p_src p_dst c p1 in
      m1
    | E_S n1 ->
      let m1 = m_t_of_nd m p_src p_dst n1 in
      m1
    | P_S (n1,l) ->
      let m1 = m_t_of_nd m p_src p_dst n1 in
      m1
    | A_S (n1,l) ->
      let m1 =
        List.fold_left
          (fun (lp,m1) p0 ->
             let q = sgn () in
             (lp@[q],m_t_of_code m1 q p_dst c p0))
          m l in
      m1
    | F_S (n1,a,p1) ->
      let m1 = m_t_of_nd m p_src p_dst n1 in
      m1
  )
let rec m_t_of_nd m p_src p_dst n =
  | PL_x _ -> m
  | PR_x _ -> m
  | Inj_x _ -> m
  | Cho_x _ -> m
  | Plg_x _ -> m
  | Z_x _ -> m
  | Stg_x _ -> m
  | TnsT (n1,_) ->
    let m1 = m_t_of_nd m p_src p_dst n1 in
    m1
  | AppT (_,_) -> m
let rec evo_st (s:st) (a:asm) (f:Sgn.t) : st =
*)
