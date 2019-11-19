§§ lng
  §§ name
    ¶ t = { ⟦s8⟧ s8 }
    § @.pnt { mp n }
      » pnt_f _ ⊢ f
      lst.fld_lft { %f n mp } ⊢|

      ! @.pnt_f { s m }
      » _ %s,%m ⊢ %sr,_,_
        [^ 1' "." 0' ^]
      ∎ sr
    § emt { mp n }
      » emt_f _ ⊢ f
      lst.fld_lft { %f n mp } ⊢|

    ! @.emt_f { s m }
      » _ %s,%m ⊢ %sr,_,_
        [^ 1' "_" 0' ^]
      ∎ sr
  §§.

  §§ rcd_ptn
    ¶ @.t ◂ a'
      ∐ r : ⟦t◂a'⟧
      ∐ a : a'

    § @.map %f
      ¿ %p
        ? p
        ∐\ p' ,p'=r◂rs' ⊢
          map %f ⊢ e0
          lst.map { e0 %rs } ⊢ %rs1
          r rs1 ⊢ p1
          ∎ p1
        ∐.\ p' ,p'=a◂r' ⊢
          ◂ %f,%r ⊢ r1
          a r1 ⊢ r2
          ∎ r2
  §§.

  §§ types
    ¶ lv = r64
    ¶ @.t
      ∐ imp : { t t }
      ∐ app : { t t }
      ∐ rcd : t_rcd
      ∐ var : sgn
      ∐ prm : sgn
      ∐ nam : s8
      @.v◂y'
      ∐ v_wc : {}
      ∐ v_v : lv
      ∐ v_q : lv
      ∐ v_ln : y'
      @.t_rcd
      ∐ cns : { t t_rcd }
      ∐ u : {}
      ∐ u_o : sgn
§§.
