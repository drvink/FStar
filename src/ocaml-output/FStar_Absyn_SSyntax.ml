
exception Err of (Prims.string)

let is_Err = (fun _discr_ -> (match (_discr_) with
| Err (_) -> begin
true
end
| _ -> begin
false
end))

let ___Err____0 = (fun projectee -> (match (projectee) with
| Err (_28_3) -> begin
_28_3
end))

let parse_error = (fun _28_4 -> (match (()) with
| () -> begin
(FStar_All.failwith "Parse error: ill-formed cache")
end))

type l__Writer =
FStar_Util.oWriter

type l__Reader =
FStar_Util.oReader

let serialize_option = (fun writer f l -> (match (l) with
| None -> begin
(writer.FStar_Util.write_char 'n')
end
| Some (l) -> begin
(let _28_12 = (writer.FStar_Util.write_char 's')
in (f writer l))
end))

let deserialize_option = (fun reader f -> (let n = (reader.FStar_Util.read_char ())
in (match ((n = 'n')) with
| true -> begin
None
end
| false -> begin
(let _97_21 = (f reader)
in Some (_97_21))
end)))

let serialize_list = (fun writer f l -> (let _28_22 = (writer.FStar_Util.write_int (FStar_List.length l))
in (FStar_List.iter (fun elt -> (f writer elt)) (FStar_List.rev_append l []))))

let deserialize_list = (fun reader f -> (let n = (reader.FStar_Util.read_int ())
in (let rec helper = (fun accum n -> (match ((n = 0)) with
| true -> begin
accum
end
| false -> begin
(let _97_42 = (let _97_41 = (f reader)
in (_97_41)::accum)
in (helper _97_42 (n - 1)))
end))
in (helper [] n))))

let serialize_ident = (fun writer ast -> (writer.FStar_Util.write_string ast.FStar_Absyn_Syntax.idText))

let deserialize_ident = (fun reader -> (let _97_50 = (let _97_49 = (reader.FStar_Util.read_string ())
in (_97_49, FStar_Absyn_Syntax.dummyRange))
in (FStar_Absyn_Syntax.mk_ident _97_50)))

let serialize_LongIdent = (fun writer ast -> (let _28_37 = (serialize_list writer serialize_ident ast.FStar_Absyn_Syntax.ns)
in (serialize_ident writer ast.FStar_Absyn_Syntax.ident)))

let deserialize_LongIdent = (fun reader -> (let _97_60 = (let _97_59 = (deserialize_list reader deserialize_ident)
in (let _97_58 = (let _97_57 = (deserialize_ident reader)
in (_97_57)::[])
in (FStar_List.append _97_59 _97_58)))
in (FStar_Absyn_Syntax.lid_of_ids _97_60)))

let serialize_lident = serialize_LongIdent

let deserialize_lident = deserialize_LongIdent

let serialize_withinfo_t = (fun writer s_v s_sort ast -> (let _28_46 = (s_v writer ast.FStar_Absyn_Syntax.v)
in (s_sort writer ast.FStar_Absyn_Syntax.sort)))

let deserialize_withinfo_t = (fun reader ds_v ds_sort -> (let _97_90 = (ds_v reader)
in (let _97_89 = (ds_sort reader)
in {FStar_Absyn_Syntax.v = _97_90; FStar_Absyn_Syntax.sort = _97_89; FStar_Absyn_Syntax.p = FStar_Absyn_Syntax.dummyRange})))

let serialize_var = (fun writer s_sort ast -> (serialize_withinfo_t writer serialize_lident s_sort ast))

let deserialize_var = (fun reader ds_sort -> (deserialize_withinfo_t reader deserialize_lident ds_sort))

let serialize_bvdef = (fun writer ast -> (let _28_63 = (serialize_ident writer ast.FStar_Absyn_Syntax.ppname)
in (serialize_ident writer ast.FStar_Absyn_Syntax.realname)))

let deserialize_bvdef = (fun ghost reader -> (let _97_110 = (deserialize_ident reader)
in (let _97_109 = (deserialize_ident reader)
in {FStar_Absyn_Syntax.ppname = _97_110; FStar_Absyn_Syntax.realname = _97_109})))

let serialize_bvar = (fun writer s_sort ast -> (serialize_withinfo_t writer serialize_bvdef s_sort ast))

let deserialize_bvar = (fun ghost reader ds_sort -> (deserialize_withinfo_t reader (deserialize_bvdef ghost) ds_sort))

let serialize_sconst = (fun writer ast -> (match (ast) with
| FStar_Absyn_Syntax.Const_unit -> begin
(writer.FStar_Util.write_char 'a')
end
| FStar_Absyn_Syntax.Const_uint8 (v) -> begin
(let _28_83 = (writer.FStar_Util.write_char 'b')
in (writer.FStar_Util.write_byte v))
end
| FStar_Absyn_Syntax.Const_bool (v) -> begin
(let _28_87 = (writer.FStar_Util.write_char 'c')
in (writer.FStar_Util.write_bool v))
end
| FStar_Absyn_Syntax.Const_int32 (v) -> begin
(let _28_91 = (writer.FStar_Util.write_char 'd')
in (writer.FStar_Util.write_int32 v))
end
| FStar_Absyn_Syntax.Const_int64 (v) -> begin
(let _28_95 = (writer.FStar_Util.write_char 'e')
in (writer.FStar_Util.write_int64 v))
end
| FStar_Absyn_Syntax.Const_char (v) -> begin
(let _28_99 = (writer.FStar_Util.write_char 'f')
in (writer.FStar_Util.write_char v))
end
| FStar_Absyn_Syntax.Const_float (v) -> begin
(let _28_103 = (writer.FStar_Util.write_char 'g')
in (writer.FStar_Util.write_double v))
end
| FStar_Absyn_Syntax.Const_bytearray (v, _28_107) -> begin
(let _28_110 = (writer.FStar_Util.write_char 'h')
in (writer.FStar_Util.write_bytearray v))
end
| FStar_Absyn_Syntax.Const_string (v, _28_114) -> begin
(let _28_117 = (writer.FStar_Util.write_char 'i')
in (writer.FStar_Util.write_bytearray v))
end
| FStar_Absyn_Syntax.Const_int (v) -> begin
(let _28_121 = (writer.FStar_Util.write_char 'j')
in (writer.FStar_Util.write_string v))
end))

let deserialize_sconst = (fun reader -> (match ((reader.FStar_Util.read_char ())) with
| 'a' -> begin
FStar_Absyn_Syntax.Const_unit
end
| 'b' -> begin
(let _97_132 = (reader.FStar_Util.read_byte ())
in FStar_Absyn_Syntax.Const_uint8 (_97_132))
end
| 'c' -> begin
(let _97_133 = (reader.FStar_Util.read_bool ())
in FStar_Absyn_Syntax.Const_bool (_97_133))
end
| 'd' -> begin
(let _97_134 = (reader.FStar_Util.read_int32 ())
in FStar_Absyn_Syntax.Const_int32 (_97_134))
end
| 'e' -> begin
(let _97_135 = (reader.FStar_Util.read_int64 ())
in FStar_Absyn_Syntax.Const_int64 (_97_135))
end
| 'f' -> begin
(let _97_136 = (reader.FStar_Util.read_char ())
in FStar_Absyn_Syntax.Const_char (_97_136))
end
| 'g' -> begin
(let _97_137 = (reader.FStar_Util.read_double ())
in FStar_Absyn_Syntax.Const_float (_97_137))
end
| 'h' -> begin
(let _97_139 = (let _97_138 = (reader.FStar_Util.read_bytearray ())
in (_97_138, FStar_Absyn_Syntax.dummyRange))
in FStar_Absyn_Syntax.Const_bytearray (_97_139))
end
| 'i' -> begin
(let _97_141 = (let _97_140 = (reader.FStar_Util.read_bytearray ())
in (_97_140, FStar_Absyn_Syntax.dummyRange))
in FStar_Absyn_Syntax.Const_string (_97_141))
end
| 'j' -> begin
(let _97_142 = (reader.FStar_Util.read_string ())
in FStar_Absyn_Syntax.Const_int (_97_142))
end
| _28_135 -> begin
(parse_error ())
end))

