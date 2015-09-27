
let syn' = (fun env k -> (let _108_11 = (FStar_Tc_Env.get_range env)
in (FStar_Absyn_Syntax.syn _108_11 (Some (k)))))

let log = (fun env -> ((FStar_ST.read FStar_Options.log_types) && (not ((let _108_14 = (FStar_Tc_Env.current_module env)
in (FStar_Absyn_Syntax.lid_equals FStar_Absyn_Const.prims_lid _108_14))))))

let rng = (fun env -> (FStar_Tc_Env.get_range env))

let instantiate_both = (fun env -> (let _39_24 = env
in {FStar_Tc_Env.solver = _39_24.FStar_Tc_Env.solver; FStar_Tc_Env.range = _39_24.FStar_Tc_Env.range; FStar_Tc_Env.curmodule = _39_24.FStar_Tc_Env.curmodule; FStar_Tc_Env.gamma = _39_24.FStar_Tc_Env.gamma; FStar_Tc_Env.modules = _39_24.FStar_Tc_Env.modules; FStar_Tc_Env.expected_typ = _39_24.FStar_Tc_Env.expected_typ; FStar_Tc_Env.level = _39_24.FStar_Tc_Env.level; FStar_Tc_Env.sigtab = _39_24.FStar_Tc_Env.sigtab; FStar_Tc_Env.is_pattern = _39_24.FStar_Tc_Env.is_pattern; FStar_Tc_Env.instantiate_targs = true; FStar_Tc_Env.instantiate_vargs = true; FStar_Tc_Env.effects = _39_24.FStar_Tc_Env.effects; FStar_Tc_Env.generalize = _39_24.FStar_Tc_Env.generalize; FStar_Tc_Env.letrecs = _39_24.FStar_Tc_Env.letrecs; FStar_Tc_Env.top_level = _39_24.FStar_Tc_Env.top_level; FStar_Tc_Env.check_uvars = _39_24.FStar_Tc_Env.check_uvars; FStar_Tc_Env.use_eq = _39_24.FStar_Tc_Env.use_eq; FStar_Tc_Env.is_iface = _39_24.FStar_Tc_Env.is_iface; FStar_Tc_Env.admit = _39_24.FStar_Tc_Env.admit; FStar_Tc_Env.default_effects = _39_24.FStar_Tc_Env.default_effects}))

let no_inst = (fun env -> (let _39_27 = env
in {FStar_Tc_Env.solver = _39_27.FStar_Tc_Env.solver; FStar_Tc_Env.range = _39_27.FStar_Tc_Env.range; FStar_Tc_Env.curmodule = _39_27.FStar_Tc_Env.curmodule; FStar_Tc_Env.gamma = _39_27.FStar_Tc_Env.gamma; FStar_Tc_Env.modules = _39_27.FStar_Tc_Env.modules; FStar_Tc_Env.expected_typ = _39_27.FStar_Tc_Env.expected_typ; FStar_Tc_Env.level = _39_27.FStar_Tc_Env.level; FStar_Tc_Env.sigtab = _39_27.FStar_Tc_Env.sigtab; FStar_Tc_Env.is_pattern = _39_27.FStar_Tc_Env.is_pattern; FStar_Tc_Env.instantiate_targs = false; FStar_Tc_Env.instantiate_vargs = false; FStar_Tc_Env.effects = _39_27.FStar_Tc_Env.effects; FStar_Tc_Env.generalize = _39_27.FStar_Tc_Env.generalize; FStar_Tc_Env.letrecs = _39_27.FStar_Tc_Env.letrecs; FStar_Tc_Env.top_level = _39_27.FStar_Tc_Env.top_level; FStar_Tc_Env.check_uvars = _39_27.FStar_Tc_Env.check_uvars; FStar_Tc_Env.use_eq = _39_27.FStar_Tc_Env.use_eq; FStar_Tc_Env.is_iface = _39_27.FStar_Tc_Env.is_iface; FStar_Tc_Env.admit = _39_27.FStar_Tc_Env.admit; FStar_Tc_Env.default_effects = _39_27.FStar_Tc_Env.default_effects}))

let mk_lex_list = (fun vs -> (FStar_List.fold_right (fun v tl -> (let r = (match ((tl.FStar_Absyn_Syntax.pos = FStar_Absyn_Syntax.dummyRange)) with
| true -> begin
v.FStar_Absyn_Syntax.pos
end
| false -> begin
(FStar_Range.union_ranges v.FStar_Absyn_Syntax.pos tl.FStar_Absyn_Syntax.pos)
end)
in (let _108_34 = (let _108_33 = (let _108_32 = (let _108_27 = (let _108_26 = (FStar_Tc_Recheck.recompute_typ v)
in (FStar_All.pipe_left (fun _108_25 -> FStar_Util.Inl (_108_25)) _108_26))
in (_108_27, Some (FStar_Absyn_Syntax.Implicit)))
in (let _108_31 = (let _108_30 = (FStar_Absyn_Syntax.varg v)
in (let _108_29 = (let _108_28 = (FStar_Absyn_Syntax.varg tl)
in (_108_28)::[])
in (_108_30)::_108_29))
in (_108_32)::_108_31))
in (FStar_Absyn_Util.lex_pair, _108_33))
in (FStar_Absyn_Syntax.mk_Exp_app _108_34 (Some (FStar_Absyn_Util.lex_t)) r)))) vs FStar_Absyn_Util.lex_top))

let is_eq = (fun _39_1 -> (match (_39_1) with
| Some (FStar_Absyn_Syntax.Equality) -> begin
true
end
| _39_37 -> begin
false
end))

let steps = (fun env -> (match ((FStar_Options.should_verify env.FStar_Tc_Env.curmodule.FStar_Absyn_Syntax.str)) with
| true -> begin
(FStar_Tc_Normalize.Beta)::(FStar_Tc_Normalize.SNComp)::[]
end
| false -> begin
(FStar_Tc_Normalize.Beta)::[]
end))

let whnf = (fun env t -> (FStar_Tc_Normalize.norm_typ ((FStar_Tc_Normalize.WHNF)::(FStar_Tc_Normalize.DeltaHard)::(FStar_Tc_Normalize.Beta)::[]) env t))

let norm_t = (fun env t -> (let _108_47 = (steps env)
in (FStar_Tc_Normalize.norm_typ _108_47 env t)))

let norm_k = (fun env k -> (let _108_52 = (steps env)
in (FStar_Tc_Normalize.norm_kind _108_52 env k)))

let norm_c = (fun env c -> (let _108_57 = (steps env)
in (FStar_Tc_Normalize.norm_comp _108_57 env c)))

let fxv_check = (fun head env kt fvs -> (let rec aux = (fun norm kt -> (match ((FStar_Util.set_is_empty fvs)) with
| true -> begin
()
end
| false -> begin
(let fvs' = (match (kt) with
| FStar_Util.Inl (k) -> begin
(let _108_76 = (match (norm) with
| true -> begin
(norm_k env k)
end
| false -> begin
k
end)
in (FStar_Absyn_Util.freevars_kind _108_76))
end
| FStar_Util.Inr (t) -> begin
(let _108_77 = (match (norm) with
| true -> begin
(norm_t env t)
end
| false -> begin
t
end)
in (FStar_Absyn_Util.freevars_typ _108_77))
end)
in (let a = (FStar_Util.set_intersect fvs fvs'.FStar_Absyn_Syntax.fxvs)
in (match ((FStar_Util.set_is_empty a)) with
| true -> begin
()
end
| false -> begin
(match ((not (norm))) with
| true -> begin
(aux true kt)
end
| false -> begin
(let fail = (fun _39_61 -> (match (()) with
| () -> begin
(let escaping = (let _108_82 = (let _108_81 = (FStar_Util.set_elements a)
in (FStar_All.pipe_right _108_81 (FStar_List.map (fun x -> (FStar_Absyn_Print.strBvd x.FStar_Absyn_Syntax.v)))))
in (FStar_All.pipe_right _108_82 (FStar_String.concat ", ")))
in (let msg = (match (((FStar_Util.set_count a) > 1)) with
| true -> begin
(let _108_83 = (FStar_Tc_Normalize.exp_norm_to_string env head)
in (FStar_Util.format2 "Bound variables \'{%s}\' in the type of \'%s\' escape because of impure applications; add explicit let-bindings" escaping _108_83))
end
| false -> begin
(let _108_84 = (FStar_Tc_Normalize.exp_norm_to_string env head)
in (FStar_Util.format2 "Bound variable \'%s\' in the type of \'%s\' escapes because of impure applications; add explicit let-bindings" escaping _108_84))
end)
in (let _108_87 = (let _108_86 = (let _108_85 = (FStar_Tc_Env.get_range env)
in (msg, _108_85))
in FStar_Absyn_Syntax.Error (_108_86))
in (Prims.raise _108_87))))
end))
in (match (kt) with
| FStar_Util.Inl (k) -> begin
(let s = (FStar_Tc_Util.new_kvar env)
in (match ((FStar_Tc_Rel.try_keq env k s)) with
| Some (g) -> begin
(FStar_Tc_Rel.try_discharge_guard env g)
end
| _39_71 -> begin
(fail ())
end))
end
| FStar_Util.Inr (t) -> begin
(let s = (FStar_Tc_Util.new_tvar env FStar_Absyn_Syntax.ktype)
in (match ((FStar_Tc_Rel.try_teq env t s)) with
| Some (g) -> begin
(FStar_Tc_Rel.try_discharge_guard env g)
end
| _39_78 -> begin
(fail ())
end))
end))
end)
end)))
end))
in (aux false kt)))

let maybe_push_binding = (fun env b -> (match ((FStar_Absyn_Syntax.is_null_binder b)) with
| true -> begin
env
end
| false -> begin
(match ((Prims.fst b)) with
| FStar_Util.Inl (a) -> begin
(let b = FStar_Tc_Env.Binding_typ ((a.FStar_Absyn_Syntax.v, a.FStar_Absyn_Syntax.sort))
in (FStar_Tc_Env.push_local_binding env b))
end
| FStar_Util.Inr (x) -> begin
(let b = FStar_Tc_Env.Binding_var ((x.FStar_Absyn_Syntax.v, x.FStar_Absyn_Syntax.sort))
in (FStar_Tc_Env.push_local_binding env b))
end)
end))

let maybe_make_subst = (fun _39_2 -> (match (_39_2) with
| FStar_Util.Inl (Some (a), t) -> begin
(FStar_Util.Inl ((a, t)))::[]
end
| FStar_Util.Inr (Some (x), e) -> begin
(FStar_Util.Inr ((x, e)))::[]
end
| _39_99 -> begin
[]
end))

let maybe_alpha_subst = (fun s b1 b2 -> (match ((FStar_Absyn_Syntax.is_null_binder b1)) with
| true -> begin
s
end
| false -> begin
(match (((Prims.fst b1), (Prims.fst b2))) with
| (FStar_Util.Inl (a), FStar_Util.Inl (b)) -> begin
(match ((FStar_Absyn_Util.bvar_eq a b)) with
| true -> begin
s
end
| false -> begin
(let _108_98 = (let _108_97 = (let _108_96 = (FStar_Absyn_Util.btvar_to_typ b)
in (a.FStar_Absyn_Syntax.v, _108_96))
in FStar_Util.Inl (_108_97))
in (_108_98)::s)
end)
end
| (FStar_Util.Inr (x), FStar_Util.Inr (y)) -> begin
(match ((FStar_Absyn_Util.bvar_eq x y)) with
| true -> begin
s
end
| false -> begin
(let _108_101 = (let _108_100 = (let _108_99 = (FStar_Absyn_Util.bvar_to_exp y)
in (x.FStar_Absyn_Syntax.v, _108_99))
in FStar_Util.Inr (_108_100))
in (_108_101)::s)
end)
end
| _39_114 -> begin
(FStar_All.failwith "impossible")
end)
end))

let maybe_extend_subst = (fun s b v -> (match ((FStar_Absyn_Syntax.is_null_binder b)) with
| true -> begin
s
end
| false -> begin
(match (((Prims.fst b), (Prims.fst v))) with
| (FStar_Util.Inl (a), FStar_Util.Inl (t)) -> begin
(FStar_Util.Inl ((a.FStar_Absyn_Syntax.v, t)))::s
end
| (FStar_Util.Inr (x), FStar_Util.Inr (e)) -> begin
(FStar_Util.Inr ((x.FStar_Absyn_Syntax.v, e)))::s
end
| _39_129 -> begin
(FStar_All.failwith "Impossible")
end)
end))

let set_lcomp_result = (fun lc t -> (let _39_132 = lc
in {FStar_Absyn_Syntax.eff_name = _39_132.FStar_Absyn_Syntax.eff_name; FStar_Absyn_Syntax.res_typ = t; FStar_Absyn_Syntax.cflags = _39_132.FStar_Absyn_Syntax.cflags; FStar_Absyn_Syntax.comp = (fun _39_134 -> (match (()) with
| () -> begin
(let _108_110 = (lc.FStar_Absyn_Syntax.comp ())
in (FStar_Absyn_Util.set_result_typ _108_110 t))
end))}))

