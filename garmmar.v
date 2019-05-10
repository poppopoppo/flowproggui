Require Import Ascii String. 
Require Export Utf8_core.
Open Scope string_scope.

Inductive S : list string -> list string -> Prop :=
  | s0 : ∀ (a z b:list string) , NP a b -> VP b z -> S a z
with NP : list string -> list string -> Prop := 
  | np0 : ∀ (a b z:list string) , D a b -> N b z -> NP a z
with VP : list string -> list string -> Prop := 
  | vp0 : ∀ (a b z:list string) , V a b -> NP b z -> VP a z
with D : list string -> list string -> Prop := 
  | d0 : ∀ (x:list string) , D ("the"::x) x 
  | d1 : ∀ (x:list string) , D ("a"::x) x 
with N : list string -> list string -> Prop := 
  | n0 : ∀ (x:list string) , N ("cat"::x) x 
  | n1 : ∀ (x:list string) , N ("bat"::x) x 
with V : list string -> list string -> Prop := 
  | v0 : ∀ (x:list string) , V ("eats"::x) x. 


 sentence(A,Z) :- noun_phrase(A,B), verb_phrase(B,Z).
 noun_phrase(A,Z) :- det(A,B), noun(B,Z).s
 verb_phrase(A,Z) :- verb(A,B), noun_phrase(B,Z).
 det([the|X], X).
 det([a|X], X).
 noun([cat|X], X).
 noun([bat|X], X).
 verb([eats|X], X).