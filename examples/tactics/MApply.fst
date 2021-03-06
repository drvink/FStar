module MApply

open FStar.Tactics

assume val p : Type0
assume val q : Type0
assume val x : squash p

assume val lem     : unit -> Lemma (requires p) (ensures q)
assume val lem_imp : unit -> Lemma (p ==> q)
assume val f_sq    : squash p -> squash q
assume val f_unsq  : squash p -> q

let _ =
    assert_by_tactic q (mapply (quote lem_imp);;
                        exact (quote x))

let _ =
    assert_by_tactic q (mapply (quote lem);;
                        exact (quote x))

let _ =
    assert_by_tactic q (mapply (quote f_sq);;
                        exact (quote x))

let _ =
    assert_by_tactic q (mapply (quote f_unsq);;
                        exact (quote x))