let value_check_expected_typ = (fun env e tlc -> (let lc = (match (tlc) with
| FStar_Util.Inl (t) -> begin
(let _108_117 = (match ((not ((FStar_Absyn_Util.is_pure_or_ghost_function t)))) with
| true -> begin
(FStar_Absyn_Syntax.mk_Total t)
end
| false -> begin
(FStar_Tc_Util.return_value env t e)
end)
in (FStar_Tc_Util.lcomp_of_comp _108_117))
end
| FStar_Util.Inr (lc) -> begin
lc
end)
in (let t = lc.FStar_Absyn_Syntax.res_typ
in (let _39_158 = (match ((FStar_Tc_Env.expected_typ env)) with
| None -> begin
(e, lc, FStar_Tc_Rel.trivial_guard)
end
| Some (t') -> begin
(let _39_147 = (match ((FStar_Tc_Env.debug env FStar_Options.High)) with
| true -> begin
(let _108_119 = (FStar_Absyn_Print.typ_to_string t)
in (let _108_118 = (FStar_Absyn_Print.typ_to_string t')
in (FStar_Util.fprint2 "Computed return type %s; expected type %s\n" _108_119 _108_118)))
end
| false -> begin
()
end)
in (let _39_151 = (FStar_Tc_Util.check_and_ascribe env e t t')
in (match (_39_151) with
| (e, g) -> begin
(let _39_154 = (let _108_125 = (FStar_All.pipe_left (fun _108_124 -> Some (_108_124)) (FStar_Tc_Errors.subtyping_failed env t t'))
in (FStar_Tc_Util.strengthen_precondition _108_125 env e lc g))
in (match (_39_154) with
| (lc, g) -> begin
(e, (set_lcomp_result lc t'), g)
end))
end)))
end)
in (match (_39_158) with
| (e, lc, g) -> begin
(let _39_159 = (match ((FStar_Tc_Env.debug env FStar_Options.Low)) with
| true -> begin
(let _108_126 = (FStar_Absyn_Print.lcomp_typ_to_string lc)
in (FStar_Util.fprint1 "Return comp type is %s\n" _108_126))
end
| false -> begin
()
end)
in (e, lc, g))
end)))))

let comp_check_expected_typ = (fun env e lc -> (match ((FStar_Tc_Env.expected_typ env)) with
| None -> begin
(e, lc, FStar_Tc_Rel.trivial_guard)
end
| Some (t) -> begin
(FStar_Tc_Util.weaken_result_typ env e lc t)
end))

let check_expected_effect = (fun env copt _39_171 -> (match (_39_171) with
| (e, c) -> begin
(let expected_c_opt = (match (copt) with
| Some (_39_173) -> begin
copt
end
| None -> begin
(let c1 = (FStar_Tc_Normalize.weak_norm_comp env c)
in (let md = (FStar_Tc_Env.get_effect_decl env c1.FStar_Absyn_Syntax.effect_name)
in (match ((FStar_Tc_Env.default_effect env md.FStar_Absyn_Syntax.mname)) with
| None -> begin
None
end
| Some (l) -> begin
(let flags = (match ((FStar_Absyn_Syntax.lid_equals l FStar_Absyn_Const.effect_Tot_lid)) with
| true -> begin
(FStar_Absyn_Syntax.TOTAL)::[]
end
| false -> begin
(match ((FStar_Absyn_Syntax.lid_equals l FStar_Absyn_Const.effect_ML_lid)) with
| true -> begin
(FStar_Absyn_Syntax.MLEFFECT)::[]
end
| false -> begin
[]
end)
end)
in (let def = (FStar_Absyn_Syntax.mk_Comp {FStar_Absyn_Syntax.effect_name = l; FStar_Absyn_Syntax.result_typ = c1.FStar_Absyn_Syntax.result_typ; FStar_Absyn_Syntax.effect_args = []; FStar_Absyn_Syntax.flags = flags})
in Some (def)))
end)))
end)
in (match (expected_c_opt) with
| None -> begin
(let _108_139 = (norm_c env c)
in (e, _108_139, FStar_Tc_Rel.trivial_guard))
end
| Some (expected_c) -> begin
(let _39_187 = (match ((FStar_Tc_Env.debug env FStar_Options.Low)) with
| true -> begin
(let _108_142 = (FStar_Range.string_of_range e.FStar_Absyn_Syntax.pos)
in (let _108_141 = (FStar_Absyn_Print.comp_typ_to_string c)
in (let _108_140 = (FStar_Absyn_Print.comp_typ_to_string expected_c)
in (FStar_Util.fprint3 "(%s) About to check\n\t%s\nagainst expected effect\n\t%s\n" _108_142 _108_141 _108_140))))
end
| false -> begin
()
end)
in (let c = (norm_c env c)
in (let expected_c' = (let _108_143 = (FStar_All.pipe_left FStar_Tc_Util.lcomp_of_comp expected_c)
in (FStar_Tc_Util.refresh_comp_label env true _108_143))
in (let _39_195 = (let _108_144 = (expected_c'.FStar_Absyn_Syntax.comp ())
in (FStar_All.pipe_left (FStar_Tc_Util.check_comp env e c) _108_144))
in (match (_39_195) with
| (e, _39_193, g) -> begin
(let _39_196 = (match ((FStar_Tc_Env.debug env FStar_Options.Low)) with
| true -> begin
(let _108_146 = (FStar_Range.string_of_range e.FStar_Absyn_Syntax.pos)
in (let _108_145 = (FStar_Tc_Rel.guard_to_string env g)
in (FStar_Util.fprint2 "(%s) DONE check_expected_effect; guard is: %s\n" _108_146 _108_145)))
end
| false -> begin
()
end)
in (e, expected_c, g))
end)))))
end))
end))

let no_logical_guard = (fun env _39_202 -> (match (_39_202) with
| (te, kt, f) -> begin
(match ((FStar_Tc_Rel.guard_form f)) with
| FStar_Tc_Rel.Trivial -> begin
(te, kt, f)
end
| FStar_Tc_Rel.NonTrivial (f) -> begin
(let _108_152 = (let _108_151 = (let _108_150 = (FStar_Tc_Errors.unexpected_non_trivial_precondition_on_term env f)
in (let _108_149 = (FStar_Tc_Env.get_range env)
in (_108_150, _108_149)))
in FStar_Absyn_Syntax.Error (_108_151))
in (Prims.raise _108_152))
end)
end))

let binding_of_lb = (fun x t -> (match (x) with
| FStar_Util.Inl (bvd) -> begin
FStar_Tc_Env.Binding_var ((bvd, t))
end
| FStar_Util.Inr (lid) -> begin
FStar_Tc_Env.Binding_lid ((lid, t))
end))

let print_expected_ty = (fun env -> (match ((FStar_Tc_Env.expected_typ env)) with
| None -> begin
(FStar_Util.print_string "Expected type is None")
end
| Some (t) -> begin
(let _108_159 = (FStar_Absyn_Print.typ_to_string t)
in (FStar_Util.fprint1 "Expected type is %s" _108_159))
end))

let with_implicits = (fun imps _39_220 -> (match (_39_220) with
| (e, l, g) -> begin
(e, l, (let _39_221 = g
in {FStar_Tc_Rel.guard_f = _39_221.FStar_Tc_Rel.guard_f; FStar_Tc_Rel.deferred = _39_221.FStar_Tc_Rel.deferred; FStar_Tc_Rel.implicits = (FStar_List.append imps g.FStar_Tc_Rel.implicits)}))
end))

let add_implicit = (fun u g -> (let _39_225 = g
in {FStar_Tc_Rel.guard_f = _39_225.FStar_Tc_Rel.guard_f; FStar_Tc_Rel.deferred = _39_225.FStar_Tc_Rel.deferred; FStar_Tc_Rel.implicits = (u)::g.FStar_Tc_Rel.implicits}))

let rec tc_kind = (fun env k -> (let k = (FStar_Absyn_Util.compress_kind k)
in (let w = (fun f -> (f k.FStar_Absyn_Syntax.pos))
in (match (k.FStar_Absyn_Syntax.n) with
| (FStar_Absyn_Syntax.Kind_lam (_)) | (FStar_Absyn_Syntax.Kind_delayed (_)) -> begin
(FStar_All.failwith "impossible")
end
| (FStar_Absyn_Syntax.Kind_type) | (FStar_Absyn_Syntax.Kind_effect) -> begin
(k, FStar_Tc_Rel.trivial_guard)
end
| FStar_Absyn_Syntax.Kind_uvar (u, args) -> begin
(let _39_244 = (match ((FStar_Tc_Env.debug env FStar_Options.Medium)) with
| true -> begin
(let _108_210 = (FStar_Range.string_of_range k.FStar_Absyn_Syntax.pos)
in (let _108_209 = (FStar_Absyn_Print.kind_to_string k)
in (FStar_Util.fprint2 "(%s) - Checking kind %s" _108_210 _108_209)))
end
| false -> begin
()
end)
in (let _39_249 = (FStar_Tc_Env.clear_expected_typ env)
in (match (_39_249) with
| (env, _39_248) -> begin
(let _39_252 = (tc_args env args)
in (match (_39_252) with
| (args, g) -> begin
(let _108_212 = (FStar_All.pipe_left w (FStar_Absyn_Syntax.mk_Kind_uvar (u, args)))
in (_108_212, g))
end))
end)))
end
| FStar_Absyn_Syntax.Kind_abbrev ((l, args), {FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Kind_unknown; FStar_Absyn_Syntax.tk = _39_263; FStar_Absyn_Syntax.pos = _39_261; FStar_Absyn_Syntax.fvs = _39_259; FStar_Absyn_Syntax.uvs = _39_257}) -> begin
(let _39_272 = (FStar_Tc_Env.lookup_kind_abbrev env l)
in (match (_39_272) with
| (_39_269, binders, body) -> begin
(let _39_275 = (tc_args env args)
in (match (_39_275) with
| (args, g) -> begin
(match (((FStar_List.length binders) <> (FStar_List.length args))) with
| true -> begin
(let _108_216 = (let _108_215 = (let _108_214 = (let _108_213 = (FStar_Absyn_Print.sli l)
in (Prims.strcat "Unexpected number of arguments to kind abbreviation " _108_213))
in (_108_214, k.FStar_Absyn_Syntax.pos))
in FStar_Absyn_Syntax.Error (_108_215))
in (Prims.raise _108_216))
end
| false -> begin
(let _39_308 = (FStar_List.fold_left2 (fun _39_279 b a -> (match (_39_279) with
| (subst, args, guards) -> begin
(match (((Prims.fst b), (Prims.fst a))) with
| (FStar_Util.Inl (a), FStar_Util.Inl (t)) -> begin
(let _39_289 = (let _108_220 = (FStar_Absyn_Util.subst_kind subst a.FStar_Absyn_Syntax.sort)
in (tc_typ_check env t _108_220))
in (match (_39_289) with
| (t, g) -> begin
(let subst = (FStar_Util.Inl ((a.FStar_Absyn_Syntax.v, t)))::subst
in (let _108_222 = (let _108_221 = (FStar_Absyn_Syntax.targ t)
in (_108_221)::args)
in (subst, _108_222, (g)::guards)))
end))
end
| (FStar_Util.Inr (x), FStar_Util.Inr (e)) -> begin
(let env = (let _108_223 = (FStar_Absyn_Util.subst_typ subst x.FStar_Absyn_Syntax.sort)
in (FStar_Tc_Env.set_expected_typ env _108_223))
in (let _39_301 = (tc_ghost_exp env e)
in (match (_39_301) with
| (e, _39_299, g) -> begin
(let subst = (FStar_Util.Inr ((x.FStar_Absyn_Syntax.v, e)))::subst
in (let _108_225 = (let _108_224 = (FStar_Absyn_Syntax.varg e)
in (_108_224)::args)
in (subst, _108_225, (g)::guards)))
end)))
end
| _39_304 -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Ill-typed argument to kind abbreviation", (FStar_Absyn_Util.range_of_arg a)))))
end)
end)) ([], [], []) binders args)
in (match (_39_308) with
| (subst, args, guards) -> begin
(let args = (FStar_List.rev args)
in (let k = (FStar_All.pipe_left w (FStar_Absyn_Syntax.mk_Kind_abbrev ((l, args), FStar_Absyn_Syntax.mk_Kind_unknown)))
in (let k' = (FStar_Tc_Normalize.norm_kind ((FStar_Tc_Normalize.DeltaHard)::[]) env k)
in (let k = (FStar_All.pipe_left w (FStar_Absyn_Syntax.mk_Kind_abbrev ((l, args), k')))
in (let _108_228 = (FStar_List.fold_left FStar_Tc_Rel.conj_guard g guards)
in (k', _108_228))))))
end))
end)
end))
end))
end
| FStar_Absyn_Syntax.Kind_abbrev (kabr, k) -> begin
(let _39_319 = (tc_kind env k)
in (match (_39_319) with
| (k, f) -> begin
(let _39_322 = (FStar_All.pipe_left (tc_args env) (Prims.snd kabr))
in (match (_39_322) with
| (args, g) -> begin
(let kabr = ((Prims.fst kabr), args)
in (let kk = (FStar_All.pipe_left w (FStar_Absyn_Syntax.mk_Kind_abbrev (kabr, k)))
in (let _108_230 = (FStar_Tc_Rel.conj_guard f g)
in (kk, _108_230))))
end))
end))
end
| FStar_Absyn_Syntax.Kind_arrow (bs, k) -> begin
(let _39_332 = (tc_binders env bs)
in (match (_39_332) with
| (bs, env, g) -> begin
(let _39_335 = (tc_kind env k)
in (match (_39_335) with
| (k, f) -> begin
(let f = (FStar_Tc_Rel.close_guard bs f)
in (let _108_233 = (FStar_All.pipe_left w (FStar_Absyn_Syntax.mk_Kind_arrow (bs, k)))
in (let _108_232 = (FStar_Tc_Rel.conj_guard g f)
in (_108_233, _108_232))))
end))
end))
end
| FStar_Absyn_Syntax.Kind_unknown -> begin
(let _108_234 = (FStar_Tc_Util.new_kvar env)
in (_108_234, FStar_Tc_Rel.trivial_guard))
end))))
and tc_vbinder = (fun env x -> (let _39_342 = (tc_typ_check env x.FStar_Absyn_Syntax.sort FStar_Absyn_Syntax.ktype)
in (match (_39_342) with
| (t, g) -> begin
(let x = (let _39_343 = x
in {FStar_Absyn_Syntax.v = _39_343.FStar_Absyn_Syntax.v; FStar_Absyn_Syntax.sort = t; FStar_Absyn_Syntax.p = _39_343.FStar_Absyn_Syntax.p})
in (let env' = (let _108_237 = (FStar_Absyn_Syntax.v_binder x)
in (maybe_push_binding env _108_237))
in (x, env', g)))
end)))
and tc_binders = (fun env bs -> (let rec aux = (fun env bs -> (match (bs) with
| [] -> begin
([], env, FStar_Tc_Rel.trivial_guard)
end
| (b, imp)::bs -> begin
(match (b) with
| FStar_Util.Inl (a) -> begin
(let _39_362 = (tc_kind env a.FStar_Absyn_Syntax.sort)
in (match (_39_362) with
| (k, g) -> begin
(let b = (FStar_Util.Inl ((let _39_363 = a
in {FStar_Absyn_Syntax.v = _39_363.FStar_Absyn_Syntax.v; FStar_Absyn_Syntax.sort = k; FStar_Absyn_Syntax.p = _39_363.FStar_Absyn_Syntax.p})), imp)
in (let env' = (maybe_push_binding env b)
in (let _39_370 = (aux env' bs)
in (match (_39_370) with
| (bs, env', g') -> begin
(let _108_245 = (let _108_244 = (FStar_Tc_Rel.close_guard ((b)::[]) g')
in (FStar_Tc_Rel.conj_guard g _108_244))
in ((b)::bs, env', _108_245))
end))))
end))
end
| FStar_Util.Inr (x) -> begin
(let _39_376 = (tc_vbinder env x)
in (match (_39_376) with
| (x, env', g) -> begin
(let b = (FStar_Util.Inr (x), imp)
in (let _39_381 = (aux env' bs)
in (match (_39_381) with
| (bs, env', g') -> begin
(let _108_247 = (let _108_246 = (FStar_Tc_Rel.close_guard ((b)::[]) g')
in (FStar_Tc_Rel.conj_guard g _108_246))
in ((b)::bs, env', _108_247))
end)))
end))
end)
end))
in (aux env bs)))
and tc_args = (fun env args -> (FStar_List.fold_right (fun _39_386 _39_389 -> (match ((_39_386, _39_389)) with
| ((arg, imp), (args, g)) -> begin
(match (arg) with
| FStar_Util.Inl (t) -> begin
(let _39_396 = (tc_typ env t)
in (match (_39_396) with
| (t, _39_394, g') -> begin
(let _108_252 = (FStar_Tc_Rel.conj_guard g g')
in (((FStar_Util.Inl (t), imp))::args, _108_252))
end))
end
| FStar_Util.Inr (e) -> begin
(let _39_403 = (tc_ghost_exp env e)
in (match (_39_403) with
| (e, _39_401, g') -> begin
(let _108_253 = (FStar_Tc_Rel.conj_guard g g')
in (((FStar_Util.Inr (e), imp))::args, _108_253))
end))
end)
end)) args ([], FStar_Tc_Rel.trivial_guard)))
and tc_comp = (fun env c -> (match (c.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Total (t) -> begin
(let _39_410 = (tc_typ_check env t FStar_Absyn_Syntax.ktype)
in (match (_39_410) with
| (t, g) -> begin
(let _108_256 = (FStar_Absyn_Syntax.mk_Total t)
in (_108_256, g))
end))
end
| FStar_Absyn_Syntax.Comp (c) -> begin
(let kc = (FStar_Tc_Env.lookup_effect_lid env c.FStar_Absyn_Syntax.effect_name)
in (let head = (FStar_Absyn_Util.ftv c.FStar_Absyn_Syntax.effect_name kc)
in (let tc = (let _108_259 = (let _108_258 = (let _108_257 = (FStar_Absyn_Syntax.targ c.FStar_Absyn_Syntax.result_typ)
in (_108_257)::c.FStar_Absyn_Syntax.effect_args)
in (head, _108_258))
in (FStar_Absyn_Syntax.mk_Typ_app _108_259 None c.FStar_Absyn_Syntax.result_typ.FStar_Absyn_Syntax.pos))
in (let _39_418 = (tc_typ_check env tc FStar_Absyn_Syntax.keffect)
in (match (_39_418) with
| (tc, f) -> begin
(let _39_422 = (FStar_Absyn_Util.head_and_args tc)
in (match (_39_422) with
| (_39_420, args) -> begin
(let _39_434 = (match (args) with
| (FStar_Util.Inl (res), _39_427)::args -> begin
(res, args)
end
| _39_431 -> begin
(FStar_All.failwith "Impossible")
end)
in (match (_39_434) with
| (res, args) -> begin
(let _39_450 = (let _108_261 = (FStar_All.pipe_right c.FStar_Absyn_Syntax.flags (FStar_List.map (fun _39_3 -> (match (_39_3) with
| FStar_Absyn_Syntax.DECREASES (e) -> begin
(let _39_441 = (FStar_Tc_Env.clear_expected_typ env)
in (match (_39_441) with
| (env, _39_440) -> begin
(let _39_446 = (tc_ghost_exp env e)
in (match (_39_446) with
| (e, _39_444, g) -> begin
(FStar_Absyn_Syntax.DECREASES (e), g)
end))
end))
end
| f -> begin
(f, FStar_Tc_Rel.trivial_guard)
end))))
in (FStar_All.pipe_right _108_261 FStar_List.unzip))
in (match (_39_450) with
| (flags, guards) -> begin
(let _108_263 = (FStar_Absyn_Syntax.mk_Comp (let _39_451 = c
in {FStar_Absyn_Syntax.effect_name = _39_451.FStar_Absyn_Syntax.effect_name; FStar_Absyn_Syntax.result_typ = res; FStar_Absyn_Syntax.effect_args = args; FStar_Absyn_Syntax.flags = _39_451.FStar_Absyn_Syntax.flags}))
in (let _108_262 = (FStar_List.fold_left FStar_Tc_Rel.conj_guard f guards)
in (_108_263, _108_262)))
end))
end))
end))
end)))))
end))
and tc_typ = (fun env t -> (let env = (FStar_Tc_Env.set_range env t.FStar_Absyn_Syntax.pos)
in (let w = (fun k -> (FStar_Absyn_Syntax.syn t.FStar_Absyn_Syntax.pos (Some (k))))
in (let t = (FStar_Absyn_Util.compress_typ t)
in (let top = t
in (match (t.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_btvar (a) -> begin
(let k = (FStar_Tc_Env.lookup_btvar env a)
in (let a = (let _39_463 = a
in {FStar_Absyn_Syntax.v = _39_463.FStar_Absyn_Syntax.v; FStar_Absyn_Syntax.sort = k; FStar_Absyn_Syntax.p = _39_463.FStar_Absyn_Syntax.p})
in (let t = (FStar_All.pipe_left (w k) (FStar_Absyn_Syntax.mk_Typ_btvar a))
in (let _39_470 = (FStar_Tc_Util.maybe_instantiate_typ env t k)
in (match (_39_470) with
| (t, k, implicits) -> begin
(FStar_All.pipe_left (with_implicits implicits) (t, k, FStar_Tc_Rel.trivial_guard))
end)))))
end
| FStar_Absyn_Syntax.Typ_const (i) when (FStar_Absyn_Syntax.lid_equals i.FStar_Absyn_Syntax.v FStar_Absyn_Const.eqT_lid) -> begin
(let k = (FStar_Tc_Util.new_kvar env)
in (let qk = (FStar_Absyn_Util.eqT_k k)
in (let i = (let _39_475 = i
in {FStar_Absyn_Syntax.v = _39_475.FStar_Absyn_Syntax.v; FStar_Absyn_Syntax.sort = qk; FStar_Absyn_Syntax.p = _39_475.FStar_Absyn_Syntax.p})
in (let _108_286 = (FStar_Absyn_Syntax.mk_Typ_const i (Some (qk)) t.FStar_Absyn_Syntax.pos)
in (_108_286, qk, FStar_Tc_Rel.trivial_guard)))))
end
| FStar_Absyn_Syntax.Typ_const (i) when ((FStar_Absyn_Syntax.lid_equals i.FStar_Absyn_Syntax.v FStar_Absyn_Const.allTyp_lid) || (FStar_Absyn_Syntax.lid_equals i.FStar_Absyn_Syntax.v FStar_Absyn_Const.exTyp_lid)) -> begin
(let k = (FStar_Tc_Util.new_kvar env)
in (let qk = (FStar_Absyn_Util.allT_k k)
in (let i = (let _39_482 = i
in {FStar_Absyn_Syntax.v = _39_482.FStar_Absyn_Syntax.v; FStar_Absyn_Syntax.sort = qk; FStar_Absyn_Syntax.p = _39_482.FStar_Absyn_Syntax.p})
in (let _108_287 = (FStar_Absyn_Syntax.mk_Typ_const i (Some (qk)) t.FStar_Absyn_Syntax.pos)
in (_108_287, qk, FStar_Tc_Rel.trivial_guard)))))
end
| FStar_Absyn_Syntax.Typ_const (i) -> begin
(let k = (match ((FStar_Tc_Env.try_lookup_effect_lid env i.FStar_Absyn_Syntax.v)) with
| Some (k) -> begin
k
end
| _39_490 -> begin
(FStar_Tc_Env.lookup_typ_lid env i.FStar_Absyn_Syntax.v)
end)
in (let i = (let _39_492 = i
in {FStar_Absyn_Syntax.v = _39_492.FStar_Absyn_Syntax.v; FStar_Absyn_Syntax.sort = k; FStar_Absyn_Syntax.p = _39_492.FStar_Absyn_Syntax.p})
in (let t = (FStar_Absyn_Syntax.mk_Typ_const i (Some (k)) t.FStar_Absyn_Syntax.pos)
in (let _39_499 = (FStar_Tc_Util.maybe_instantiate_typ env t k)
in (match (_39_499) with
| (t, k, imps) -> begin
(FStar_All.pipe_left (with_implicits imps) (t, k, FStar_Tc_Rel.trivial_guard))
end)))))
end
| FStar_Absyn_Syntax.Typ_fun (bs, cod) -> begin
(let _39_507 = (tc_binders env bs)
in (match (_39_507) with
| (bs, env, g) -> begin
(let _39_510 = (tc_comp env cod)
in (match (_39_510) with
| (cod, f) -> begin
(let t = (FStar_All.pipe_left (w FStar_Absyn_Syntax.ktype) (FStar_Absyn_Syntax.mk_Typ_fun (bs, cod)))
in (let _39_550 = (match ((FStar_Absyn_Util.is_smt_lemma t)) with
| true -> begin
(match (cod.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Comp ({FStar_Absyn_Syntax.effect_name = _39_533; FStar_Absyn_Syntax.result_typ = _39_531; FStar_Absyn_Syntax.effect_args = (FStar_Util.Inl (pre), _39_527)::(FStar_Util.Inl (post), _39_522)::(FStar_Util.Inr (pats), _39_517)::[]; FStar_Absyn_Syntax.flags = _39_513}) -> begin
(let fvs = (FStar_Absyn_Util.freevars_exp pats)
in (match ((FStar_All.pipe_right bs (FStar_Util.find_opt (fun _39_540 -> (match (_39_540) with
| (b, _39_539) -> begin
(match (b) with
| FStar_Util.Inl (a) -> begin
(not ((FStar_Util.set_mem a fvs.FStar_Absyn_Syntax.ftvs)))
end
| FStar_Util.Inr (x) -> begin
(not ((FStar_Util.set_mem x fvs.FStar_Absyn_Syntax.fxvs)))
end)
end))))) with
| None -> begin
()
end
| Some (b) -> begin
(let _108_292 = (let _108_291 = (FStar_Absyn_Print.binder_to_string b)
in (FStar_Util.format1 "Pattern misses at least one bound variables: %s" _108_291))
in (FStar_Tc_Errors.warn t.FStar_Absyn_Syntax.pos _108_292))
end))
end
| _39_549 -> begin
()
end)
end
| false -> begin
()
end)
in (let _108_294 = (let _108_293 = (FStar_Tc_Rel.close_guard bs f)
in (FStar_Tc_Rel.conj_guard g _108_293))
in (t, FStar_Absyn_Syntax.ktype, _108_294))))
end))
end))
end
| FStar_Absyn_Syntax.Typ_lam (bs, t) -> begin
(let _39_559 = (tc_binders env bs)
in (match (_39_559) with
| (bs, env, g) -> begin
(let _39_563 = (tc_typ env t)
in (match (_39_563) with
| (t, k, f) -> begin
(let k = (FStar_Absyn_Syntax.mk_Kind_arrow (bs, k) top.FStar_Absyn_Syntax.pos)
in (let _108_299 = (FStar_All.pipe_left (w k) (FStar_Absyn_Syntax.mk_Typ_lam (bs, t)))
in (let _108_298 = (let _108_297 = (FStar_Tc_Rel.close_guard bs f)
in (FStar_All.pipe_left (FStar_Tc_Rel.conj_guard g) _108_297))
in (_108_299, k, _108_298))))
end))
end))
end
| FStar_Absyn_Syntax.Typ_refine (x, phi) -> begin
(let _39_572 = (tc_vbinder env x)
in (match (_39_572) with
| (x, env, f1) -> begin
(let _39_576 = (match ((FStar_Tc_Env.debug env FStar_Options.High)) with
| true -> begin
(let _108_302 = (FStar_Range.string_of_range top.FStar_Absyn_Syntax.pos)
in (let _108_301 = (FStar_Absyn_Print.typ_to_string phi)
in (let _108_300 = (match ((FStar_Tc_Env.expected_typ env)) with
| None -> begin
"None"
end
| Some (t) -> begin
(FStar_Absyn_Print.typ_to_string t)
end)
in (FStar_Util.fprint3 "(%s) Checking refinement formula %s; env expects type %s\n" _108_302 _108_301 _108_300))))
end
| false -> begin
()
end)
in (let _39_580 = (tc_typ_check env phi FStar_Absyn_Syntax.ktype)
in (match (_39_580) with
| (phi, f2) -> begin
(let _108_309 = (FStar_All.pipe_left (w FStar_Absyn_Syntax.ktype) (FStar_Absyn_Syntax.mk_Typ_refine (x, phi)))
in (let _108_308 = (let _108_307 = (let _108_306 = (let _108_305 = (FStar_Absyn_Syntax.v_binder x)
in (_108_305)::[])
in (FStar_Tc_Rel.close_guard _108_306 f2))
in (FStar_Tc_Rel.conj_guard f1 _108_307))
in (_108_309, FStar_Absyn_Syntax.ktype, _108_308)))
end)))
end))
end
| FStar_Absyn_Syntax.Typ_app (head, args) -> begin
(let _39_585 = (match ((FStar_Tc_Env.debug env FStar_Options.Extreme)) with
| true -> begin
(let _108_312 = (FStar_Range.string_of_range top.FStar_Absyn_Syntax.pos)
in (let _108_311 = (FStar_All.pipe_left FStar_Util.string_of_int (FStar_List.length args))
in (let _108_310 = (FStar_Absyn_Print.typ_to_string top)
in (FStar_Util.fprint3 "(%s) Checking type application (%s): %s\n" _108_312 _108_311 _108_310))))
end
| false -> begin
()
end)
in (let _39_590 = (tc_typ (no_inst env) head)
in (match (_39_590) with
| (head, k1', f1) -> begin
(let args0 = args
in (let k1 = (FStar_Tc_Normalize.norm_kind ((FStar_Tc_Normalize.WHNF)::(FStar_Tc_Normalize.Beta)::[]) env k1')
in (let _39_593 = (match ((FStar_Tc_Env.debug env FStar_Options.Extreme)) with
| true -> begin
(let _108_316 = (FStar_Range.string_of_range head.FStar_Absyn_Syntax.pos)
in (let _108_315 = (FStar_Absyn_Print.typ_to_string head)
in (let _108_314 = (FStar_Absyn_Print.kind_to_string k1')
in (let _108_313 = (FStar_Absyn_Print.kind_to_string k1)
in (FStar_Util.fprint4 "(%s) head %s has kind %s ... after norm %s\n" _108_316 _108_315 _108_314 _108_313)))))
end
| false -> begin
()
end)
in (let check_app = (fun _39_596 -> (match (()) with
| () -> begin
(match (k1.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Kind_uvar (_39_598) -> begin
(let _39_602 = (tc_args env args)
in (match (_39_602) with
| (args, g) -> begin
(let fvs = (FStar_Absyn_Util.freevars_kind k1)
in (let binders = (FStar_Absyn_Util.binders_of_freevars fvs)
in (let kres = (let _108_319 = (FStar_Tc_Rel.new_kvar k1.FStar_Absyn_Syntax.pos binders)
in (FStar_All.pipe_right _108_319 Prims.fst))
in (let bs = (let _108_320 = (FStar_Tc_Util.tks_of_args args)
in (FStar_Absyn_Util.null_binders_of_tks _108_320))
in (let kar = (FStar_Absyn_Syntax.mk_Kind_arrow (bs, kres) k1.FStar_Absyn_Syntax.pos)
in (let _39_608 = (let _108_321 = (FStar_Tc_Rel.keq env None k1 kar)
in (FStar_All.pipe_left (FStar_Tc_Util.force_trivial env) _108_321))
in (kres, args, g)))))))
end))
end
| FStar_Absyn_Syntax.Kind_arrow (formals, kres) -> begin
(let rec check_args = (fun outargs subst g formals args -> (match ((formals, args)) with
| ([], []) -> begin
(let _108_332 = (FStar_Absyn_Util.subst_kind subst kres)
in (_108_332, (FStar_List.rev outargs), g))
end
| (((_, None)::_, (_, Some (FStar_Absyn_Syntax.Implicit))::_)) | (((_, Some (FStar_Absyn_Syntax.Equality))::_, (_, Some (FStar_Absyn_Syntax.Implicit))::_)) -> begin
(let _108_336 = (let _108_335 = (let _108_334 = (let _108_333 = (FStar_List.hd args)
in (FStar_Absyn_Util.range_of_arg _108_333))
in ("Argument is marked as instantiating an implicit parameter; although the expected parameter is explicit", _108_334))
in FStar_Absyn_Syntax.Error (_108_335))
in (Prims.raise _108_336))
end
| (((FStar_Util.Inl (a), Some (FStar_Absyn_Syntax.Implicit))::rest, (_, None)::_)) | (((FStar_Util.Inl (a), Some (FStar_Absyn_Syntax.Implicit))::rest, [])) -> begin
(let formal = (FStar_List.hd formals)
in (let _39_681 = (let _108_337 = (FStar_Absyn_Util.subst_kind subst a.FStar_Absyn_Syntax.sort)
in (FStar_Tc_Util.new_implicit_tvar env _108_337))
in (match (_39_681) with
| (t, u) -> begin
(let targ = (FStar_Util.Inl (t), Some (FStar_Absyn_Syntax.Implicit))
in (let g = (add_implicit (FStar_Util.Inl (u)) g)
in (let subst = (maybe_extend_subst subst formal targ)
in (check_args ((targ)::outargs) subst g rest args))))
end)))
end
| (((FStar_Util.Inr (x), Some (FStar_Absyn_Syntax.Implicit))::rest, (_, None)::_)) | (((FStar_Util.Inr (x), Some (FStar_Absyn_Syntax.Implicit))::rest, [])) -> begin
(let formal = (FStar_List.hd formals)
in (let _39_710 = (let _108_338 = (FStar_Absyn_Util.subst_typ subst x.FStar_Absyn_Syntax.sort)
in (FStar_Tc_Util.new_implicit_evar env _108_338))
in (match (_39_710) with
| (e, u) -> begin
(let varg = (FStar_Util.Inr (e), Some (FStar_Absyn_Syntax.Implicit))
in (let g = (add_implicit (FStar_Util.Inr (u)) g)
in (let subst = (maybe_extend_subst subst formal varg)
in (check_args ((varg)::outargs) subst g rest args))))
end)))
end
| (formal::formals, actual::actuals) -> begin
(match ((formal, actual)) with
| ((FStar_Util.Inl (a), aqual), (FStar_Util.Inl (t), imp)) -> begin
(let formal_k = (FStar_Absyn_Util.subst_kind subst a.FStar_Absyn_Syntax.sort)
in (let _39_731 = (match ((FStar_Tc_Env.debug env FStar_Options.High)) with
| true -> begin
(let _108_340 = (FStar_Absyn_Print.arg_to_string actual)
in (let _108_339 = (FStar_Absyn_Print.kind_to_string formal_k)
in (FStar_Util.fprint2 "Checking argument %s against expected kind %s\n" _108_340 _108_339)))
end
| false -> begin
()
end)
in (let _39_737 = (tc_typ_check (let _39_733 = env
in {FStar_Tc_Env.solver = _39_733.FStar_Tc_Env.solver; FStar_Tc_Env.range = _39_733.FStar_Tc_Env.range; FStar_Tc_Env.curmodule = _39_733.FStar_Tc_Env.curmodule; FStar_Tc_Env.gamma = _39_733.FStar_Tc_Env.gamma; FStar_Tc_Env.modules = _39_733.FStar_Tc_Env.modules; FStar_Tc_Env.expected_typ = _39_733.FStar_Tc_Env.expected_typ; FStar_Tc_Env.level = _39_733.FStar_Tc_Env.level; FStar_Tc_Env.sigtab = _39_733.FStar_Tc_Env.sigtab; FStar_Tc_Env.is_pattern = _39_733.FStar_Tc_Env.is_pattern; FStar_Tc_Env.instantiate_targs = _39_733.FStar_Tc_Env.instantiate_targs; FStar_Tc_Env.instantiate_vargs = _39_733.FStar_Tc_Env.instantiate_vargs; FStar_Tc_Env.effects = _39_733.FStar_Tc_Env.effects; FStar_Tc_Env.generalize = _39_733.FStar_Tc_Env.generalize; FStar_Tc_Env.letrecs = _39_733.FStar_Tc_Env.letrecs; FStar_Tc_Env.top_level = _39_733.FStar_Tc_Env.top_level; FStar_Tc_Env.check_uvars = _39_733.FStar_Tc_Env.check_uvars; FStar_Tc_Env.use_eq = (is_eq aqual); FStar_Tc_Env.is_iface = _39_733.FStar_Tc_Env.is_iface; FStar_Tc_Env.admit = _39_733.FStar_Tc_Env.admit; FStar_Tc_Env.default_effects = _39_733.FStar_Tc_Env.default_effects}) t formal_k)
in (match (_39_737) with
| (t, g') -> begin
(let _39_738 = (match ((FStar_Tc_Env.debug env FStar_Options.High)) with
| true -> begin
(let _108_341 = (FStar_Tc_Rel.guard_to_string env g')
in (FStar_Util.fprint1 ">>>Got guard %s\n" _108_341))
end
| false -> begin
()
end)
in (let actual = (FStar_Util.Inl (t), imp)
in (let g' = (let _108_343 = (let _108_342 = (FStar_Tc_Util.short_circuit_typ (FStar_Util.Inl (head)) outargs)
in (FStar_All.pipe_left FStar_Tc_Rel.guard_of_guard_formula _108_342))
in (FStar_Tc_Rel.imp_guard _108_343 g'))
in (let subst = (maybe_extend_subst subst formal actual)
in (let _108_344 = (FStar_Tc_Rel.conj_guard g g')
in (check_args ((actual)::outargs) subst _108_344 formals actuals))))))
end))))
end
| ((FStar_Util.Inr (x), aqual), (FStar_Util.Inr (v), imp)) -> begin
(let tx = (FStar_Absyn_Util.subst_typ subst x.FStar_Absyn_Syntax.sort)
in (let env' = (FStar_Tc_Env.set_expected_typ env tx)
in (let env' = (let _39_754 = env'
in {FStar_Tc_Env.solver = _39_754.FStar_Tc_Env.solver; FStar_Tc_Env.range = _39_754.FStar_Tc_Env.range; FStar_Tc_Env.curmodule = _39_754.FStar_Tc_Env.curmodule; FStar_Tc_Env.gamma = _39_754.FStar_Tc_Env.gamma; FStar_Tc_Env.modules = _39_754.FStar_Tc_Env.modules; FStar_Tc_Env.expected_typ = _39_754.FStar_Tc_Env.expected_typ; FStar_Tc_Env.level = _39_754.FStar_Tc_Env.level; FStar_Tc_Env.sigtab = _39_754.FStar_Tc_Env.sigtab; FStar_Tc_Env.is_pattern = _39_754.FStar_Tc_Env.is_pattern; FStar_Tc_Env.instantiate_targs = _39_754.FStar_Tc_Env.instantiate_targs; FStar_Tc_Env.instantiate_vargs = _39_754.FStar_Tc_Env.instantiate_vargs; FStar_Tc_Env.effects = _39_754.FStar_Tc_Env.effects; FStar_Tc_Env.generalize = _39_754.FStar_Tc_Env.generalize; FStar_Tc_Env.letrecs = _39_754.FStar_Tc_Env.letrecs; FStar_Tc_Env.top_level = _39_754.FStar_Tc_Env.top_level; FStar_Tc_Env.check_uvars = _39_754.FStar_Tc_Env.check_uvars; FStar_Tc_Env.use_eq = (is_eq aqual); FStar_Tc_Env.is_iface = _39_754.FStar_Tc_Env.is_iface; FStar_Tc_Env.admit = _39_754.FStar_Tc_Env.admit; FStar_Tc_Env.default_effects = _39_754.FStar_Tc_Env.default_effects})
in (let _39_757 = (match ((FStar_Tc_Env.debug env FStar_Options.High)) with
| true -> begin
(let _108_346 = (FStar_Absyn_Print.arg_to_string actual)
in (let _108_345 = (FStar_Absyn_Print.typ_to_string tx)
in (FStar_Util.fprint2 "Checking argument %s against expected type %s\n" _108_346 _108_345)))
end
| false -> begin
()
end)
in (let _39_763 = (tc_ghost_exp env' v)
in (match (_39_763) with
| (v, _39_761, g') -> begin
(let actual = (FStar_Util.Inr (v), imp)
in (let g' = (let _108_348 = (let _108_347 = (FStar_Tc_Util.short_circuit_typ (FStar_Util.Inl (head)) outargs)
in (FStar_All.pipe_left FStar_Tc_Rel.guard_of_guard_formula _108_347))
in (FStar_Tc_Rel.imp_guard _108_348 g'))
in (let subst = (maybe_extend_subst subst formal actual)
in (let _108_349 = (FStar_Tc_Rel.conj_guard g g')
in (check_args ((actual)::outargs) subst _108_349 formals actuals)))))
end))))))
end
| ((FStar_Util.Inl (a), _39_770), (FStar_Util.Inr (v), imp)) -> begin
(match (a.FStar_Absyn_Syntax.sort.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Kind_type -> begin
(let tv = (FStar_Absyn_Util.b2t v)
in (let _108_351 = (let _108_350 = (FStar_Absyn_Syntax.targ tv)
in (_108_350)::actuals)
in (check_args outargs subst g ((formal)::formals) _108_351)))
end
| _39_780 -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Expected a type; got an expression", v.FStar_Absyn_Syntax.pos))))
end)
end
| ((FStar_Util.Inr (_39_782), _39_785), (FStar_Util.Inl (_39_788), _39_791)) -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Expected an expression; got a type", (FStar_Absyn_Util.range_of_arg actual)))))
end)
end
| (_39_795, []) -> begin
(let _108_353 = (let _108_352 = (FStar_Absyn_Syntax.mk_Kind_arrow (formals, kres) kres.FStar_Absyn_Syntax.pos)
in (FStar_Absyn_Util.subst_kind subst _108_352))
in (_108_353, (FStar_List.rev outargs), g))
end
| ([], _39_800) -> begin
(let _108_361 = (let _108_360 = (let _108_359 = (let _108_358 = (let _108_356 = (let _108_355 = (FStar_All.pipe_right outargs (FStar_List.filter (fun _39_4 -> (match (_39_4) with
| (_39_804, Some (FStar_Absyn_Syntax.Implicit)) -> begin
false
end
| _39_809 -> begin
true
end))))
in (FStar_List.length _108_355))
in (FStar_All.pipe_right _108_356 FStar_Util.string_of_int))
in (let _108_357 = (FStar_All.pipe_right (FStar_List.length args0) FStar_Util.string_of_int)
in (FStar_Util.format2 "Too many arguments to type; expected %s arguments but got %s" _108_358 _108_357)))
in (_108_359, top.FStar_Absyn_Syntax.pos))
in FStar_Absyn_Syntax.Error (_108_360))
in (Prims.raise _108_361))
end))
in (check_args [] [] f1 formals args))
end
| _39_811 -> begin
(let _108_364 = (let _108_363 = (let _108_362 = (FStar_Tc_Errors.expected_tcon_kind env top k1)
in (_108_362, top.FStar_Absyn_Syntax.pos))
in FStar_Absyn_Syntax.Error (_108_363))
in (Prims.raise _108_364))
end)
end))
in (match ((let _108_368 = (let _108_365 = (FStar_Absyn_Util.compress_typ head)
in _108_365.FStar_Absyn_Syntax.n)
in (let _108_367 = (let _108_366 = (FStar_Absyn_Util.compress_kind k1)
in _108_366.FStar_Absyn_Syntax.n)
in (_108_368, _108_367)))) with
| (FStar_Absyn_Syntax.Typ_uvar (_39_813), FStar_Absyn_Syntax.Kind_arrow (formals, k)) when ((FStar_List.length args) = (FStar_List.length formals)) -> begin
(let result_k = (let s = (FStar_List.map2 FStar_Absyn_Util.subst_formal formals args)
in (FStar_Absyn_Util.subst_kind s k))
in (let t = (FStar_Absyn_Syntax.mk_Typ_app (head, args) (Some (result_k)) top.FStar_Absyn_Syntax.pos)
in (t, result_k, FStar_Tc_Rel.trivial_guard)))
end
| _39_824 -> begin
(let _39_828 = (check_app ())
in (match (_39_828) with
| (k, args, g) -> begin
(let t = (FStar_Absyn_Syntax.mk_Typ_app (head, args) (Some (k)) top.FStar_Absyn_Syntax.pos)
in (t, k, g))
end))
end)))))
end)))
end
| FStar_Absyn_Syntax.Typ_ascribed (t1, k1) -> begin
(let _39_836 = (tc_kind env k1)
in (match (_39_836) with
| (k1, f1) -> begin
(let _39_839 = (tc_typ_check env t1 k1)
in (match (_39_839) with
| (t1, f2) -> begin
(let _108_372 = (FStar_All.pipe_left (w k1) (FStar_Absyn_Syntax.mk_Typ_ascribed' (t1, k1)))
in (let _108_371 = (FStar_Tc_Rel.conj_guard f1 f2)
in (_108_372, k1, _108_371)))
end))
end))
end
| FStar_Absyn_Syntax.Typ_uvar (u, k1) when env.FStar_Tc_Env.check_uvars -> begin
(let s = (FStar_Absyn_Util.compress_typ t)
in (match (s.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_uvar (u, k1) -> begin
(let _39_851 = (tc_kind env k1)
in (match (_39_851) with
| (k1, g) -> begin
(let _39_855 = (FStar_Tc_Rel.new_tvar s.FStar_Absyn_Syntax.pos [] k1)
in (match (_39_855) with
| (_39_853, u') -> begin
(let _39_856 = (FStar_Absyn_Util.unchecked_unify u u')
in (u', k1, g))
end))
end))
end
| _39_859 -> begin
(tc_typ env s)
end))
end
| FStar_Absyn_Syntax.Typ_uvar (_39_861, k1) -> begin
(let s = (FStar_Absyn_Util.compress_typ t)
in (match (s.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_uvar (u, k1) -> begin
(let _39_870 = (match ((FStar_All.pipe_left (FStar_Tc_Env.debug env) FStar_Options.High)) with
| true -> begin
(let _108_374 = (FStar_Absyn_Print.typ_to_string s)
in (let _108_373 = (FStar_Absyn_Print.kind_to_string k1)
in (FStar_Util.fprint2 "Admitting un-instantiated uvar %s at kind %s\n" _108_374 _108_373)))
end
| false -> begin
()
end)
in (let _108_377 = (FStar_All.pipe_left (w k1) (FStar_Absyn_Syntax.mk_Typ_uvar' (u, k1)))
in (_108_377, k1, FStar_Tc_Rel.trivial_guard)))
end
| _39_873 -> begin
(let _39_874 = (match ((FStar_All.pipe_left (FStar_Tc_Env.debug env) FStar_Options.High)) with
| true -> begin
(let _108_379 = (FStar_Absyn_Print.typ_to_string s)
in (let _108_378 = (FStar_Absyn_Print.kind_to_string k1)
in (FStar_Util.fprint2 "Admitting instantiated uvar %s at kind %s\n" _108_379 _108_378)))
end
| false -> begin
()
end)
in (s, k1, FStar_Tc_Rel.trivial_guard))
end))
end
| FStar_Absyn_Syntax.Typ_meta (FStar_Absyn_Syntax.Meta_refresh_label (t, b, r)) -> begin
(let _39_885 = (tc_typ env t)
in (match (_39_885) with
| (t, k, f) -> begin
(let _108_380 = (FStar_Absyn_Syntax.mk_Typ_meta (FStar_Absyn_Syntax.Meta_refresh_label ((t, b, r))))
in (_108_380, k, f))
end))
end
| FStar_Absyn_Syntax.Typ_meta (FStar_Absyn_Syntax.Meta_labeled (t, l, r, p)) -> begin
(let _39_896 = (tc_typ env t)
in (match (_39_896) with
| (t, k, f) -> begin
(let _108_381 = (FStar_Absyn_Syntax.mk_Typ_meta (FStar_Absyn_Syntax.Meta_labeled ((t, l, r, p))))
in (_108_381, k, f))
end))
end
| FStar_Absyn_Syntax.Typ_meta (FStar_Absyn_Syntax.Meta_named (t, l)) -> begin
(let _39_905 = (tc_typ env t)
in (match (_39_905) with
| (t, k, f) -> begin
(let _108_382 = (FStar_Absyn_Syntax.mk_Typ_meta (FStar_Absyn_Syntax.Meta_named ((t, l))))
in (_108_382, k, f))
end))
end
| FStar_Absyn_Syntax.Typ_meta (FStar_Absyn_Syntax.Meta_pattern (qbody, pats)) -> begin
(let _39_913 = (tc_typ_check env qbody FStar_Absyn_Syntax.ktype)
in (match (_39_913) with
| (quant, f) -> begin
(let _39_916 = (tc_args env pats)
in (match (_39_916) with
| (pats, g) -> begin
(let _108_385 = (FStar_Absyn_Syntax.mk_Typ_meta (FStar_Absyn_Syntax.Meta_pattern ((quant, pats))))
in (let _108_384 = (FStar_Tc_Util.force_tk quant)
in (let _108_383 = (FStar_Tc_Rel.conj_guard f g)
in (_108_385, _108_384, _108_383))))
end))
end))
end
| FStar_Absyn_Syntax.Typ_unknown -> begin
(let k = (FStar_Tc_Util.new_kvar env)
in (let t = (FStar_Tc_Util.new_tvar env k)
in (t, k, FStar_Tc_Rel.trivial_guard)))
end
| _39_921 -> begin
(let _108_387 = (let _108_386 = (FStar_Absyn_Print.typ_to_string t)
in (FStar_Util.format1 "Unexpected type : %s\n" _108_386))
in (FStar_All.failwith _108_387))
end))))))
and tc_typ_check = (fun env t k -> (let _39_928 = (tc_typ env t)
in (match (_39_928) with
| (t, k', f) -> begin
(let env = (FStar_Tc_Env.set_range env t.FStar_Absyn_Syntax.pos)
in (let f' = (match (env.FStar_Tc_Env.use_eq) with
| true -> begin
(FStar_Tc_Rel.keq env (Some (t)) k' k)
end
| false -> begin
(FStar_Tc_Rel.subkind env k' k)
end)
in (let f = (FStar_Tc_Rel.conj_guard f f')
in (t, f))))
end)))
and tc_value = (fun env e -> (let env = (FStar_Tc_Env.set_range env e.FStar_Absyn_Syntax.pos)
in (let top = e
in (match (e.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Exp_uvar (_39_937, t1) -> begin
(value_check_expected_typ env e (FStar_Util.Inl (t1)))
end
| FStar_Absyn_Syntax.Exp_bvar (x) -> begin
(let t = (FStar_Tc_Env.lookup_bvar env x)
in (let e = (FStar_Absyn_Syntax.mk_Exp_bvar (let _39_944 = x
in {FStar_Absyn_Syntax.v = _39_944.FStar_Absyn_Syntax.v; FStar_Absyn_Syntax.sort = t; FStar_Absyn_Syntax.p = _39_944.FStar_Absyn_Syntax.p}) (Some (t)) e.FStar_Absyn_Syntax.pos)
in (let _39_950 = (FStar_Tc_Util.maybe_instantiate env e t)
in (match (_39_950) with
| (e, t, implicits) -> begin
(let tc = (match ((FStar_Options.should_verify env.FStar_Tc_Env.curmodule.FStar_Absyn_Syntax.str)) with
| true -> begin
FStar_Util.Inl (t)
end
| false -> begin
(let _108_394 = (let _108_393 = (FStar_Absyn_Syntax.mk_Total t)
in (FStar_All.pipe_left FStar_Tc_Util.lcomp_of_comp _108_393))
in FStar_Util.Inr (_108_394))
end)
in (let _108_395 = (value_check_expected_typ env e tc)
in (FStar_All.pipe_left (with_implicits implicits) _108_395)))
end))))
end
| FStar_Absyn_Syntax.Exp_fvar (v, dc) -> begin
(let t = (FStar_Tc_Env.lookup_lid env v.FStar_Absyn_Syntax.v)
in (let e = (FStar_Absyn_Syntax.mk_Exp_fvar ((let _39_957 = v
in {FStar_Absyn_Syntax.v = _39_957.FStar_Absyn_Syntax.v; FStar_Absyn_Syntax.sort = t; FStar_Absyn_Syntax.p = _39_957.FStar_Absyn_Syntax.p}), dc) (Some (t)) e.FStar_Absyn_Syntax.pos)
in (let _39_963 = (FStar_Tc_Util.maybe_instantiate env e t)
in (match (_39_963) with
| (e, t, implicits) -> begin
(let tc = (match ((FStar_Options.should_verify env.FStar_Tc_Env.curmodule.FStar_Absyn_Syntax.str)) with
| true -> begin
FStar_Util.Inl (t)
end
| false -> begin
(let _108_397 = (let _108_396 = (FStar_Absyn_Syntax.mk_Total t)
in (FStar_All.pipe_left FStar_Tc_Util.lcomp_of_comp _108_396))
in FStar_Util.Inr (_108_397))
end)
in (let is_data_ctor = (fun _39_5 -> (match (_39_5) with
| (Some (FStar_Absyn_Syntax.Data_ctor)) | (Some (FStar_Absyn_Syntax.Record_ctor (_))) -> begin
true
end
| _39_973 -> begin
false
end))
in (match (((is_data_ctor dc) && (not ((FStar_Tc_Env.is_datacon env v.FStar_Absyn_Syntax.v))))) with
| true -> begin
(let _108_403 = (let _108_402 = (let _108_401 = (FStar_Util.format1 "Expected a data constructor; got %s" v.FStar_Absyn_Syntax.v.FStar_Absyn_Syntax.str)
in (let _108_400 = (FStar_Tc_Env.get_range env)
in (_108_401, _108_400)))
in FStar_Absyn_Syntax.Error (_108_402))
in (Prims.raise _108_403))
end
| false -> begin
(let _108_404 = (value_check_expected_typ env e tc)
in (FStar_All.pipe_left (with_implicits implicits) _108_404))
end)))
end))))
end
| FStar_Absyn_Syntax.Exp_constant (c) -> begin
(let t = (FStar_Tc_Recheck.typing_const e.FStar_Absyn_Syntax.pos c)
in (let e = (FStar_Absyn_Syntax.mk_Exp_constant c (Some (t)) e.FStar_Absyn_Syntax.pos)
in (value_check_expected_typ env e (FStar_Util.Inl (t)))))
end
| FStar_Absyn_Syntax.Exp_abs (bs, body) -> begin
(let fail = (fun msg t -> (let _108_409 = (let _108_408 = (let _108_407 = (FStar_Tc_Errors.expected_a_term_of_type_t_got_a_function env msg t top)
in (_108_407, top.FStar_Absyn_Syntax.pos))
in FStar_Absyn_Syntax.Error (_108_408))
in (Prims.raise _108_409)))
in (let rec expected_function_typ = (fun env t0 -> (match (t0) with
| None -> begin
(let _39_994 = (match (env.FStar_Tc_Env.letrecs) with
| [] -> begin
()
end
| _39_993 -> begin
(FStar_All.failwith "Impossible")
end)
in (let _39_999 = (tc_binders env bs)
in (match (_39_999) with
| (bs, envbody, g) -> begin
(None, bs, [], None, envbody, g)
end)))
end
| Some (t) -> begin
(let t = (FStar_Absyn_Util.compress_typ t)
in (let rec as_function_typ = (fun norm t -> (match ((let _108_418 = (FStar_Absyn_Util.compress_typ t)
in _108_418.FStar_Absyn_Syntax.n)) with
| (FStar_Absyn_Syntax.Typ_uvar (_)) | (FStar_Absyn_Syntax.Typ_app ({FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Typ_uvar (_); FStar_Absyn_Syntax.tk = _; FStar_Absyn_Syntax.pos = _; FStar_Absyn_Syntax.fvs = _; FStar_Absyn_Syntax.uvs = _}, _)) -> begin
(let _39_1028 = (match (env.FStar_Tc_Env.letrecs) with
| [] -> begin
()
end
| _39_1027 -> begin
(FStar_All.failwith "Impossible")
end)
in (let _39_1033 = (tc_binders env bs)
in (match (_39_1033) with
| (bs, envbody, g) -> begin
(let _39_1037 = (FStar_Tc_Env.clear_expected_typ envbody)
in (match (_39_1037) with
| (envbody, _39_1036) -> begin
(Some ((t, true)), bs, [], None, envbody, g)
end))
end)))
end
| FStar_Absyn_Syntax.Typ_fun (bs', c) -> begin
(let rec tc_binders = (fun _39_1047 bs_annot c bs -> (match (_39_1047) with
| (out, env, g, subst) -> begin
(match ((bs_annot, bs)) with
| ([], []) -> begin
(let _108_427 = (FStar_Absyn_Util.subst_comp subst c)
in ((FStar_List.rev out), env, g, _108_427))
end
| (hdannot::tl_annot, hd::tl) -> begin
(match ((hdannot, hd)) with
| ((FStar_Util.Inl (_39_1062), _39_1065), (FStar_Util.Inr (_39_1068), _39_1071)) -> begin
(let env = (maybe_push_binding env hdannot)
in (tc_binders ((hdannot)::out, env, g, subst) tl_annot c bs))
end
| ((FStar_Util.Inl (a), _39_1078), (FStar_Util.Inl (b), imp)) -> begin
(let ka = (FStar_Absyn_Util.subst_kind subst a.FStar_Absyn_Syntax.sort)
in (let _39_1096 = (match (b.FStar_Absyn_Syntax.sort.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Kind_unknown -> begin
(ka, FStar_Tc_Rel.trivial_guard)
end
| _39_1088 -> begin
(let _39_1091 = (tc_kind env b.FStar_Absyn_Syntax.sort)
in (match (_39_1091) with
| (k, g1) -> begin
(let g2 = (FStar_Tc_Rel.keq env None ka k)
in (let g = (let _108_428 = (FStar_Tc_Rel.conj_guard g1 g2)
in (FStar_Tc_Rel.conj_guard g _108_428))
in (k, g)))
end))
end)
in (match (_39_1096) with
| (k, g) -> begin
(let b = (FStar_Util.Inl ((let _39_1097 = b
in {FStar_Absyn_Syntax.v = _39_1097.FStar_Absyn_Syntax.v; FStar_Absyn_Syntax.sort = k; FStar_Absyn_Syntax.p = _39_1097.FStar_Absyn_Syntax.p})), imp)
in (let env = (maybe_push_binding env b)
in (let subst = (maybe_alpha_subst subst hdannot b)
in (tc_binders ((b)::out, env, g, subst) tl_annot c tl))))
end)))
end
| ((FStar_Util.Inr (x), _39_1105), (FStar_Util.Inr (y), imp)) -> begin
(let tx = (FStar_Absyn_Util.subst_typ subst x.FStar_Absyn_Syntax.sort)
in (let _39_1127 = (match ((let _108_429 = (FStar_Absyn_Util.unmeta_typ y.FStar_Absyn_Syntax.sort)
in _108_429.FStar_Absyn_Syntax.n)) with
| FStar_Absyn_Syntax.Typ_unknown -> begin
(tx, g)
end
| _39_1115 -> begin
(let _39_1116 = (match ((FStar_Tc_Env.debug env FStar_Options.High)) with
| true -> begin
(let _108_430 = (FStar_Absyn_Print.binder_to_string hd)
in (FStar_Util.fprint1 "Checking binder %s\n" _108_430))
end
| false -> begin
()
end)
in (let _39_1122 = (tc_typ env y.FStar_Absyn_Syntax.sort)
in (match (_39_1122) with
| (t, _39_1120, g1) -> begin
(let g2 = (FStar_Tc_Rel.teq env tx t)
in (let g = (let _108_431 = (FStar_Tc_Rel.conj_guard g1 g2)
in (FStar_Tc_Rel.conj_guard g _108_431))
in (t, g)))
end)))
end)
in (match (_39_1127) with
| (t, g) -> begin
(let b = (FStar_Util.Inr ((let _39_1128 = y
in {FStar_Absyn_Syntax.v = _39_1128.FStar_Absyn_Syntax.v; FStar_Absyn_Syntax.sort = t; FStar_Absyn_Syntax.p = _39_1128.FStar_Absyn_Syntax.p})), imp)
in (let env = (maybe_push_binding env b)
in (let subst = (maybe_alpha_subst subst hdannot b)
in (tc_binders ((b)::out, env, g, subst) tl_annot c tl))))
end)))
end
| _39_1134 -> begin
(let _108_434 = (let _108_433 = (FStar_Absyn_Print.binder_to_string hdannot)
in (let _108_432 = (FStar_Absyn_Print.binder_to_string hd)
in (FStar_Util.format2 "Annotated %s; given %s" _108_433 _108_432)))
in (fail _108_434 t))
end)
end
| ([], _39_1137) -> begin
(match ((FStar_Absyn_Util.is_total_comp c)) with
| true -> begin
(match ((FStar_All.pipe_right (FStar_Absyn_Util.comp_result c) (whnf env))) with
| {FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Typ_fun (bs_annot, c'); FStar_Absyn_Syntax.tk = _39_1146; FStar_Absyn_Syntax.pos = _39_1144; FStar_Absyn_Syntax.fvs = _39_1142; FStar_Absyn_Syntax.uvs = _39_1140} -> begin
(tc_binders (out, env, g, subst) bs_annot c' bs)
end
| t -> begin
(let _108_436 = (let _108_435 = (FStar_Absyn_Print.tag_of_typ t)
in (FStar_Util.format1 "More arguments than annotated type (%s)" _108_435))
in (fail _108_436 t))
end)
end
| false -> begin
(fail "Curried function, but not total" t)
end)
end
| (_39_1154, []) -> begin
(let c = (let _108_437 = (FStar_Absyn_Syntax.mk_Typ_fun (bs_annot, c) (Some (FStar_Absyn_Syntax.ktype)) c.FStar_Absyn_Syntax.pos)
in (FStar_Absyn_Util.total_comp _108_437 c.FStar_Absyn_Syntax.pos))
in (let _108_438 = (FStar_Absyn_Util.subst_comp subst c)
in ((FStar_List.rev out), env, g, _108_438)))
end)
end))
in (let mk_letrec_environment = (fun actuals env -> (match (env.FStar_Tc_Env.letrecs) with
| [] -> begin
(env, [])
end
| letrecs -> begin
(let _39_1163 = (match ((FStar_Tc_Env.debug env FStar_Options.High)) with
| true -> begin
(let _108_443 = (FStar_Absyn_Print.typ_to_string t)
in (FStar_Util.fprint1 "Building let-rec environment... type of this abstraction is %s\n" _108_443))
end
| false -> begin
()
end)
in (let r = (FStar_Tc_Env.get_range env)
in (let env = (let _39_1166 = env
in {FStar_Tc_Env.solver = _39_1166.FStar_Tc_Env.solver; FStar_Tc_Env.range = _39_1166.FStar_Tc_Env.range; FStar_Tc_Env.curmodule = _39_1166.FStar_Tc_Env.curmodule; FStar_Tc_Env.gamma = _39_1166.FStar_Tc_Env.gamma; FStar_Tc_Env.modules = _39_1166.FStar_Tc_Env.modules; FStar_Tc_Env.expected_typ = _39_1166.FStar_Tc_Env.expected_typ; FStar_Tc_Env.level = _39_1166.FStar_Tc_Env.level; FStar_Tc_Env.sigtab = _39_1166.FStar_Tc_Env.sigtab; FStar_Tc_Env.is_pattern = _39_1166.FStar_Tc_Env.is_pattern; FStar_Tc_Env.instantiate_targs = _39_1166.FStar_Tc_Env.instantiate_targs; FStar_Tc_Env.instantiate_vargs = _39_1166.FStar_Tc_Env.instantiate_vargs; FStar_Tc_Env.effects = _39_1166.FStar_Tc_Env.effects; FStar_Tc_Env.generalize = _39_1166.FStar_Tc_Env.generalize; FStar_Tc_Env.letrecs = []; FStar_Tc_Env.top_level = _39_1166.FStar_Tc_Env.top_level; FStar_Tc_Env.check_uvars = _39_1166.FStar_Tc_Env.check_uvars; FStar_Tc_Env.use_eq = _39_1166.FStar_Tc_Env.use_eq; FStar_Tc_Env.is_iface = _39_1166.FStar_Tc_Env.is_iface; FStar_Tc_Env.admit = _39_1166.FStar_Tc_Env.admit; FStar_Tc_Env.default_effects = _39_1166.FStar_Tc_Env.default_effects})
in (let filter_types_and_functions = (fun bs -> (FStar_All.pipe_right bs (FStar_List.collect (fun b -> (match (b) with
| (FStar_Util.Inl (_39_1173), _39_1176) -> begin
[]
end
| (FStar_Util.Inr (x), _39_1181) -> begin
(match ((let _108_449 = (let _108_448 = (let _108_447 = (FStar_Absyn_Util.unrefine x.FStar_Absyn_Syntax.sort)
in (whnf env _108_447))
in (FStar_Absyn_Util.unrefine _108_448))
in _108_449.FStar_Absyn_Syntax.n)) with
| FStar_Absyn_Syntax.Typ_fun (_39_1184) -> begin
[]
end
| _39_1187 -> begin
(let _108_450 = (FStar_Absyn_Util.bvar_to_exp x)
in (_108_450)::[])
end)
end)))))
in (let precedes = (FStar_Absyn_Util.ftv FStar_Absyn_Const.precedes_lid FStar_Absyn_Syntax.kun)
in (let as_lex_list = (fun dec -> (let _39_1194 = (FStar_Absyn_Util.head_and_args_e dec)
in (match (_39_1194) with
| (head, _39_1193) -> begin
(match (head.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Exp_fvar (fv, _39_1197) when (FStar_Absyn_Syntax.lid_equals fv.FStar_Absyn_Syntax.v FStar_Absyn_Const.lexcons_lid) -> begin
dec
end
| _39_1201 -> begin
(mk_lex_list ((dec)::[]))
end)
end)))
in (let prev_dec = (let ct = (FStar_Absyn_Util.comp_to_comp_typ c)
in (match ((FStar_All.pipe_right ct.FStar_Absyn_Syntax.flags (FStar_List.tryFind (fun _39_6 -> (match (_39_6) with
| FStar_Absyn_Syntax.DECREASES (_39_1205) -> begin
true
end
| _39_1208 -> begin
false
end))))) with
| Some (FStar_Absyn_Syntax.DECREASES (dec)) -> begin
(let _39_1212 = (match (((FStar_List.length bs') <> (FStar_List.length actuals))) with
| true -> begin
(let _108_459 = (let _108_458 = (let _108_457 = (let _108_455 = (FStar_Util.string_of_int (FStar_List.length bs'))
in (let _108_454 = (FStar_Util.string_of_int (FStar_List.length actuals))
in (FStar_Util.format2 "Decreases clause on a function with an unexpected number of arguments (expected %s; got %s)" _108_455 _108_454)))
in (let _108_456 = (FStar_Tc_Env.get_range env)
in (_108_457, _108_456)))
in FStar_Absyn_Syntax.Error (_108_458))
in (Prims.raise _108_459))
end
| false -> begin
()
end)
in (let dec = (as_lex_list dec)
in (let subst = (FStar_List.map2 (fun b a -> (match ((b, a)) with
| ((FStar_Util.Inl (formal), _39_1220), (FStar_Util.Inl (actual), _39_1225)) -> begin
(let _108_463 = (let _108_462 = (FStar_Absyn_Util.btvar_to_typ actual)
in (formal.FStar_Absyn_Syntax.v, _108_462))
in FStar_Util.Inl (_108_463))
end
| ((FStar_Util.Inr (formal), _39_1231), (FStar_Util.Inr (actual), _39_1236)) -> begin
(let _108_465 = (let _108_464 = (FStar_Absyn_Util.bvar_to_exp actual)
in (formal.FStar_Absyn_Syntax.v, _108_464))
in FStar_Util.Inr (_108_465))
end
| _39_1240 -> begin
(FStar_All.failwith "impossible")
end)) bs' actuals)
in (FStar_Absyn_Util.subst_exp subst dec))))
end
| _39_1243 -> begin
(let actual_args = (FStar_All.pipe_right actuals filter_types_and_functions)
in (match (actual_args) with
| i::[] -> begin
i
end
| _39_1248 -> begin
(mk_lex_list actual_args)
end))
end))
in (let letrecs = (FStar_All.pipe_right letrecs (FStar_List.map (fun _39_1252 -> (match (_39_1252) with
| (l, t0) -> begin
(let t = (FStar_Absyn_Util.alpha_typ t0)
in (match ((let _108_467 = (FStar_Absyn_Util.compress_typ t)
in _108_467.FStar_Absyn_Syntax.n)) with
| FStar_Absyn_Syntax.Typ_fun (formals, c) -> begin
(match ((FStar_Util.prefix formals)) with
| (bs, (FStar_Util.Inr (x), imp)) -> begin
(let y = (FStar_Absyn_Util.gen_bvar_p x.FStar_Absyn_Syntax.p x.FStar_Absyn_Syntax.sort)
in (let ct = (FStar_Absyn_Util.comp_to_comp_typ c)
in (let precedes = (match ((FStar_All.pipe_right ct.FStar_Absyn_Syntax.flags (FStar_List.tryFind (fun _39_7 -> (match (_39_7) with
| FStar_Absyn_Syntax.DECREASES (_39_1268) -> begin
true
end
| _39_1271 -> begin
false
end))))) with
| Some (FStar_Absyn_Syntax.DECREASES (dec)) -> begin
(let dec = (as_lex_list dec)
in (let dec = (let subst = (let _108_471 = (let _108_470 = (let _108_469 = (FStar_Absyn_Util.bvar_to_exp y)
in (x.FStar_Absyn_Syntax.v, _108_469))
in FStar_Util.Inr (_108_470))
in (_108_471)::[])
in (FStar_Absyn_Util.subst_exp subst dec))
in (let _108_476 = (let _108_475 = (let _108_474 = (FStar_Absyn_Syntax.varg dec)
in (let _108_473 = (let _108_472 = (FStar_Absyn_Syntax.varg prev_dec)
in (_108_472)::[])
in (_108_474)::_108_473))
in (precedes, _108_475))
in (FStar_Absyn_Syntax.mk_Typ_app _108_476 None r))))
end
| _39_1279 -> begin
(let formal_args = (let _108_479 = (let _108_478 = (let _108_477 = (FStar_Absyn_Syntax.v_binder y)
in (_108_477)::[])
in (FStar_List.append bs _108_478))
in (FStar_All.pipe_right _108_479 filter_types_and_functions))
in (let lhs = (match (formal_args) with
| i::[] -> begin
i
end
| _39_1284 -> begin
(mk_lex_list formal_args)
end)
in (let _108_484 = (let _108_483 = (let _108_482 = (FStar_Absyn_Syntax.varg lhs)
in (let _108_481 = (let _108_480 = (FStar_Absyn_Syntax.varg prev_dec)
in (_108_480)::[])
in (_108_482)::_108_481))
in (precedes, _108_483))
in (FStar_Absyn_Syntax.mk_Typ_app _108_484 None r))))
end)
in (let refined_domain = (FStar_Absyn_Syntax.mk_Typ_refine (y, precedes) None r)
in (let bs = (FStar_List.append bs (((FStar_Util.Inr ((let _39_1288 = x
in {FStar_Absyn_Syntax.v = _39_1288.FStar_Absyn_Syntax.v; FStar_Absyn_Syntax.sort = refined_domain; FStar_Absyn_Syntax.p = _39_1288.FStar_Absyn_Syntax.p})), imp))::[]))
in (let t' = (FStar_Absyn_Syntax.mk_Typ_fun (bs, c) None r)
in (let _39_1292 = (match ((FStar_Tc_Env.debug env FStar_Options.Low)) with
| true -> begin
(let _108_487 = (FStar_Absyn_Print.lbname_to_string l)
in (let _108_486 = (FStar_Absyn_Print.typ_to_string t)
in (let _108_485 = (FStar_Absyn_Print.typ_to_string t')
in (FStar_Util.fprint3 "Refined let rec %s\n\tfrom type %s\n\tto type %s\n" _108_487 _108_486 _108_485))))
end
| false -> begin
()
end)
in (let _39_1299 = (let _108_489 = (let _108_488 = (FStar_Tc_Env.clear_expected_typ env)
in (FStar_All.pipe_right _108_488 Prims.fst))
in (tc_typ _108_489 t'))
in (match (_39_1299) with
| (t', _39_1296, _39_1298) -> begin
(l, t')
end)))))))))
end
| _39_1301 -> begin
(FStar_All.failwith "Impossible")
end)
end
| _39_1303 -> begin
(FStar_All.failwith "Impossible")
end))
end))))
in (let _108_495 = (FStar_All.pipe_right letrecs (FStar_List.fold_left (fun env _39_1308 -> (match (_39_1308) with
| (x, t) -> begin
(FStar_Tc_Env.push_local_binding env (binding_of_lb x t))
end)) env))
in (let _108_494 = (FStar_All.pipe_right letrecs (FStar_List.collect (fun _39_8 -> (match (_39_8) with
| (FStar_Util.Inl (x), t) -> begin
(let _108_493 = (FStar_Absyn_Syntax.v_binder (FStar_Absyn_Util.bvd_to_bvar_s x t))
in (_108_493)::[])
end
| _39_1315 -> begin
[]
end))))
in (_108_495, _108_494)))))))))))
end))
in (let _39_1320 = (tc_binders ([], env, FStar_Tc_Rel.trivial_guard, []) bs' c bs)
in (match (_39_1320) with
| (bs, envbody, g, c) -> begin
(let _39_1323 = (match ((FStar_Options.should_verify env.FStar_Tc_Env.curmodule.FStar_Absyn_Syntax.str)) with
| true -> begin
(mk_letrec_environment bs envbody)
end
| false -> begin
(envbody, [])
end)
in (match (_39_1323) with
| (envbody, letrecs) -> begin
(let envbody = (FStar_Tc_Env.set_expected_typ envbody (FStar_Absyn_Util.comp_result c))
in (Some ((t, false)), bs, letrecs, Some (c), envbody, g))
end))
end))))
end
| FStar_Absyn_Syntax.Typ_refine (b, _39_1327) -> begin
(let _39_1337 = (as_function_typ norm b.FStar_Absyn_Syntax.sort)
in (match (_39_1337) with
| (_39_1331, bs, bs', copt, env, g) -> begin
(Some ((t, false)), bs, bs', copt, env, g)
end))
end
| _39_1339 -> begin
(match ((not (norm))) with
| true -> begin
(let _108_496 = (whnf env t)
in (as_function_typ true _108_496))
end
| false -> begin
(let _39_1348 = (expected_function_typ env None)
in (match (_39_1348) with
| (_39_1341, bs, _39_1344, c_opt, envbody, g) -> begin
(Some ((t, false)), bs, [], c_opt, envbody, g)
end))
end)
end))
in (as_function_typ false t)))
end))
in (let use_eq = env.FStar_Tc_Env.use_eq
in (let _39_1352 = (FStar_Tc_Env.clear_expected_typ env)
in (match (_39_1352) with
| (env, topt) -> begin
(let _39_1359 = (expected_function_typ env topt)
in (match (_39_1359) with
| (tfun_opt, bs, letrec_binders, c_opt, envbody, g) -> begin
(let _39_1365 = (tc_exp (let _39_1360 = envbody
in {FStar_Tc_Env.solver = _39_1360.FStar_Tc_Env.solver; FStar_Tc_Env.range = _39_1360.FStar_Tc_Env.range; FStar_Tc_Env.curmodule = _39_1360.FStar_Tc_Env.curmodule; FStar_Tc_Env.gamma = _39_1360.FStar_Tc_Env.gamma; FStar_Tc_Env.modules = _39_1360.FStar_Tc_Env.modules; FStar_Tc_Env.expected_typ = _39_1360.FStar_Tc_Env.expected_typ; FStar_Tc_Env.level = _39_1360.FStar_Tc_Env.level; FStar_Tc_Env.sigtab = _39_1360.FStar_Tc_Env.sigtab; FStar_Tc_Env.is_pattern = _39_1360.FStar_Tc_Env.is_pattern; FStar_Tc_Env.instantiate_targs = _39_1360.FStar_Tc_Env.instantiate_targs; FStar_Tc_Env.instantiate_vargs = _39_1360.FStar_Tc_Env.instantiate_vargs; FStar_Tc_Env.effects = _39_1360.FStar_Tc_Env.effects; FStar_Tc_Env.generalize = _39_1360.FStar_Tc_Env.generalize; FStar_Tc_Env.letrecs = _39_1360.FStar_Tc_Env.letrecs; FStar_Tc_Env.top_level = false; FStar_Tc_Env.check_uvars = _39_1360.FStar_Tc_Env.check_uvars; FStar_Tc_Env.use_eq = use_eq; FStar_Tc_Env.is_iface = _39_1360.FStar_Tc_Env.is_iface; FStar_Tc_Env.admit = _39_1360.FStar_Tc_Env.admit; FStar_Tc_Env.default_effects = _39_1360.FStar_Tc_Env.default_effects}) body)
in (match (_39_1365) with
| (body, cbody, guard_body) -> begin
(let _39_1366 = (match ((FStar_Tc_Env.debug env FStar_Options.Medium)) with
| true -> begin
(let _108_499 = (FStar_Absyn_Print.exp_to_string body)
in (let _108_498 = (FStar_Absyn_Print.lcomp_typ_to_string cbody)
in (let _108_497 = (FStar_Tc_Rel.guard_to_string env guard_body)
in (FStar_Util.fprint3 "!!!!!!!!!!!!!!!body %s has type %s\nguard is %s\n" _108_499 _108_498 _108_497))))
end
| false -> begin
()
end)
in (let guard_body = (FStar_Tc_Rel.solve_deferred_constraints envbody guard_body)
in (let _39_1369 = (match ((FStar_All.pipe_left (FStar_Tc_Env.debug env) (FStar_Options.Other ("Implicits")))) with
| true -> begin
(let _108_500 = (FStar_All.pipe_left FStar_Util.string_of_int (FStar_List.length guard_body.FStar_Tc_Rel.implicits))
in (FStar_Util.fprint1 "Introduced %s implicits in body of abstraction\n" _108_500))
end
| false -> begin
()
end)
in (let _39_1376 = (let _108_502 = (let _108_501 = (cbody.FStar_Absyn_Syntax.comp ())
in (body, _108_501))
in (check_expected_effect (let _39_1371 = envbody
in {FStar_Tc_Env.solver = _39_1371.FStar_Tc_Env.solver; FStar_Tc_Env.range = _39_1371.FStar_Tc_Env.range; FStar_Tc_Env.curmodule = _39_1371.FStar_Tc_Env.curmodule; FStar_Tc_Env.gamma = _39_1371.FStar_Tc_Env.gamma; FStar_Tc_Env.modules = _39_1371.FStar_Tc_Env.modules; FStar_Tc_Env.expected_typ = _39_1371.FStar_Tc_Env.expected_typ; FStar_Tc_Env.level = _39_1371.FStar_Tc_Env.level; FStar_Tc_Env.sigtab = _39_1371.FStar_Tc_Env.sigtab; FStar_Tc_Env.is_pattern = _39_1371.FStar_Tc_Env.is_pattern; FStar_Tc_Env.instantiate_targs = _39_1371.FStar_Tc_Env.instantiate_targs; FStar_Tc_Env.instantiate_vargs = _39_1371.FStar_Tc_Env.instantiate_vargs; FStar_Tc_Env.effects = _39_1371.FStar_Tc_Env.effects; FStar_Tc_Env.generalize = _39_1371.FStar_Tc_Env.generalize; FStar_Tc_Env.letrecs = _39_1371.FStar_Tc_Env.letrecs; FStar_Tc_Env.top_level = _39_1371.FStar_Tc_Env.top_level; FStar_Tc_Env.check_uvars = _39_1371.FStar_Tc_Env.check_uvars; FStar_Tc_Env.use_eq = use_eq; FStar_Tc_Env.is_iface = _39_1371.FStar_Tc_Env.is_iface; FStar_Tc_Env.admit = _39_1371.FStar_Tc_Env.admit; FStar_Tc_Env.default_effects = _39_1371.FStar_Tc_Env.default_effects}) c_opt _108_502))
in (match (_39_1376) with
| (body, cbody, guard) -> begin
(let guard = (FStar_Tc_Rel.conj_guard guard_body guard)
in (let guard = (match ((env.FStar_Tc_Env.top_level || (not ((FStar_Options.should_verify env.FStar_Tc_Env.curmodule.FStar_Absyn_Syntax.str))))) with
| true -> begin
(let _39_1378 = (let _108_503 = (FStar_Tc_Rel.conj_guard g guard)
in (FStar_Tc_Util.discharge_guard envbody _108_503))
in (let _39_1380 = FStar_Tc_Rel.trivial_guard
in {FStar_Tc_Rel.guard_f = _39_1380.FStar_Tc_Rel.guard_f; FStar_Tc_Rel.deferred = _39_1380.FStar_Tc_Rel.deferred; FStar_Tc_Rel.implicits = guard.FStar_Tc_Rel.implicits}))
end
| false -> begin
(let guard = (FStar_Tc_Rel.close_guard (FStar_List.append bs letrec_binders) guard)
in (FStar_Tc_Rel.conj_guard g guard))
end)
in (let tfun_computed = (FStar_Absyn_Syntax.mk_Typ_fun (bs, cbody) (Some (FStar_Absyn_Syntax.ktype)) top.FStar_Absyn_Syntax.pos)
in (let e = (let _108_505 = (let _108_504 = (FStar_Absyn_Syntax.mk_Exp_abs (bs, body) (Some (tfun_computed)) top.FStar_Absyn_Syntax.pos)
in (_108_504, tfun_computed, Some (FStar_Absyn_Const.effect_Tot_lid)))
in (FStar_Absyn_Syntax.mk_Exp_ascribed _108_505 None top.FStar_Absyn_Syntax.pos))
in (let _39_1403 = (match (tfun_opt) with
| Some (t, use_teq) -> begin
(let t = (FStar_Absyn_Util.compress_typ t)
in (match (t.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_fun (_39_1392) -> begin
(let _108_508 = (let _108_507 = (let _108_506 = (FStar_Absyn_Syntax.mk_Exp_abs (bs, body) (Some (t)) e.FStar_Absyn_Syntax.pos)
in (_108_506, t, Some (FStar_Absyn_Const.effect_Tot_lid)))
in (FStar_Absyn_Syntax.mk_Exp_ascribed _108_507 None top.FStar_Absyn_Syntax.pos))
in (_108_508, t, guard))
end
| _39_1395 -> begin
(let _39_1398 = (match (use_teq) with
| true -> begin
(let _108_509 = (FStar_Tc_Rel.teq env t tfun_computed)
in (e, _108_509))
end
| false -> begin
(FStar_Tc_Util.check_and_ascribe env e tfun_computed t)
end)
in (match (_39_1398) with
| (e, guard') -> begin
(let _108_511 = (FStar_Absyn_Syntax.mk_Exp_ascribed (e, t, Some (FStar_Absyn_Const.effect_Tot_lid)) None top.FStar_Absyn_Syntax.pos)
in (let _108_510 = (FStar_Tc_Rel.conj_guard guard guard')
in (_108_511, t, _108_510)))
end))
end))
end
| None -> begin
(e, tfun_computed, guard)
end)
in (match (_39_1403) with
| (e, tfun, guard) -> begin
(let _39_1404 = (match ((FStar_Tc_Env.debug env FStar_Options.Low)) with
| true -> begin
(let _108_514 = (FStar_Absyn_Print.typ_to_string tfun)
in (let _108_513 = (FStar_Absyn_Print.tag_of_typ tfun)
in (let _108_512 = (FStar_Tc_Rel.guard_to_string env guard)
in (FStar_Util.fprint3 "!!!!!!!!!!!!!!!Annotating lambda with type %s (%s)\nGuard is %s\n" _108_514 _108_513 _108_512))))
end
| false -> begin
()
end)
in (let c = (match (env.FStar_Tc_Env.top_level) with
| true -> begin
(FStar_Absyn_Syntax.mk_Total tfun)
end
| false -> begin
(FStar_Tc_Util.return_value env tfun e)
end)
in (let _39_1409 = (let _108_516 = (FStar_Tc_Util.lcomp_of_comp c)
in (FStar_Tc_Util.strengthen_precondition None env e _108_516 guard))
in (match (_39_1409) with
| (c, g) -> begin
(e, c, g)
end))))
end))))))
end)))))
end))
end))
end)))))
end
| _39_1411 -> begin
(let _108_518 = (let _108_517 = (FStar_Absyn_Print.exp_to_string e)
in (FStar_Util.format1 "Unexpected value: %s" _108_517))
in (FStar_All.failwith _108_518))
end))))
and tc_exp = (fun env e -> (let env = (match ((e.FStar_Absyn_Syntax.pos = FStar_Absyn_Syntax.dummyRange)) with
| true -> begin
env
end
| false -> begin
(FStar_Tc_Env.set_range env e.FStar_Absyn_Syntax.pos)
end)
in (let _39_1415 = (match ((FStar_Tc_Env.debug env FStar_Options.Low)) with
| true -> begin
(let _108_523 = (let _108_521 = (FStar_Tc_Env.get_range env)
in (FStar_All.pipe_left FStar_Range.string_of_range _108_521))
in (let _108_522 = (FStar_Absyn_Print.tag_of_exp e)
in (FStar_Util.fprint2 "%s (%s)\n" _108_523 _108_522)))
end
| false -> begin
()
end)
in (let w = (fun lc -> (FStar_All.pipe_left (FStar_Absyn_Syntax.syn e.FStar_Absyn_Syntax.pos) (Some (lc.FStar_Absyn_Syntax.res_typ))))
in (let top = e
in (match (e.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Exp_delayed (_39_1421) -> begin
(let _108_547 = (FStar_Absyn_Util.compress_exp e)
in (tc_exp env _108_547))
end
| (FStar_Absyn_Syntax.Exp_uvar (_)) | (FStar_Absyn_Syntax.Exp_bvar (_)) | (FStar_Absyn_Syntax.Exp_fvar (_)) | (FStar_Absyn_Syntax.Exp_constant (_)) | (FStar_Absyn_Syntax.Exp_abs (_)) -> begin
(tc_value env e)
end
| FStar_Absyn_Syntax.Exp_ascribed (e1, t1, _39_1441) -> begin
(let _39_1446 = (tc_typ_check env t1 FStar_Absyn_Syntax.ktype)
in (match (_39_1446) with
| (t1, f) -> begin
(let _39_1450 = (let _108_548 = (FStar_Tc_Env.set_expected_typ env t1)
in (tc_exp _108_548 e1))
in (match (_39_1450) with
| (e1, c, g) -> begin
(let _39_1454 = (let _108_552 = (FStar_Tc_Env.set_range env t1.FStar_Absyn_Syntax.pos)
in (FStar_Tc_Util.strengthen_precondition (Some ((fun _39_1451 -> (match (()) with
| () -> begin
FStar_Tc_Errors.ill_kinded_type
end)))) _108_552 e1 c f))
in (match (_39_1454) with
| (c, f) -> begin
(let _39_1458 = (let _108_556 = (let _108_555 = (w c)
in (FStar_All.pipe_left _108_555 (FStar_Absyn_Syntax.mk_Exp_ascribed (e1, t1, Some (c.FStar_Absyn_Syntax.eff_name)))))
in (comp_check_expected_typ env _108_556 c))
in (match (_39_1458) with
| (e, c, f2) -> begin
(let _108_558 = (let _108_557 = (FStar_Tc_Rel.conj_guard g f2)
in (FStar_Tc_Rel.conj_guard f _108_557))
in (e, c, _108_558))
end))
end))
end))
end))
end
| FStar_Absyn_Syntax.Exp_meta (FStar_Absyn_Syntax.Meta_desugared (e, FStar_Absyn_Syntax.Sequence)) -> begin
(match ((let _108_559 = (FStar_Absyn_Util.compress_exp e)
in _108_559.FStar_Absyn_Syntax.n)) with
| FStar_Absyn_Syntax.Exp_let ((_39_1465, {FStar_Absyn_Syntax.lbname = x; FStar_Absyn_Syntax.lbtyp = _39_1470; FStar_Absyn_Syntax.lbeff = _39_1468; FStar_Absyn_Syntax.lbdef = e1}::[]), e2) -> begin
(let _39_1481 = (let _108_560 = (FStar_Tc_Env.set_expected_typ env FStar_Tc_Recheck.t_unit)
in (tc_exp _108_560 e1))
in (match (_39_1481) with
| (e1, c1, g1) -> begin
(let _39_1485 = (tc_exp env e2)
in (match (_39_1485) with
| (e2, c2, g2) -> begin
(let c = (FStar_Tc_Util.bind env (Some (e1)) c1 (None, c2))
in (let _108_573 = (let _108_571 = (let _108_570 = (let _108_569 = (let _108_568 = (w c)
in (let _108_567 = (let _108_566 = (let _108_565 = (let _108_564 = (let _108_563 = (FStar_Absyn_Syntax.mk_lb (x, c1.FStar_Absyn_Syntax.eff_name, FStar_Tc_Recheck.t_unit, e1))
in (_108_563)::[])
in (false, _108_564))
in (_108_565, e2))
in (FStar_Absyn_Syntax.mk_Exp_let _108_566))
in (FStar_All.pipe_left _108_568 _108_567)))
in (_108_569, FStar_Absyn_Syntax.Sequence))
in FStar_Absyn_Syntax.Meta_desugared (_108_570))
in (FStar_Absyn_Syntax.mk_Exp_meta _108_571))
in (let _108_572 = (FStar_Tc_Rel.conj_guard g1 g2)
in (_108_573, c, _108_572))))
end))
end))
end
| _39_1488 -> begin
(let _39_1492 = (tc_exp env e)
in (match (_39_1492) with
| (e, c, g) -> begin
(let _108_574 = (FStar_Absyn_Syntax.mk_Exp_meta (FStar_Absyn_Syntax.Meta_desugared ((e, FStar_Absyn_Syntax.Sequence))))
in (_108_574, c, g))
end))
end)
end
| FStar_Absyn_Syntax.Exp_meta (FStar_Absyn_Syntax.Meta_desugared (e, i)) -> begin
(let _39_1501 = (tc_exp env e)
in (match (_39_1501) with
| (e, c, g) -> begin
(let _108_575 = (FStar_Absyn_Syntax.mk_Exp_meta (FStar_Absyn_Syntax.Meta_desugared ((e, i))))
in (_108_575, c, g))
end))
end
| FStar_Absyn_Syntax.Exp_app (head, args) -> begin
(let env0 = env
in (let env = (let _108_577 = (let _108_576 = (FStar_Tc_Env.clear_expected_typ env)
in (FStar_All.pipe_right _108_576 Prims.fst))
in (FStar_All.pipe_right _108_577 instantiate_both))
in (let _39_1508 = (match ((FStar_Tc_Env.debug env FStar_Options.High)) with
| true -> begin
(let _108_579 = (FStar_Range.string_of_range top.FStar_Absyn_Syntax.pos)
in (let _108_578 = (FStar_Absyn_Print.exp_to_string top)
in (FStar_Util.fprint2 "(%s) Checking app %s\n" _108_579 _108_578)))
end
| false -> begin
()
end)
in (let _39_1513 = (tc_exp (no_inst env) head)
in (match (_39_1513) with
| (head, chead, g_head) -> begin
(let aux = (fun _39_1515 -> (match (()) with
| () -> begin
(let n_args = (FStar_List.length args)
in (match (head.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Exp_fvar (fv, _39_1519) when (((FStar_Absyn_Syntax.lid_equals fv.FStar_Absyn_Syntax.v FStar_Absyn_Const.op_And) || (FStar_Absyn_Syntax.lid_equals fv.FStar_Absyn_Syntax.v FStar_Absyn_Const.op_Or)) && (n_args = 2)) -> begin
(let env = (FStar_Tc_Env.set_expected_typ env FStar_Absyn_Util.t_bool)
in (match (args) with
| (FStar_Util.Inr (e1), _39_1531)::(FStar_Util.Inr (e2), _39_1526)::[] -> begin
(let _39_1537 = (tc_exp env e1)
in (match (_39_1537) with
| (e1, c1, g1) -> begin
(let _39_1541 = (tc_exp env e2)
in (match (_39_1541) with
| (e2, c2, g2) -> begin
(let x = (FStar_Absyn_Util.gen_bvar FStar_Absyn_Util.t_bool)
in (let xexp = (FStar_Absyn_Util.bvar_to_exp x)
in (let c2 = (match ((FStar_Absyn_Syntax.lid_equals fv.FStar_Absyn_Syntax.v FStar_Absyn_Const.op_And)) with
| true -> begin
(let _108_585 = (let _108_582 = (FStar_Absyn_Util.bvar_to_exp x)
in (FStar_All.pipe_left FStar_Absyn_Util.b2t _108_582))
in (let _108_584 = (let _108_583 = (FStar_Tc_Util.return_value env FStar_Absyn_Util.t_bool xexp)
in (FStar_All.pipe_right _108_583 FStar_Tc_Util.lcomp_of_comp))
in (FStar_Tc_Util.ite env _108_585 c2 _108_584)))
end
| false -> begin
(let _108_589 = (let _108_586 = (FStar_Absyn_Util.bvar_to_exp x)
in (FStar_All.pipe_left FStar_Absyn_Util.b2t _108_586))
in (let _108_588 = (let _108_587 = (FStar_Tc_Util.return_value env FStar_Absyn_Util.t_bool xexp)
in (FStar_All.pipe_right _108_587 FStar_Tc_Util.lcomp_of_comp))
in (FStar_Tc_Util.ite env _108_589 _108_588 c2)))
end)
in (let c = (let _108_592 = (let _108_591 = (FStar_All.pipe_left (fun _108_590 -> Some (_108_590)) (FStar_Tc_Env.Binding_var ((x.FStar_Absyn_Syntax.v, FStar_Absyn_Util.t_bool))))
in (_108_591, c2))
in (FStar_Tc_Util.bind env None c1 _108_592))
in (let e = (let _108_597 = (let _108_596 = (let _108_595 = (FStar_Absyn_Syntax.varg e1)
in (let _108_594 = (let _108_593 = (FStar_Absyn_Syntax.varg e2)
in (_108_593)::[])
in (_108_595)::_108_594))
in (head, _108_596))
in (FStar_Absyn_Syntax.mk_Exp_app _108_597 (Some (FStar_Absyn_Util.t_bool)) top.FStar_Absyn_Syntax.pos))
in (let _108_599 = (let _108_598 = (FStar_Tc_Rel.conj_guard g1 g2)
in (FStar_Tc_Rel.conj_guard g_head _108_598))
in (e, c, _108_599)))))))
end))
end))
end
| _39_1548 -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Expected two boolean arguments", head.FStar_Absyn_Syntax.pos))))
end))
end
| _39_1550 -> begin
(let thead = chead.FStar_Absyn_Syntax.res_typ
in (let _39_1552 = (match ((FStar_Tc_Env.debug env FStar_Options.High)) with
| true -> begin
(let _108_601 = (FStar_Range.string_of_range head.FStar_Absyn_Syntax.pos)
in (let _108_600 = (FStar_Absyn_Print.typ_to_string thead)
in (FStar_Util.fprint2 "(%s) Type of head is %s\n" _108_601 _108_600)))
end
| false -> begin
()
end)
in (let rec check_function_app = (fun norm tf -> (match ((let _108_606 = (FStar_Absyn_Util.unrefine tf)
in _108_606.FStar_Absyn_Syntax.n)) with
| (FStar_Absyn_Syntax.Typ_uvar (_)) | (FStar_Absyn_Syntax.Typ_app ({FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Typ_uvar (_); FStar_Absyn_Syntax.tk = _; FStar_Absyn_Syntax.pos = _; FStar_Absyn_Syntax.fvs = _; FStar_Absyn_Syntax.uvs = _}, _)) -> begin
(let rec tc_args = (fun env args -> (match (args) with
| [] -> begin
([], [], FStar_Tc_Rel.trivial_guard)
end
| (FStar_Util.Inl (t), _39_1585)::_39_1581 -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Explicit type applications on a term with unknown type; add an annotation?", t.FStar_Absyn_Syntax.pos))))
end
| (FStar_Util.Inr (e), imp)::tl -> begin
(let _39_1597 = (tc_exp env e)
in (match (_39_1597) with
| (e, c, g_e) -> begin
(let _39_1601 = (tc_args env tl)
in (match (_39_1601) with
| (args, comps, g_rest) -> begin
(let _108_611 = (FStar_Tc_Rel.conj_guard g_e g_rest)
in (((FStar_Util.Inr (e), imp))::args, (c)::comps, _108_611))
end))
end))
end))
in (let _39_1605 = (tc_args env args)
in (match (_39_1605) with
| (args, comps, g_args) -> begin
(let bs = (let _108_612 = (FStar_Tc_Util.tks_of_args args)
in (FStar_Absyn_Util.null_binders_of_tks _108_612))
in (let cres = (let _108_613 = (FStar_Tc_Util.new_tvar env FStar_Absyn_Syntax.ktype)
in (FStar_Absyn_Util.ml_comp _108_613 top.FStar_Absyn_Syntax.pos))
in (let _39_1608 = (let _108_615 = (let _108_614 = (FStar_Absyn_Syntax.mk_Typ_fun (bs, cres) (Some (FStar_Absyn_Syntax.ktype)) tf.FStar_Absyn_Syntax.pos)
in (FStar_Tc_Rel.teq env tf _108_614))
in (FStar_All.pipe_left (FStar_Tc_Util.force_trivial env) _108_615))
in (let comp = (let _108_618 = (FStar_All.pipe_left FStar_Tc_Util.lcomp_of_comp cres)
in (FStar_List.fold_right (fun c out -> (FStar_Tc_Util.bind env None c (None, out))) ((chead)::comps) _108_618))
in (let _108_620 = (FStar_Absyn_Syntax.mk_Exp_app (head, args) (Some (comp.FStar_Absyn_Syntax.res_typ)) top.FStar_Absyn_Syntax.pos)
in (let _108_619 = (FStar_Tc_Rel.conj_guard g_head g_args)
in (_108_620, comp, _108_619)))))))
end)))
end
| FStar_Absyn_Syntax.Typ_fun (bs, c) -> begin
(let vars = (FStar_Tc_Env.binders env)
in (let rec tc_args = (fun _39_1625 bs cres args -> (match (_39_1625) with
| (subst, outargs, arg_rets, comps, g, fvs) -> begin
(match ((bs, args)) with
| ((FStar_Util.Inl (a), Some (FStar_Absyn_Syntax.Implicit))::rest, (_39_1639, None)::_39_1637) -> begin
(let k = (FStar_Absyn_Util.subst_kind subst a.FStar_Absyn_Syntax.sort)
in (let _39_1645 = (fxv_check head env (FStar_Util.Inl (k)) fvs)
in (let _39_1649 = (let _108_656 = (let _108_655 = (FStar_List.hd args)
in (FStar_Absyn_Util.range_of_arg _108_655))
in (FStar_Tc_Rel.new_tvar _108_656 vars k))
in (match (_39_1649) with
| (targ, u) -> begin
(let _39_1650 = (match ((FStar_Tc_Env.debug env FStar_Options.Extreme)) with
| true -> begin
(let _108_658 = (FStar_Absyn_Print.strBvd a.FStar_Absyn_Syntax.v)
in (let _108_657 = (FStar_Absyn_Print.typ_to_string targ)
in (FStar_Util.fprint2 "Instantiating %s to %s" _108_658 _108_657)))
end
| false -> begin
()
end)
in (let subst = (FStar_Util.Inl ((a.FStar_Absyn_Syntax.v, targ)))::subst
in (let arg = (let _108_659 = (FStar_Absyn_Syntax.as_implicit true)
in (FStar_Util.Inl (targ), _108_659))
in (let _108_668 = (let _108_667 = (let _108_666 = (let _108_665 = (let _108_664 = (FStar_Tc_Util.as_uvar_t u)
in (_108_664, u.FStar_Absyn_Syntax.pos))
in FStar_Util.Inl (_108_665))
in (add_implicit _108_666 g))
in (subst, (arg)::outargs, (arg)::arg_rets, comps, _108_667, fvs))
in (tc_args _108_668 rest cres args)))))
end))))
end
| ((FStar_Util.Inr (x), Some (FStar_Absyn_Syntax.Implicit))::rest, (_39_1664, None)::_39_1662) -> begin
(let t = (FStar_Absyn_Util.subst_typ subst x.FStar_Absyn_Syntax.sort)
in (let _39_1670 = (fxv_check head env (FStar_Util.Inr (t)) fvs)
in (let _39_1674 = (FStar_Tc_Util.new_implicit_evar env t)
in (match (_39_1674) with
| (varg, u) -> begin
(let subst = (FStar_Util.Inr ((x.FStar_Absyn_Syntax.v, varg)))::subst
in (let arg = (let _108_669 = (FStar_Absyn_Syntax.as_implicit true)
in (FStar_Util.Inr (varg), _108_669))
in (tc_args (subst, (arg)::outargs, (arg)::arg_rets, comps, (add_implicit (FStar_Util.Inr (u)) g), fvs) rest cres args)))
end))))
end
| ((FStar_Util.Inl (a), aqual)::rest, (FStar_Util.Inl (t), aq)::rest') -> begin
(let _39_1690 = (match ((FStar_Tc_Env.debug env FStar_Options.Extreme)) with
| true -> begin
(let _108_675 = (FStar_Absyn_Print.strBvd a.FStar_Absyn_Syntax.v)
in (let _108_674 = (FStar_Absyn_Print.typ_to_string t)
in (FStar_Util.fprint2 "\tGot a type arg for %s = %s\n" _108_675 _108_674)))
end
| false -> begin
()
end)
in (let k = (FStar_Absyn_Util.subst_kind subst a.FStar_Absyn_Syntax.sort)
in (let _39_1693 = (fxv_check head env (FStar_Util.Inl (k)) fvs)
in (let _39_1699 = (tc_typ_check (let _39_1695 = env
in {FStar_Tc_Env.solver = _39_1695.FStar_Tc_Env.solver; FStar_Tc_Env.range = _39_1695.FStar_Tc_Env.range; FStar_Tc_Env.curmodule = _39_1695.FStar_Tc_Env.curmodule; FStar_Tc_Env.gamma = _39_1695.FStar_Tc_Env.gamma; FStar_Tc_Env.modules = _39_1695.FStar_Tc_Env.modules; FStar_Tc_Env.expected_typ = _39_1695.FStar_Tc_Env.expected_typ; FStar_Tc_Env.level = _39_1695.FStar_Tc_Env.level; FStar_Tc_Env.sigtab = _39_1695.FStar_Tc_Env.sigtab; FStar_Tc_Env.is_pattern = _39_1695.FStar_Tc_Env.is_pattern; FStar_Tc_Env.instantiate_targs = _39_1695.FStar_Tc_Env.instantiate_targs; FStar_Tc_Env.instantiate_vargs = _39_1695.FStar_Tc_Env.instantiate_vargs; FStar_Tc_Env.effects = _39_1695.FStar_Tc_Env.effects; FStar_Tc_Env.generalize = _39_1695.FStar_Tc_Env.generalize; FStar_Tc_Env.letrecs = _39_1695.FStar_Tc_Env.letrecs; FStar_Tc_Env.top_level = _39_1695.FStar_Tc_Env.top_level; FStar_Tc_Env.check_uvars = _39_1695.FStar_Tc_Env.check_uvars; FStar_Tc_Env.use_eq = (is_eq aqual); FStar_Tc_Env.is_iface = _39_1695.FStar_Tc_Env.is_iface; FStar_Tc_Env.admit = _39_1695.FStar_Tc_Env.admit; FStar_Tc_Env.default_effects = _39_1695.FStar_Tc_Env.default_effects}) t k)
in (match (_39_1699) with
| (t, g') -> begin
(let f = (let _108_676 = (FStar_Tc_Rel.guard_form g')
in (FStar_Tc_Util.label_guard FStar_Tc_Errors.ill_kinded_type t.FStar_Absyn_Syntax.pos _108_676))
in (let g' = (let _39_1701 = g'
in {FStar_Tc_Rel.guard_f = f; FStar_Tc_Rel.deferred = _39_1701.FStar_Tc_Rel.deferred; FStar_Tc_Rel.implicits = _39_1701.FStar_Tc_Rel.implicits})
in (let arg = (FStar_Util.Inl (t), aq)
in (let subst = (let _108_677 = (FStar_List.hd bs)
in (maybe_extend_subst subst _108_677 arg))
in (let _108_683 = (let _108_682 = (FStar_Tc_Rel.conj_guard g g')
in (subst, (arg)::outargs, (arg)::arg_rets, comps, _108_682, fvs))
in (tc_args _108_683 rest cres rest'))))))
end)))))
end
| ((FStar_Util.Inr (x), aqual)::rest, (FStar_Util.Inr (e), aq)::rest') -> begin
(let _39_1719 = (match ((FStar_Tc_Env.debug env FStar_Options.Extreme)) with
| true -> begin
(let _108_685 = (FStar_Absyn_Print.subst_to_string subst)
in (let _108_684 = (FStar_Absyn_Print.typ_to_string x.FStar_Absyn_Syntax.sort)
in (FStar_Util.fprint2 "\tType of arg (before subst (%s)) = %s\n" _108_685 _108_684)))
end
| false -> begin
()
end)
in (let targ = (FStar_Absyn_Util.subst_typ subst x.FStar_Absyn_Syntax.sort)
in (let _39_1722 = (match ((FStar_Tc_Env.debug env FStar_Options.Extreme)) with
| true -> begin
(let _108_686 = (FStar_Absyn_Print.typ_to_string targ)
in (FStar_Util.fprint1 "\tType of arg (after subst) = %s\n" _108_686))
end
| false -> begin
()
end)
in (let _39_1724 = (fxv_check head env (FStar_Util.Inr (targ)) fvs)
in (let env = (FStar_Tc_Env.set_expected_typ env targ)
in (let env = (let _39_1727 = env
in {FStar_Tc_Env.solver = _39_1727.FStar_Tc_Env.solver; FStar_Tc_Env.range = _39_1727.FStar_Tc_Env.range; FStar_Tc_Env.curmodule = _39_1727.FStar_Tc_Env.curmodule; FStar_Tc_Env.gamma = _39_1727.FStar_Tc_Env.gamma; FStar_Tc_Env.modules = _39_1727.FStar_Tc_Env.modules; FStar_Tc_Env.expected_typ = _39_1727.FStar_Tc_Env.expected_typ; FStar_Tc_Env.level = _39_1727.FStar_Tc_Env.level; FStar_Tc_Env.sigtab = _39_1727.FStar_Tc_Env.sigtab; FStar_Tc_Env.is_pattern = _39_1727.FStar_Tc_Env.is_pattern; FStar_Tc_Env.instantiate_targs = _39_1727.FStar_Tc_Env.instantiate_targs; FStar_Tc_Env.instantiate_vargs = _39_1727.FStar_Tc_Env.instantiate_vargs; FStar_Tc_Env.effects = _39_1727.FStar_Tc_Env.effects; FStar_Tc_Env.generalize = _39_1727.FStar_Tc_Env.generalize; FStar_Tc_Env.letrecs = _39_1727.FStar_Tc_Env.letrecs; FStar_Tc_Env.top_level = _39_1727.FStar_Tc_Env.top_level; FStar_Tc_Env.check_uvars = _39_1727.FStar_Tc_Env.check_uvars; FStar_Tc_Env.use_eq = (is_eq aqual); FStar_Tc_Env.is_iface = _39_1727.FStar_Tc_Env.is_iface; FStar_Tc_Env.admit = _39_1727.FStar_Tc_Env.admit; FStar_Tc_Env.default_effects = _39_1727.FStar_Tc_Env.default_effects})
in (let _39_1730 = (match (((FStar_All.pipe_left (FStar_Tc_Env.debug env) (FStar_Options.Other ("EQ"))) && env.FStar_Tc_Env.use_eq)) with
| true -> begin
(let _108_688 = (FStar_Absyn_Print.exp_to_string e)
in (let _108_687 = (FStar_Absyn_Print.typ_to_string targ)
in (FStar_Util.fprint2 "Checking arg %s at type %s with an equality constraint!\n" _108_688 _108_687)))
end
| false -> begin
()
end)
in (let _39_1732 = (match ((FStar_Tc_Env.debug env FStar_Options.High)) with
| true -> begin
(let _108_691 = (FStar_Absyn_Print.tag_of_exp e)
in (let _108_690 = (FStar_Absyn_Print.exp_to_string e)
in (let _108_689 = (FStar_Absyn_Print.typ_to_string targ)
in (FStar_Util.fprint3 "Checking arg (%s) %s at type %s\n" _108_691 _108_690 _108_689))))
end
| false -> begin
()
end)
in (let _39_1737 = (tc_exp env e)
in (match (_39_1737) with
| (e, c, g_e) -> begin
(let g = (FStar_Tc_Rel.conj_guard g g_e)
in (let _39_1739 = (match ((FStar_Tc_Env.debug env FStar_Options.High)) with
| true -> begin
(let _108_693 = (FStar_Tc_Rel.guard_to_string env g_e)
in (let _108_692 = (FStar_Tc_Rel.guard_to_string env g)
in (FStar_Util.fprint2 "Guard on this arg is %s;\naccumulated guard is %s\n" _108_693 _108_692)))
end
| false -> begin
()
end)
in (let arg = (FStar_Util.Inr (e), aq)
in (match ((FStar_Absyn_Util.is_tot_or_gtot_lcomp c)) with
| true -> begin
(let subst = (let _108_694 = (FStar_List.hd bs)
in (maybe_extend_subst subst _108_694 arg))
in (tc_args (subst, (arg)::outargs, (arg)::arg_rets, comps, g, fvs) rest cres rest'))
end
| false -> begin
(match ((FStar_Tc_Util.is_pure_or_ghost_effect env c.FStar_Absyn_Syntax.eff_name)) with
| true -> begin
(let subst = (let _108_699 = (FStar_List.hd bs)
in (maybe_extend_subst subst _108_699 arg))
in (let _39_1746 = (((Some (FStar_Tc_Env.Binding_var ((x.FStar_Absyn_Syntax.v, targ))), c))::comps, g)
in (match (_39_1746) with
| (comps, guard) -> begin
(tc_args (subst, (arg)::outargs, (arg)::arg_rets, comps, guard, fvs) rest cres rest')
end)))
end
| false -> begin
(match ((let _108_704 = (FStar_List.hd bs)
in (FStar_Absyn_Syntax.is_null_binder _108_704))) with
| true -> begin
(let newx = (FStar_Absyn_Util.gen_bvar_p e.FStar_Absyn_Syntax.pos c.FStar_Absyn_Syntax.res_typ)
in (let arg' = (let _108_705 = (FStar_Absyn_Util.bvar_to_exp newx)
in (FStar_All.pipe_left FStar_Absyn_Syntax.varg _108_705))
in (let binding = FStar_Tc_Env.Binding_var ((newx.FStar_Absyn_Syntax.v, newx.FStar_Absyn_Syntax.sort))
in (tc_args (subst, (arg)::outargs, (arg')::arg_rets, ((Some (binding), c))::comps, g, fvs) rest cres rest'))))
end
| false -> begin
(let _108_718 = (let _108_717 = (let _108_711 = (let _108_710 = (FStar_Absyn_Util.bvar_to_exp x)
in (FStar_All.pipe_left FStar_Absyn_Syntax.varg _108_710))
in (_108_711)::arg_rets)
in (let _108_716 = (let _108_714 = (let _108_713 = (FStar_All.pipe_left (fun _108_712 -> Some (_108_712)) (FStar_Tc_Env.Binding_var ((x.FStar_Absyn_Syntax.v, targ))))
in (_108_713, c))
in (_108_714)::comps)
in (let _108_715 = (FStar_Util.set_add x fvs)
in (subst, (arg)::outargs, _108_717, _108_716, g, _108_715))))
in (tc_args _108_718 rest cres rest'))
end)
end)
end))))
end))))))))))
end
| ((FStar_Util.Inr (_39_1753), _39_1756)::_39_1751, (FStar_Util.Inl (_39_1762), _39_1765)::_39_1760) -> begin
(let _108_722 = (let _108_721 = (let _108_720 = (let _108_719 = (FStar_List.hd args)
in (FStar_Absyn_Util.range_of_arg _108_719))
in ("Expected an expression; got a type", _108_720))
in FStar_Absyn_Syntax.Error (_108_721))
in (Prims.raise _108_722))
end
| ((FStar_Util.Inl (_39_1772), _39_1775)::_39_1770, (FStar_Util.Inr (_39_1781), _39_1784)::_39_1779) -> begin
(let _108_726 = (let _108_725 = (let _108_724 = (let _108_723 = (FStar_List.hd args)
in (FStar_Absyn_Util.range_of_arg _108_723))
in ("Expected a type; got an expression", _108_724))
in FStar_Absyn_Syntax.Error (_108_725))
in (Prims.raise _108_726))
end
| (_39_1789, []) -> begin
(let _39_1792 = (fxv_check head env (FStar_Util.Inr (cres.FStar_Absyn_Syntax.res_typ)) fvs)
in (let _39_1810 = (match (bs) with
| [] -> begin
(let cres = (FStar_Tc_Util.subst_lcomp subst cres)
in (let g = (FStar_Tc_Rel.conj_guard g_head g)
in (let refine_with_equality = ((FStar_Absyn_Util.is_pure_or_ghost_lcomp cres) && (FStar_All.pipe_right comps (FStar_Util.for_some (fun _39_1800 -> (match (_39_1800) with
| (_39_1798, c) -> begin
(not ((FStar_Absyn_Util.is_pure_or_ghost_lcomp c)))
end)))))
in (let cres = (match (refine_with_equality) with
| true -> begin
(let _108_728 = (FStar_Absyn_Syntax.mk_Exp_app_flat (head, (FStar_List.rev arg_rets)) (Some (cres.FStar_Absyn_Syntax.res_typ)) top.FStar_Absyn_Syntax.pos)
in (FStar_Tc_Util.maybe_assume_result_eq_pure_term env _108_728 cres))
end
| false -> begin
(let _39_1802 = (match ((FStar_Tc_Env.debug env FStar_Options.Low)) with
| true -> begin
(let _108_731 = (FStar_Absyn_Print.exp_to_string head)
in (let _108_730 = (FStar_Absyn_Print.lcomp_typ_to_string cres)
in (let _108_729 = (FStar_Tc_Rel.guard_to_string env g)
in (FStar_Util.fprint3 "Not refining result: f=%s; cres=%s; guard=%s\n" _108_731 _108_730 _108_729))))
end
| false -> begin
()
end)
in cres)
end)
in (let _108_732 = (FStar_Tc_Util.refresh_comp_label env false cres)
in (_108_732, g))))))
end
| _39_1806 -> begin
(let g = (let _108_733 = (FStar_Tc_Rel.conj_guard g_head g)
in (FStar_All.pipe_right _108_733 (FStar_Tc_Rel.solve_deferred_constraints env)))
in (let _108_739 = (let _108_738 = (let _108_737 = (let _108_736 = (let _108_735 = (let _108_734 = (cres.FStar_Absyn_Syntax.comp ())
in (bs, _108_734))
in (FStar_Absyn_Syntax.mk_Typ_fun _108_735 (Some (FStar_Absyn_Syntax.ktype)) top.FStar_Absyn_Syntax.pos))
in (FStar_All.pipe_left (FStar_Absyn_Util.subst_typ subst) _108_736))
in (FStar_Absyn_Syntax.mk_Total _108_737))
in (FStar_All.pipe_left FStar_Tc_Util.lcomp_of_comp _108_738))
in (_108_739, g)))
end)
in (match (_39_1810) with
| (cres, g) -> begin
(let _39_1811 = (match ((FStar_Tc_Env.debug env FStar_Options.Low)) with
| true -> begin
(let _108_740 = (FStar_Absyn_Print.lcomp_typ_to_string cres)
in (FStar_Util.fprint1 "\t Type of result cres is %s\n" _108_740))
end
| false -> begin
()
end)
in (let comp = (FStar_List.fold_left (fun out c -> (FStar_Tc_Util.bind env None (Prims.snd c) ((Prims.fst c), out))) cres comps)
in (let comp = (FStar_Tc_Util.bind env None chead (None, comp))
in (let app = (FStar_Absyn_Syntax.mk_Exp_app_flat (head, (FStar_List.rev outargs)) (Some (comp.FStar_Absyn_Syntax.res_typ)) top.FStar_Absyn_Syntax.pos)
in (let _39_1820 = (FStar_Tc_Util.strengthen_precondition None env app comp g)
in (match (_39_1820) with
| (comp, g) -> begin
(let _39_1821 = (match ((FStar_Tc_Env.debug env FStar_Options.Low)) with
| true -> begin
(let _108_746 = (FStar_Tc_Normalize.exp_norm_to_string env app)
in (let _108_745 = (let _108_744 = (comp.FStar_Absyn_Syntax.comp ())
in (FStar_Absyn_Print.comp_typ_to_string _108_744))
in (FStar_Util.fprint2 "\t Type of app term %s is %s\n" _108_746 _108_745)))
end
| false -> begin
()
end)
in (app, comp, g))
end))))))
end)))
end
| ([], arg::_39_1825) -> begin
(let rec aux = (fun norm tres -> (let tres = (let _108_751 = (FStar_Absyn_Util.compress_typ tres)
in (FStar_All.pipe_right _108_751 FStar_Absyn_Util.unrefine))
in (match (tres.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_fun (bs, cres') -> begin
(let _39_1837 = (match ((FStar_Tc_Env.debug env FStar_Options.Low)) with
| true -> begin
(let _108_752 = (FStar_Range.string_of_range tres.FStar_Absyn_Syntax.pos)
in (FStar_Util.fprint1 "%s: Warning: Potentially redundant explicit currying of a function type \n" _108_752))
end
| false -> begin
()
end)
in (let _108_757 = (FStar_Tc_Util.lcomp_of_comp cres')
in (tc_args (subst, outargs, arg_rets, ((None, cres))::comps, g, fvs) bs _108_757 args)))
end
| _39_1840 when (not (norm)) -> begin
(let _108_758 = (whnf env tres)
in (aux true _108_758))
end
| _39_1842 -> begin
(let _108_764 = (let _108_763 = (let _108_762 = (let _108_760 = (FStar_Tc_Normalize.typ_norm_to_string env tf)
in (let _108_759 = (FStar_Absyn_Print.exp_to_string top)
in (FStar_Util.format2 "Too many arguments to function of type %s; got %s" _108_760 _108_759)))
in (let _108_761 = (FStar_Absyn_Syntax.argpos arg)
in (_108_762, _108_761)))
in FStar_Absyn_Syntax.Error (_108_763))
in (Prims.raise _108_764))
end)))
in (aux false cres.FStar_Absyn_Syntax.res_typ))
end)
end))
in (let _108_765 = (FStar_Tc_Util.lcomp_of_comp c)
in (tc_args ([], [], [], [], FStar_Tc_Rel.trivial_guard, FStar_Absyn_Syntax.no_fvs.FStar_Absyn_Syntax.fxvs) bs _108_765 args))))
end
| _39_1844 -> begin
(match ((not (norm))) with
| true -> begin
(let _108_766 = (whnf env tf)
in (check_function_app true _108_766))
end
| false -> begin
(let _108_769 = (let _108_768 = (let _108_767 = (FStar_Tc_Errors.expected_function_typ env tf)
in (_108_767, head.FStar_Absyn_Syntax.pos))
in FStar_Absyn_Syntax.Error (_108_768))
in (Prims.raise _108_769))
end)
end))
in (let _108_770 = (FStar_Absyn_Util.unrefine thead)
in (check_function_app false _108_770)))))
end))
end))
in (let _39_1848 = (aux ())
in (match (_39_1848) with
| (e, c, g) -> begin
(let _39_1849 = (match ((FStar_All.pipe_left (FStar_Tc_Env.debug env) (FStar_Options.Other ("Implicits")))) with
| true -> begin
(let _108_771 = (FStar_All.pipe_left FStar_Util.string_of_int (FStar_List.length g.FStar_Tc_Rel.implicits))
in (FStar_Util.fprint1 "Introduced %s implicits in application\n" _108_771))
end
| false -> begin
()
end)
in (let c = (match ((((FStar_Options.should_verify env.FStar_Tc_Env.curmodule.FStar_Absyn_Syntax.str) && (not ((FStar_Absyn_Util.is_lcomp_partial_return c)))) && (FStar_Absyn_Util.is_pure_or_ghost_lcomp c))) with
| true -> begin
(FStar_Tc_Util.maybe_assume_result_eq_pure_term env e c)
end
| false -> begin
c
end)
in (let _39_1856 = (match ((FStar_Tc_Env.debug env FStar_Options.Extreme)) with
| true -> begin
(let _108_776 = (FStar_Range.string_of_range e.FStar_Absyn_Syntax.pos)
in (let _108_775 = (FStar_Absyn_Print.typ_to_string c.FStar_Absyn_Syntax.res_typ)
in (let _108_774 = (let _108_773 = (FStar_Tc_Env.expected_typ env0)
in (FStar_All.pipe_right _108_773 (fun x -> (match (x) with
| None -> begin
"None"
end
| Some (t) -> begin
(FStar_Absyn_Print.typ_to_string t)
end))))
in (FStar_Util.fprint3 "(%s) About to check %s against expected typ %s\n" _108_776 _108_775 _108_774))))
end
| false -> begin
()
end)
in (let _39_1861 = (comp_check_expected_typ env0 e c)
in (match (_39_1861) with
| (e, c, g') -> begin
(let _108_777 = (FStar_Tc_Rel.conj_guard g g')
in (e, c, _108_777))
end)))))
end)))
end)))))
end
| FStar_Absyn_Syntax.Exp_match (e1, eqns) -> begin
(let _39_1868 = (FStar_Tc_Env.clear_expected_typ env)
in (match (_39_1868) with
| (env1, topt) -> begin
(let env1 = (instantiate_both env1)
in (let _39_1873 = (tc_exp env1 e1)
in (match (_39_1873) with
| (e1, c1, g1) -> begin
(let _39_1880 = (match (topt) with
| Some (t) -> begin
(env, t)
end
| None -> begin
(let res_t = (FStar_Tc_Util.new_tvar env FStar_Absyn_Syntax.ktype)
in (let _108_778 = (FStar_Tc_Env.set_expected_typ env res_t)
in (_108_778, res_t)))
end)
in (match (_39_1880) with
| (env_branches, res_t) -> begin
(let guard_x = (let _108_780 = (FStar_All.pipe_left (fun _108_779 -> Some (_108_779)) e1.FStar_Absyn_Syntax.pos)
in (FStar_Absyn_Util.new_bvd _108_780))
in (let t_eqns = (FStar_All.pipe_right eqns (FStar_List.map (tc_eqn guard_x c1.FStar_Absyn_Syntax.res_typ env_branches)))
in (let _39_1897 = (let _39_1894 = (FStar_List.fold_right (fun _39_1888 _39_1891 -> (match ((_39_1888, _39_1891)) with
| ((_39_1884, f, c, g), (caccum, gaccum)) -> begin
(let _108_783 = (FStar_Tc_Rel.conj_guard g gaccum)
in (((f, c))::caccum, _108_783))
end)) t_eqns ([], FStar_Tc_Rel.trivial_guard))
in (match (_39_1894) with
| (cases, g) -> begin
(let _108_784 = (FStar_Tc_Util.bind_cases env res_t cases)
in (_108_784, g))
end))
in (match (_39_1897) with
| (c_branches, g_branches) -> begin
(let _39_1898 = (match ((FStar_Tc_Env.debug env FStar_Options.Extreme)) with
| true -> begin
(let _108_788 = (FStar_Range.string_of_range top.FStar_Absyn_Syntax.pos)
in (let _108_787 = (FStar_Absyn_Print.lcomp_typ_to_string c1)
in (let _108_786 = (FStar_Absyn_Print.lcomp_typ_to_string c_branches)
in (let _108_785 = (FStar_Tc_Rel.guard_to_string env g_branches)
in (FStar_Util.fprint4 "(%s) comp\n\tscrutinee: %s\n\tbranches: %s\nguard = %s\n" _108_788 _108_787 _108_786 _108_785)))))
end
| false -> begin
()
end)
in (let cres = (let _108_791 = (let _108_790 = (FStar_All.pipe_left (fun _108_789 -> Some (_108_789)) (FStar_Tc_Env.Binding_var ((guard_x, c1.FStar_Absyn_Syntax.res_typ))))
in (_108_790, c_branches))
in (FStar_Tc_Util.bind env (Some (e1)) c1 _108_791))
in (let e = (let _108_798 = (w cres)
in (let _108_797 = (let _108_796 = (let _108_795 = (FStar_List.map (fun _39_1908 -> (match (_39_1908) with
| (f, _39_1903, _39_1905, _39_1907) -> begin
f
end)) t_eqns)
in (e1, _108_795))
in (FStar_Absyn_Syntax.mk_Exp_match _108_796))
in (FStar_All.pipe_left _108_798 _108_797)))
in (let _108_800 = (FStar_Absyn_Syntax.mk_Exp_ascribed (e, cres.FStar_Absyn_Syntax.res_typ, Some (cres.FStar_Absyn_Syntax.eff_name)) None e.FStar_Absyn_Syntax.pos)
in (let _108_799 = (FStar_Tc_Rel.conj_guard g1 g_branches)
in (_108_800, cres, _108_799))))))
end))))
end))
end)))
end))
end
| FStar_Absyn_Syntax.Exp_let ((false, {FStar_Absyn_Syntax.lbname = x; FStar_Absyn_Syntax.lbtyp = t; FStar_Absyn_Syntax.lbeff = _39_1913; FStar_Absyn_Syntax.lbdef = e1}::[]), e2) -> begin
(let env = (instantiate_both env)
in (let env0 = env
in (let topt = (FStar_Tc_Env.expected_typ env)
in (let top_level = (match (x) with
| FStar_Util.Inr (_39_1926) -> begin
true
end
| _39_1929 -> begin
false
end)
in (let _39_1934 = (FStar_Tc_Env.clear_expected_typ env)
in (match (_39_1934) with
| (env1, _39_1933) -> begin
(let _39_1947 = (match (t.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_unknown -> begin
(FStar_Tc_Rel.trivial_guard, env1)
end
| _39_1937 -> begin
(match ((top_level && (not (env.FStar_Tc_Env.generalize)))) with
| true -> begin
(let _108_801 = (FStar_Tc_Env.set_expected_typ env1 t)
in (FStar_Tc_Rel.trivial_guard, _108_801))
end
| false -> begin
(let _39_1940 = (tc_typ_check env1 t FStar_Absyn_Syntax.ktype)
in (match (_39_1940) with
| (t, f) -> begin
(let _39_1941 = (match ((FStar_Tc_Env.debug env FStar_Options.Medium)) with
| true -> begin
(let _108_803 = (FStar_Range.string_of_range top.FStar_Absyn_Syntax.pos)
in (let _108_802 = (FStar_Absyn_Print.typ_to_string t)
in (FStar_Util.fprint2 "(%s) Checked type annotation %s\n" _108_803 _108_802)))
end
| false -> begin
()
end)
in (let t = (norm_t env1 t)
in (let env1 = (FStar_Tc_Env.set_expected_typ env1 t)
in (f, env1))))
end))
end)
end)
in (match (_39_1947) with
| (f, env1) -> begin
(let _39_1953 = (tc_exp (let _39_1948 = env1
in {FStar_Tc_Env.solver = _39_1948.FStar_Tc_Env.solver; FStar_Tc_Env.range = _39_1948.FStar_Tc_Env.range; FStar_Tc_Env.curmodule = _39_1948.FStar_Tc_Env.curmodule; FStar_Tc_Env.gamma = _39_1948.FStar_Tc_Env.gamma; FStar_Tc_Env.modules = _39_1948.FStar_Tc_Env.modules; FStar_Tc_Env.expected_typ = _39_1948.FStar_Tc_Env.expected_typ; FStar_Tc_Env.level = _39_1948.FStar_Tc_Env.level; FStar_Tc_Env.sigtab = _39_1948.FStar_Tc_Env.sigtab; FStar_Tc_Env.is_pattern = _39_1948.FStar_Tc_Env.is_pattern; FStar_Tc_Env.instantiate_targs = _39_1948.FStar_Tc_Env.instantiate_targs; FStar_Tc_Env.instantiate_vargs = _39_1948.FStar_Tc_Env.instantiate_vargs; FStar_Tc_Env.effects = _39_1948.FStar_Tc_Env.effects; FStar_Tc_Env.generalize = _39_1948.FStar_Tc_Env.generalize; FStar_Tc_Env.letrecs = _39_1948.FStar_Tc_Env.letrecs; FStar_Tc_Env.top_level = top_level; FStar_Tc_Env.check_uvars = _39_1948.FStar_Tc_Env.check_uvars; FStar_Tc_Env.use_eq = _39_1948.FStar_Tc_Env.use_eq; FStar_Tc_Env.is_iface = _39_1948.FStar_Tc_Env.is_iface; FStar_Tc_Env.admit = _39_1948.FStar_Tc_Env.admit; FStar_Tc_Env.default_effects = _39_1948.FStar_Tc_Env.default_effects}) e1)
in (match (_39_1953) with
| (e1, c1, g1) -> begin
(let _39_1957 = (let _108_807 = (FStar_Tc_Env.set_range env t.FStar_Absyn_Syntax.pos)
in (FStar_Tc_Util.strengthen_precondition (Some ((fun _39_1954 -> (match (()) with
| () -> begin
FStar_Tc_Errors.ill_kinded_type
end)))) _108_807 e1 c1 f))
in (match (_39_1957) with
| (c1, guard_f) -> begin
(match (x) with
| FStar_Util.Inr (_39_1959) -> begin
(let _39_1970 = (match ((FStar_Options.should_verify env.FStar_Tc_Env.curmodule.FStar_Absyn_Syntax.str)) with
| true -> begin
(let _39_1963 = (let _108_808 = (FStar_Tc_Rel.conj_guard g1 guard_f)
in (FStar_Tc_Util.check_top_level env _108_808 c1))
in (match (_39_1963) with
| (ok, c1) -> begin
(match (ok) with
| true -> begin
(e2, c1)
end
| false -> begin
(let _39_1964 = (match ((FStar_ST.read FStar_Options.warn_top_level_effects)) with
| true -> begin
(let _108_809 = (FStar_Tc_Env.get_range env)
in (FStar_Tc_Errors.warn _108_809 FStar_Tc_Errors.top_level_effect))
end
| false -> begin
()
end)
in (let _108_810 = (FStar_Absyn_Syntax.mk_Exp_meta (FStar_Absyn_Syntax.Meta_desugared ((e2, FStar_Absyn_Syntax.MaskedEffect))))
in (_108_810, c1)))
end)
end))
end
| false -> begin
(let _39_1966 = (let _108_811 = (FStar_Tc_Rel.conj_guard g1 guard_f)
in (FStar_Tc_Util.discharge_guard env _108_811))
in (let _108_812 = (c1.FStar_Absyn_Syntax.comp ())
in (e2, _108_812)))
end)
in (match (_39_1970) with
| (e2, c1) -> begin
(let _39_1975 = (match (env.FStar_Tc_Env.generalize) with
| true -> begin
(let _108_813 = (FStar_Tc_Util.generalize false env1 (((x, e1, c1))::[]))
in (FStar_All.pipe_left FStar_List.hd _108_813))
end
| false -> begin
(x, e1, c1)
end)
in (match (_39_1975) with
| (_39_1972, e1, c1) -> begin
(let cres = (let _108_814 = (FStar_Absyn_Util.ml_comp FStar_Tc_Recheck.t_unit top.FStar_Absyn_Syntax.pos)
in (FStar_All.pipe_left FStar_Tc_Util.lcomp_of_comp _108_814))
in (let cres = (match ((FStar_Absyn_Util.is_total_comp c1)) with
| true -> begin
cres
end
| false -> begin
(let _108_815 = (FStar_Tc_Util.lcomp_of_comp c1)
in (FStar_Tc_Util.bind env None _108_815 (None, cres)))
end)
in (let _39_1978 = (FStar_ST.op_Colon_Equals e2.FStar_Absyn_Syntax.tk (Some (FStar_Tc_Recheck.t_unit)))
in (let _108_824 = (let _108_823 = (w cres)
in (let _108_822 = (let _108_821 = (let _108_820 = (let _108_819 = (let _108_818 = (FStar_Absyn_Syntax.mk_lb (x, (FStar_Absyn_Util.comp_effect_name c1), (FStar_Absyn_Util.comp_result c1), e1))
in (_108_818)::[])
in (false, _108_819))
in (_108_820, e2))
in (FStar_Absyn_Syntax.mk_Exp_let _108_821))
in (FStar_All.pipe_left _108_823 _108_822)))
in (_108_824, cres, FStar_Tc_Rel.trivial_guard)))))
end))
end))
end
| FStar_Util.Inl (bvd) -> begin
(let b = (binding_of_lb x c1.FStar_Absyn_Syntax.res_typ)
in (let _39_1986 = (let _108_825 = (FStar_Tc_Env.push_local_binding env b)
in (tc_exp _108_825 e2))
in (match (_39_1986) with
| (e2, c2, g2) -> begin
(let cres = (FStar_Tc_Util.bind env (Some (e1)) c1 (Some (b), c2))
in (let e = (let _108_833 = (w cres)
in (let _108_832 = (let _108_831 = (let _108_830 = (let _108_829 = (let _108_828 = (FStar_Absyn_Syntax.mk_lb (x, c1.FStar_Absyn_Syntax.eff_name, c1.FStar_Absyn_Syntax.res_typ, e1))
in (_108_828)::[])
in (false, _108_829))
in (_108_830, e2))
in (FStar_Absyn_Syntax.mk_Exp_let _108_831))
in (FStar_All.pipe_left _108_833 _108_832)))
in (let g2 = (let _108_842 = (let _108_835 = (let _108_834 = (FStar_Absyn_Syntax.v_binder (FStar_Absyn_Util.bvd_to_bvar_s bvd c1.FStar_Absyn_Syntax.res_typ))
in (_108_834)::[])
in (FStar_Tc_Rel.close_guard _108_835))
in (let _108_841 = (let _108_840 = (let _108_839 = (let _108_838 = (let _108_837 = (FStar_Absyn_Util.bvd_to_exp bvd c1.FStar_Absyn_Syntax.res_typ)
in (FStar_Absyn_Util.mk_eq c1.FStar_Absyn_Syntax.res_typ c1.FStar_Absyn_Syntax.res_typ _108_837 e1))
in (FStar_All.pipe_left (fun _108_836 -> FStar_Tc_Rel.NonTrivial (_108_836)) _108_838))
in (FStar_Tc_Rel.guard_of_guard_formula _108_839))
in (FStar_Tc_Rel.imp_guard _108_840 g2))
in (FStar_All.pipe_left _108_842 _108_841)))
in (let guard = (let _108_843 = (FStar_Tc_Rel.conj_guard g1 g2)
in (FStar_Tc_Rel.conj_guard guard_f _108_843))
in (match (topt) with
| None -> begin
(let tres = cres.FStar_Absyn_Syntax.res_typ
in (let fvs = (FStar_Absyn_Util.freevars_typ tres)
in (match ((FStar_Util.set_mem (FStar_Absyn_Util.bvd_to_bvar_s bvd t) fvs.FStar_Absyn_Syntax.fxvs)) with
| true -> begin
(let t = (FStar_Tc_Util.new_tvar env0 FStar_Absyn_Syntax.ktype)
in (let _39_1995 = (let _108_844 = (FStar_Tc_Rel.teq env tres t)
in (FStar_All.pipe_left (FStar_Tc_Rel.try_discharge_guard env) _108_844))
in (e, cres, guard)))
end
| false -> begin
(e, cres, guard)
end)))
end
| _39_1998 -> begin
(e, cres, guard)
end)))))
end)))
end)
end))
end))
end))
end))))))
end
| FStar_Absyn_Syntax.Exp_let ((false, _39_2001), _39_2004) -> begin
(FStar_All.failwith "impossible")
end
| FStar_Absyn_Syntax.Exp_let ((true, lbs), e1) -> begin
(let env = (instantiate_both env)
in (let _39_2016 = (FStar_Tc_Env.clear_expected_typ env)
in (match (_39_2016) with
| (env0, topt) -> begin
(let is_inner_let = (FStar_All.pipe_right lbs (FStar_Util.for_some (fun _39_9 -> (match (_39_9) with
| {FStar_Absyn_Syntax.lbname = FStar_Util.Inl (_39_2025); FStar_Absyn_Syntax.lbtyp = _39_2023; FStar_Absyn_Syntax.lbeff = _39_2021; FStar_Absyn_Syntax.lbdef = _39_2019} -> begin
true
end
| _39_2029 -> begin
false
end))))
in (let _39_2056 = (FStar_All.pipe_right lbs (FStar_List.fold_left (fun _39_2033 _39_2039 -> (match ((_39_2033, _39_2039)) with
| ((xts, env), {FStar_Absyn_Syntax.lbname = x; FStar_Absyn_Syntax.lbtyp = t; FStar_Absyn_Syntax.lbeff = _39_2036; FStar_Absyn_Syntax.lbdef = e}) -> begin
(let _39_2044 = (FStar_Tc_Util.extract_lb_annotation env t e)
in (match (_39_2044) with
| (_39_2041, t, check_t) -> begin
(let e = (FStar_Absyn_Util.unascribe e)
in (let t = (match ((not (check_t))) with
| true -> begin
t
end
| false -> begin
(match (((not (is_inner_let)) && (not (env.FStar_Tc_Env.generalize)))) with
| true -> begin
(let _39_2046 = (match ((FStar_All.pipe_left (FStar_Tc_Env.debug env) FStar_Options.High)) with
| true -> begin
(let _108_848 = (FStar_Absyn_Print.typ_to_string t)
in (FStar_Util.fprint1 "Type %s is marked as no-generalize\n" _108_848))
end
| false -> begin
()
end)
in t)
end
| false -> begin
(let _108_849 = (tc_typ_check_trivial (let _39_2048 = env0
in {FStar_Tc_Env.solver = _39_2048.FStar_Tc_Env.solver; FStar_Tc_Env.range = _39_2048.FStar_Tc_Env.range; FStar_Tc_Env.curmodule = _39_2048.FStar_Tc_Env.curmodule; FStar_Tc_Env.gamma = _39_2048.FStar_Tc_Env.gamma; FStar_Tc_Env.modules = _39_2048.FStar_Tc_Env.modules; FStar_Tc_Env.expected_typ = _39_2048.FStar_Tc_Env.expected_typ; FStar_Tc_Env.level = _39_2048.FStar_Tc_Env.level; FStar_Tc_Env.sigtab = _39_2048.FStar_Tc_Env.sigtab; FStar_Tc_Env.is_pattern = _39_2048.FStar_Tc_Env.is_pattern; FStar_Tc_Env.instantiate_targs = _39_2048.FStar_Tc_Env.instantiate_targs; FStar_Tc_Env.instantiate_vargs = _39_2048.FStar_Tc_Env.instantiate_vargs; FStar_Tc_Env.effects = _39_2048.FStar_Tc_Env.effects; FStar_Tc_Env.generalize = _39_2048.FStar_Tc_Env.generalize; FStar_Tc_Env.letrecs = _39_2048.FStar_Tc_Env.letrecs; FStar_Tc_Env.top_level = _39_2048.FStar_Tc_Env.top_level; FStar_Tc_Env.check_uvars = true; FStar_Tc_Env.use_eq = _39_2048.FStar_Tc_Env.use_eq; FStar_Tc_Env.is_iface = _39_2048.FStar_Tc_Env.is_iface; FStar_Tc_Env.admit = _39_2048.FStar_Tc_Env.admit; FStar_Tc_Env.default_effects = _39_2048.FStar_Tc_Env.default_effects}) t FStar_Absyn_Syntax.ktype)
in (FStar_All.pipe_right _108_849 (norm_t env)))
end)
end)
in (let env = (match (((FStar_Absyn_Util.is_pure_or_ghost_function t) && (FStar_Options.should_verify env.FStar_Tc_Env.curmodule.FStar_Absyn_Syntax.str))) with
| true -> begin
(let _39_2051 = env
in {FStar_Tc_Env.solver = _39_2051.FStar_Tc_Env.solver; FStar_Tc_Env.range = _39_2051.FStar_Tc_Env.range; FStar_Tc_Env.curmodule = _39_2051.FStar_Tc_Env.curmodule; FStar_Tc_Env.gamma = _39_2051.FStar_Tc_Env.gamma; FStar_Tc_Env.modules = _39_2051.FStar_Tc_Env.modules; FStar_Tc_Env.expected_typ = _39_2051.FStar_Tc_Env.expected_typ; FStar_Tc_Env.level = _39_2051.FStar_Tc_Env.level; FStar_Tc_Env.sigtab = _39_2051.FStar_Tc_Env.sigtab; FStar_Tc_Env.is_pattern = _39_2051.FStar_Tc_Env.is_pattern; FStar_Tc_Env.instantiate_targs = _39_2051.FStar_Tc_Env.instantiate_targs; FStar_Tc_Env.instantiate_vargs = _39_2051.FStar_Tc_Env.instantiate_vargs; FStar_Tc_Env.effects = _39_2051.FStar_Tc_Env.effects; FStar_Tc_Env.generalize = _39_2051.FStar_Tc_Env.generalize; FStar_Tc_Env.letrecs = ((x, t))::env.FStar_Tc_Env.letrecs; FStar_Tc_Env.top_level = _39_2051.FStar_Tc_Env.top_level; FStar_Tc_Env.check_uvars = _39_2051.FStar_Tc_Env.check_uvars; FStar_Tc_Env.use_eq = _39_2051.FStar_Tc_Env.use_eq; FStar_Tc_Env.is_iface = _39_2051.FStar_Tc_Env.is_iface; FStar_Tc_Env.admit = _39_2051.FStar_Tc_Env.admit; FStar_Tc_Env.default_effects = _39_2051.FStar_Tc_Env.default_effects})
end
| false -> begin
(FStar_Tc_Env.push_local_binding env (binding_of_lb x t))
end)
in (((x, t, e))::xts, env))))
end))
end)) ([], env)))
in (match (_39_2056) with
| (lbs, env') -> begin
(let _39_2071 = (let _108_855 = (let _108_854 = (FStar_All.pipe_right lbs FStar_List.rev)
in (FStar_All.pipe_right _108_854 (FStar_List.map (fun _39_2060 -> (match (_39_2060) with
| (x, t, e) -> begin
(let t = (FStar_Tc_Normalize.norm_typ ((FStar_Tc_Normalize.Beta)::[]) env t)
in (let _39_2062 = (match ((FStar_Tc_Env.debug env FStar_Options.High)) with
| true -> begin
(let _108_853 = (FStar_Absyn_Print.lbname_to_string x)
in (let _108_852 = (FStar_Absyn_Print.exp_to_string e)
in (let _108_851 = (FStar_Absyn_Print.typ_to_string t)
in (FStar_Util.fprint3 "Checking %s = %s against type %s\n" _108_853 _108_852 _108_851))))
end
| false -> begin
()
end)
in (let env' = (FStar_Tc_Env.set_expected_typ env' t)
in (let _39_2068 = (tc_total_exp env' e)
in (match (_39_2068) with
| (e, t, g) -> begin
((x, t, e), g)
end)))))
end)))))
in (FStar_All.pipe_right _108_855 FStar_List.unzip))
in (match (_39_2071) with
| (lbs, gs) -> begin
(let g_lbs = (FStar_List.fold_right FStar_Tc_Rel.conj_guard gs FStar_Tc_Rel.trivial_guard)
in (let _39_2090 = (match (((not (env.FStar_Tc_Env.generalize)) || is_inner_let)) with
| true -> begin
(let _108_857 = (FStar_List.map (fun _39_2076 -> (match (_39_2076) with
| (x, t, e) -> begin
(FStar_Absyn_Syntax.mk_lb (x, FStar_Absyn_Const.effect_Tot_lid, t, e))
end)) lbs)
in (_108_857, g_lbs))
end
| false -> begin
(let _39_2077 = (FStar_Tc_Util.discharge_guard env g_lbs)
in (let ecs = (let _108_861 = (FStar_All.pipe_right lbs (FStar_List.map (fun _39_2082 -> (match (_39_2082) with
| (x, t, e) -> begin
(let _108_860 = (let _108_859 = (FStar_Absyn_Util.range_of_lb (x, t, e))
in (FStar_All.pipe_left (FStar_Absyn_Util.total_comp t) _108_859))
in (x, e, _108_860))
end))))
in (FStar_Tc_Util.generalize true env _108_861))
in (let _108_863 = (FStar_List.map (fun _39_2087 -> (match (_39_2087) with
| (x, e, c) -> begin
(FStar_Absyn_Syntax.mk_lb (x, FStar_Absyn_Const.effect_Tot_lid, (FStar_Absyn_Util.comp_result c), e))
end)) ecs)
in (_108_863, FStar_Tc_Rel.trivial_guard))))
end)
in (match (_39_2090) with
| (lbs, g_lbs) -> begin
(match ((not (is_inner_let))) with
| true -> begin
(let cres = (let _108_864 = (FStar_Absyn_Util.total_comp FStar_Tc_Recheck.t_unit top.FStar_Absyn_Syntax.pos)
in (FStar_All.pipe_left FStar_Tc_Util.lcomp_of_comp _108_864))
in (let _39_2092 = (FStar_Tc_Util.discharge_guard env g_lbs)
in (let _39_2094 = (FStar_ST.op_Colon_Equals e1.FStar_Absyn_Syntax.tk (Some (FStar_Tc_Recheck.t_unit)))
in (let _108_868 = (let _108_867 = (w cres)
in (FStar_All.pipe_left _108_867 (FStar_Absyn_Syntax.mk_Exp_let ((true, lbs), e1))))
in (_108_868, cres, FStar_Tc_Rel.trivial_guard)))))
end
| false -> begin
(let _39_2110 = (FStar_All.pipe_right lbs (FStar_List.fold_left (fun _39_2098 _39_2105 -> (match ((_39_2098, _39_2105)) with
| ((bindings, env), {FStar_Absyn_Syntax.lbname = x; FStar_Absyn_Syntax.lbtyp = t; FStar_Absyn_Syntax.lbeff = _39_2102; FStar_Absyn_Syntax.lbdef = _39_2100}) -> begin
(let b = (binding_of_lb x t)
in (let env = (FStar_Tc_Env.push_local_binding env b)
in ((b)::bindings, env)))
end)) ([], env)))
in (match (_39_2110) with
| (bindings, env) -> begin
(let _39_2114 = (tc_exp env e1)
in (match (_39_2114) with
| (e1, cres, g1) -> begin
(let guard = (FStar_Tc_Rel.conj_guard g_lbs g1)
in (let cres = (FStar_Tc_Util.close_comp env bindings cres)
in (let tres = (norm_t env cres.FStar_Absyn_Syntax.res_typ)
in (let cres = (let _39_2118 = cres
in {FStar_Absyn_Syntax.eff_name = _39_2118.FStar_Absyn_Syntax.eff_name; FStar_Absyn_Syntax.res_typ = tres; FStar_Absyn_Syntax.cflags = _39_2118.FStar_Absyn_Syntax.cflags; FStar_Absyn_Syntax.comp = _39_2118.FStar_Absyn_Syntax.comp})
in (let e = (let _108_873 = (w cres)
in (FStar_All.pipe_left _108_873 (FStar_Absyn_Syntax.mk_Exp_let ((true, lbs), e1))))
in (match (topt) with
| Some (_39_2123) -> begin
(e, cres, guard)
end
| None -> begin
(let fvs = (FStar_All.pipe_left FStar_Absyn_Util.freevars_typ tres)
in (match ((FStar_All.pipe_right lbs (FStar_List.tryFind (fun _39_10 -> (match (_39_10) with
| {FStar_Absyn_Syntax.lbname = FStar_Util.Inr (_39_2135); FStar_Absyn_Syntax.lbtyp = _39_2133; FStar_Absyn_Syntax.lbeff = _39_2131; FStar_Absyn_Syntax.lbdef = _39_2129} -> begin
false
end
| {FStar_Absyn_Syntax.lbname = FStar_Util.Inl (x); FStar_Absyn_Syntax.lbtyp = _39_2143; FStar_Absyn_Syntax.lbeff = _39_2141; FStar_Absyn_Syntax.lbdef = _39_2139} -> begin
(FStar_Util.set_mem (FStar_Absyn_Util.bvd_to_bvar_s x FStar_Absyn_Syntax.tun) fvs.FStar_Absyn_Syntax.fxvs)
end))))) with
| Some ({FStar_Absyn_Syntax.lbname = FStar_Util.Inl (y); FStar_Absyn_Syntax.lbtyp = _39_2152; FStar_Absyn_Syntax.lbeff = _39_2150; FStar_Absyn_Syntax.lbdef = _39_2148}) -> begin
(let t' = (FStar_Tc_Util.new_tvar env0 FStar_Absyn_Syntax.ktype)
in (let _39_2158 = (let _108_875 = (FStar_Tc_Rel.teq env tres t')
in (FStar_All.pipe_left (FStar_Tc_Rel.try_discharge_guard env) _108_875))
in (e, cres, guard)))
end
| _39_2161 -> begin
(e, cres, guard)
end))
end))))))
end))
end))
end)
end)))
end))
end)))
end)))
end))))))
and tc_eqn = (fun scrutinee_x pat_t env _39_2168 -> (match (_39_2168) with
| (pattern, when_clause, branch) -> begin
(let tc_pat = (fun allow_implicits pat_t p0 -> (let _39_2176 = (FStar_Tc_Util.pat_as_exps allow_implicits env p0)
in (match (_39_2176) with
| (bindings, exps, p) -> begin
(let pat_env = (FStar_List.fold_left FStar_Tc_Env.push_local_binding env bindings)
in (let _39_2185 = (match ((FStar_All.pipe_left (FStar_Tc_Env.debug env) (FStar_Options.Other ("Pat")))) with
| true -> begin
(FStar_All.pipe_right bindings (FStar_List.iter (fun _39_11 -> (match (_39_11) with
| FStar_Tc_Env.Binding_var (x, t) -> begin
(let _108_888 = (FStar_Absyn_Print.strBvd x)
in (let _108_887 = (FStar_Tc_Normalize.typ_norm_to_string env t)
in (FStar_Util.fprint2 "Before tc ... pattern var %s  : %s\n" _108_888 _108_887)))
end
| _39_2184 -> begin
()
end))))
end
| false -> begin
()
end)
in (let _39_2190 = (FStar_Tc_Env.clear_expected_typ pat_env)
in (match (_39_2190) with
| (env1, _39_2189) -> begin
(let env1 = (let _39_2191 = env1
in {FStar_Tc_Env.solver = _39_2191.FStar_Tc_Env.solver; FStar_Tc_Env.range = _39_2191.FStar_Tc_Env.range; FStar_Tc_Env.curmodule = _39_2191.FStar_Tc_Env.curmodule; FStar_Tc_Env.gamma = _39_2191.FStar_Tc_Env.gamma; FStar_Tc_Env.modules = _39_2191.FStar_Tc_Env.modules; FStar_Tc_Env.expected_typ = _39_2191.FStar_Tc_Env.expected_typ; FStar_Tc_Env.level = _39_2191.FStar_Tc_Env.level; FStar_Tc_Env.sigtab = _39_2191.FStar_Tc_Env.sigtab; FStar_Tc_Env.is_pattern = true; FStar_Tc_Env.instantiate_targs = _39_2191.FStar_Tc_Env.instantiate_targs; FStar_Tc_Env.instantiate_vargs = _39_2191.FStar_Tc_Env.instantiate_vargs; FStar_Tc_Env.effects = _39_2191.FStar_Tc_Env.effects; FStar_Tc_Env.generalize = _39_2191.FStar_Tc_Env.generalize; FStar_Tc_Env.letrecs = _39_2191.FStar_Tc_Env.letrecs; FStar_Tc_Env.top_level = _39_2191.FStar_Tc_Env.top_level; FStar_Tc_Env.check_uvars = _39_2191.FStar_Tc_Env.check_uvars; FStar_Tc_Env.use_eq = _39_2191.FStar_Tc_Env.use_eq; FStar_Tc_Env.is_iface = _39_2191.FStar_Tc_Env.is_iface; FStar_Tc_Env.admit = _39_2191.FStar_Tc_Env.admit; FStar_Tc_Env.default_effects = _39_2191.FStar_Tc_Env.default_effects})
in (let expected_pat_t = (FStar_Tc_Rel.unrefine env pat_t)
in (let exps = (FStar_All.pipe_right exps (FStar_List.map (fun e -> (let _39_2196 = (match ((FStar_Tc_Env.debug env FStar_Options.High)) with
| true -> begin
(let _108_891 = (FStar_Absyn_Print.exp_to_string e)
in (let _108_890 = (FStar_Absyn_Print.typ_to_string pat_t)
in (FStar_Util.fprint2 "Checking pattern expression %s against expected type %s\n" _108_891 _108_890)))
end
| false -> begin
()
end)
in (let _39_2201 = (tc_exp env1 e)
in (match (_39_2201) with
| (e, lc, g) -> begin
(let _39_2202 = (match ((FStar_Tc_Env.debug env FStar_Options.High)) with
| true -> begin
(let _108_893 = (FStar_Tc_Normalize.exp_norm_to_string env e)
in (let _108_892 = (FStar_Tc_Normalize.typ_norm_to_string env lc.FStar_Absyn_Syntax.res_typ)
in (FStar_Util.fprint2 "Pre-checked pattern expression %s at type %s\n" _108_893 _108_892)))
end
| false -> begin
()
end)
in (let g' = (FStar_Tc_Rel.teq env lc.FStar_Absyn_Syntax.res_typ expected_pat_t)
in (let g = (FStar_Tc_Rel.conj_guard g g')
in (let _39_2206 = (let _108_894 = (FStar_Tc_Rel.solve_deferred_constraints env g)
in (FStar_All.pipe_left Prims.ignore _108_894))
in (let e' = (FStar_Tc_Normalize.norm_exp ((FStar_Tc_Normalize.Beta)::[]) env e)
in (let _39_2209 = (match ((let _108_897 = (let _108_896 = (FStar_Absyn_Util.uvars_in_exp e')
in (let _108_895 = (FStar_Absyn_Util.uvars_in_typ expected_pat_t)
in (FStar_Absyn_Util.uvars_included_in _108_896 _108_895)))
in (FStar_All.pipe_left Prims.op_Negation _108_897))) with
| true -> begin
(let _108_902 = (let _108_901 = (let _108_900 = (let _108_899 = (FStar_Absyn_Print.exp_to_string e')
in (let _108_898 = (FStar_Absyn_Print.typ_to_string expected_pat_t)
in (FStar_Util.format2 "Implicit pattern variables in %s could not be resolved against expected type %s; please bind them explicitly" _108_899 _108_898)))
in (_108_900, p.FStar_Absyn_Syntax.p))
in FStar_Absyn_Syntax.Error (_108_901))
in (Prims.raise _108_902))
end
| false -> begin
()
end)
in (let _39_2211 = (match ((FStar_Tc_Env.debug env FStar_Options.High)) with
| true -> begin
(let _108_903 = (FStar_Tc_Normalize.exp_norm_to_string env e)
in (FStar_Util.fprint1 "Done checking pattern expression %s\n" _108_903))
end
| false -> begin
()
end)
in e)))))))
end))))))
in (let p = (FStar_Tc_Util.decorate_pattern env p exps)
in (let _39_2222 = (match ((FStar_All.pipe_left (FStar_Tc_Env.debug env) (FStar_Options.Other ("Pat")))) with
| true -> begin
(FStar_All.pipe_right bindings (FStar_List.iter (fun _39_12 -> (match (_39_12) with
| FStar_Tc_Env.Binding_var (x, t) -> begin
(let _108_906 = (FStar_Absyn_Print.strBvd x)
in (let _108_905 = (FStar_Absyn_Print.typ_to_string t)
in (FStar_Util.fprint2 "Pattern var %s  : %s\n" _108_906 _108_905)))
end
| _39_2221 -> begin
()
end))))
end
| false -> begin
()
end)
in (p, bindings, pat_env, exps, FStar_Tc_Rel.trivial_guard))))))
end))))
end)))
in (let _39_2229 = (tc_pat true pat_t pattern)
in (match (_39_2229) with
| (pattern, bindings, pat_env, disj_exps, g_pat) -> begin
(let _39_2239 = (match (when_clause) with
| None -> begin
(None, FStar_Tc_Rel.trivial_guard)
end
| Some (e) -> begin
(match ((FStar_Options.should_verify env.FStar_Tc_Env.curmodule.FStar_Absyn_Syntax.str)) with
| true -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("When clauses are not yet supported in --verify mode; they soon will be", e.FStar_Absyn_Syntax.pos))))
end
| false -> begin
(let _39_2236 = (let _108_907 = (FStar_Tc_Env.set_expected_typ pat_env FStar_Tc_Recheck.t_bool)
in (tc_exp _108_907 e))
in (match (_39_2236) with
| (e, c, g) -> begin
(Some (e), g)
end))
end)
end)
in (match (_39_2239) with
| (when_clause, g_when) -> begin
(let when_condition = (match (when_clause) with
| None -> begin
None
end
| Some (w) -> begin
(let _108_909 = (FStar_Absyn_Util.mk_eq FStar_Absyn_Util.t_bool FStar_Absyn_Util.t_bool w FStar_Absyn_Const.exp_true_bool)
in (FStar_All.pipe_left (fun _108_908 -> Some (_108_908)) _108_909))
end)
in (let _39_2247 = (tc_exp pat_env branch)
in (match (_39_2247) with
| (branch, c, g_branch) -> begin
(let scrutinee = (FStar_Absyn_Util.bvd_to_exp scrutinee_x pat_t)
in (let _39_2252 = (let _108_910 = (FStar_Tc_Env.push_local_binding env (FStar_Tc_Env.Binding_var ((scrutinee_x, pat_t))))
in (FStar_All.pipe_right _108_910 FStar_Tc_Env.clear_expected_typ))
in (match (_39_2252) with
| (scrutinee_env, _39_2251) -> begin
(let c = (let eqs = (FStar_All.pipe_right disj_exps (FStar_List.fold_left (fun fopt e -> (let e = (FStar_Absyn_Util.compress_exp e)
in (match (e.FStar_Absyn_Syntax.n) with
| (FStar_Absyn_Syntax.Exp_uvar (_)) | (FStar_Absyn_Syntax.Exp_constant (_)) | (FStar_Absyn_Syntax.Exp_fvar (_)) -> begin
fopt
end
| _39_2266 -> begin
(let clause = (let _108_914 = (FStar_Tc_Recheck.recompute_typ scrutinee)
in (let _108_913 = (FStar_Tc_Recheck.recompute_typ e)
in (FStar_Absyn_Util.mk_eq _108_914 _108_913 scrutinee e)))
in (match (fopt) with
| None -> begin
Some (clause)
end
| Some (f) -> begin
(let _108_916 = (FStar_Absyn_Util.mk_disj clause f)
in (FStar_All.pipe_left (fun _108_915 -> Some (_108_915)) _108_916))
end))
end))) None))
in (let c = (match ((eqs, when_condition)) with
| (None, None) -> begin
c
end
| (Some (f), None) -> begin
(FStar_Tc_Util.weaken_precondition env c (FStar_Tc_Rel.NonTrivial (f)))
end
| (Some (f), Some (w)) -> begin
(let _108_919 = (let _108_918 = (FStar_Absyn_Util.mk_conj f w)
in (FStar_All.pipe_left (fun _108_917 -> FStar_Tc_Rel.NonTrivial (_108_917)) _108_918))
in (FStar_Tc_Util.weaken_precondition env c _108_919))
end
| (None, Some (w)) -> begin
(FStar_Tc_Util.weaken_precondition env c (FStar_Tc_Rel.NonTrivial (w)))
end)
in (FStar_Tc_Util.close_comp env bindings c)))
in (let discriminate = (fun scrutinee f -> (let disc = (let _108_926 = (let _108_924 = (FStar_Absyn_Util.mk_discriminator f.FStar_Absyn_Syntax.v)
in (FStar_Absyn_Util.fvar None _108_924))
in (let _108_925 = (FStar_Absyn_Syntax.range_of_lid f.FStar_Absyn_Syntax.v)
in (FStar_All.pipe_left _108_926 _108_925)))
in (let disc = (let _108_929 = (let _108_928 = (let _108_927 = (FStar_All.pipe_left FStar_Absyn_Syntax.varg scrutinee)
in (_108_927)::[])
in (disc, _108_928))
in (FStar_Absyn_Syntax.mk_Exp_app _108_929 None scrutinee.FStar_Absyn_Syntax.pos))
in (FStar_Absyn_Util.mk_eq FStar_Absyn_Util.t_bool FStar_Absyn_Util.t_bool disc FStar_Absyn_Const.exp_true_bool))))
in (let rec mk_guard = (fun scrutinee pat_exp -> (let pat_exp = (FStar_Absyn_Util.compress_exp pat_exp)
in (match (pat_exp.FStar_Absyn_Syntax.n) with
| (FStar_Absyn_Syntax.Exp_uvar (_)) | (FStar_Absyn_Syntax.Exp_app ({FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Exp_uvar (_); FStar_Absyn_Syntax.tk = _; FStar_Absyn_Syntax.pos = _; FStar_Absyn_Syntax.fvs = _; FStar_Absyn_Syntax.uvs = _}, _)) | (FStar_Absyn_Syntax.Exp_bvar (_)) | (FStar_Absyn_Syntax.Exp_constant (FStar_Absyn_Syntax.Const_unit)) -> begin
(FStar_Absyn_Util.ftv FStar_Absyn_Const.true_lid FStar_Absyn_Syntax.ktype)
end
| FStar_Absyn_Syntax.Exp_constant (_39_2324) -> begin
(let _108_938 = (let _108_937 = (let _108_936 = (FStar_Absyn_Syntax.varg scrutinee)
in (let _108_935 = (let _108_934 = (FStar_Absyn_Syntax.varg pat_exp)
in (_108_934)::[])
in (_108_936)::_108_935))
in (FStar_Absyn_Util.teq, _108_937))
in (FStar_Absyn_Syntax.mk_Typ_app _108_938 None scrutinee.FStar_Absyn_Syntax.pos))
end
| FStar_Absyn_Syntax.Exp_fvar (f, _39_2328) -> begin
(discriminate scrutinee f)
end
| FStar_Absyn_Syntax.Exp_app ({FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Exp_fvar (f, _39_2341); FStar_Absyn_Syntax.tk = _39_2338; FStar_Absyn_Syntax.pos = _39_2336; FStar_Absyn_Syntax.fvs = _39_2334; FStar_Absyn_Syntax.uvs = _39_2332}, args) -> begin
(let head = (discriminate scrutinee f)
in (let sub_term_guards = (let _108_946 = (FStar_All.pipe_right args (FStar_List.mapi (fun i arg -> (match ((Prims.fst arg)) with
| FStar_Util.Inl (_39_2352) -> begin
[]
end
| FStar_Util.Inr (ei) -> begin
(let projector = (FStar_Tc_Env.lookup_projector env f.FStar_Absyn_Syntax.v i)
in (let sub_term = (let _108_944 = (let _108_943 = (FStar_Absyn_Util.fvar None projector f.FStar_Absyn_Syntax.p)
in (let _108_942 = (let _108_941 = (FStar_Absyn_Syntax.varg scrutinee)
in (_108_941)::[])
in (_108_943, _108_942)))
in (FStar_Absyn_Syntax.mk_Exp_app _108_944 None f.FStar_Absyn_Syntax.p))
in (let _108_945 = (mk_guard sub_term ei)
in (_108_945)::[])))
end))))
in (FStar_All.pipe_right _108_946 FStar_List.flatten))
in (FStar_Absyn_Util.mk_conj_l ((head)::sub_term_guards))))
end
| _39_2360 -> begin
(let _108_949 = (let _108_948 = (FStar_Range.string_of_range pat_exp.FStar_Absyn_Syntax.pos)
in (let _108_947 = (FStar_Absyn_Print.exp_to_string pat_exp)
in (FStar_Util.format2 "tc_eqn: Impossible (%s) %s" _108_948 _108_947)))
in (FStar_All.failwith _108_949))
end)))
in (let mk_guard = (fun s tsc pat -> (match ((not ((FStar_Options.should_verify env.FStar_Tc_Env.curmodule.FStar_Absyn_Syntax.str)))) with
| true -> begin
(FStar_Absyn_Util.ftv FStar_Absyn_Const.true_lid FStar_Absyn_Syntax.ktype)
end
| false -> begin
(let t = (mk_guard s pat)
in (let _39_2369 = (tc_typ_check scrutinee_env t FStar_Absyn_Syntax.mk_Kind_type)
in (match (_39_2369) with
| (t, _39_2368) -> begin
t
end)))
end))
in (let path_guard = (let _108_958 = (FStar_All.pipe_right disj_exps (FStar_List.map (fun e -> (let _108_957 = (FStar_Tc_Normalize.norm_exp ((FStar_Tc_Normalize.Beta)::[]) env e)
in (mk_guard scrutinee pat_t _108_957)))))
in (FStar_All.pipe_right _108_958 FStar_Absyn_Util.mk_disj_l))
in (let path_guard = (match (when_condition) with
| None -> begin
path_guard
end
| Some (w) -> begin
(FStar_Absyn_Util.mk_conj path_guard w)
end)
in (let guard = (let _108_959 = (FStar_Tc_Rel.conj_guard g_when g_branch)
in (FStar_Tc_Rel.conj_guard g_pat _108_959))
in (let _39_2377 = (match ((FStar_Tc_Env.debug env FStar_Options.High)) with
| true -> begin
(let _108_960 = (FStar_Tc_Rel.guard_to_string env guard)
in (FStar_All.pipe_left (FStar_Util.fprint1 "Carrying guard from match: %s\n") _108_960))
end
| false -> begin
()
end)
in (let _108_962 = (let _108_961 = (FStar_Tc_Rel.conj_guard g_when g_branch)
in (FStar_Tc_Rel.conj_guard g_pat _108_961))
in ((pattern, when_clause, branch), path_guard, c, _108_962))))))))))
end)))
end)))
end))
end)))
end))
and tc_kind_trivial = (fun env k -> (let _39_2383 = (tc_kind env k)
in (match (_39_2383) with
| (k, g) -> begin
(let _39_2384 = (FStar_Tc_Util.discharge_guard env g)
in k)
end)))
and tc_typ_trivial = (fun env t -> (let _39_2391 = (tc_typ env t)
in (match (_39_2391) with
| (t, k, g) -> begin
(let _39_2392 = (FStar_Tc_Util.discharge_guard env g)
in (t, k))
end)))
and tc_typ_check_trivial = (fun env t k -> (let _39_2399 = (tc_typ_check env t k)
in (match (_39_2399) with
| (t, f) -> begin
(let _39_2400 = (FStar_Tc_Util.discharge_guard env f)
in t)
end)))
and tc_total_exp = (fun env e -> (let _39_2407 = (tc_exp env e)
in (match (_39_2407) with
| (e, c, g) -> begin
(match ((FStar_Absyn_Util.is_total_lcomp c)) with
| true -> begin
(e, c.FStar_Absyn_Syntax.res_typ, g)
end
| false -> begin
(let g = (FStar_Tc_Rel.solve_deferred_constraints env g)
in (let c = (let _108_972 = (c.FStar_Absyn_Syntax.comp ())
in (FStar_All.pipe_right _108_972 (norm_c env)))
in (match ((let _108_974 = (let _108_973 = (FStar_Tc_Env.get_range env)
in (FStar_Absyn_Util.total_comp (FStar_Absyn_Util.comp_result c) _108_973))
in (FStar_Tc_Rel.sub_comp env c _108_974))) with
| Some (g') -> begin
(let _108_975 = (FStar_Tc_Rel.conj_guard g g')
in (e, (FStar_Absyn_Util.comp_result c), _108_975))
end
| _39_2413 -> begin
(let _108_978 = (let _108_977 = (let _108_976 = (FStar_Tc_Errors.expected_pure_expression e c)
in (_108_976, e.FStar_Absyn_Syntax.pos))
in FStar_Absyn_Syntax.Error (_108_977))
in (Prims.raise _108_978))
end)))
end)
end)))
and tc_ghost_exp = (fun env e -> (let _39_2419 = (tc_exp env e)
in (match (_39_2419) with
| (e, c, g) -> begin
(match ((FStar_Absyn_Util.is_total_lcomp c)) with
| true -> begin
(e, c.FStar_Absyn_Syntax.res_typ, g)
end
| false -> begin
(let c = (let _108_981 = (c.FStar_Absyn_Syntax.comp ())
in (FStar_All.pipe_right _108_981 (norm_c env)))
in (let expected_c = (FStar_Absyn_Util.gtotal_comp (FStar_Absyn_Util.comp_result c))
in (let g = (FStar_Tc_Rel.solve_deferred_constraints env g)
in (match ((FStar_Tc_Rel.sub_comp (let _39_2423 = env
in {FStar_Tc_Env.solver = _39_2423.FStar_Tc_Env.solver; FStar_Tc_Env.range = _39_2423.FStar_Tc_Env.range; FStar_Tc_Env.curmodule = _39_2423.FStar_Tc_Env.curmodule; FStar_Tc_Env.gamma = _39_2423.FStar_Tc_Env.gamma; FStar_Tc_Env.modules = _39_2423.FStar_Tc_Env.modules; FStar_Tc_Env.expected_typ = _39_2423.FStar_Tc_Env.expected_typ; FStar_Tc_Env.level = _39_2423.FStar_Tc_Env.level; FStar_Tc_Env.sigtab = _39_2423.FStar_Tc_Env.sigtab; FStar_Tc_Env.is_pattern = _39_2423.FStar_Tc_Env.is_pattern; FStar_Tc_Env.instantiate_targs = _39_2423.FStar_Tc_Env.instantiate_targs; FStar_Tc_Env.instantiate_vargs = _39_2423.FStar_Tc_Env.instantiate_vargs; FStar_Tc_Env.effects = _39_2423.FStar_Tc_Env.effects; FStar_Tc_Env.generalize = _39_2423.FStar_Tc_Env.generalize; FStar_Tc_Env.letrecs = _39_2423.FStar_Tc_Env.letrecs; FStar_Tc_Env.top_level = _39_2423.FStar_Tc_Env.top_level; FStar_Tc_Env.check_uvars = _39_2423.FStar_Tc_Env.check_uvars; FStar_Tc_Env.use_eq = false; FStar_Tc_Env.is_iface = _39_2423.FStar_Tc_Env.is_iface; FStar_Tc_Env.admit = _39_2423.FStar_Tc_Env.admit; FStar_Tc_Env.default_effects = _39_2423.FStar_Tc_Env.default_effects}) c expected_c)) with
| Some (g') -> begin
(let _108_982 = (FStar_Tc_Rel.conj_guard g g')
in (e, (FStar_Absyn_Util.comp_result c), _108_982))
end
| _39_2428 -> begin
(let _108_985 = (let _108_984 = (let _108_983 = (FStar_Tc_Errors.expected_ghost_expression e c)
in (_108_983, e.FStar_Absyn_Syntax.pos))
in FStar_Absyn_Syntax.Error (_108_984))
in (Prims.raise _108_985))
end))))
end)
end)))

let tc_tparams = (fun env tps -> (let _39_2434 = (tc_binders env tps)
in (match (_39_2434) with
| (tps, env, g) -> begin
(let _39_2435 = (FStar_Tc_Util.force_trivial env g)
in (tps, env))
end)))

let a_kwp_a = (fun env m s -> (match (s.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Kind_arrow ((FStar_Util.Inl (a), _39_2454)::(FStar_Util.Inl (wp), _39_2449)::(FStar_Util.Inl (_39_2441), _39_2444)::[], _39_2458) -> begin
(a, wp.FStar_Absyn_Syntax.sort)
end
| _39_2462 -> begin
(let _108_999 = (let _108_998 = (let _108_997 = (FStar_Tc_Errors.unexpected_signature_for_monad env m s)
in (let _108_996 = (FStar_Absyn_Syntax.range_of_lid m)
in (_108_997, _108_996)))
in FStar_Absyn_Syntax.Error (_108_998))
in (Prims.raise _108_999))
end))

let rec tc_eff_decl = (fun env m -> (let _39_2468 = (tc_binders env m.FStar_Absyn_Syntax.binders)
in (match (_39_2468) with
| (binders, env, g) -> begin
(let _39_2469 = (FStar_Tc_Util.discharge_guard env g)
in (let mk = (tc_kind_trivial env m.FStar_Absyn_Syntax.signature)
in (let _39_2474 = (a_kwp_a env m.FStar_Absyn_Syntax.mname mk)
in (match (_39_2474) with
| (a, kwp_a) -> begin
(let a_typ = (FStar_Absyn_Util.btvar_to_typ a)
in (let b = (let _108_1013 = (FStar_Absyn_Syntax.range_of_lid m.FStar_Absyn_Syntax.mname)
in (FStar_Absyn_Util.gen_bvar_p _108_1013 FStar_Absyn_Syntax.ktype))
in (let b_typ = (FStar_Absyn_Util.btvar_to_typ b)
in (let kwp_b = (FStar_Absyn_Util.subst_kind ((FStar_Util.Inl ((a.FStar_Absyn_Syntax.v, b_typ)))::[]) kwp_a)
in (let kwlp_a = kwp_a
in (let kwlp_b = kwp_b
in (let a_kwp_b = (let _108_1016 = (let _108_1015 = (let _108_1014 = (FStar_Absyn_Syntax.null_v_binder a_typ)
in (_108_1014)::[])
in (_108_1015, kwp_b))
in (FStar_Absyn_Syntax.mk_Kind_arrow _108_1016 a_typ.FStar_Absyn_Syntax.pos))
in (let a_kwlp_b = a_kwp_b
in (let w = (fun k -> (let _108_1024 = (FStar_Absyn_Syntax.range_of_lid m.FStar_Absyn_Syntax.mname)
in (k _108_1024)))
in (let ret = (let expected_k = (let _108_1031 = (let _108_1030 = (let _108_1029 = (let _108_1028 = (FStar_Absyn_Syntax.t_binder a)
in (let _108_1027 = (let _108_1026 = (FStar_Absyn_Syntax.null_v_binder a_typ)
in (_108_1026)::[])
in (_108_1028)::_108_1027))
in (_108_1029, kwp_a))
in (FStar_Absyn_Syntax.mk_Kind_arrow _108_1030))
in (FStar_All.pipe_left w _108_1031))
in (let _108_1032 = (tc_typ_check_trivial env m.FStar_Absyn_Syntax.ret expected_k)
in (FStar_All.pipe_right _108_1032 (norm_t env))))
in (let bind_wp = (let expected_k = (let _108_1047 = (let _108_1046 = (let _108_1045 = (let _108_1044 = (FStar_Absyn_Syntax.t_binder a)
in (let _108_1043 = (let _108_1042 = (FStar_Absyn_Syntax.t_binder b)
in (let _108_1041 = (let _108_1040 = (FStar_Absyn_Syntax.null_t_binder kwp_a)
in (let _108_1039 = (let _108_1038 = (FStar_Absyn_Syntax.null_t_binder kwlp_a)
in (let _108_1037 = (let _108_1036 = (FStar_Absyn_Syntax.null_t_binder a_kwp_b)
in (let _108_1035 = (let _108_1034 = (FStar_Absyn_Syntax.null_t_binder a_kwlp_b)
in (_108_1034)::[])
in (_108_1036)::_108_1035))
in (_108_1038)::_108_1037))
in (_108_1040)::_108_1039))
in (_108_1042)::_108_1041))
in (_108_1044)::_108_1043))
in (_108_1045, kwp_b))
in (FStar_Absyn_Syntax.mk_Kind_arrow _108_1046))
in (FStar_All.pipe_left w _108_1047))
in (let _108_1048 = (tc_typ_check_trivial env m.FStar_Absyn_Syntax.bind_wp expected_k)
in (FStar_All.pipe_right _108_1048 (norm_t env))))
in (let bind_wlp = (let expected_k = (let _108_1059 = (let _108_1058 = (let _108_1057 = (let _108_1056 = (FStar_Absyn_Syntax.t_binder a)
in (let _108_1055 = (let _108_1054 = (FStar_Absyn_Syntax.t_binder b)
in (let _108_1053 = (let _108_1052 = (FStar_Absyn_Syntax.null_t_binder kwlp_a)
in (let _108_1051 = (let _108_1050 = (FStar_Absyn_Syntax.null_t_binder a_kwlp_b)
in (_108_1050)::[])
in (_108_1052)::_108_1051))
in (_108_1054)::_108_1053))
in (_108_1056)::_108_1055))
in (_108_1057, kwlp_b))
in (FStar_Absyn_Syntax.mk_Kind_arrow _108_1058))
in (FStar_All.pipe_left w _108_1059))
in (let _108_1060 = (tc_typ_check_trivial env m.FStar_Absyn_Syntax.bind_wlp expected_k)
in (FStar_All.pipe_right _108_1060 (norm_t env))))
in (let if_then_else = (let expected_k = (let _108_1071 = (let _108_1070 = (let _108_1069 = (let _108_1068 = (FStar_Absyn_Syntax.t_binder a)
in (let _108_1067 = (let _108_1066 = (FStar_Absyn_Syntax.t_binder b)
in (let _108_1065 = (let _108_1064 = (FStar_Absyn_Syntax.null_t_binder kwp_a)
in (let _108_1063 = (let _108_1062 = (FStar_Absyn_Syntax.null_t_binder kwp_a)
in (_108_1062)::[])
in (_108_1064)::_108_1063))
in (_108_1066)::_108_1065))
in (_108_1068)::_108_1067))
in (_108_1069, kwp_a))
in (FStar_Absyn_Syntax.mk_Kind_arrow _108_1070))
in (FStar_All.pipe_left w _108_1071))
in (let _108_1072 = (tc_typ_check_trivial env m.FStar_Absyn_Syntax.if_then_else expected_k)
in (FStar_All.pipe_right _108_1072 (norm_t env))))
in (let ite_wp = (let expected_k = (let _108_1081 = (let _108_1080 = (let _108_1079 = (let _108_1078 = (FStar_Absyn_Syntax.t_binder a)
in (let _108_1077 = (let _108_1076 = (FStar_Absyn_Syntax.null_t_binder kwlp_a)
in (let _108_1075 = (let _108_1074 = (FStar_Absyn_Syntax.null_t_binder kwp_a)
in (_108_1074)::[])
in (_108_1076)::_108_1075))
in (_108_1078)::_108_1077))
in (_108_1079, kwp_a))
in (FStar_Absyn_Syntax.mk_Kind_arrow _108_1080))
in (FStar_All.pipe_left w _108_1081))
in (let _108_1082 = (tc_typ_check_trivial env m.FStar_Absyn_Syntax.ite_wp expected_k)
in (FStar_All.pipe_right _108_1082 (norm_t env))))
in (let ite_wlp = (let expected_k = (let _108_1089 = (let _108_1088 = (let _108_1087 = (let _108_1086 = (FStar_Absyn_Syntax.t_binder a)
in (let _108_1085 = (let _108_1084 = (FStar_Absyn_Syntax.null_t_binder kwlp_a)
in (_108_1084)::[])
in (_108_1086)::_108_1085))
in (_108_1087, kwlp_a))
in (FStar_Absyn_Syntax.mk_Kind_arrow _108_1088))
in (FStar_All.pipe_left w _108_1089))
in (let _108_1090 = (tc_typ_check_trivial env m.FStar_Absyn_Syntax.ite_wlp expected_k)
in (FStar_All.pipe_right _108_1090 (norm_t env))))
in (let wp_binop = (let expected_k = (let _108_1102 = (let _108_1101 = (let _108_1100 = (let _108_1099 = (FStar_Absyn_Syntax.t_binder a)
in (let _108_1098 = (let _108_1097 = (FStar_Absyn_Syntax.null_t_binder kwp_a)
in (let _108_1096 = (let _108_1095 = (let _108_1092 = (FStar_Absyn_Const.kbin FStar_Absyn_Syntax.ktype FStar_Absyn_Syntax.ktype FStar_Absyn_Syntax.ktype)
in (FStar_Absyn_Syntax.null_t_binder _108_1092))
in (let _108_1094 = (let _108_1093 = (FStar_Absyn_Syntax.null_t_binder kwp_a)
in (_108_1093)::[])
in (_108_1095)::_108_1094))
in (_108_1097)::_108_1096))
in (_108_1099)::_108_1098))
in (_108_1100, kwp_a))
in (FStar_Absyn_Syntax.mk_Kind_arrow _108_1101))
in (FStar_All.pipe_left w _108_1102))
in (let _108_1103 = (tc_typ_check_trivial env m.FStar_Absyn_Syntax.wp_binop expected_k)
in (FStar_All.pipe_right _108_1103 (norm_t env))))
in (let wp_as_type = (let expected_k = (let _108_1110 = (let _108_1109 = (let _108_1108 = (let _108_1107 = (FStar_Absyn_Syntax.t_binder a)
in (let _108_1106 = (let _108_1105 = (FStar_Absyn_Syntax.null_t_binder kwp_a)
in (_108_1105)::[])
in (_108_1107)::_108_1106))
in (_108_1108, FStar_Absyn_Syntax.ktype))
in (FStar_Absyn_Syntax.mk_Kind_arrow _108_1109))
in (FStar_All.pipe_left w _108_1110))
in (let _108_1111 = (tc_typ_check_trivial env m.FStar_Absyn_Syntax.wp_as_type expected_k)
in (FStar_All.pipe_right _108_1111 (norm_t env))))
in (let close_wp = (let expected_k = (let _108_1120 = (let _108_1119 = (let _108_1118 = (let _108_1117 = (FStar_Absyn_Syntax.t_binder b)
in (let _108_1116 = (let _108_1115 = (FStar_Absyn_Syntax.t_binder a)
in (let _108_1114 = (let _108_1113 = (FStar_Absyn_Syntax.null_t_binder a_kwp_b)
in (_108_1113)::[])
in (_108_1115)::_108_1114))
in (_108_1117)::_108_1116))
in (_108_1118, kwp_b))
in (FStar_Absyn_Syntax.mk_Kind_arrow _108_1119))
in (FStar_All.pipe_left w _108_1120))
in (let _108_1121 = (tc_typ_check_trivial env m.FStar_Absyn_Syntax.close_wp expected_k)
in (FStar_All.pipe_right _108_1121 (norm_t env))))
in (let close_wp_t = (let expected_k = (let _108_1134 = (let _108_1133 = (let _108_1132 = (let _108_1131 = (FStar_Absyn_Syntax.t_binder a)
in (let _108_1130 = (let _108_1129 = (let _108_1128 = (let _108_1127 = (let _108_1126 = (let _108_1125 = (let _108_1124 = (FStar_Absyn_Syntax.null_t_binder FStar_Absyn_Syntax.ktype)
in (_108_1124)::[])
in (_108_1125, kwp_a))
in (FStar_Absyn_Syntax.mk_Kind_arrow _108_1126))
in (FStar_All.pipe_left w _108_1127))
in (FStar_Absyn_Syntax.null_t_binder _108_1128))
in (_108_1129)::[])
in (_108_1131)::_108_1130))
in (_108_1132, kwp_a))
in (FStar_Absyn_Syntax.mk_Kind_arrow _108_1133))
in (FStar_All.pipe_left w _108_1134))
in (let _108_1135 = (tc_typ_check_trivial env m.FStar_Absyn_Syntax.close_wp_t expected_k)
in (FStar_All.pipe_right _108_1135 (norm_t env))))
in (let _39_2508 = (let expected_k = (let _108_1144 = (let _108_1143 = (let _108_1142 = (let _108_1141 = (FStar_Absyn_Syntax.t_binder a)
in (let _108_1140 = (let _108_1139 = (FStar_Absyn_Syntax.null_t_binder FStar_Absyn_Syntax.ktype)
in (let _108_1138 = (let _108_1137 = (FStar_Absyn_Syntax.null_t_binder kwp_a)
in (_108_1137)::[])
in (_108_1139)::_108_1138))
in (_108_1141)::_108_1140))
in (_108_1142, kwp_a))
in (FStar_Absyn_Syntax.mk_Kind_arrow _108_1143))
in (FStar_All.pipe_left w _108_1144))
in (let _108_1148 = (let _108_1145 = (tc_typ_check_trivial env m.FStar_Absyn_Syntax.assert_p expected_k)
in (FStar_All.pipe_right _108_1145 (norm_t env)))
in (let _108_1147 = (let _108_1146 = (tc_typ_check_trivial env m.FStar_Absyn_Syntax.assume_p expected_k)
in (FStar_All.pipe_right _108_1146 (norm_t env)))
in (_108_1148, _108_1147))))
in (match (_39_2508) with
| (assert_p, assume_p) -> begin
(let null_wp = (let expected_k = (let _108_1153 = (let _108_1152 = (let _108_1151 = (let _108_1150 = (FStar_Absyn_Syntax.t_binder a)
in (_108_1150)::[])
in (_108_1151, kwp_a))
in (FStar_Absyn_Syntax.mk_Kind_arrow _108_1152))
in (FStar_All.pipe_left w _108_1153))
in (let _108_1154 = (tc_typ_check_trivial env m.FStar_Absyn_Syntax.null_wp expected_k)
in (FStar_All.pipe_right _108_1154 (norm_t env))))
in (let trivial_wp = (let expected_k = (let _108_1161 = (let _108_1160 = (let _108_1159 = (let _108_1158 = (FStar_Absyn_Syntax.t_binder a)
in (let _108_1157 = (let _108_1156 = (FStar_Absyn_Syntax.null_t_binder kwp_a)
in (_108_1156)::[])
in (_108_1158)::_108_1157))
in (_108_1159, FStar_Absyn_Syntax.ktype))
in (FStar_Absyn_Syntax.mk_Kind_arrow _108_1160))
in (FStar_All.pipe_left w _108_1161))
in (let _108_1162 = (tc_typ_check_trivial env m.FStar_Absyn_Syntax.trivial expected_k)
in (FStar_All.pipe_right _108_1162 (norm_t env))))
in {FStar_Absyn_Syntax.mname = m.FStar_Absyn_Syntax.mname; FStar_Absyn_Syntax.binders = binders; FStar_Absyn_Syntax.qualifiers = m.FStar_Absyn_Syntax.qualifiers; FStar_Absyn_Syntax.signature = mk; FStar_Absyn_Syntax.ret = ret; FStar_Absyn_Syntax.bind_wp = bind_wp; FStar_Absyn_Syntax.bind_wlp = bind_wlp; FStar_Absyn_Syntax.if_then_else = if_then_else; FStar_Absyn_Syntax.ite_wp = ite_wp; FStar_Absyn_Syntax.ite_wlp = ite_wlp; FStar_Absyn_Syntax.wp_binop = wp_binop; FStar_Absyn_Syntax.wp_as_type = wp_as_type; FStar_Absyn_Syntax.close_wp = close_wp; FStar_Absyn_Syntax.close_wp_t = close_wp_t; FStar_Absyn_Syntax.assert_p = assert_p; FStar_Absyn_Syntax.assume_p = assume_p; FStar_Absyn_Syntax.null_wp = null_wp; FStar_Absyn_Syntax.trivial = trivial_wp}))
end)))))))))))))))))))))
end))))
end)))
and tc_decl = (fun env se deserialized -> (match (se) with
| FStar_Absyn_Syntax.Sig_pragma (p, r) -> begin
(match (p) with
| FStar_Absyn_Syntax.SetOptions (o) -> begin
(match ((FStar_Options.set_options o)) with
| FStar_Getopt.GoOn -> begin
(se, env)
end
| FStar_Getopt.Help -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Failed to process pragma: use \'fstar --help\' to see which options are available", r))))
end
| FStar_Getopt.Die (s) -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (((Prims.strcat "Failed to process pragma: " s), r))))
end)
end
| FStar_Absyn_Syntax.ResetOptions -> begin
(let _39_2527 = (env.FStar_Tc_Env.solver.FStar_Tc_Env.refresh ())
in (let _39_2529 = (let _108_1166 = (FStar_Options.reset_options ())
in (FStar_All.pipe_right _108_1166 Prims.ignore))
in (se, env)))
end)
end
| FStar_Absyn_Syntax.Sig_new_effect (ne, r) -> begin
(let ne = (tc_eff_decl env ne)
in (let se = FStar_Absyn_Syntax.Sig_new_effect ((ne, r))
in (let env = (FStar_Tc_Env.push_sigelt env se)
in (se, env))))
end
| FStar_Absyn_Syntax.Sig_sub_effect (sub, r) -> begin
(let _39_2544 = (let _108_1167 = (FStar_Tc_Env.lookup_effect_lid env sub.FStar_Absyn_Syntax.source)
in (a_kwp_a env sub.FStar_Absyn_Syntax.source _108_1167))
in (match (_39_2544) with
| (a, kwp_a_src) -> begin
(let _39_2547 = (let _108_1168 = (FStar_Tc_Env.lookup_effect_lid env sub.FStar_Absyn_Syntax.target)
in (a_kwp_a env sub.FStar_Absyn_Syntax.target _108_1168))
in (match (_39_2547) with
| (b, kwp_b_tgt) -> begin
(let kwp_a_tgt = (let _108_1172 = (let _108_1171 = (let _108_1170 = (let _108_1169 = (FStar_Absyn_Util.btvar_to_typ a)
in (b.FStar_Absyn_Syntax.v, _108_1169))
in FStar_Util.Inl (_108_1170))
in (_108_1171)::[])
in (FStar_Absyn_Util.subst_kind _108_1172 kwp_b_tgt))
in (let expected_k = (let _108_1178 = (let _108_1177 = (let _108_1176 = (let _108_1175 = (FStar_Absyn_Syntax.t_binder a)
in (let _108_1174 = (let _108_1173 = (FStar_Absyn_Syntax.null_t_binder kwp_a_src)
in (_108_1173)::[])
in (_108_1175)::_108_1174))
in (_108_1176, kwp_a_tgt))
in (FStar_Absyn_Syntax.mk_Kind_arrow _108_1177))
in (FStar_All.pipe_right r _108_1178))
in (let lift = (tc_typ_check_trivial env sub.FStar_Absyn_Syntax.lift expected_k)
in (let sub = (let _39_2551 = sub
in {FStar_Absyn_Syntax.source = _39_2551.FStar_Absyn_Syntax.source; FStar_Absyn_Syntax.target = _39_2551.FStar_Absyn_Syntax.target; FStar_Absyn_Syntax.lift = lift})
in (let se = FStar_Absyn_Syntax.Sig_sub_effect ((sub, r))
in (let env = (FStar_Tc_Env.push_sigelt env se)
in (se, env)))))))
end))
end))
end
| FStar_Absyn_Syntax.Sig_tycon (lid, tps, k, _mutuals, _data, tags, r) -> begin
(let env = (FStar_Tc_Env.set_range env r)
in (let _39_2568 = (tc_tparams env tps)
in (match (_39_2568) with
| (tps, env) -> begin
(let k = (match (k.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Kind_unknown -> begin
FStar_Absyn_Syntax.ktype
end
| _39_2571 -> begin
(tc_kind_trivial env k)
end)
in (let _39_2573 = (match ((FStar_Tc_Env.debug env FStar_Options.Extreme)) with
| true -> begin
(let _108_1181 = (FStar_Absyn_Print.sli lid)
in (let _108_1180 = (let _108_1179 = (FStar_Absyn_Util.close_kind tps k)
in (FStar_Absyn_Print.kind_to_string _108_1179))
in (FStar_Util.fprint2 "Checked %s at kind %s\n" _108_1181 _108_1180)))
end
| false -> begin
()
end)
in (let k = (norm_k env k)
in (let se = FStar_Absyn_Syntax.Sig_tycon ((lid, tps, k, _mutuals, _data, tags, r))
in (let _39_2591 = (match ((FStar_Absyn_Util.compress_kind k)) with
| {FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Kind_uvar (_39_2586); FStar_Absyn_Syntax.tk = _39_2584; FStar_Absyn_Syntax.pos = _39_2582; FStar_Absyn_Syntax.fvs = _39_2580; FStar_Absyn_Syntax.uvs = _39_2578} -> begin
(let _108_1182 = (FStar_Tc_Rel.keq env None k FStar_Absyn_Syntax.ktype)
in (FStar_All.pipe_left (FStar_Tc_Util.force_trivial env) _108_1182))
end
| _39_2590 -> begin
()
end)
in (let env = (FStar_Tc_Env.push_sigelt env se)
in (se, env)))))))
end)))
end
| FStar_Absyn_Syntax.Sig_kind_abbrev (lid, tps, k, r) -> begin
(let env0 = env
in (let env = (FStar_Tc_Env.set_range env r)
in (let _39_2604 = (tc_tparams env tps)
in (match (_39_2604) with
| (tps, env) -> begin
(let k = (tc_kind_trivial env k)
in (let se = FStar_Absyn_Syntax.Sig_kind_abbrev ((lid, tps, k, r))
in (let env = (FStar_Tc_Env.push_sigelt env0 se)
in (se, env))))
end))))
end
| FStar_Absyn_Syntax.Sig_effect_abbrev (lid, tps, c, tags, r) -> begin
(let env0 = env
in (let env = (FStar_Tc_Env.set_range env r)
in (let _39_2619 = (tc_tparams env tps)
in (match (_39_2619) with
| (tps, env) -> begin
(let _39_2622 = (tc_comp env c)
in (match (_39_2622) with
| (c, g) -> begin
(let tags = (FStar_All.pipe_right tags (FStar_List.map (fun _39_13 -> (match (_39_13) with
| FStar_Absyn_Syntax.DefaultEffect (None) -> begin
(let c' = (FStar_Tc_Normalize.weak_norm_comp env c)
in (let _108_1185 = (FStar_All.pipe_right c'.FStar_Absyn_Syntax.effect_name (fun _108_1184 -> Some (_108_1184)))
in FStar_Absyn_Syntax.DefaultEffect (_108_1185)))
end
| t -> begin
t
end))))
in (let se = FStar_Absyn_Syntax.Sig_effect_abbrev ((lid, tps, c, tags, r))
in (let env = (FStar_Tc_Env.push_sigelt env0 se)
in (se, env))))
end))
end))))
end
| FStar_Absyn_Syntax.Sig_typ_abbrev (lid, tps, k, t, tags, r) -> begin
(let env = (FStar_Tc_Env.set_range env r)
in (let _39_2642 = (tc_tparams env tps)
in (match (_39_2642) with
| (tps, env') -> begin
(let _39_2648 = (let _108_1189 = (tc_typ_trivial env' t)
in (FStar_All.pipe_right _108_1189 (fun _39_2645 -> (match (_39_2645) with
| (t, k) -> begin
(let _108_1188 = (norm_t env' t)
in (let _108_1187 = (norm_k env' k)
in (_108_1188, _108_1187)))
end))))
in (match (_39_2648) with
| (t, k1) -> begin
(let k2 = (match (k.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Kind_unknown -> begin
k1
end
| _39_2651 -> begin
(let k2 = (let _108_1190 = (tc_kind_trivial env' k)
in (FStar_All.pipe_right _108_1190 (norm_k env)))
in (let _39_2653 = (let _108_1191 = (FStar_Tc_Rel.keq env' (Some (t)) k1 k2)
in (FStar_All.pipe_left (FStar_Tc_Util.force_trivial env') _108_1191))
in k2))
end)
in (let se = FStar_Absyn_Syntax.Sig_typ_abbrev ((lid, tps, k2, t, tags, r))
in (let env = (FStar_Tc_Env.push_sigelt env se)
in (se, env))))
end))
end)))
end
| FStar_Absyn_Syntax.Sig_datacon (lid, t, (tname, tps, k), quals, mutuals, r) -> begin
(let env = (FStar_Tc_Env.set_range env r)
in (let _39_2673 = (tc_binders env tps)
in (match (_39_2673) with
| (tps, env, g) -> begin
(let tycon = (tname, tps, k)
in (let _39_2675 = (FStar_Tc_Util.discharge_guard env g)
in (let t = (tc_typ_check_trivial env t FStar_Absyn_Syntax.ktype)
in (let t = (norm_t env t)
in (let _39_2687 = (match ((FStar_Absyn_Util.function_formals t)) with
| Some (formals, cod) -> begin
(formals, (FStar_Absyn_Util.comp_result cod))
end
| _39_2684 -> begin
([], t)
end)
in (match (_39_2687) with
| (formals, result_t) -> begin
(let cardinality_and_positivity_check = (fun formal -> (let check_positivity = (fun formals -> (FStar_All.pipe_right formals (FStar_List.iter (fun _39_2695 -> (match (_39_2695) with
| (a, _39_2694) -> begin
(match (a) with
| FStar_Util.Inl (_39_2697) -> begin
()
end
| FStar_Util.Inr (y) -> begin
(let t = y.FStar_Absyn_Syntax.sort
in (FStar_Absyn_Visit.collect_from_typ (fun b t -> (match ((let _108_1199 = (FStar_Absyn_Util.compress_typ t)
in _108_1199.FStar_Absyn_Syntax.n)) with
| FStar_Absyn_Syntax.Typ_const (f) -> begin
(match ((FStar_List.tryFind (FStar_Absyn_Syntax.lid_equals f.FStar_Absyn_Syntax.v) mutuals)) with
| None -> begin
()
end
| Some (tname) -> begin
(let _108_1205 = (let _108_1204 = (let _108_1203 = (let _108_1201 = (let _108_1200 = (FStar_Absyn_Syntax.range_of_lid lid)
in (FStar_Absyn_Util.fvar (Some (FStar_Absyn_Syntax.Data_ctor)) lid _108_1200))
in (FStar_Tc_Errors.constructor_fails_the_positivity_check env _108_1201 tname))
in (let _108_1202 = (FStar_Absyn_Syntax.range_of_lid lid)
in (_108_1203, _108_1202)))
in FStar_Absyn_Syntax.Error (_108_1204))
in (Prims.raise _108_1205))
end)
end
| _39_2710 -> begin
()
end)) () t))
end)
end)))))
in (match ((Prims.fst formal)) with
| FStar_Util.Inl (a) -> begin
(let _39_2713 = (match ((FStar_Options.warn_cardinality ())) with
| true -> begin
(let _108_1206 = (FStar_Tc_Errors.cardinality_constraint_violated lid a)
in (FStar_Tc_Errors.warn r _108_1206))
end
| false -> begin
(match ((FStar_Options.check_cardinality ())) with
| true -> begin
(let _108_1209 = (let _108_1208 = (let _108_1207 = (FStar_Tc_Errors.cardinality_constraint_violated lid a)
in (_108_1207, r))
in FStar_Absyn_Syntax.Error (_108_1208))
in (Prims.raise _108_1209))
end
| false -> begin
()
end)
end)
in (let k = (FStar_Tc_Normalize.norm_kind ((FStar_Tc_Normalize.Beta)::(FStar_Tc_Normalize.DeltaHard)::[]) env a.FStar_Absyn_Syntax.sort)
in (match (k.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Kind_arrow (_39_2717) -> begin
(let _39_2722 = (FStar_Absyn_Util.kind_formals k)
in (match (_39_2722) with
| (formals, _39_2721) -> begin
(check_positivity formals)
end))
end
| _39_2724 -> begin
()
end)))
end
| FStar_Util.Inr (x) -> begin
(let t = (FStar_Tc_Normalize.norm_typ ((FStar_Tc_Normalize.Beta)::(FStar_Tc_Normalize.DeltaHard)::[]) env x.FStar_Absyn_Syntax.sort)
in (match (((FStar_Absyn_Util.is_function_typ t) && (FStar_Absyn_Util.is_pure_or_ghost_function t))) with
| true -> begin
(let _39_2731 = (let _108_1210 = (FStar_Absyn_Util.function_formals t)
in (FStar_All.pipe_right _108_1210 FStar_Util.must))
in (match (_39_2731) with
| (formals, _39_2730) -> begin
(check_positivity formals)
end))
end
| false -> begin
()
end))
end)))
in (let _39_2732 = (FStar_All.pipe_right formals (FStar_List.iter cardinality_and_positivity_check))
in (let _39_2786 = (match ((FStar_Absyn_Util.destruct result_t tname)) with
| Some (args) -> begin
(match ((not ((((FStar_List.length args) >= (FStar_List.length tps)) && (let _108_1214 = (let _108_1213 = (FStar_Util.first_N (FStar_List.length tps) args)
in (FStar_All.pipe_right _108_1213 Prims.fst))
in (FStar_List.forall2 (fun _39_2739 _39_2743 -> (match ((_39_2739, _39_2743)) with
| ((a, _39_2738), (b, _39_2742)) -> begin
(match ((a, b)) with
| (FStar_Util.Inl ({FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Typ_btvar (aa); FStar_Absyn_Syntax.tk = _39_2751; FStar_Absyn_Syntax.pos = _39_2749; FStar_Absyn_Syntax.fvs = _39_2747; FStar_Absyn_Syntax.uvs = _39_2745}), FStar_Util.Inl (bb)) -> begin
(FStar_Absyn_Util.bvar_eq aa bb)
end
| (FStar_Util.Inr ({FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Exp_bvar (xx); FStar_Absyn_Syntax.tk = _39_2766; FStar_Absyn_Syntax.pos = _39_2764; FStar_Absyn_Syntax.fvs = _39_2762; FStar_Absyn_Syntax.uvs = _39_2760}), FStar_Util.Inr (yy)) -> begin
(FStar_Absyn_Util.bvar_eq xx yy)
end
| _39_2775 -> begin
false
end)
end)) _108_1214 tps)))))) with
| true -> begin
(let expected_t = (match (tps) with
| [] -> begin
(FStar_Absyn_Util.ftv tname FStar_Absyn_Syntax.kun)
end
| _39_2778 -> begin
(let _39_2782 = (FStar_Absyn_Util.args_of_binders tps)
in (match (_39_2782) with
| (_39_2780, expected_args) -> begin
(let _108_1215 = (FStar_Absyn_Util.ftv tname FStar_Absyn_Syntax.kun)
in (FStar_Absyn_Util.mk_typ_app _108_1215 expected_args))
end))
end)
in (let _108_1221 = (let _108_1220 = (let _108_1219 = (let _108_1217 = (let _108_1216 = (FStar_Absyn_Syntax.range_of_lid lid)
in (FStar_Absyn_Util.fvar (Some (FStar_Absyn_Syntax.Data_ctor)) lid _108_1216))
in (FStar_Tc_Errors.constructor_builds_the_wrong_type env _108_1217 result_t expected_t))
in (let _108_1218 = (FStar_Absyn_Syntax.range_of_lid lid)
in (_108_1219, _108_1218)))
in FStar_Absyn_Syntax.Error (_108_1220))
in (Prims.raise _108_1221)))
end
| false -> begin
()
end)
end
| _39_2785 -> begin
(let _108_1228 = (let _108_1227 = (let _108_1226 = (let _108_1224 = (let _108_1222 = (FStar_Absyn_Syntax.range_of_lid lid)
in (FStar_Absyn_Util.fvar (Some (FStar_Absyn_Syntax.Data_ctor)) lid _108_1222))
in (let _108_1223 = (FStar_Absyn_Util.ftv tname FStar_Absyn_Syntax.kun)
in (FStar_Tc_Errors.constructor_builds_the_wrong_type env _108_1224 result_t _108_1223)))
in (let _108_1225 = (FStar_Absyn_Syntax.range_of_lid lid)
in (_108_1226, _108_1225)))
in FStar_Absyn_Syntax.Error (_108_1227))
in (Prims.raise _108_1228))
end)
in (let se = FStar_Absyn_Syntax.Sig_datacon ((lid, t, tycon, quals, mutuals, r))
in (let env = (FStar_Tc_Env.push_sigelt env se)
in (let _39_2790 = (match ((log env)) with
| true -> begin
(let _108_1230 = (let _108_1229 = (FStar_Tc_Normalize.typ_norm_to_string env t)
in (FStar_Util.format2 "data %s : %s\n" lid.FStar_Absyn_Syntax.str _108_1229))
in (FStar_All.pipe_left FStar_Util.print_string _108_1230))
end
| false -> begin
()
end)
in (se, env)))))))
end))))))
end)))
end
| FStar_Absyn_Syntax.Sig_val_decl (lid, t, quals, r) -> begin
(let env = (FStar_Tc_Env.set_range env r)
in (let t = (let _108_1231 = (tc_typ_check_trivial env t FStar_Absyn_Syntax.ktype)
in (FStar_All.pipe_right _108_1231 (FStar_Tc_Normalize.norm_typ ((FStar_Tc_Normalize.Beta)::(FStar_Tc_Normalize.SNComp)::[]) env)))
in (let _39_2800 = (FStar_Tc_Util.check_uvars r t)
in (let se = FStar_Absyn_Syntax.Sig_val_decl ((lid, t, quals, r))
in (let env = (FStar_Tc_Env.push_sigelt env se)
in (let _39_2804 = (match ((log env)) with
| true -> begin
(let _108_1233 = (let _108_1232 = (FStar_Tc_Normalize.typ_norm_to_string env t)
in (FStar_Util.format2 "val %s : %s\n" lid.FStar_Absyn_Syntax.str _108_1232))
in (FStar_All.pipe_left FStar_Util.print_string _108_1233))
end
| false -> begin
()
end)
in (se, env)))))))
end
| FStar_Absyn_Syntax.Sig_assume (lid, phi, quals, r) -> begin
(let env = (FStar_Tc_Env.set_range env r)
in (let phi = (let _108_1234 = (tc_typ_check_trivial env phi FStar_Absyn_Syntax.ktype)
in (FStar_All.pipe_right _108_1234 (norm_t env)))
in (let _39_2814 = (FStar_Tc_Util.check_uvars r phi)
in (let se = FStar_Absyn_Syntax.Sig_assume ((lid, phi, quals, r))
in (let env = (FStar_Tc_Env.push_sigelt env se)
in (se, env))))))
end
| FStar_Absyn_Syntax.Sig_let (lbs, r, lids, quals) -> begin
(let env = (FStar_Tc_Env.set_range env r)
in (let _39_2867 = (FStar_All.pipe_right (Prims.snd lbs) (FStar_List.fold_left (fun _39_2827 lb -> (match (_39_2827) with
| (gen, lbs) -> begin
(let _39_2864 = (match (lb) with
| {FStar_Absyn_Syntax.lbname = FStar_Util.Inl (_39_2836); FStar_Absyn_Syntax.lbtyp = _39_2834; FStar_Absyn_Syntax.lbeff = _39_2832; FStar_Absyn_Syntax.lbdef = _39_2830} -> begin
(FStar_All.failwith "impossible")
end
| {FStar_Absyn_Syntax.lbname = FStar_Util.Inr (l); FStar_Absyn_Syntax.lbtyp = t; FStar_Absyn_Syntax.lbeff = _39_2841; FStar_Absyn_Syntax.lbdef = e} -> begin
(let _39_2861 = (match ((FStar_Tc_Env.try_lookup_val_decl env l)) with
| None -> begin
(gen, lb)
end
| Some (t', _39_2849) -> begin
(let _39_2852 = (match ((FStar_Tc_Env.debug env FStar_Options.Medium)) with
| true -> begin
(let _108_1237 = (FStar_Absyn_Print.typ_to_string t')
in (FStar_Util.fprint2 "Using annotation %s for let binding %s\n" _108_1237 l.FStar_Absyn_Syntax.str))
end
| false -> begin
()
end)
in (match (t.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_unknown -> begin
(let _108_1238 = (FStar_Absyn_Syntax.mk_lb (FStar_Util.Inr (l), FStar_Absyn_Const.effect_ALL_lid, t', e))
in (false, _108_1238))
end
| _39_2856 -> begin
(let _39_2857 = (match ((not (deserialized))) with
| true -> begin
(let _108_1240 = (let _108_1239 = (FStar_Range.string_of_range r)
in (FStar_Util.format1 "%s: Warning: Annotation from val declaration overrides inline type annotation\n" _108_1239))
in (FStar_All.pipe_left FStar_Util.print_string _108_1240))
end
| false -> begin
()
end)
in (let _108_1241 = (FStar_Absyn_Syntax.mk_lb (FStar_Util.Inr (l), FStar_Absyn_Const.effect_ALL_lid, t', e))
in (false, _108_1241)))
end))
end)
in (match (_39_2861) with
| (gen, lb) -> begin
(gen, lb)
end))
end)
in (match (_39_2864) with
| (gen, lb) -> begin
(gen, (lb)::lbs)
end))
end)) (true, [])))
in (match (_39_2867) with
| (generalize, lbs') -> begin
(let lbs' = (FStar_List.rev lbs')
in (let e = (let _108_1246 = (let _108_1245 = (let _108_1244 = (syn' env FStar_Tc_Recheck.t_unit)
in (FStar_All.pipe_left _108_1244 (FStar_Absyn_Syntax.mk_Exp_constant FStar_Absyn_Syntax.Const_unit)))
in (((Prims.fst lbs), lbs'), _108_1245))
in (FStar_Absyn_Syntax.mk_Exp_let _108_1246 None r))
in (let _39_2902 = (match ((tc_exp (let _39_2870 = env
in {FStar_Tc_Env.solver = _39_2870.FStar_Tc_Env.solver; FStar_Tc_Env.range = _39_2870.FStar_Tc_Env.range; FStar_Tc_Env.curmodule = _39_2870.FStar_Tc_Env.curmodule; FStar_Tc_Env.gamma = _39_2870.FStar_Tc_Env.gamma; FStar_Tc_Env.modules = _39_2870.FStar_Tc_Env.modules; FStar_Tc_Env.expected_typ = _39_2870.FStar_Tc_Env.expected_typ; FStar_Tc_Env.level = _39_2870.FStar_Tc_Env.level; FStar_Tc_Env.sigtab = _39_2870.FStar_Tc_Env.sigtab; FStar_Tc_Env.is_pattern = _39_2870.FStar_Tc_Env.is_pattern; FStar_Tc_Env.instantiate_targs = _39_2870.FStar_Tc_Env.instantiate_targs; FStar_Tc_Env.instantiate_vargs = _39_2870.FStar_Tc_Env.instantiate_vargs; FStar_Tc_Env.effects = _39_2870.FStar_Tc_Env.effects; FStar_Tc_Env.generalize = generalize; FStar_Tc_Env.letrecs = _39_2870.FStar_Tc_Env.letrecs; FStar_Tc_Env.top_level = _39_2870.FStar_Tc_Env.top_level; FStar_Tc_Env.check_uvars = _39_2870.FStar_Tc_Env.check_uvars; FStar_Tc_Env.use_eq = _39_2870.FStar_Tc_Env.use_eq; FStar_Tc_Env.is_iface = _39_2870.FStar_Tc_Env.is_iface; FStar_Tc_Env.admit = _39_2870.FStar_Tc_Env.admit; FStar_Tc_Env.default_effects = _39_2870.FStar_Tc_Env.default_effects}) e)) with
| ({FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Exp_let (lbs, e); FStar_Absyn_Syntax.tk = _39_2879; FStar_Absyn_Syntax.pos = _39_2877; FStar_Absyn_Syntax.fvs = _39_2875; FStar_Absyn_Syntax.uvs = _39_2873}, _39_2886, g) when (FStar_Tc_Rel.is_trivial g) -> begin
(let quals = (match (e.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Exp_meta (FStar_Absyn_Syntax.Meta_desugared (_39_2890, FStar_Absyn_Syntax.MaskedEffect)) -> begin
(FStar_Absyn_Syntax.HasMaskedEffect)::quals
end
| _39_2896 -> begin
quals
end)
in (FStar_Absyn_Syntax.Sig_let ((lbs, r, lids, quals)), lbs))
end
| _39_2899 -> begin
(FStar_All.failwith "impossible")
end)
in (match (_39_2902) with
| (se, lbs) -> begin
(let _39_2908 = (match ((log env)) with
| true -> begin
(let _108_1252 = (let _108_1251 = (FStar_All.pipe_right (Prims.snd lbs) (FStar_List.map (fun lb -> (let should_log = (match ((let _108_1248 = (FStar_Util.right lb.FStar_Absyn_Syntax.lbname)
in (FStar_Tc_Env.try_lookup_val_decl env _108_1248))) with
| None -> begin
true
end
| _39_2906 -> begin
false
end)
in (match (should_log) with
| true -> begin
(let _108_1250 = (FStar_Absyn_Print.lbname_to_string lb.FStar_Absyn_Syntax.lbname)
in (let _108_1249 = (FStar_Tc_Normalize.typ_norm_to_string env lb.FStar_Absyn_Syntax.lbtyp)
in (FStar_Util.format2 "let %s : %s" _108_1250 _108_1249)))
end
| false -> begin
""
end)))))
in (FStar_All.pipe_right _108_1251 (FStar_String.concat "\n")))
in (FStar_Util.fprint1 "%s\n" _108_1252))
end
| false -> begin
()
end)
in (let env = (FStar_Tc_Env.push_sigelt env se)
in (se, env)))
end))))
end)))
end
| FStar_Absyn_Syntax.Sig_main (e, r) -> begin
(let env = (FStar_Tc_Env.set_range env r)
in (let env = (FStar_Tc_Env.set_expected_typ env FStar_Tc_Recheck.t_unit)
in (let _39_2920 = (tc_exp env e)
in (match (_39_2920) with
| (e, c, g1) -> begin
(let g1 = (FStar_Tc_Rel.solve_deferred_constraints env g1)
in (let _39_2926 = (let _108_1256 = (let _108_1253 = (FStar_Absyn_Util.ml_comp FStar_Tc_Recheck.t_unit r)
in Some (_108_1253))
in (let _108_1255 = (let _108_1254 = (c.FStar_Absyn_Syntax.comp ())
in (e, _108_1254))
in (check_expected_effect env _108_1256 _108_1255)))
in (match (_39_2926) with
| (e, _39_2924, g) -> begin
(let _39_2927 = (let _108_1257 = (FStar_Tc_Rel.conj_guard g1 g)
in (FStar_Tc_Util.discharge_guard env _108_1257))
in (let se = FStar_Absyn_Syntax.Sig_main ((e, r))
in (let env = (FStar_Tc_Env.push_sigelt env se)
in (se, env))))
end)))
end))))
end
| FStar_Absyn_Syntax.Sig_bundle (ses, quals, lids, r) -> begin
(let env = (FStar_Tc_Env.set_range env r)
in (let _39_2946 = (FStar_All.pipe_right ses (FStar_List.partition (fun _39_14 -> (match (_39_14) with
| FStar_Absyn_Syntax.Sig_tycon (_39_2940) -> begin
true
end
| _39_2943 -> begin
false
end))))
in (match (_39_2946) with
| (tycons, rest) -> begin
(let _39_2955 = (FStar_All.pipe_right rest (FStar_List.partition (fun _39_15 -> (match (_39_15) with
| FStar_Absyn_Syntax.Sig_typ_abbrev (_39_2949) -> begin
true
end
| _39_2952 -> begin
false
end))))
in (match (_39_2955) with
| (abbrevs, rest) -> begin
(let recs = (FStar_All.pipe_right abbrevs (FStar_List.map (fun _39_16 -> (match (_39_16) with
| FStar_Absyn_Syntax.Sig_typ_abbrev (lid, tps, k, t, [], r) -> begin
(let k = (match (k.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Kind_unknown -> begin
(let _108_1261 = (FStar_Tc_Rel.new_kvar r tps)
in (FStar_All.pipe_right _108_1261 Prims.fst))
end
| _39_2967 -> begin
k
end)
in (FStar_Absyn_Syntax.Sig_tycon ((lid, tps, k, [], [], [], r)), t))
end
| _39_2970 -> begin
(FStar_All.failwith "impossible")
end))))
in (let _39_2974 = (FStar_List.split recs)
in (match (_39_2974) with
| (recs, abbrev_defs) -> begin
(let msg = (match ((FStar_ST.read FStar_Options.logQueries)) with
| true -> begin
(let _108_1262 = (FStar_Absyn_Print.sigelt_to_string_short se)
in (FStar_Util.format1 "Recursive bindings: %s" _108_1262))
end
| false -> begin
""
end)
in (let _39_2976 = (env.FStar_Tc_Env.solver.FStar_Tc_Env.push msg)
in (let _39_2983 = (tc_decls false env tycons deserialized)
in (match (_39_2983) with
| (tycons, _39_2980, _39_2982) -> begin
(let _39_2989 = (tc_decls false env recs deserialized)
in (match (_39_2989) with
| (recs, _39_2986, _39_2988) -> begin
(let env1 = (FStar_Tc_Env.push_sigelt env (FStar_Absyn_Syntax.Sig_bundle (((FStar_List.append tycons recs), quals, lids, r))))
in (let _39_2996 = (tc_decls false env1 rest deserialized)
in (match (_39_2996) with
| (rest, _39_2993, _39_2995) -> begin
(let abbrevs = (FStar_List.map2 (fun se t -> (match (se) with
| FStar_Absyn_Syntax.Sig_tycon (lid, tps, k, [], [], [], r) -> begin
(let tt = (let _108_1265 = (FStar_Absyn_Syntax.mk_Typ_ascribed (t, k) t.FStar_Absyn_Syntax.pos)
in (FStar_Absyn_Util.close_with_lam tps _108_1265))
in (let _39_3012 = (tc_typ_trivial env1 tt)
in (match (_39_3012) with
| (tt, _39_3011) -> begin
(let _39_3021 = (match (tt.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_lam (bs, t) -> begin
(bs, t)
end
| _39_3018 -> begin
([], tt)
end)
in (match (_39_3021) with
| (tps, t) -> begin
(let _108_1267 = (let _108_1266 = (FStar_Absyn_Util.compress_kind k)
in (lid, tps, _108_1266, t, [], r))
in FStar_Absyn_Syntax.Sig_typ_abbrev (_108_1267))
end))
end)))
end
| _39_3023 -> begin
(let _108_1269 = (let _108_1268 = (FStar_Range.string_of_range r)
in (FStar_Util.format1 "(%s) Impossible" _108_1268))
in (FStar_All.failwith _108_1269))
end)) recs abbrev_defs)
in (let _39_3025 = (env.FStar_Tc_Env.solver.FStar_Tc_Env.pop msg)
in (let se = FStar_Absyn_Syntax.Sig_bundle (((FStar_List.append (FStar_List.append tycons abbrevs) rest), quals, lids, r))
in (let env = (FStar_Tc_Env.push_sigelt env se)
in (se, env)))))
end)))
end))
end))))
end)))
end))
end)))
end))
and tc_decls = (fun for_export env ses deserialized -> (let _39_3049 = (FStar_All.pipe_right ses (FStar_List.fold_left (fun _39_3036 se -> (match (_39_3036) with
| (ses, all_non_private, env) -> begin
(let _39_3038 = (match ((FStar_Tc_Env.debug env FStar_Options.Low)) with
| true -> begin
(let _108_1277 = (let _108_1276 = (FStar_Absyn_Print.sigelt_to_string se)
in (FStar_Util.format1 "Checking sigelt\t%s\n" _108_1276))
in (FStar_Util.print_string _108_1277))
end
| false -> begin
()
end)
in (let _39_3042 = (tc_decl env se deserialized)
in (match (_39_3042) with
| (se, env) -> begin
(let _39_3043 = (env.FStar_Tc_Env.solver.FStar_Tc_Env.encode_sig env se)
in (let non_private_decls = (match (for_export) with
| true -> begin
(non_private env se)
end
| false -> begin
[]
end)
in ((se)::ses, (non_private_decls)::all_non_private, env)))
end)))
end)) ([], [], env)))
in (match (_39_3049) with
| (ses, all_non_private, env) -> begin
(let _108_1278 = (FStar_All.pipe_right (FStar_List.rev all_non_private) FStar_List.flatten)
in ((FStar_List.rev ses), _108_1278, env))
end)))
and non_private = (fun env se -> (let is_private = (fun quals -> (FStar_List.contains FStar_Absyn_Syntax.Private quals))
in (match (se) with
| FStar_Absyn_Syntax.Sig_bundle (ses, quals, _39_3057, _39_3059) -> begin
(se)::[]
end
| FStar_Absyn_Syntax.Sig_tycon (_39_3063, _39_3065, _39_3067, _39_3069, _39_3071, quals, r) -> begin
(match ((is_private quals)) with
| true -> begin
[]
end
| false -> begin
(se)::[]
end)
end
| FStar_Absyn_Syntax.Sig_typ_abbrev (l, bs, k, t, quals, r) -> begin
(match ((is_private quals)) with
| true -> begin
(FStar_Absyn_Syntax.Sig_tycon ((l, bs, k, [], [], (FStar_Absyn_Syntax.Assumption)::quals, r)))::[]
end
| false -> begin
(se)::[]
end)
end
| FStar_Absyn_Syntax.Sig_assume (_39_3085, _39_3087, quals, _39_3090) -> begin
(match ((is_private quals)) with
| true -> begin
[]
end
| false -> begin
(se)::[]
end)
end
| FStar_Absyn_Syntax.Sig_val_decl (_39_3094, _39_3096, quals, _39_3099) -> begin
(match ((is_private quals)) with
| true -> begin
[]
end
| false -> begin
(se)::[]
end)
end
| FStar_Absyn_Syntax.Sig_main (_39_3103) -> begin
[]
end
| (FStar_Absyn_Syntax.Sig_new_effect (_)) | (FStar_Absyn_Syntax.Sig_sub_effect (_)) | (FStar_Absyn_Syntax.Sig_effect_abbrev (_)) | (FStar_Absyn_Syntax.Sig_pragma (_)) | (FStar_Absyn_Syntax.Sig_kind_abbrev (_)) -> begin
(se)::[]
end
| FStar_Absyn_Syntax.Sig_datacon (_39_3121) -> begin
(FStar_All.failwith "Impossible")
end
| FStar_Absyn_Syntax.Sig_let (lbs, r, l, _39_3127) -> begin
(let check_priv = (fun lbs -> (let is_priv = (fun _39_17 -> (match (_39_17) with
| {FStar_Absyn_Syntax.lbname = FStar_Util.Inr (l); FStar_Absyn_Syntax.lbtyp = _39_3138; FStar_Absyn_Syntax.lbeff = _39_3136; FStar_Absyn_Syntax.lbdef = _39_3134} -> begin
(match ((FStar_Tc_Env.try_lookup_val_decl env l)) with
| Some (_39_3143, qs) -> begin
(FStar_List.contains FStar_Absyn_Syntax.Private qs)
end
| _39_3148 -> begin
false
end)
end
| _39_3150 -> begin
false
end))
in (let some_priv = (FStar_All.pipe_right lbs (FStar_Util.for_some is_priv))
in (match (some_priv) with
| true -> begin
(match ((FStar_All.pipe_right lbs (FStar_Util.for_some (fun x -> (let _108_1288 = (is_priv x)
in (FStar_All.pipe_right _108_1288 Prims.op_Negation)))))) with
| true -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Some but not all functions in this mutually recursive nest are marked private", r))))
end
| false -> begin
true
end)
end
| false -> begin
false
end))))
in (let _39_3157 = (FStar_All.pipe_right (Prims.snd lbs) (FStar_List.partition (fun lb -> ((FStar_Absyn_Util.is_pure_or_ghost_function lb.FStar_Absyn_Syntax.lbtyp) && (let _108_1290 = (FStar_Absyn_Util.is_lemma lb.FStar_Absyn_Syntax.lbtyp)
in (FStar_All.pipe_left Prims.op_Negation _108_1290))))))
in (match (_39_3157) with
| (pure_funs, rest) -> begin
(match ((pure_funs, rest)) with
| (_39_3161::_39_3159, _39_3166::_39_3164) -> begin
(Prims.raise (FStar_Absyn_Syntax.Error (("Pure functions cannot be mutually recursive with impure functions", r))))
end
| (_39_3172::_39_3170, []) -> begin
(match ((check_priv pure_funs)) with
| true -> begin
[]
end
| false -> begin
(se)::[]
end)
end
| ([], _39_3180::_39_3178) -> begin
(match ((check_priv rest)) with
| true -> begin
[]
end
| false -> begin
(FStar_All.pipe_right rest (FStar_List.collect (fun lb -> (match (lb.FStar_Absyn_Syntax.lbname) with
| FStar_Util.Inl (_39_3185) -> begin
(FStar_All.failwith "impossible")
end
| FStar_Util.Inr (l) -> begin
(let _108_1294 = (let _108_1293 = (let _108_1292 = (FStar_Absyn_Syntax.range_of_lid l)
in (l, lb.FStar_Absyn_Syntax.lbtyp, (FStar_Absyn_Syntax.Assumption)::[], _108_1292))
in FStar_Absyn_Syntax.Sig_val_decl (_108_1293))
in (_108_1294)::[])
end))))
end)
end
| ([], []) -> begin
(FStar_All.failwith "Impossible")
end)
end)))
end)))

let get_exports = (fun env modul non_private_decls -> (let assume_vals = (fun decls -> (FStar_All.pipe_right decls (FStar_List.map (fun _39_18 -> (match (_39_18) with
| FStar_Absyn_Syntax.Sig_val_decl (lid, t, quals, r) -> begin
FStar_Absyn_Syntax.Sig_val_decl ((lid, t, (FStar_Absyn_Syntax.Assumption)::quals, r))
end
| s -> begin
s
end)))))
in (match (modul.FStar_Absyn_Syntax.is_interface) with
| true -> begin
non_private_decls
end
| false -> begin
(let exports = (let _108_1306 = (FStar_Tc_Env.modules env)
in (FStar_Util.find_map _108_1306 (fun m -> (match ((m.FStar_Absyn_Syntax.is_interface && (FStar_Absyn_Syntax.lid_equals modul.FStar_Absyn_Syntax.name m.FStar_Absyn_Syntax.name))) with
| true -> begin
(let _108_1305 = (FStar_All.pipe_right m.FStar_Absyn_Syntax.exports assume_vals)
in Some (_108_1305))
end
| false -> begin
None
end))))
in (match (exports) with
| None -> begin
non_private_decls
end
| Some (e) -> begin
e
end))
end)))

let tc_partial_modul = (fun env modul -> (let name = (FStar_Util.format2 "%s %s" (match (modul.FStar_Absyn_Syntax.is_interface) with
| true -> begin
"interface"
end
| false -> begin
"module"
end) modul.FStar_Absyn_Syntax.name.FStar_Absyn_Syntax.str)
in (let msg = (Prims.strcat "Internals for " name)
in (let env = (let _39_3214 = env
in (let _108_1311 = (not ((FStar_Options.should_verify modul.FStar_Absyn_Syntax.name.FStar_Absyn_Syntax.str)))
in {FStar_Tc_Env.solver = _39_3214.FStar_Tc_Env.solver; FStar_Tc_Env.range = _39_3214.FStar_Tc_Env.range; FStar_Tc_Env.curmodule = _39_3214.FStar_Tc_Env.curmodule; FStar_Tc_Env.gamma = _39_3214.FStar_Tc_Env.gamma; FStar_Tc_Env.modules = _39_3214.FStar_Tc_Env.modules; FStar_Tc_Env.expected_typ = _39_3214.FStar_Tc_Env.expected_typ; FStar_Tc_Env.level = _39_3214.FStar_Tc_Env.level; FStar_Tc_Env.sigtab = _39_3214.FStar_Tc_Env.sigtab; FStar_Tc_Env.is_pattern = _39_3214.FStar_Tc_Env.is_pattern; FStar_Tc_Env.instantiate_targs = _39_3214.FStar_Tc_Env.instantiate_targs; FStar_Tc_Env.instantiate_vargs = _39_3214.FStar_Tc_Env.instantiate_vargs; FStar_Tc_Env.effects = _39_3214.FStar_Tc_Env.effects; FStar_Tc_Env.generalize = _39_3214.FStar_Tc_Env.generalize; FStar_Tc_Env.letrecs = _39_3214.FStar_Tc_Env.letrecs; FStar_Tc_Env.top_level = _39_3214.FStar_Tc_Env.top_level; FStar_Tc_Env.check_uvars = _39_3214.FStar_Tc_Env.check_uvars; FStar_Tc_Env.use_eq = _39_3214.FStar_Tc_Env.use_eq; FStar_Tc_Env.is_iface = modul.FStar_Absyn_Syntax.is_interface; FStar_Tc_Env.admit = _108_1311; FStar_Tc_Env.default_effects = _39_3214.FStar_Tc_Env.default_effects}))
in (let _39_3217 = (match ((not ((FStar_Absyn_Syntax.lid_equals modul.FStar_Absyn_Syntax.name FStar_Absyn_Const.prims_lid)))) with
| true -> begin
(env.FStar_Tc_Env.solver.FStar_Tc_Env.push msg)
end
| false -> begin
()
end)
in (let env = (FStar_Tc_Env.set_current_module env modul.FStar_Absyn_Syntax.name)
in (let _39_3223 = (tc_decls true env modul.FStar_Absyn_Syntax.declarations modul.FStar_Absyn_Syntax.is_deserialized)
in (match (_39_3223) with
| (ses, non_private_decls, env) -> begin
((let _39_3224 = modul
in {FStar_Absyn_Syntax.name = _39_3224.FStar_Absyn_Syntax.name; FStar_Absyn_Syntax.declarations = ses; FStar_Absyn_Syntax.exports = _39_3224.FStar_Absyn_Syntax.exports; FStar_Absyn_Syntax.is_interface = _39_3224.FStar_Absyn_Syntax.is_interface; FStar_Absyn_Syntax.is_deserialized = _39_3224.FStar_Absyn_Syntax.is_deserialized}), non_private_decls, env)
end))))))))

let tc_more_partial_modul = (fun env modul decls -> (let _39_3232 = (tc_decls true env decls false)
in (match (_39_3232) with
| (ses, non_private_decls, env) -> begin
(let modul = (let _39_3233 = modul
in {FStar_Absyn_Syntax.name = _39_3233.FStar_Absyn_Syntax.name; FStar_Absyn_Syntax.declarations = (FStar_List.append modul.FStar_Absyn_Syntax.declarations ses); FStar_Absyn_Syntax.exports = _39_3233.FStar_Absyn_Syntax.exports; FStar_Absyn_Syntax.is_interface = _39_3233.FStar_Absyn_Syntax.is_interface; FStar_Absyn_Syntax.is_deserialized = _39_3233.FStar_Absyn_Syntax.is_deserialized})
in (modul, non_private_decls, env))
end)))

let finish_partial_modul = (fun env modul npds -> (let exports = (get_exports env modul npds)
in (let modul = (let _39_3240 = modul
in {FStar_Absyn_Syntax.name = _39_3240.FStar_Absyn_Syntax.name; FStar_Absyn_Syntax.declarations = _39_3240.FStar_Absyn_Syntax.declarations; FStar_Absyn_Syntax.exports = exports; FStar_Absyn_Syntax.is_interface = modul.FStar_Absyn_Syntax.is_interface; FStar_Absyn_Syntax.is_deserialized = modul.FStar_Absyn_Syntax.is_deserialized})
in (let env = (FStar_Tc_Env.finish_module env modul)
in (let _39_3250 = (match ((not ((FStar_Absyn_Syntax.lid_equals modul.FStar_Absyn_Syntax.name FStar_Absyn_Const.prims_lid)))) with
| true -> begin
(let _39_3244 = (env.FStar_Tc_Env.solver.FStar_Tc_Env.pop (Prims.strcat "Ending modul " modul.FStar_Absyn_Syntax.name.FStar_Absyn_Syntax.str))
in (let _39_3246 = (match (((not (modul.FStar_Absyn_Syntax.is_interface)) || (let _108_1324 = (FStar_ST.read FStar_Options.admit_fsi)
in (FStar_List.contains modul.FStar_Absyn_Syntax.name.FStar_Absyn_Syntax.str _108_1324)))) with
| true -> begin
(env.FStar_Tc_Env.solver.FStar_Tc_Env.encode_modul env modul)
end
| false -> begin
()
end)
in (let _39_3248 = (env.FStar_Tc_Env.solver.FStar_Tc_Env.refresh ())
in (let _108_1325 = (FStar_Options.reset_options ())
in (FStar_All.pipe_right _108_1325 Prims.ignore)))))
end
| false -> begin
()
end)
in (modul, env))))))

let tc_modul = (fun env modul -> (let _39_3257 = (tc_partial_modul env modul)
in (match (_39_3257) with
| (modul, non_private_decls, env) -> begin
(finish_partial_modul env modul non_private_decls)
end)))

let add_modul_to_tcenv = (fun en m -> (let do_sigelt = (fun en elt -> (let env = (FStar_Tc_Env.push_sigelt en elt)
in (let _39_3264 = (env.FStar_Tc_Env.solver.FStar_Tc_Env.encode_sig env elt)
in env)))
in (let en = (FStar_Tc_Env.set_current_module en m.FStar_Absyn_Syntax.name)
in (let _108_1338 = (FStar_List.fold_left do_sigelt en m.FStar_Absyn_Syntax.exports)
in (FStar_Tc_Env.finish_module _108_1338 m)))))

let check_module = (fun env m -> (let _39_3269 = (match (((let _108_1343 = (FStar_ST.read FStar_Options.debug)
in (FStar_List.length _108_1343)) <> 0)) with
| true -> begin
(let _108_1344 = (FStar_Absyn_Print.sli m.FStar_Absyn_Syntax.name)
in (FStar_Util.fprint2 "Checking %s: %s\n" (match (m.FStar_Absyn_Syntax.is_interface) with
| true -> begin
"i\'face"
end
| false -> begin
"module"
end) _108_1344))
end
| false -> begin
()
end)
in (let _39_3282 = (match (m.FStar_Absyn_Syntax.is_deserialized) with
| true -> begin
(let env' = (add_modul_to_tcenv env m)
in (m, env'))
end
| false -> begin
(let _39_3274 = (tc_modul env m)
in (match (_39_3274) with
| (m, env) -> begin
(let _39_3278 = (match ((FStar_ST.read FStar_Options.serialize_mods)) with
| true -> begin
(let c_file_name = (let _108_1350 = (let _108_1349 = (let _108_1347 = (let _108_1346 = (let _108_1345 = (FStar_Options.get_fstar_home ())
in (Prims.strcat _108_1345 "/"))
in (Prims.strcat _108_1346 FStar_Options.cache_dir))
in (Prims.strcat _108_1347 "/"))
in (let _108_1348 = (FStar_Absyn_Syntax.text_of_lid m.FStar_Absyn_Syntax.name)
in (Prims.strcat _108_1349 _108_1348)))
in (Prims.strcat _108_1350 ".cache"))
in (let _39_3276 = (let _108_1353 = (let _108_1352 = (let _108_1351 = (FStar_Absyn_Syntax.text_of_lid m.FStar_Absyn_Syntax.name)
in (Prims.strcat "Serializing module " _108_1351))
in (Prims.strcat _108_1352 "\n"))
in (FStar_Util.print_string _108_1353))
in (let _108_1354 = (FStar_Util.get_owriter c_file_name)
in (FStar_Absyn_SSyntax.serialize_modul _108_1354 m))))
end
| false -> begin
()
end)
in (m, env))
end))
end)
in (match (_39_3282) with
| (m, env) -> begin
(let _39_3283 = (match ((FStar_Options.should_dump m.FStar_Absyn_Syntax.name.FStar_Absyn_Syntax.str)) with
| true -> begin
(let _108_1355 = (FStar_Absyn_Print.modul_to_string m)
in (FStar_Util.fprint1 "%s\n" _108_1355))
end
| false -> begin
()
end)
in ((m)::[], env))
end))))




