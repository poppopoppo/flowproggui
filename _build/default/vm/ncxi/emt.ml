(*
open Lang
type ns_e_k =
  | Etr_V of (int * r) Rcd_Ptn.t
  | Ctr of int
  | Prs of Grm.etr
type ns_t_k =
  | T_CP of args * ((Types.t * string) list)
  | T_Ln of name
  | T_V of Types.v ref
  | T_Prm
type ns =
  { ns : (name, Types.v ref) Hashtbl.t;
    ns_e : (name, ns_e_k) Hashtbl.t;
    ns_t : (name, ns_t_k) Hashtbl.t;
  }
let init_ns () = { ns=Hashtbl.create 10; ns_e=Hashtbl.create 10; ns_t=Hashtbl.create 10; }
let rec emt_m ns ps el =
  ( match el with
    | [] -> ("","","")
    | e::tl ->
      let _ =
        ( match e with
          | Mdl(n,el0) ->
            let (e0,e1,e2) = emt_m ns (n::ps) el0 in
            (e0,e1,e2)
          | Etr(n,_,_,(r0,p0)) ->
            let (r0,p0) = mk_ir_etr (r0,p0) in
            let y0 = inst_ptn 0 r0 in
            let y1 = slv ns ps 0 !p0 in
            let y = Imp(y0,y1) in
            let _ = gen (ref []) (-1) y in
            let s = Hashtbl.create 10 in
            let i0 = idx_crt_ptn s r0 in
            let iv0 = Rcd_Ptn.map (fun v -> (idx s v,v)) r0 in
            Hashtbl.add ns.ns_e (ps,n) (Etr_V iv0);
            Hashtbl.add ns.ns (ps,n) (ref(Ln y));
            let c0 = cmt ("\t|» "^(emt_ptn i0)) in
            let l0 = "emt_etr_c_"^(lb ()) in
            let l2 = "_"^n in
            let (ea,w) = push_reg s x86_reg_lst in
            let e0 =
              n^":\n"^c0^
              "\tjz "^l2^"\n"^
              "\tjc "^l0^"\n"^
              "\tpush rbx\n"^
              "\tmov rbx,rdi\n"^
              "\tpush rbx\n"^
              (emt_set_ptn "" s "r12" emt_reg_x86 "rbx" i0)^
              "\tpop rbx\n"^
              ea^
              "\tmov rdi,rbx\n"^
              "\tcall dec_r\n"^
              (pop_reg w)^
              "\tpop rbx\n"^
              "jmp "^l2^"\n"^
              l0^":\n"^
              "\tpush rbx\n"^
              "\tmov rbx,rdi\n"^
              (emt_set_ptn "" s "r12" emt_reg_x86 "rbx" i0)^
              "\tpop rbx\n"^
              l2^":\n" in
            let ep = emt_ir ns s !p0 in
            let se =
              "\t_dyn_"^(pnt_name ps n)^":\n"^
              (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
              "\t\tdq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001\n"^
              "\t\tdq "^(pnt_name ps n)^"\n" in
            (se1^se,e0^ep^s1,"")
          | Etr_Abs(n,y0,y1) ->
            let l = ref [] in
            let ys = mk_vars (ref []) m `Etr l y0 in
            let yd = mk_vars (ref []) m `Etr l y1 in
            let v = ref(Ln(Imp(ys,yd))) in
            Hashtbl.add ns.ns (ps,n) v;
            Hashtbl.add ns.ns_e (ps,n) (Etr_V (A (0,v)));
            ("","","")
          | Etr_Out_Abs(n,y0) ->
            let l = ref [] in
            let ys = mk_vars (ref []) m `Etr l y0 in
            let v = ref(Ln(App(Prm(Name ([],"-")),ys))) in
            Hashtbl.add ns.ns (ps,n) v;
            Hashtbl.add ns.ns_e (ps,n) (Etr_V (A (0,v)));
            ("","","")
          | Etr_Clq q ->
            let l0 =
              List.fold_left
                (fun l0 (n,_,_,(r0,p0)) ->
                   let (r0,p0) = mk_ir_etr (r0,p0) in
                   let i0 = idx_crt_ptn s r0 in
                   let iv0 = Rcd_Ptn.map (fun v -> (idx s v,v)) r0 in
                   Hashtbl.add ns.ns_e (ps,n) (Etr_V iv0);
                   let y0 = inst_ptn 0 r0 in
                   let y1 = newvar_l 0 in
                   let y2 = newvar () in
                   y2 := Ln(Imp(y0,Var y1));
                   Hashtbl.add ns.ns (ps,n) y2;
                   (n,y1,p0,iv0)::l0 )
                [] q in
            let l1 =
              List.fold_left
                (fun l (n,y0,p0,iv0) ->
                   let y1 = slv ns ps 0 !p0 in
                   (n,y0,y1,p0,iv0)::l )
                [] l0 in
            let _ =
              List.fold_left
                ( fun _ (n,y0,y1,_,iv0) ->
                    ( try
                        let _ = unify [] (Var y0) (inst 0 y1) in
                        let v0 = List.assoc (ps,n) m.ns in
                        gen (ref []) (-1) (Var v0)
                      with _ -> err "y1:" ))
                () l1 in
            List.fold_left
              (fun (e_0,e_1,e_2) (n,_,_,_,iv0) ->
                 let s = Hashtbl.create 10 in
                 let i0 = Rcd_Ptn.map (fun (i,v) -> Hashtbl.add s i v; i) iv0 in
                 let c0 = cmt ("\t|» "^(emt_ptn i0)) in
                 let l0 = "emt_etr_c_"^(lb ()) in
                 let l2 = "_"^n in
                 let (ea,w) = push_reg s x86_reg_lst in
                 let e0 =
                   n^":\n"^c0^
                   "\tjz "^l2^"\n"^
                   "\tjc "^l0^"\n"^
                   "\tpush rbx\n"^
                   "\tmov rbx,rdi\n"^
                   "\tpush rbx\n"^
                   (emt_set_ptn "" s "r12" emt_reg_x86 "rbx" i0)^
                   "\tpop rbx\n"^
                   ea^
                   "\tmov rdi,rbx\n"^
                   "\tcall dec_r\n"^
                   (pop_reg w)^
                   "\tpop rbx\n"^
                   "jmp "^l2^"\n"^
                   l0^":\n"^
                   "\tpush rbx\n"^
                   "\tmov rbx,rdi\n"^
                   (emt_set_ptn "" s "r12" emt_reg_x86 "rbx" i0)^
                   "\tpop rbx\n"^
                   l2^":\n" in
                 let ep = emt_ir ns s !p0 in
                 let se =
                   "\t_dyn_"^(pnt_name ps n)^":\n"^
                   (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
                   "\t\tdq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001\n"^
                   "\t\tdq "^(pnt_name ps n)^"\n" in
                 (e_0^se1^se,e_1^e0^ep^s1,e_2^"")) "" l1
          | Flow f ->
            ( match f with
              | Ast.Def_CoPrd (n,a,ds) ->
                let ps = List.map (fun (y,c) -> (mk_vars (ref []) m `Abs (ref a) y,c)) ps in
                Hashtbl.add m.ns_t (ps,n) (T_CP(a,ds));
                let ya = List.fold_left (fun ya (_,v) -> App(ya,Var v)) (Prm(Name ([],n))) a in
                let (_,es) =
                  List.fold_left
                    ( fun (i,s) (t,n) ->
                        let tc = Imp(t,ya) in
                        Hashtbl.add ns.ns (ps,n) (ref (Ln tc));
                        Hashtbl.add ns.ns_e (ps,n) (Ctr i);
                        let sn =
                          "\t_dyn_"^(pnt_name ps n)^":\n"^
                          (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
                          "\t\tdq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001\n"^
                          "\t\tdq "^(string_of_int i)^"\n" in
                        (i+1,s^sn) )
                    0 ds in
                ("","",es)
              | Ast.Def_Abs (n,_) ->
                Hashtbl.add ns.ns_t n (T_Prm);
                ("","","")
              | Ast.Def_EqT (_,_,_) -> ("","","")
              | _ -> err "slv_flows 1" )
          | Flow_Clq q ->
            let _ =
              List.fold_left
                ( fun dl f ->
                    ( match f with
                      | Ast.Def_CoPrd (n,_,_) ->
                        Hashtbl.add ns.ns_t (ps,n) T_Prm
                      | Ast.Def_Abs _ -> dl
                      | Ast.Def_EqT (_,_,_) -> dl
                      | _ -> err "slv_flows 1" )
                )
                [] q in
            let es =
              List.fold_left
                ( fun es f ->
                    ( match f with
                      | Ast.Def_CoPrd (n,a,ds) ->
                        let ds = List.map (fun (y,c) -> (mk_vars (ref []) ns `Abs (ref a) y,c)) ds in
                        let ya = List.fold_left (fun ya (_,v) -> App(ya,Var v)) (Prm(Name ([],n))) a in
                        Hashtbl.add m.ns_t n (T_CP(a,ds));
                        let (_,eq) =
                          List.fold_left
                            (fun i (t,n) ->
                               let tc = Imp(t,ya) in
                               Hashtbl.add m.ns n (ref (Ln tc));
                               Hashtbl.add m.ns_e n (Ctr i);
                               let sn =
                                 "\t_dyn_"^(pnt_name ps n)^":\n"^
                                 (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
                                 "\t\tdq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001\n"^
                                 "\t\tdq "^(string_of_int i)^"\n" in
                               (i+1,eq^sn))
                            (0,"") ps in
                        es^eq
                      | Ast.Def_Abs _ -> ()
                      | Ast.Def_EqT (_,_,_) -> ()
                      | _ -> err "slv_flows 1" )
                )
                "" q in
            ("","",es)
          | Gram g ->
            let _  =
              List.fold_left
                ( fun _ (n,_) ->
                    Hashtbl.add m.ns_t (ps,n) (newvar ());
                    Hashtbl.add m.ns_e (ps,n) (Etr_V) )
                () g in
            let _ =
              List.fold_left
                (fun _ (n,rs) ->
                   Hashtbl.add ns.ns_e (ps,n) rs;
                   let y = Prm(Name ([],n)) in
                   let v = List.assoc (ps,n) ns.ns_t in
                   v := Ln y;
                   let yp = Imp(Rcd(rcd_cl [Prm Stg;Prm(Name ([],"r64"))]),Rcd(rcd_cl [Prm Stg;Prm(Name ([],"r64"));Prm(Name ([],n))])) in
                   Hashtbl.add ns.ns (ps,n) (ref(Ln yp))
                ) () g in
            ()
        ) in
      emt_m m ps tl
  )
  *)
