open Util
type rule_flag = Synt | Lex
type pred_flag = And | Not
type grammar = entry list
and entry = name * (_val list) * ((rule * (name option)) list)
and rule = rule_flag * pattern list * ((pred_flag * (pattern list)) option)
and pattern =
  | List of pattern_atm
  | Option of pattern_atm
  | Atm of pattern_atm
and pattern_atm =
  | Text of string
  | Name of name
  | Var of _val
  | Any
and name = string
and _val = string
type ast =
  | Ast_Rule of (name option) * (ast list)
  | Ast_Text of string
  | Ast_List of ast list
  | Ast_Option of (ast option)
type rtn = Parse of (ast * string) | Fail of string
type global = grammar list
let rec print_ast a =
  ( match a with
    | Ast_Rule (None,l) -> "_[_]◂{ "^(Util.string_of_list " " print_ast l)^" }"
    | Ast_Rule (Some s,l) -> s^"◂{ "^(Util.string_of_list " " print_ast l)^" }"
    | Ast_Text s -> "\""^s^"\""
    | Ast_List l -> "⟦ "^(Util.string_of_list " " print_ast l)^" ⟧"
    | Ast_Option None -> "‹›"
    | Ast_Option (Some x) -> "‹"^(print_ast x)^"›" )
  let rec print g =
  ( match g with
    | [] -> ""
    | (n,vs,l)::tl ->
      let s0 = print_entry l in
      "\t@ "^n^" ◂ "^(Util.string_of_list "," (fun x -> x) vs)^" ≃ \n"^s0^(print tl) )
and print_entry l =
  ( match l with
    | [] -> ""
    | (r,_)::tl ->
      "\t"^(print_rule r)^"\n"^(print_entry tl))
and print_rule (rf,pl,po) =
  let s0 = print_rf rf in
  let s1 = print_pl pl in
  let s2 = print_po po in
  "\t"^s0^s1^s2
and print_rf rf = ( match rf with | Synt -> "∐ " | Lex -> "∐*" )
and print_pl pl =
  ( match pl with
    | [] -> ""
    | hd::tl ->
      let s0 =
        ( match hd with
          | List n -> "⟦"^(print_pa n)^"⟧"
          | Option n -> "‹"^(print_pa n)^"›"
          | Atm a -> print_pa a
        ) in
      s0^" "^(print_pl tl))
and print_pa a =
  ( match a with
    | Text s -> "\""^s^"\""
    | Name n -> n
    | Var v -> v^"'"
    | Any -> "_" )
and print_po po =
  ( match po with
    | None -> ""
    | Some (pf,pl) ->
      ( match pf with
        | And -> " +| "^(print_pl pl)
        | Not -> " ¬| "^(print_pl pl)))
let rec parse (g:grammar) (n:name) (s:string) : (ast option) * string =
  let e = List.find (fun (n0,_,_) -> n=n0) g in
  let (_,_,rs) = e in
  parse_entry g rs s
and parse_entry g rs s =
  ( match rs with
    | [] -> (None,s)
    | ((rf,ps,o),c)::tl ->
      let (o0,s0) = parse_patterns rf g s ps in
      ( match o0 with
        | None -> parse_entry g tl s
        | Some al0 ->
          let a0 = (Some (Ast_Rule (c,al0)),s0) in
          ( match o with
            | None -> a0
            | Some (f,ps1) ->
              let (o1,_) = parse_patterns rf g s0 ps1 in
              ( match f,o1 with
                | Not,None -> a0
                | And,Some _ -> a0
                | _ -> parse_entry g tl s )
          )
      )
  )
and skip s =
  if s=""
  then ""
  else
    let hd=s.[0] in
    if (hd=' ' || hd='\n' || hd='\t')
    then skip (Str.string_after s 1)
    else s
and parse_patterns (b:rule_flag) (g:grammar) (s:string)(ps:pattern list) =
  List.fold_left
    (fun o p ->
       match o with
       | Some ast_lst,s0 ->
         let s0 = if b=Synt then skip s0 else s0 in
         let o0 = parse_pattern b g s0 p in
         ( match o0 with
           | (None,s1) -> (None,s1)
           | (Some ast0,s1) -> (Some (ast_lst@[ast0]),s1) )
       | None,_ -> (None,s) ) (Some [],s) ps