let serialize_either = (fun writer s_l s_r ast -> (match (ast) with
| FStar_Util.Inl (v) -> begin
(let _28_144 = (writer.FStar_Util.write_char 'a')
in (s_l writer v))
end
| FStar_Util.Inr (v) -> begin
(let _28_148 = (writer.FStar_Util.write_char 'b')
in (s_r writer v))
end))

let deserialize_either = (fun reader ds_l ds_r -> (match ((reader.FStar_Util.read_char ())) with
| 'a' -> begin
(let _97_168 = (ds_l reader)
in FStar_Util.Inl (_97_168))
end
| 'b' -> begin
(let _97_169 = (ds_r reader)
in FStar_Util.Inr (_97_169))
end
| _28_158 -> begin
(parse_error ())
end))

let serialize_syntax = (fun writer s_a ast -> (s_a writer ast.FStar_Absyn_Syntax.n))

let deserialize_syntax = (fun reader ds_a ds_b -> (let _97_188 = (ds_a reader)
in (let _97_187 = (FStar_Util.mk_ref None)
in (let _97_186 = (FStar_Util.mk_ref None)
in (let _97_185 = (FStar_Util.mk_ref None)
in {FStar_Absyn_Syntax.n = _97_188; FStar_Absyn_Syntax.tk = _97_187; FStar_Absyn_Syntax.pos = FStar_Absyn_Syntax.dummyRange; FStar_Absyn_Syntax.fvs = _97_186; FStar_Absyn_Syntax.uvs = _97_185})))))

