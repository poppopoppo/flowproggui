type rule_flag = Synt | Lex
type pred_flag = And | Not
type grammar = entry list
and entry = name * (_val list) * ((rule * (name option)) list)
and rule = rule_flag * pattern list * ((pred_flag * (pattern list)) option)
and pattern =
  | Text of string
  | Name of name
  | Val of _val
  | List of pattern
  | Option of pattern
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
let rec parse (g:grammar) (n:name) (s:string) : (ast * string) option =
  let e = List.find (fun (n0,_,_) -> n=n0) g in
  let (_,_,rs) = e in
  ( match rs with
    | [] -> None
    | ((rf,ps,o),c)::_ ->
      let o0 = parse_patterns rf g s ps in
      ( match o0 with
        | None -> None
        | Some (al0,s0) ->
          let a0 = Some (Ast_Rule (c,al0),s0) in
          ( match o with
            | None -> a0
            | Some (f,ps1) ->
              let o1 = parse_patterns rf g s0 ps1 in
              ( match (f,o1) with
                | (Not,None) -> a0
                | (And,Some _) -> a0
                | _ -> None
              )
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
and parse_patterns (b:rule_flag) (g:grammar) (s:string)(ps:pattern list) : (ast list * string) option =
  List.fold_left
    (fun o p ->
       match o with
       | Some (ast_lst,s0) ->
         let s0 = if b=Synt then skip s0 else s0 in
         let o0 = parse_pattern b g s0 p in
         ( match o0 with
           | None -> None
           | Some (ast0,s1) -> Some (ast_lst@[ast0],s1) )
       | None -> None ) (Some ([],s)) ps
and parse_pattern (b:rule_flag) (g:grammar) (s0:string) (p:pattern) : (ast * string) option =
  ( match p with
    | Text t0 ->
      let len = String.length t0 in
      ( try
          let s00 = Str.string_before s0 len in
          if t0=s00
          then Some (Ast_Text t0,Str.string_after s0 len)
          else None
        with Invalid_argument _ -> None)
    | Name n0 ->
      let a0 = parse g n0 s0 in
      a0
    | Val _ -> raise @@ Failure "err0"
    | List p0 ->
      let rec lp l s =
        let s1 = if b=Synt then skip s else s in
        ( match parse_pattern b g s1 p0 with
          | None -> Some (Ast_List l,s)
          | Some (ast0,s2) -> lp (l@[ast0]) s2 ) in
      lp [] s0
    | Option p0 ->
      ( match parse_pattern b g s0 p0 with
        | None -> Some (Ast_Option None,s0)
        | Some (ast0,s1) -> Some (Ast_Option (Some ast0),s1) )
    | Any ->
      ( try
          let s00 = Str.string_before s0 1 in
          Some (Ast_Text s00,Str.string_after s0 1)
        with Invalid_argument _ -> None)
  )

module Sample = struct
  let g0 = [("E0",[],[((Synt,[Text "Hi"],None),Some "c0")])]
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
        ((Synt,[Text ">"],None),None);
        ((Synt,[Text ">|"],None),None)
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
  ]
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
    | Text x -> [Head_Text x]
    | Name n -> head g n
    | Val _ -> []
    | List p -> head_pattern g p
    | Option p -> head_pattern g p
    | Any -> [Head_Any]
  )