and parse_pattern (b:rule_flag) (g:grammar) (s0:string) (p:pattern) =
  ( match p with
    | List n0 ->
      let rec lp l s =
        let s1 = if b=Synt then skip s else s in
        ( match parse_pattern_atm b g s1 n0 with
          | None,_ -> (Some (Ast_List l),s)
          | Some ast0,s2 -> lp (l@[ast0]) s2 ) in
      lp [] s0
    | Option n0 ->
      ( match parse_pattern_atm b g s0 n0 with
        | None,_ -> (Some (Ast_Option None),s0)
        | Some ast0,s1 -> (Some (Ast_Option (Some ast0)),s1) )
    | Atm a -> parse_pattern_atm b g s0 a
  )
and parse_pattern_atm _ g s0 p =
  ( match p with
    | Text t0 ->
      let len = String.length t0 in
      ( try
          let s00 = Str.string_before s0 len in
          if t0=s00
          then (Some (Ast_Text t0),Str.string_after s0 len)
          else (None,s0)
        with Invalid_argument _ -> (None,s0))
    | Name n0 -> parse g n0 s0
    | Var _ -> err "err0"
    | Any ->
      ( try
          let s00 = Str.string_before s0 1 in
          (Some (Ast_Text s00),Str.string_after s0 1)
        with Invalid_argument _ -> (None,s0))
  )
module Sample = struct
  (*
  let g0 = [("E0",[],[((Synt,[Text "Hi"],None),Some "c0")]);]
  let g1 = [("E0",[],[((Synt,[List (Text "Hi")],None),Some "c0")])];;
  let peg =
  [
    ("grm",[],
     [((Synt,[Text "¶+ℾ";Name "etr";List(Name "etr")],None),None)]
      );
    ("etr",[],
     [((Synt,[Text "@";Name "nam"; Text "≃";Name "rul";List (Name "rul")],None),None)]
      );
    ("rul",[],
     [((Synt,[Name "lex";Name "seq"],None),None)]
      );
    ("lex",[],
      [
        ((Synt,[Text "∐"],None),None);
        ((Synt,[Text "∐\\"],None),None)
      ]
    );
    ("seq",[],
     [
       ((Synt,[List (Name "ptn");Name "prd"],None),None)
     ]
    );
    ("ptn",[],
      [
        ((Synt,[Name "atm"],None),None);
        ((Synt,[List(Name "atm")],None),None);
        ((Synt,[Option(Name "atm")],None),None)
      ]
    );
    ("atm",[],
      [
        ((Synt,[Name "stg"],None),None);
         ((Synt,[Name "nam"],None),None)
      ]
    );
    ("prd",[],
      [
        ((Synt,[Text "|";List (Name "ptn")],None),None);
        ((Synt,[Text "¬|";List (Name "ptn")],None),None)
      ]
    )
  ] *)
end
type head =
  | Head_Text of string
  | Head_Spaces
  | Head_Any
let rec head (g:grammar) (n:name) : head list =
  let (_,_,rs) = List.find (fun (n0,_,_) -> n=n0) g in
  List.fold_left
    (fun l (r,_) ->
       let xs = head_rule g r in
       l@xs) [] rs
and head_rule (g:grammar) (r:rule) : head list =
  let (rf,ps,_) = r in
  ( match ps with
    | [] -> []
    | hd::_ ->
      let hs = head_pattern g hd in
      if rf=Synt then Head_Spaces::hs else hs
  )
and head_pattern g p =
  ( match p with
    | List n -> head_pattern_atm g n
    | Option n -> head_pattern_atm g n
    | Atm n -> head_pattern_atm g n )
and head_pattern_atm g a =
  ( match a with
    | Text x -> [Head_Text x]
    | Name n -> head g n
    | Var _ -> []
    | Any -> [Head_Any]
  )