let rec serialize_typ' = (fun writer ast -> (match (ast) with
| FStar_Absyn_Syntax.Typ_btvar (v) -> begin
(let _28_173 = (writer.FStar_Util.write_char 'a')
in (serialize_btvar writer v))
end
| FStar_Absyn_Syntax.Typ_const (v) -> begin
(let _28_177 = (writer.FStar_Util.write_char 'b')
in (serialize_ftvar writer v))
end
| FStar_Absyn_Syntax.Typ_fun (bs, c) -> begin
(let _28_183 = (writer.FStar_Util.write_char 'c')
in (let _28_185 = (serialize_binders writer bs)
in (serialize_comp writer c)))
end
| FStar_Absyn_Syntax.Typ_refine (v, t) -> begin
(let _28_191 = (writer.FStar_Util.write_char 'd')
in (let _28_193 = (serialize_bvvar writer v)
in (serialize_typ writer t)))
end
| FStar_Absyn_Syntax.Typ_app (t, ars) -> begin
(let _28_199 = (writer.FStar_Util.write_char 'e')
in (let _28_201 = (serialize_typ writer t)
in (let _28_203 = (serialize_args writer ars)
in (match (((FStar_ST.read FStar_Options.debug) <> [])) with
| true -> begin
(match (t.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Typ_lam (_28_206, _28_208) -> begin
(FStar_Util.print_string "type application node with lam\n")
end
| _28_212 -> begin
()
end)
end
| false -> begin
()
end))))
end
| FStar_Absyn_Syntax.Typ_lam (bs, t) -> begin
(let _28_217 = (writer.FStar_Util.write_char 'f')
in (let _28_219 = (serialize_binders writer bs)
in (serialize_typ writer t)))
end
| FStar_Absyn_Syntax.Typ_ascribed (t, k) -> begin
(let _28_225 = (writer.FStar_Util.write_char 'g')
in (let _28_227 = (serialize_typ writer t)
in (serialize_knd writer k)))
end
| FStar_Absyn_Syntax.Typ_meta (m) -> begin
(let _28_231 = (writer.FStar_Util.write_char 'h')
in (serialize_meta_t writer m))
end
| FStar_Absyn_Syntax.Typ_unknown -> begin
(writer.FStar_Util.write_char 'i')
end
| FStar_Absyn_Syntax.Typ_uvar (_28_235, _28_237) -> begin
(Prims.raise (Err ("typ not impl:1")))
end
| FStar_Absyn_Syntax.Typ_delayed (_28_241, _28_243) -> begin
(Prims.raise (Err ("typ not impl:2")))
end))
and serialize_meta_t = (fun writer ast -> (match (ast) with
| FStar_Absyn_Syntax.Meta_pattern (t, l) -> begin
(let _28_252 = (writer.FStar_Util.write_char 'a')
in (let _28_254 = (serialize_typ writer t)
in (serialize_list writer serialize_arg l)))
end
| FStar_Absyn_Syntax.Meta_named (t, lid) -> begin
(let _28_260 = (writer.FStar_Util.write_char 'b')
in (let _28_262 = (serialize_typ writer t)
in (serialize_lident writer lid)))
end
| FStar_Absyn_Syntax.Meta_labeled (t, s, _28_267, b) -> begin
(let _28_271 = (writer.FStar_Util.write_char 'c')
in (let _28_273 = (serialize_typ writer t)
in (let _28_275 = (writer.FStar_Util.write_string s)
in (writer.FStar_Util.write_bool b))))
end
| _28_278 -> begin
(Prims.raise (Err ("unimplemented meta_t")))
end))
and serialize_arg = (fun writer ast -> (let _28_281 = (serialize_either writer serialize_typ serialize_exp (Prims.fst ast))
in (let _97_255 = (FStar_All.pipe_left FStar_Absyn_Syntax.is_implicit (Prims.snd ast))
in (writer.FStar_Util.write_bool _97_255))))
and serialize_args = (fun writer ast -> (serialize_list writer serialize_arg ast))
and serialize_binder = (fun writer ast -> (let _28_287 = (serialize_either writer serialize_btvar serialize_bvvar (Prims.fst ast))
in (let _97_260 = (FStar_All.pipe_left FStar_Absyn_Syntax.is_implicit (Prims.snd ast))
in (writer.FStar_Util.write_bool _97_260))))
and serialize_binders = (fun writer ast -> (serialize_list writer serialize_binder ast))
and serialize_typ = (fun writer ast -> (let _97_265 = (FStar_Absyn_Util.compress_typ ast)
in (serialize_syntax writer serialize_typ' _97_265)))
and serialize_comp_typ = (fun writer ast -> (let _28_295 = (serialize_lident writer ast.FStar_Absyn_Syntax.effect_name)
in (let _28_297 = (serialize_typ writer ast.FStar_Absyn_Syntax.result_typ)
in (let _28_299 = (serialize_args writer ast.FStar_Absyn_Syntax.effect_args)
in (serialize_list writer serialize_cflags ast.FStar_Absyn_Syntax.flags)))))
and serialize_comp' = (fun writer ast -> (match (ast) with
| FStar_Absyn_Syntax.Total (t) -> begin
(let _28_305 = (writer.FStar_Util.write_char 'a')
in (serialize_typ writer t))
end
| FStar_Absyn_Syntax.Comp (c) -> begin
(let _28_309 = (writer.FStar_Util.write_char 'b')
in (serialize_comp_typ writer c))
end))
and serialize_comp = (fun writer ast -> (serialize_syntax writer serialize_comp' ast))
and serialize_cflags = (fun writer ast -> (match (ast) with
| FStar_Absyn_Syntax.TOTAL -> begin
(writer.FStar_Util.write_char 'a')
end
| FStar_Absyn_Syntax.MLEFFECT -> begin
(writer.FStar_Util.write_char 'b')
end
| FStar_Absyn_Syntax.RETURN -> begin
(writer.FStar_Util.write_char 'c')
end
| FStar_Absyn_Syntax.PARTIAL_RETURN -> begin
(writer.FStar_Util.write_char 'd')
end
| FStar_Absyn_Syntax.SOMETRIVIAL -> begin
(writer.FStar_Util.write_char 'e')
end
| FStar_Absyn_Syntax.LEMMA -> begin
(writer.FStar_Util.write_char 'f')
end
| FStar_Absyn_Syntax.DECREASES (e) -> begin
(let _28_323 = (writer.FStar_Util.write_char 'g')
in (serialize_exp writer e))
end))
and serialize_exp' = (fun writer ast -> (match (ast) with
| FStar_Absyn_Syntax.Exp_bvar (v) -> begin
(let _28_329 = (writer.FStar_Util.write_char 'a')
in (serialize_bvvar writer v))
end
| FStar_Absyn_Syntax.Exp_fvar (v, b) -> begin
(let _28_335 = (writer.FStar_Util.write_char 'b')
in (let _28_337 = (serialize_fvvar writer v)
in (writer.FStar_Util.write_bool false)))
end
| FStar_Absyn_Syntax.Exp_constant (c) -> begin
(let _28_341 = (writer.FStar_Util.write_char 'c')
in (serialize_sconst writer c))
end
| FStar_Absyn_Syntax.Exp_abs (bs, e) -> begin
(let _28_347 = (writer.FStar_Util.write_char 'd')
in (let _28_349 = (serialize_binders writer bs)
in (serialize_exp writer e)))
end
| FStar_Absyn_Syntax.Exp_app (e, ars) -> begin
(let _28_355 = (writer.FStar_Util.write_char 'e')
in (let _28_357 = (serialize_exp writer e)
in (serialize_args writer ars)))
end
| FStar_Absyn_Syntax.Exp_match (e, l) -> begin
(let g = (fun writer eopt -> (match (eopt) with
| Some (e1) -> begin
(let _28_368 = (writer.FStar_Util.write_char 'a')
in (serialize_exp writer e1))
end
| None -> begin
(writer.FStar_Util.write_char 'b')
end))
in (let f = (fun writer _28_376 -> (match (_28_376) with
| (p, eopt, e) -> begin
(let _28_377 = (serialize_pat writer p)
in (let _28_379 = (g writer eopt)
in (serialize_exp writer e)))
end))
in (let _28_381 = (writer.FStar_Util.write_char 'f')
in (let _28_383 = (serialize_exp writer e)
in (serialize_list writer f l)))))
end
| FStar_Absyn_Syntax.Exp_ascribed (e, t, l) -> begin
(let _28_390 = (writer.FStar_Util.write_char 'g')
in (let _28_392 = (serialize_exp writer e)
in (let _28_394 = (serialize_typ writer t)
in (serialize_option writer serialize_lident l))))
end
| FStar_Absyn_Syntax.Exp_let (lbs, e) -> begin
(let _28_400 = (writer.FStar_Util.write_char 'h')
in (let _28_402 = (serialize_letbindings writer lbs)
in (serialize_exp writer e)))
end
| FStar_Absyn_Syntax.Exp_meta (m) -> begin
(let _28_406 = (writer.FStar_Util.write_char 'i')
in (serialize_meta_e writer m))
end
| _28_409 -> begin
(Prims.raise (Err ("unimplemented exp\'")))
end))
and serialize_meta_e = (fun writer ast -> (match (ast) with
| FStar_Absyn_Syntax.Meta_desugared (e, s) -> begin
(let _28_416 = (writer.FStar_Util.write_char 'a')
in (let _28_418 = (serialize_exp writer e)
in (serialize_meta_source_info writer s)))
end))
and serialize_meta_source_info = (fun writer ast -> (match (ast) with
| FStar_Absyn_Syntax.Data_app -> begin
(writer.FStar_Util.write_char 'a')
end
| FStar_Absyn_Syntax.Sequence -> begin
(writer.FStar_Util.write_char 'b')
end
| FStar_Absyn_Syntax.Primop -> begin
(writer.FStar_Util.write_char 'c')
end
| FStar_Absyn_Syntax.MaskedEffect -> begin
(writer.FStar_Util.write_char 'd')
end))
and serialize_exp = (fun writer ast -> (let _97_290 = (FStar_Absyn_Util.compress_exp ast)
in (serialize_syntax writer serialize_exp' _97_290)))
and serialize_btvdef = (fun writer ast -> (serialize_bvdef writer ast))
and serialize_bvvdef = (fun writer ast -> (serialize_bvdef writer ast))
and serialize_pat' = (fun writer ast -> (match (ast) with
| FStar_Absyn_Syntax.Pat_disj (l) -> begin
(let _28_436 = (writer.FStar_Util.write_char 'a')
in (serialize_list writer serialize_pat l))
end
| FStar_Absyn_Syntax.Pat_constant (c) -> begin
(let _28_440 = (writer.FStar_Util.write_char 'b')
in (serialize_sconst writer c))
end
| FStar_Absyn_Syntax.Pat_cons (v, _28_444, l) -> begin
(let _28_448 = (writer.FStar_Util.write_char 'c')
in (let _28_450 = (serialize_fvvar writer v)
in (serialize_list writer (fun w _28_455 -> (match (_28_455) with
| (p, b) -> begin
(let _28_456 = (serialize_pat w p)
in (w.FStar_Util.write_bool b))
end)) l)))
end
| FStar_Absyn_Syntax.Pat_var (v) -> begin
(let _28_460 = (writer.FStar_Util.write_char 'd')
in (serialize_bvvar writer v))
end
| FStar_Absyn_Syntax.Pat_tvar (v) -> begin
(let _28_464 = (writer.FStar_Util.write_char 'e')
in (serialize_btvar writer v))
end
| FStar_Absyn_Syntax.Pat_wild (v) -> begin
(let _28_468 = (writer.FStar_Util.write_char 'f')
in (serialize_bvvar writer v))
end
| FStar_Absyn_Syntax.Pat_twild (v) -> begin
(let _28_472 = (writer.FStar_Util.write_char 'g')
in (serialize_btvar writer v))
end
| FStar_Absyn_Syntax.Pat_dot_term (v, e) -> begin
(let _28_478 = (writer.FStar_Util.write_char 'h')
in (let _28_480 = (serialize_bvvar writer v)
in (serialize_exp writer e)))
end
| FStar_Absyn_Syntax.Pat_dot_typ (v, t) -> begin
(let _28_486 = (writer.FStar_Util.write_char 'i')
in (let _28_488 = (serialize_btvar writer v)
in (serialize_typ writer t)))
end))
and serialize_pat = (fun writer ast -> (serialize_withinfo_t writer serialize_pat' (fun w kt -> ()) ast))
and serialize_knd' = (fun writer ast -> (match (ast) with
| FStar_Absyn_Syntax.Kind_type -> begin
(writer.FStar_Util.write_char 'a')
end
| FStar_Absyn_Syntax.Kind_effect -> begin
(writer.FStar_Util.write_char 'b')
end
| FStar_Absyn_Syntax.Kind_abbrev (ka, k) -> begin
(let _28_502 = (writer.FStar_Util.write_char 'c')
in (let _28_504 = (serialize_kabbrev writer ka)
in (serialize_knd writer k)))
end
| FStar_Absyn_Syntax.Kind_arrow (bs, k) -> begin
(let _28_510 = (writer.FStar_Util.write_char 'd')
in (let _28_512 = (serialize_binders writer bs)
in (serialize_knd writer k)))
end
| FStar_Absyn_Syntax.Kind_lam (bs, k) -> begin
(let _28_518 = (writer.FStar_Util.write_char 'e')
in (let _28_520 = (serialize_binders writer bs)
in (serialize_knd writer k)))
end
| FStar_Absyn_Syntax.Kind_unknown -> begin
(writer.FStar_Util.write_char 'f')
end
| FStar_Absyn_Syntax.Kind_uvar (uv, args) -> begin
(Prims.raise (Err ("knd\' serialization unimplemented:1")))
end
| FStar_Absyn_Syntax.Kind_delayed (_28_528, _28_530, _28_532) -> begin
(Prims.raise (Err ("knd\' serialization unimplemented:2")))
end))
and serialize_knd = (fun writer ast -> (let _97_307 = (FStar_Absyn_Util.compress_kind ast)
in (serialize_syntax writer serialize_knd' _97_307)))
and serialize_kabbrev = (fun writer ast -> (let _28_539 = (serialize_lident writer (Prims.fst ast))
in (serialize_args writer (Prims.snd ast))))
and serialize_lbname = (fun writer ast -> (serialize_either writer serialize_bvvdef serialize_lident ast))
and serialize_letbindings = (fun writer ast -> (let f = (fun writer lb -> (let _28_548 = (serialize_lbname writer lb.FStar_Absyn_Syntax.lbname)
in (let _28_550 = (serialize_lident writer lb.FStar_Absyn_Syntax.lbeff)
in (let _28_552 = (serialize_typ writer lb.FStar_Absyn_Syntax.lbtyp)
in (serialize_exp writer lb.FStar_Absyn_Syntax.lbdef)))))
in (let _28_554 = (writer.FStar_Util.write_bool (Prims.fst ast))
in (serialize_list writer f (Prims.snd ast)))))
and serialize_fvar = (fun writer ast -> (serialize_either writer serialize_btvdef serialize_bvvdef ast))
and serialize_btvar = (fun writer ast -> (serialize_bvar writer serialize_knd ast))
and serialize_bvvar = (fun writer ast -> (serialize_bvar writer serialize_typ ast))
and serialize_ftvar = (fun writer ast -> (serialize_var writer serialize_knd ast))
and serialize_fvvar = (fun writer ast -> (serialize_var writer serialize_typ ast))

let rec deserialize_typ' = (fun reader -> (match ((reader.FStar_Util.read_char ())) with
| 'a' -> begin
(let _97_358 = (deserialize_btvar reader)
in FStar_Absyn_Syntax.Typ_btvar (_97_358))
end
| 'b' -> begin
(let _97_359 = (deserialize_ftvar reader)
in FStar_Absyn_Syntax.Typ_const (_97_359))
end
| 'c' -> begin
(let _97_362 = (let _97_361 = (deserialize_binders reader)
in (let _97_360 = (deserialize_comp reader)
in (_97_361, _97_360)))
in FStar_Absyn_Syntax.Typ_fun (_97_362))
end
| 'd' -> begin
(let _97_365 = (let _97_364 = (deserialize_bvvar reader)
in (let _97_363 = (deserialize_typ reader)
in (_97_364, _97_363)))
in FStar_Absyn_Syntax.Typ_refine (_97_365))
end
| 'e' -> begin
(let _97_368 = (let _97_367 = (deserialize_typ reader)
in (let _97_366 = (deserialize_args reader)
in (_97_367, _97_366)))
in FStar_Absyn_Syntax.Typ_app (_97_368))
end
| 'f' -> begin
(let _97_371 = (let _97_370 = (deserialize_binders reader)
in (let _97_369 = (deserialize_typ reader)
in (_97_370, _97_369)))
in FStar_Absyn_Syntax.Typ_lam (_97_371))
end
| 'g' -> begin
(let _97_374 = (let _97_373 = (deserialize_typ reader)
in (let _97_372 = (deserialize_knd reader)
in (_97_373, _97_372)))
in FStar_Absyn_Syntax.Typ_ascribed (_97_374))
end
| 'h' -> begin
(let _97_375 = (deserialize_meta_t reader)
in FStar_Absyn_Syntax.Typ_meta (_97_375))
end
| 'i' -> begin
FStar_Absyn_Syntax.Typ_unknown
end
| _28_577 -> begin
(parse_error ())
end))
and deserialize_meta_t = (fun reader -> (match ((reader.FStar_Util.read_char ())) with
| 'a' -> begin
(let _97_379 = (let _97_378 = (deserialize_typ reader)
in (let _97_377 = (deserialize_list reader deserialize_arg)
in (_97_378, _97_377)))
in FStar_Absyn_Syntax.Meta_pattern (_97_379))
end
| 'b' -> begin
(let _97_382 = (let _97_381 = (deserialize_typ reader)
in (let _97_380 = (deserialize_lident reader)
in (_97_381, _97_380)))
in FStar_Absyn_Syntax.Meta_named (_97_382))
end
| 'c' -> begin
(let _97_386 = (let _97_385 = (deserialize_typ reader)
in (let _97_384 = (reader.FStar_Util.read_string ())
in (let _97_383 = (reader.FStar_Util.read_bool ())
in (_97_385, _97_384, FStar_Absyn_Syntax.dummyRange, _97_383))))
in FStar_Absyn_Syntax.Meta_labeled (_97_386))
end
| _28_583 -> begin
(parse_error ())
end))
and deserialize_arg = (fun reader -> (let _97_390 = (deserialize_either reader deserialize_typ deserialize_exp)
in (let _97_389 = (let _97_388 = (reader.FStar_Util.read_bool ())
in (FStar_All.pipe_left FStar_Absyn_Syntax.as_implicit _97_388))
in (_97_390, _97_389))))
and deserialize_args = (fun reader -> (deserialize_list reader deserialize_arg))
and deserialize_binder = (fun reader -> (let _97_395 = (deserialize_either reader deserialize_btvar deserialize_bvvar)
in (let _97_394 = (let _97_393 = (reader.FStar_Util.read_bool ())
in (FStar_All.pipe_left FStar_Absyn_Syntax.as_implicit _97_393))
in (_97_395, _97_394))))
and deserialize_binders = (fun reader -> (deserialize_list reader deserialize_binder))
and deserialize_typ = (fun reader -> (deserialize_syntax reader deserialize_typ' FStar_Absyn_Syntax.mk_Kind_unknown))
and deserialize_comp_typ = (fun reader -> (let _97_402 = (deserialize_lident reader)
in (let _97_401 = (deserialize_typ reader)
in (let _97_400 = (deserialize_args reader)
in (let _97_399 = (deserialize_list reader deserialize_cflags)
in {FStar_Absyn_Syntax.effect_name = _97_402; FStar_Absyn_Syntax.result_typ = _97_401; FStar_Absyn_Syntax.effect_args = _97_400; FStar_Absyn_Syntax.flags = _97_399})))))
and deserialize_comp' = (fun reader -> (match ((reader.FStar_Util.read_char ())) with
| 'a' -> begin
(let _97_404 = (deserialize_typ reader)
in FStar_Absyn_Syntax.Total (_97_404))
end
| 'b' -> begin
(let _97_405 = (deserialize_comp_typ reader)
in FStar_Absyn_Syntax.Comp (_97_405))
end
| _28_594 -> begin
(parse_error ())
end))
and deserialize_comp = (fun reader -> (deserialize_syntax reader deserialize_comp' ()))
and deserialize_cflags = (fun reader -> (match ((reader.FStar_Util.read_char ())) with
| 'a' -> begin
FStar_Absyn_Syntax.TOTAL
end
| 'b' -> begin
FStar_Absyn_Syntax.MLEFFECT
end
| 'c' -> begin
FStar_Absyn_Syntax.RETURN
end
| 'd' -> begin
FStar_Absyn_Syntax.PARTIAL_RETURN
end
| 'e' -> begin
FStar_Absyn_Syntax.SOMETRIVIAL
end
| 'f' -> begin
FStar_Absyn_Syntax.LEMMA
end
| 'g' -> begin
(let _97_408 = (deserialize_exp reader)
in FStar_Absyn_Syntax.DECREASES (_97_408))
end
| _28_605 -> begin
(parse_error ())
end))
and deserialize_exp' = (fun reader -> (match ((reader.FStar_Util.read_char ())) with
| 'a' -> begin
(let _97_410 = (deserialize_bvvar reader)
in FStar_Absyn_Syntax.Exp_bvar (_97_410))
end
| 'b' -> begin
(let _97_414 = (let _97_413 = (deserialize_fvvar reader)
in (let _97_412 = (let _28_609 = (let _97_411 = (reader.FStar_Util.read_bool ())
in (FStar_All.pipe_left Prims.ignore _97_411))
in None)
in (_97_413, _97_412)))
in FStar_Absyn_Syntax.Exp_fvar (_97_414))
end
| 'c' -> begin
(let _97_415 = (deserialize_sconst reader)
in FStar_Absyn_Syntax.Exp_constant (_97_415))
end
| 'd' -> begin
(let _97_418 = (let _97_417 = (deserialize_binders reader)
in (let _97_416 = (deserialize_exp reader)
in (_97_417, _97_416)))
in FStar_Absyn_Syntax.Exp_abs (_97_418))
end
| 'e' -> begin
(let _97_421 = (let _97_420 = (deserialize_exp reader)
in (let _97_419 = (deserialize_args reader)
in (_97_420, _97_419)))
in FStar_Absyn_Syntax.Exp_app (_97_421))
end
| 'f' -> begin
(let g = (fun reader -> (match ((reader.FStar_Util.read_char ())) with
| 'a' -> begin
(let _97_424 = (deserialize_exp reader)
in Some (_97_424))
end
| 'b' -> begin
None
end
| _28_620 -> begin
(parse_error ())
end))
in (let f = (fun reader -> (let _97_429 = (deserialize_pat reader)
in (let _97_428 = (g reader)
in (let _97_427 = (deserialize_exp reader)
in (_97_429, _97_428, _97_427)))))
in (let _97_432 = (let _97_431 = (deserialize_exp reader)
in (let _97_430 = (deserialize_list reader f)
in (_97_431, _97_430)))
in FStar_Absyn_Syntax.Exp_match (_97_432))))
end
| 'g' -> begin
(let _97_436 = (let _97_435 = (deserialize_exp reader)
in (let _97_434 = (deserialize_typ reader)
in (let _97_433 = (deserialize_option reader deserialize_lident)
in (_97_435, _97_434, _97_433))))
in FStar_Absyn_Syntax.Exp_ascribed (_97_436))
end
| 'h' -> begin
(let _97_439 = (let _97_438 = (deserialize_letbindings reader)
in (let _97_437 = (deserialize_exp reader)
in (_97_438, _97_437)))
in FStar_Absyn_Syntax.Exp_let (_97_439))
end
| 'i' -> begin
(let _97_440 = (deserialize_meta_e reader)
in FStar_Absyn_Syntax.Exp_meta (_97_440))
end
| _28_627 -> begin
(parse_error ())
end))
and deserialize_meta_e = (fun reader -> (match ((reader.FStar_Util.read_char ())) with
| 'a' -> begin
(let _97_444 = (let _97_443 = (deserialize_exp reader)
in (let _97_442 = (deserialize_meta_source_info reader)
in (_97_443, _97_442)))
in FStar_Absyn_Syntax.Meta_desugared (_97_444))
end
| _28_631 -> begin
(parse_error ())
end))
and deserialize_meta_source_info = (fun reader -> (match ((reader.FStar_Util.read_char ())) with
| 'a' -> begin
FStar_Absyn_Syntax.Data_app
end
| 'b' -> begin
FStar_Absyn_Syntax.Sequence
end
| 'c' -> begin
FStar_Absyn_Syntax.Primop
end
| 'd' -> begin
FStar_Absyn_Syntax.MaskedEffect
end
| _28_638 -> begin
(parse_error ())
end))
and deserialize_exp = (fun reader -> (deserialize_syntax reader deserialize_exp' FStar_Absyn_Syntax.mk_Typ_unknown))
and deserialize_btvdef = (fun reader -> (deserialize_bvdef None reader))
and deserialize_bvvdef = (fun reader -> (deserialize_bvdef None reader))
and deserialize_pat' = (fun reader -> (match ((reader.FStar_Util.read_char ())) with
| 'a' -> begin
(let _97_450 = (deserialize_list reader deserialize_pat)
in FStar_Absyn_Syntax.Pat_disj (_97_450))
end
| 'b' -> begin
(let _97_451 = (deserialize_sconst reader)
in FStar_Absyn_Syntax.Pat_constant (_97_451))
end
| 'c' -> begin
(let _97_457 = (let _97_456 = (deserialize_fvvar reader)
in (let _97_455 = (deserialize_list reader (fun r -> (let _97_454 = (deserialize_pat r)
in (let _97_453 = (r.FStar_Util.read_bool ())
in (_97_454, _97_453)))))
in (_97_456, None, _97_455)))
in FStar_Absyn_Syntax.Pat_cons (_97_457))
end
| 'd' -> begin
(let _97_458 = (deserialize_bvvar reader)
in FStar_Absyn_Syntax.Pat_var (_97_458))
end
| 'e' -> begin
(let _97_459 = (deserialize_btvar reader)
in FStar_Absyn_Syntax.Pat_tvar (_97_459))
end
| 'f' -> begin
(let _97_460 = (deserialize_bvvar reader)
in FStar_Absyn_Syntax.Pat_wild (_97_460))
end
| 'g' -> begin
(let _97_461 = (deserialize_btvar reader)
in FStar_Absyn_Syntax.Pat_twild (_97_461))
end
| 'h' -> begin
(let _97_464 = (let _97_463 = (deserialize_bvvar reader)
in (let _97_462 = (deserialize_exp reader)
in (_97_463, _97_462)))
in FStar_Absyn_Syntax.Pat_dot_term (_97_464))
end
| 'i' -> begin
(let _97_467 = (let _97_466 = (deserialize_btvar reader)
in (let _97_465 = (deserialize_typ reader)
in (_97_466, _97_465)))
in FStar_Absyn_Syntax.Pat_dot_typ (_97_467))
end
| _28_654 -> begin
(parse_error ())
end))
and deserialize_pat = (fun reader -> (deserialize_withinfo_t reader deserialize_pat' (fun r -> None)))
and deserialize_knd' = (fun reader -> (match ((reader.FStar_Util.read_char ())) with
| 'a' -> begin
FStar_Absyn_Syntax.Kind_type
end
| 'b' -> begin
FStar_Absyn_Syntax.Kind_effect
end
| 'c' -> begin
(let _97_473 = (let _97_472 = (deserialize_kabbrev reader)
in (let _97_471 = (deserialize_knd reader)
in (_97_472, _97_471)))
in FStar_Absyn_Syntax.Kind_abbrev (_97_473))
end
| 'd' -> begin
(let _97_476 = (let _97_475 = (deserialize_binders reader)
in (let _97_474 = (deserialize_knd reader)
in (_97_475, _97_474)))
in FStar_Absyn_Syntax.Kind_arrow (_97_476))
end
| 'e' -> begin
(let _97_479 = (let _97_478 = (deserialize_binders reader)
in (let _97_477 = (deserialize_knd reader)
in (_97_478, _97_477)))
in FStar_Absyn_Syntax.Kind_lam (_97_479))
end
| 'f' -> begin
FStar_Absyn_Syntax.Kind_unknown
end
| _28_665 -> begin
(parse_error ())
end))
and deserialize_knd = (fun reader -> (deserialize_syntax reader deserialize_knd' ()))
and deserialize_kabbrev = (fun reader -> (let _97_483 = (deserialize_lident reader)
in (let _97_482 = (deserialize_args reader)
in (_97_483, _97_482))))
and deserialize_lbname = (fun reader -> (deserialize_either reader deserialize_bvvdef deserialize_lident))
and deserialize_letbindings = (fun reader -> (let f = (fun reader -> (let _97_491 = (deserialize_lbname reader)
in (let _97_490 = (deserialize_typ reader)
in (let _97_489 = (deserialize_lident reader)
in (let _97_488 = (deserialize_exp reader)
in {FStar_Absyn_Syntax.lbname = _97_491; FStar_Absyn_Syntax.lbtyp = _97_490; FStar_Absyn_Syntax.lbeff = _97_489; FStar_Absyn_Syntax.lbdef = _97_488})))))
in (let _97_493 = (reader.FStar_Util.read_bool ())
in (let _97_492 = (deserialize_list reader f)
in (_97_493, _97_492)))))
and deserialize_fvar = (fun reader -> (deserialize_either reader deserialize_btvdef deserialize_bvvdef))
and deserialize_btvar = (fun reader -> (deserialize_bvar None reader deserialize_knd))
and deserialize_bvvar = (fun reader -> (deserialize_bvar None reader deserialize_typ))
and deserialize_ftvar = (fun reader -> (deserialize_var reader deserialize_knd))
and deserialize_fvvar = (fun reader -> (deserialize_var reader deserialize_typ))

let serialize_formula = serialize_typ

let deserialize_formula = deserialize_typ

let serialize_qualifier = (fun writer ast -> (match (ast) with
| FStar_Absyn_Syntax.Private -> begin
(writer.FStar_Util.write_char 'a')
end
| FStar_Absyn_Syntax.Assumption -> begin
(writer.FStar_Util.write_char 'c')
end
| FStar_Absyn_Syntax.Logic -> begin
(writer.FStar_Util.write_char 'g')
end
| FStar_Absyn_Syntax.Opaque -> begin
(writer.FStar_Util.write_char 'h')
end
| FStar_Absyn_Syntax.Discriminator (lid) -> begin
(let _28_685 = (writer.FStar_Util.write_char 'i')
in (serialize_lident writer lid))
end
| FStar_Absyn_Syntax.Projector (lid, v) -> begin
(let _28_691 = (writer.FStar_Util.write_char 'j')
in (let _28_693 = (serialize_lident writer lid)
in (serialize_either writer serialize_btvdef serialize_bvvdef v)))
end
| FStar_Absyn_Syntax.RecordType (l) -> begin
(let _28_697 = (writer.FStar_Util.write_char 'k')
in (serialize_list writer serialize_lident l))
end
| FStar_Absyn_Syntax.RecordConstructor (l) -> begin
(let _28_701 = (writer.FStar_Util.write_char 'l')
in (serialize_list writer serialize_lident l))
end
| FStar_Absyn_Syntax.ExceptionConstructor -> begin
(writer.FStar_Util.write_char 'm')
end
| FStar_Absyn_Syntax.HasMaskedEffect -> begin
(writer.FStar_Util.write_char 'o')
end
| FStar_Absyn_Syntax.DefaultEffect (l) -> begin
(let _28_707 = (writer.FStar_Util.write_char 'p')
in (serialize_option writer serialize_lident l))
end
| FStar_Absyn_Syntax.TotalEffect -> begin
(writer.FStar_Util.write_char 'q')
end
| _28_711 -> begin
(FStar_All.failwith "Unexpected qualifier")
end))

let deserialize_qualifier = (fun reader -> (match ((reader.FStar_Util.read_char ())) with
| 'a' -> begin
FStar_Absyn_Syntax.Private
end
| 'c' -> begin
FStar_Absyn_Syntax.Assumption
end
| 'g' -> begin
FStar_Absyn_Syntax.Logic
end
| 'h' -> begin
FStar_Absyn_Syntax.Opaque
end
| 'i' -> begin
(let _97_508 = (deserialize_lident reader)
in FStar_Absyn_Syntax.Discriminator (_97_508))
end
| 'j' -> begin
(let _97_511 = (let _97_510 = (deserialize_lident reader)
in (let _97_509 = (deserialize_either reader deserialize_btvdef deserialize_bvvdef)
in (_97_510, _97_509)))
in FStar_Absyn_Syntax.Projector (_97_511))
end
| 'k' -> begin
(let _97_512 = (deserialize_list reader deserialize_lident)
in FStar_Absyn_Syntax.RecordType (_97_512))
end
| 'l' -> begin
(let _97_513 = (deserialize_list reader deserialize_lident)
in FStar_Absyn_Syntax.RecordConstructor (_97_513))
end
| 'm' -> begin
FStar_Absyn_Syntax.ExceptionConstructor
end
| 'o' -> begin
FStar_Absyn_Syntax.HasMaskedEffect
end
| 'p' -> begin
(let _97_515 = (deserialize_option reader deserialize_lident)
in (FStar_All.pipe_right _97_515 (fun _97_514 -> FStar_Absyn_Syntax.DefaultEffect (_97_514))))
end
| 'q' -> begin
FStar_Absyn_Syntax.TotalEffect
end
| _28_726 -> begin
(parse_error ())
end))

let serialize_tycon = (fun writer _28_731 -> (match (_28_731) with
| (lid, bs, k) -> begin
(let _28_732 = (serialize_lident writer lid)
in (let _28_734 = (serialize_binders writer bs)
in (serialize_knd writer k)))
end))

let deserialize_tycon = (fun reader -> (let _97_524 = (deserialize_lident reader)
in (let _97_523 = (deserialize_binders reader)
in (let _97_522 = (deserialize_knd reader)
in (_97_524, _97_523, _97_522)))))

let serialize_monad_abbrev = (fun writer ast -> (let _28_739 = (serialize_lident writer ast.FStar_Absyn_Syntax.mabbrev)
in (let _28_741 = (serialize_binders writer ast.FStar_Absyn_Syntax.parms)
in (serialize_typ writer ast.FStar_Absyn_Syntax.def))))

let deserialize_monad_abbrev = (fun reader -> (let _97_533 = (deserialize_lident reader)
in (let _97_532 = (deserialize_binders reader)
in (let _97_531 = (deserialize_typ reader)
in {FStar_Absyn_Syntax.mabbrev = _97_533; FStar_Absyn_Syntax.parms = _97_532; FStar_Absyn_Syntax.def = _97_531}))))

let serialize_sub_effect = (fun writer ast -> (let _28_746 = (serialize_lident writer ast.FStar_Absyn_Syntax.source)
in (let _28_748 = (serialize_lident writer ast.FStar_Absyn_Syntax.target)
in (serialize_typ writer ast.FStar_Absyn_Syntax.lift))))

let deserialize_sub_effect = (fun reader -> (let _97_542 = (deserialize_lident reader)
in (let _97_541 = (deserialize_lident reader)
in (let _97_540 = (deserialize_typ reader)
in {FStar_Absyn_Syntax.source = _97_542; FStar_Absyn_Syntax.target = _97_541; FStar_Absyn_Syntax.lift = _97_540}))))

let rec serialize_new_effect = (fun writer ast -> (let _28_753 = (serialize_lident writer ast.FStar_Absyn_Syntax.mname)
in (let _28_755 = (serialize_list writer serialize_binder ast.FStar_Absyn_Syntax.binders)
in (let _28_757 = (serialize_list writer serialize_qualifier ast.FStar_Absyn_Syntax.qualifiers)
in (let _28_759 = (serialize_knd writer ast.FStar_Absyn_Syntax.signature)
in (let _28_761 = (serialize_typ writer ast.FStar_Absyn_Syntax.ret)
in (let _28_763 = (serialize_typ writer ast.FStar_Absyn_Syntax.bind_wp)
in (let _28_765 = (serialize_typ writer ast.FStar_Absyn_Syntax.bind_wlp)
in (let _28_767 = (serialize_typ writer ast.FStar_Absyn_Syntax.if_then_else)
in (let _28_769 = (serialize_typ writer ast.FStar_Absyn_Syntax.ite_wp)
in (let _28_771 = (serialize_typ writer ast.FStar_Absyn_Syntax.ite_wlp)
in (let _28_773 = (serialize_typ writer ast.FStar_Absyn_Syntax.wp_binop)
in (let _28_775 = (serialize_typ writer ast.FStar_Absyn_Syntax.wp_as_type)
in (let _28_777 = (serialize_typ writer ast.FStar_Absyn_Syntax.close_wp)
in (let _28_779 = (serialize_typ writer ast.FStar_Absyn_Syntax.close_wp_t)
in (let _28_781 = (serialize_typ writer ast.FStar_Absyn_Syntax.assert_p)
in (let _28_783 = (serialize_typ writer ast.FStar_Absyn_Syntax.assume_p)
in (let _28_785 = (serialize_typ writer ast.FStar_Absyn_Syntax.null_wp)
in (serialize_typ writer ast.FStar_Absyn_Syntax.trivial)))))))))))))))))))
and serialize_sigelt = (fun writer ast -> (match (ast) with
| FStar_Absyn_Syntax.Sig_pragma (_28_790) -> begin
(FStar_All.failwith "NYI")
end
| FStar_Absyn_Syntax.Sig_tycon (lid, bs, k, l1, l2, qs, _28_799) -> begin
(let _28_802 = (writer.FStar_Util.write_char 'a')
in (let _28_804 = (serialize_lident writer lid)
in (let _28_806 = (serialize_binders writer bs)
in (let _28_808 = (serialize_knd writer k)
in (let _28_810 = (serialize_list writer serialize_lident l1)
in (let _28_812 = (serialize_list writer serialize_lident l2)
in (serialize_list writer serialize_qualifier qs)))))))
end
| FStar_Absyn_Syntax.Sig_typ_abbrev (lid, bs, k, t, qs, _28_820) -> begin
(let _28_823 = (writer.FStar_Util.write_char 'b')
in (let _28_825 = (serialize_lident writer lid)
in (let _28_827 = (serialize_binders writer bs)
in (let _28_829 = (serialize_knd writer k)
in (let _28_831 = (serialize_typ writer t)
in (serialize_list writer serialize_qualifier qs))))))
end
| FStar_Absyn_Syntax.Sig_datacon (lid1, t, tyc, qs, mutuals, _28_839) -> begin
(let t' = (match ((FStar_Absyn_Util.function_formals t)) with
| Some (f, c) -> begin
(let _97_552 = (let _97_551 = (FStar_Absyn_Syntax.mk_Total (FStar_Absyn_Util.comp_result c))
in (f, _97_551))
in (FStar_Absyn_Syntax.mk_Typ_fun _97_552 None FStar_Absyn_Syntax.dummyRange))
end
| None -> begin
t
end)
in (let _28_848 = (writer.FStar_Util.write_char 'c')
in (let _28_850 = (serialize_lident writer lid1)
in (let _28_852 = (serialize_typ writer t')
in (let _28_854 = (serialize_tycon writer tyc)
in (let _28_856 = (serialize_list writer serialize_qualifier qs)
in (serialize_list writer serialize_lident mutuals)))))))
end
| FStar_Absyn_Syntax.Sig_val_decl (lid, t, qs, _28_862) -> begin
(let _28_865 = (writer.FStar_Util.write_char 'd')
in (let _28_867 = (serialize_lident writer lid)
in (let _28_869 = (serialize_typ writer t)
in (serialize_list writer serialize_qualifier qs))))
end
| FStar_Absyn_Syntax.Sig_assume (lid, fml, qs, _28_875) -> begin
(let _28_878 = (writer.FStar_Util.write_char 'e')
in (let _28_880 = (serialize_lident writer lid)
in (let _28_882 = (serialize_formula writer fml)
in (serialize_list writer serialize_qualifier qs))))
end
| FStar_Absyn_Syntax.Sig_let (lbs, _28_886, l, quals) -> begin
(let _28_891 = (writer.FStar_Util.write_char 'f')
in (let _28_893 = (serialize_letbindings writer lbs)
in (let _28_895 = (serialize_list writer serialize_lident l)
in (let _97_554 = (FStar_All.pipe_right quals (FStar_Util.for_some (fun _28_1 -> (match (_28_1) with
| FStar_Absyn_Syntax.HasMaskedEffect -> begin
true
end
| _28_900 -> begin
false
end))))
in (writer.FStar_Util.write_bool _97_554)))))
end
| FStar_Absyn_Syntax.Sig_main (e, _28_903) -> begin
(let _28_906 = (writer.FStar_Util.write_char 'g')
in (serialize_exp writer e))
end
| FStar_Absyn_Syntax.Sig_bundle (l, qs, lids, _28_912) -> begin
(let _28_915 = (writer.FStar_Util.write_char 'h')
in (let _28_917 = (serialize_list writer serialize_sigelt l)
in (let _28_919 = (serialize_list writer serialize_qualifier qs)
in (serialize_list writer serialize_lident lids))))
end
| FStar_Absyn_Syntax.Sig_new_effect (n, _28_923) -> begin
(let _28_926 = (writer.FStar_Util.write_char 'i')
in (serialize_new_effect writer n))
end
| FStar_Absyn_Syntax.Sig_effect_abbrev (lid, bs, c, qs, _28_933) -> begin
(let _28_936 = (writer.FStar_Util.write_char 'j')
in (let _28_938 = (serialize_lident writer lid)
in (let _28_940 = (serialize_binders writer bs)
in (let _28_942 = (serialize_comp writer c)
in (serialize_list writer serialize_qualifier qs)))))
end
| FStar_Absyn_Syntax.Sig_sub_effect (se, r) -> begin
(let _28_948 = (writer.FStar_Util.write_char 'k')
in (serialize_sub_effect writer se))
end
| FStar_Absyn_Syntax.Sig_kind_abbrev (l, binders, k, _28_954) -> begin
(let _28_957 = (writer.FStar_Util.write_char 'l')
in (let _28_959 = (serialize_lident writer l)
in (let _28_961 = (serialize_list writer serialize_binder binders)
in (serialize_knd writer k))))
end))

let rec deserialize_new_effect = (fun reader -> (let _97_575 = (deserialize_lident reader)
in (let _97_574 = (deserialize_list reader deserialize_binder)
in (let _97_573 = (deserialize_list reader deserialize_qualifier)
in (let _97_572 = (deserialize_knd reader)
in (let _97_571 = (deserialize_typ reader)
in (let _97_570 = (deserialize_typ reader)
in (let _97_569 = (deserialize_typ reader)
in (let _97_568 = (deserialize_typ reader)
in (let _97_567 = (deserialize_typ reader)
in (let _97_566 = (deserialize_typ reader)
in (let _97_565 = (deserialize_typ reader)
in (let _97_564 = (deserialize_typ reader)
in (let _97_563 = (deserialize_typ reader)
in (let _97_562 = (deserialize_typ reader)
in (let _97_561 = (deserialize_typ reader)
in (let _97_560 = (deserialize_typ reader)
in (let _97_559 = (deserialize_typ reader)
in (let _97_558 = (deserialize_typ reader)
in {FStar_Absyn_Syntax.mname = _97_575; FStar_Absyn_Syntax.binders = _97_574; FStar_Absyn_Syntax.qualifiers = _97_573; FStar_Absyn_Syntax.signature = _97_572; FStar_Absyn_Syntax.ret = _97_571; FStar_Absyn_Syntax.bind_wp = _97_570; FStar_Absyn_Syntax.bind_wlp = _97_569; FStar_Absyn_Syntax.if_then_else = _97_568; FStar_Absyn_Syntax.ite_wp = _97_567; FStar_Absyn_Syntax.ite_wlp = _97_566; FStar_Absyn_Syntax.wp_binop = _97_565; FStar_Absyn_Syntax.wp_as_type = _97_564; FStar_Absyn_Syntax.close_wp = _97_563; FStar_Absyn_Syntax.close_wp_t = _97_562; FStar_Absyn_Syntax.assert_p = _97_561; FStar_Absyn_Syntax.assume_p = _97_560; FStar_Absyn_Syntax.null_wp = _97_559; FStar_Absyn_Syntax.trivial = _97_558})))))))))))))))))))
and deserialize_sigelt = (fun reader -> (match ((reader.FStar_Util.read_char ())) with
| 'a' -> begin
(let _97_583 = (let _97_582 = (deserialize_lident reader)
in (let _97_581 = (deserialize_binders reader)
in (let _97_580 = (deserialize_knd reader)
in (let _97_579 = (deserialize_list reader deserialize_lident)
in (let _97_578 = (deserialize_list reader deserialize_lident)
in (let _97_577 = (deserialize_list reader deserialize_qualifier)
in (_97_582, _97_581, _97_580, _97_579, _97_578, _97_577, FStar_Absyn_Syntax.dummyRange)))))))
in FStar_Absyn_Syntax.Sig_tycon (_97_583))
end
| 'b' -> begin
(let _97_589 = (let _97_588 = (deserialize_lident reader)
in (let _97_587 = (deserialize_binders reader)
in (let _97_586 = (deserialize_knd reader)
in (let _97_585 = (deserialize_typ reader)
in (let _97_584 = (deserialize_list reader deserialize_qualifier)
in (_97_588, _97_587, _97_586, _97_585, _97_584, FStar_Absyn_Syntax.dummyRange))))))
in FStar_Absyn_Syntax.Sig_typ_abbrev (_97_589))
end
| 'c' -> begin
(let _97_595 = (let _97_594 = (deserialize_lident reader)
in (let _97_593 = (deserialize_typ reader)
in (let _97_592 = (deserialize_tycon reader)
in (let _97_591 = (deserialize_list reader deserialize_qualifier)
in (let _97_590 = (deserialize_list reader deserialize_lident)
in (_97_594, _97_593, _97_592, _97_591, _97_590, FStar_Absyn_Syntax.dummyRange))))))
in FStar_Absyn_Syntax.Sig_datacon (_97_595))
end
| 'd' -> begin
(let _97_599 = (let _97_598 = (deserialize_lident reader)
in (let _97_597 = (deserialize_typ reader)
in (let _97_596 = (deserialize_list reader deserialize_qualifier)
in (_97_598, _97_597, _97_596, FStar_Absyn_Syntax.dummyRange))))
in FStar_Absyn_Syntax.Sig_val_decl (_97_599))
end
| 'e' -> begin
(let _97_603 = (let _97_602 = (deserialize_lident reader)
in (let _97_601 = (deserialize_formula reader)
in (let _97_600 = (deserialize_list reader deserialize_qualifier)
in (_97_602, _97_601, _97_600, FStar_Absyn_Syntax.dummyRange))))
in FStar_Absyn_Syntax.Sig_assume (_97_603))
end
| 'f' -> begin
(let _97_607 = (let _97_606 = (deserialize_letbindings reader)
in (let _97_605 = (deserialize_list reader deserialize_lident)
in (let _97_604 = (match ((reader.FStar_Util.read_bool ())) with
| true -> begin
(FStar_Absyn_Syntax.HasMaskedEffect)::[]
end
| false -> begin
[]
end)
in (_97_606, FStar_Absyn_Syntax.dummyRange, _97_605, _97_604))))
in FStar_Absyn_Syntax.Sig_let (_97_607))
end
| 'g' -> begin
(let _97_609 = (let _97_608 = (deserialize_exp reader)
in (_97_608, FStar_Absyn_Syntax.dummyRange))
in FStar_Absyn_Syntax.Sig_main (_97_609))
end
| 'h' -> begin
(let _97_613 = (let _97_612 = (deserialize_list reader deserialize_sigelt)
in (let _97_611 = (deserialize_list reader deserialize_qualifier)
in (let _97_610 = (deserialize_list reader deserialize_lident)
in (_97_612, _97_611, _97_610, FStar_Absyn_Syntax.dummyRange))))
in FStar_Absyn_Syntax.Sig_bundle (_97_613))
end
| 'i' -> begin
(let _97_615 = (let _97_614 = (deserialize_new_effect reader)
in (_97_614, FStar_Absyn_Syntax.dummyRange))
in FStar_Absyn_Syntax.Sig_new_effect (_97_615))
end
| ('j') | ('k') | ('l') -> begin
(FStar_All.failwith "TODO")
end
| _28_978 -> begin
(parse_error ())
end))

let serialize_sigelts = (fun writer ast -> (serialize_list writer serialize_sigelt ast))

let deserialize_sigelts = (fun reader -> (deserialize_list reader deserialize_sigelt))

let serialize_modul = (fun writer ast -> (let _28_984 = (serialize_lident writer ast.FStar_Absyn_Syntax.name)
in (let _28_986 = (serialize_sigelts writer [])
in (let _28_988 = (serialize_sigelts writer ast.FStar_Absyn_Syntax.exports)
in (writer.FStar_Util.write_bool ast.FStar_Absyn_Syntax.is_interface)))))

let deserialize_modul = (fun reader -> (let m = (let _97_631 = (deserialize_lident reader)
in (let _97_630 = (deserialize_sigelts reader)
in (let _97_629 = (deserialize_sigelts reader)
in (let _97_628 = (reader.FStar_Util.read_bool ())
in {FStar_Absyn_Syntax.name = _97_631; FStar_Absyn_Syntax.declarations = _97_630; FStar_Absyn_Syntax.exports = _97_629; FStar_Absyn_Syntax.is_interface = _97_628; FStar_Absyn_Syntax.is_deserialized = true}))))
in (let _28_992 = m
in {FStar_Absyn_Syntax.name = _28_992.FStar_Absyn_Syntax.name; FStar_Absyn_Syntax.declarations = m.FStar_Absyn_Syntax.exports; FStar_Absyn_Syntax.exports = _28_992.FStar_Absyn_Syntax.exports; FStar_Absyn_Syntax.is_interface = _28_992.FStar_Absyn_Syntax.is_interface; FStar_Absyn_Syntax.is_deserialized = _28_992.FStar_Absyn_Syntax.is_deserialized})))




