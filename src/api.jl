module API

using CEnum

using ISL_jll

mutable struct isl_local_space end

mutable struct isl_aff end

function isl_aff_zero_on_domain(ls)
    ccall((:isl_aff_zero_on_domain, libisl), Ptr{isl_aff}, (Ptr{isl_local_space},), ls)
end

mutable struct isl_space end

mutable struct isl_val end

function isl_aff_val_on_domain_space(space, val)
    ccall((:isl_aff_val_on_domain_space, libisl), Ptr{isl_aff}, (Ptr{isl_space}, Ptr{isl_val}), space, val)
end

function isl_aff_val_on_domain(ls, val)
    ccall((:isl_aff_val_on_domain, libisl), Ptr{isl_aff}, (Ptr{isl_local_space}, Ptr{isl_val}), ls, val)
end

@cenum isl_dim_type::UInt32 begin
    isl_dim_cst = 0
    isl_dim_param = 1
    isl_dim_in = 2
    isl_dim_out = 3
    isl_dim_set = 3
    isl_dim_div = 4
    isl_dim_all = 5
end

function isl_aff_var_on_domain(ls, type, pos)
    ccall((:isl_aff_var_on_domain, libisl), Ptr{isl_aff}, (Ptr{isl_local_space}, isl_dim_type, Cuint), ls, type, pos)
end

function isl_aff_nan_on_domain(ls)
    ccall((:isl_aff_nan_on_domain, libisl), Ptr{isl_aff}, (Ptr{isl_local_space},), ls)
end

mutable struct isl_id end

function isl_aff_param_on_domain_space_id(space, id)
    ccall((:isl_aff_param_on_domain_space_id, libisl), Ptr{isl_aff}, (Ptr{isl_space}, Ptr{isl_id}), space, id)
end

function isl_aff_copy(aff)
    ccall((:isl_aff_copy, libisl), Ptr{isl_aff}, (Ptr{isl_aff},), aff)
end

function isl_aff_free(aff)
    ccall((:isl_aff_free, libisl), Ptr{isl_aff}, (Ptr{isl_aff},), aff)
end

mutable struct isl_ctx end

function isl_aff_get_ctx(aff)
    ccall((:isl_aff_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_aff},), aff)
end

function isl_aff_get_hash(aff)
    ccall((:isl_aff_get_hash, libisl), UInt32, (Ptr{isl_aff},), aff)
end

@cenum isl_bool::Int32 begin
    isl_bool_error = -1
    isl_bool_false = 0
    isl_bool_true = 1
end

function isl_aff_involves_locals(aff)
    ccall((:isl_aff_involves_locals, libisl), isl_bool, (Ptr{isl_aff},), aff)
end

const isl_size = Cint

function isl_aff_dim(aff, type)
    ccall((:isl_aff_dim, libisl), isl_size, (Ptr{isl_aff}, isl_dim_type), aff, type)
end

function isl_aff_involves_dims(aff, type, first, n)
    ccall((:isl_aff_involves_dims, libisl), isl_bool, (Ptr{isl_aff}, isl_dim_type, Cuint, Cuint), aff, type, first, n)
end

function isl_aff_get_domain_space(aff)
    ccall((:isl_aff_get_domain_space, libisl), Ptr{isl_space}, (Ptr{isl_aff},), aff)
end

function isl_aff_get_space(aff)
    ccall((:isl_aff_get_space, libisl), Ptr{isl_space}, (Ptr{isl_aff},), aff)
end

function isl_aff_get_domain_local_space(aff)
    ccall((:isl_aff_get_domain_local_space, libisl), Ptr{isl_local_space}, (Ptr{isl_aff},), aff)
end

function isl_aff_get_local_space(aff)
    ccall((:isl_aff_get_local_space, libisl), Ptr{isl_local_space}, (Ptr{isl_aff},), aff)
end

function isl_aff_get_dim_name(aff, type, pos)
    ccall((:isl_aff_get_dim_name, libisl), Ptr{Cchar}, (Ptr{isl_aff}, isl_dim_type, Cuint), aff, type, pos)
end

function isl_aff_get_constant_val(aff)
    ccall((:isl_aff_get_constant_val, libisl), Ptr{isl_val}, (Ptr{isl_aff},), aff)
end

function isl_aff_get_coefficient_val(aff, type, pos)
    ccall((:isl_aff_get_coefficient_val, libisl), Ptr{isl_val}, (Ptr{isl_aff}, isl_dim_type, Cint), aff, type, pos)
end

function isl_aff_coefficient_sgn(aff, type, pos)
    ccall((:isl_aff_coefficient_sgn, libisl), Cint, (Ptr{isl_aff}, isl_dim_type, Cint), aff, type, pos)
end

function isl_aff_get_denominator_val(aff)
    ccall((:isl_aff_get_denominator_val, libisl), Ptr{isl_val}, (Ptr{isl_aff},), aff)
end

function isl_aff_set_constant_si(aff, v)
    ccall((:isl_aff_set_constant_si, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Cint), aff, v)
end

function isl_aff_set_constant_val(aff, v)
    ccall((:isl_aff_set_constant_val, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Ptr{isl_val}), aff, v)
end

function isl_aff_set_coefficient_si(aff, type, pos, v)
    ccall((:isl_aff_set_coefficient_si, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, isl_dim_type, Cint, Cint), aff, type, pos, v)
end

function isl_aff_set_coefficient_val(aff, type, pos, v)
    ccall((:isl_aff_set_coefficient_val, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, isl_dim_type, Cint, Ptr{isl_val}), aff, type, pos, v)
end

function isl_aff_add_constant_si(aff, v)
    ccall((:isl_aff_add_constant_si, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Cint), aff, v)
end

function isl_aff_add_constant_val(aff, v)
    ccall((:isl_aff_add_constant_val, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Ptr{isl_val}), aff, v)
end

function isl_aff_add_constant_num_si(aff, v)
    ccall((:isl_aff_add_constant_num_si, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Cint), aff, v)
end

function isl_aff_add_coefficient_si(aff, type, pos, v)
    ccall((:isl_aff_add_coefficient_si, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, isl_dim_type, Cint, Cint), aff, type, pos, v)
end

function isl_aff_add_coefficient_val(aff, type, pos, v)
    ccall((:isl_aff_add_coefficient_val, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, isl_dim_type, Cint, Ptr{isl_val}), aff, type, pos, v)
end

function isl_aff_is_cst(aff)
    ccall((:isl_aff_is_cst, libisl), isl_bool, (Ptr{isl_aff},), aff)
end

function isl_aff_set_tuple_id(aff, type, id)
    ccall((:isl_aff_set_tuple_id, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, isl_dim_type, Ptr{isl_id}), aff, type, id)
end

function isl_aff_set_dim_name(aff, type, pos, s)
    ccall((:isl_aff_set_dim_name, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, isl_dim_type, Cuint, Ptr{Cchar}), aff, type, pos, s)
end

function isl_aff_set_dim_id(aff, type, pos, id)
    ccall((:isl_aff_set_dim_id, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, isl_dim_type, Cuint, Ptr{isl_id}), aff, type, pos, id)
end

function isl_aff_find_dim_by_name(aff, type, name)
    ccall((:isl_aff_find_dim_by_name, libisl), Cint, (Ptr{isl_aff}, isl_dim_type, Ptr{Cchar}), aff, type, name)
end

function isl_aff_plain_is_equal(aff1, aff2)
    ccall((:isl_aff_plain_is_equal, libisl), isl_bool, (Ptr{isl_aff}, Ptr{isl_aff}), aff1, aff2)
end

function isl_aff_plain_is_zero(aff)
    ccall((:isl_aff_plain_is_zero, libisl), isl_bool, (Ptr{isl_aff},), aff)
end

function isl_aff_is_nan(aff)
    ccall((:isl_aff_is_nan, libisl), isl_bool, (Ptr{isl_aff},), aff)
end

function isl_aff_get_div(aff, pos)
    ccall((:isl_aff_get_div, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Cint), aff, pos)
end

function isl_aff_from_range(aff)
    ccall((:isl_aff_from_range, libisl), Ptr{isl_aff}, (Ptr{isl_aff},), aff)
end

function isl_aff_neg(aff)
    ccall((:isl_aff_neg, libisl), Ptr{isl_aff}, (Ptr{isl_aff},), aff)
end

function isl_aff_ceil(aff)
    ccall((:isl_aff_ceil, libisl), Ptr{isl_aff}, (Ptr{isl_aff},), aff)
end

function isl_aff_floor(aff)
    ccall((:isl_aff_floor, libisl), Ptr{isl_aff}, (Ptr{isl_aff},), aff)
end

function isl_aff_mod_val(aff, mod)
    ccall((:isl_aff_mod_val, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Ptr{isl_val}), aff, mod)
end

function isl_aff_mul(aff1, aff2)
    ccall((:isl_aff_mul, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Ptr{isl_aff}), aff1, aff2)
end

function isl_aff_div(aff1, aff2)
    ccall((:isl_aff_div, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Ptr{isl_aff}), aff1, aff2)
end

function isl_aff_add(aff1, aff2)
    ccall((:isl_aff_add, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Ptr{isl_aff}), aff1, aff2)
end

function isl_aff_sub(aff1, aff2)
    ccall((:isl_aff_sub, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Ptr{isl_aff}), aff1, aff2)
end

function isl_aff_scale_val(aff, v)
    ccall((:isl_aff_scale_val, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Ptr{isl_val}), aff, v)
end

function isl_aff_scale_down_ui(aff, f)
    ccall((:isl_aff_scale_down_ui, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Cuint), aff, f)
end

function isl_aff_scale_down_val(aff, v)
    ccall((:isl_aff_scale_down_val, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Ptr{isl_val}), aff, v)
end

function isl_aff_insert_dims(aff, type, first, n)
    ccall((:isl_aff_insert_dims, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, isl_dim_type, Cuint, Cuint), aff, type, first, n)
end

function isl_aff_add_dims(aff, type, n)
    ccall((:isl_aff_add_dims, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, isl_dim_type, Cuint), aff, type, n)
end

function isl_aff_move_dims(aff, dst_type, dst_pos, src_type, src_pos, n)
    ccall((:isl_aff_move_dims, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, isl_dim_type, Cuint, isl_dim_type, Cuint, Cuint), aff, dst_type, dst_pos, src_type, src_pos, n)
end

function isl_aff_drop_dims(aff, type, first, n)
    ccall((:isl_aff_drop_dims, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, isl_dim_type, Cuint, Cuint), aff, type, first, n)
end

function isl_aff_project_domain_on_params(aff)
    ccall((:isl_aff_project_domain_on_params, libisl), Ptr{isl_aff}, (Ptr{isl_aff},), aff)
end

mutable struct isl_multi_id end

function isl_aff_unbind_params_insert_domain(aff, domain)
    ccall((:isl_aff_unbind_params_insert_domain, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Ptr{isl_multi_id}), aff, domain)
end

function isl_aff_align_params(aff, model)
    ccall((:isl_aff_align_params, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Ptr{isl_space}), aff, model)
end

mutable struct isl_set end

function isl_aff_gist(aff, context)
    ccall((:isl_aff_gist, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Ptr{isl_set}), aff, context)
end

function isl_aff_gist_params(aff, context)
    ccall((:isl_aff_gist_params, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Ptr{isl_set}), aff, context)
end

mutable struct isl_point end

function isl_aff_eval(aff, pnt)
    ccall((:isl_aff_eval, libisl), Ptr{isl_val}, (Ptr{isl_aff}, Ptr{isl_point}), aff, pnt)
end

function isl_aff_pullback_aff(aff1, aff2)
    ccall((:isl_aff_pullback_aff, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Ptr{isl_aff}), aff1, aff2)
end

mutable struct isl_multi_aff end

function isl_aff_pullback_multi_aff(aff, ma)
    ccall((:isl_aff_pullback_multi_aff, libisl), Ptr{isl_aff}, (Ptr{isl_aff}, Ptr{isl_multi_aff}), aff, ma)
end

mutable struct isl_basic_set end

function isl_aff_zero_basic_set(aff)
    ccall((:isl_aff_zero_basic_set, libisl), Ptr{isl_basic_set}, (Ptr{isl_aff},), aff)
end

function isl_aff_neg_basic_set(aff)
    ccall((:isl_aff_neg_basic_set, libisl), Ptr{isl_basic_set}, (Ptr{isl_aff},), aff)
end

function isl_aff_eq_basic_set(aff1, aff2)
    ccall((:isl_aff_eq_basic_set, libisl), Ptr{isl_basic_set}, (Ptr{isl_aff}, Ptr{isl_aff}), aff1, aff2)
end

function isl_aff_eq_set(aff1, aff2)
    ccall((:isl_aff_eq_set, libisl), Ptr{isl_set}, (Ptr{isl_aff}, Ptr{isl_aff}), aff1, aff2)
end

function isl_aff_ne_set(aff1, aff2)
    ccall((:isl_aff_ne_set, libisl), Ptr{isl_set}, (Ptr{isl_aff}, Ptr{isl_aff}), aff1, aff2)
end

function isl_aff_le_basic_set(aff1, aff2)
    ccall((:isl_aff_le_basic_set, libisl), Ptr{isl_basic_set}, (Ptr{isl_aff}, Ptr{isl_aff}), aff1, aff2)
end

function isl_aff_le_set(aff1, aff2)
    ccall((:isl_aff_le_set, libisl), Ptr{isl_set}, (Ptr{isl_aff}, Ptr{isl_aff}), aff1, aff2)
end

function isl_aff_lt_basic_set(aff1, aff2)
    ccall((:isl_aff_lt_basic_set, libisl), Ptr{isl_basic_set}, (Ptr{isl_aff}, Ptr{isl_aff}), aff1, aff2)
end

function isl_aff_lt_set(aff1, aff2)
    ccall((:isl_aff_lt_set, libisl), Ptr{isl_set}, (Ptr{isl_aff}, Ptr{isl_aff}), aff1, aff2)
end

function isl_aff_ge_basic_set(aff1, aff2)
    ccall((:isl_aff_ge_basic_set, libisl), Ptr{isl_basic_set}, (Ptr{isl_aff}, Ptr{isl_aff}), aff1, aff2)
end

function isl_aff_ge_set(aff1, aff2)
    ccall((:isl_aff_ge_set, libisl), Ptr{isl_set}, (Ptr{isl_aff}, Ptr{isl_aff}), aff1, aff2)
end

function isl_aff_gt_basic_set(aff1, aff2)
    ccall((:isl_aff_gt_basic_set, libisl), Ptr{isl_basic_set}, (Ptr{isl_aff}, Ptr{isl_aff}), aff1, aff2)
end

function isl_aff_gt_set(aff1, aff2)
    ccall((:isl_aff_gt_set, libisl), Ptr{isl_set}, (Ptr{isl_aff}, Ptr{isl_aff}), aff1, aff2)
end

function isl_aff_bind_id(aff, id)
    ccall((:isl_aff_bind_id, libisl), Ptr{isl_basic_set}, (Ptr{isl_aff}, Ptr{isl_id}), aff, id)
end

function isl_aff_read_from_str(ctx, str)
    ccall((:isl_aff_read_from_str, libisl), Ptr{isl_aff}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_aff_to_str(aff)
    ccall((:isl_aff_to_str, libisl), Ptr{Cchar}, (Ptr{isl_aff},), aff)
end

mutable struct isl_printer end

function isl_printer_print_aff(p, aff)
    ccall((:isl_printer_print_aff, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_aff}), p, aff)
end

function isl_aff_dump(aff)
    ccall((:isl_aff_dump, libisl), Cvoid, (Ptr{isl_aff},), aff)
end

mutable struct isl_pw_aff end

function isl_pw_aff_get_ctx(pwaff)
    ccall((:isl_pw_aff_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_pw_aff},), pwaff)
end

function isl_pw_aff_get_hash(pa)
    ccall((:isl_pw_aff_get_hash, libisl), UInt32, (Ptr{isl_pw_aff},), pa)
end

function isl_pw_aff_get_domain_space(pwaff)
    ccall((:isl_pw_aff_get_domain_space, libisl), Ptr{isl_space}, (Ptr{isl_pw_aff},), pwaff)
end

function isl_pw_aff_get_space(pwaff)
    ccall((:isl_pw_aff_get_space, libisl), Ptr{isl_space}, (Ptr{isl_pw_aff},), pwaff)
end

function isl_pw_aff_from_aff(aff)
    ccall((:isl_pw_aff_from_aff, libisl), Ptr{isl_pw_aff}, (Ptr{isl_aff},), aff)
end

function isl_pw_aff_empty(space)
    ccall((:isl_pw_aff_empty, libisl), Ptr{isl_pw_aff}, (Ptr{isl_space},), space)
end

function isl_pw_aff_alloc(set, aff)
    ccall((:isl_pw_aff_alloc, libisl), Ptr{isl_pw_aff}, (Ptr{isl_set}, Ptr{isl_aff}), set, aff)
end

function isl_pw_aff_zero_on_domain(ls)
    ccall((:isl_pw_aff_zero_on_domain, libisl), Ptr{isl_pw_aff}, (Ptr{isl_local_space},), ls)
end

function isl_pw_aff_var_on_domain(ls, type, pos)
    ccall((:isl_pw_aff_var_on_domain, libisl), Ptr{isl_pw_aff}, (Ptr{isl_local_space}, isl_dim_type, Cuint), ls, type, pos)
end

function isl_pw_aff_nan_on_domain(ls)
    ccall((:isl_pw_aff_nan_on_domain, libisl), Ptr{isl_pw_aff}, (Ptr{isl_local_space},), ls)
end

function isl_pw_aff_val_on_domain(domain, v)
    ccall((:isl_pw_aff_val_on_domain, libisl), Ptr{isl_pw_aff}, (Ptr{isl_set}, Ptr{isl_val}), domain, v)
end

function isl_pw_aff_param_on_domain_id(domain, id)
    ccall((:isl_pw_aff_param_on_domain_id, libisl), Ptr{isl_pw_aff}, (Ptr{isl_set}, Ptr{isl_id}), domain, id)
end

function isl_set_indicator_function(set)
    ccall((:isl_set_indicator_function, libisl), Ptr{isl_pw_aff}, (Ptr{isl_set},), set)
end

function isl_pw_aff_get_dim_name(pa, type, pos)
    ccall((:isl_pw_aff_get_dim_name, libisl), Ptr{Cchar}, (Ptr{isl_pw_aff}, isl_dim_type, Cuint), pa, type, pos)
end

function isl_pw_aff_has_dim_id(pa, type, pos)
    ccall((:isl_pw_aff_has_dim_id, libisl), isl_bool, (Ptr{isl_pw_aff}, isl_dim_type, Cuint), pa, type, pos)
end

function isl_pw_aff_get_dim_id(pa, type, pos)
    ccall((:isl_pw_aff_get_dim_id, libisl), Ptr{isl_id}, (Ptr{isl_pw_aff}, isl_dim_type, Cuint), pa, type, pos)
end

function isl_pw_aff_set_dim_id(pma, type, pos, id)
    ccall((:isl_pw_aff_set_dim_id, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, isl_dim_type, Cuint, Ptr{isl_id}), pma, type, pos, id)
end

function isl_pw_aff_find_dim_by_name(pa, type, name)
    ccall((:isl_pw_aff_find_dim_by_name, libisl), Cint, (Ptr{isl_pw_aff}, isl_dim_type, Ptr{Cchar}), pa, type, name)
end

function isl_pw_aff_is_empty(pwaff)
    ccall((:isl_pw_aff_is_empty, libisl), isl_bool, (Ptr{isl_pw_aff},), pwaff)
end

function isl_pw_aff_involves_nan(pa)
    ccall((:isl_pw_aff_involves_nan, libisl), isl_bool, (Ptr{isl_pw_aff},), pa)
end

function isl_pw_aff_plain_cmp(pa1, pa2)
    ccall((:isl_pw_aff_plain_cmp, libisl), Cint, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pa1, pa2)
end

function isl_pw_aff_plain_is_equal(pwaff1, pwaff2)
    ccall((:isl_pw_aff_plain_is_equal, libisl), isl_bool, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pwaff1, pwaff2)
end

function isl_pw_aff_is_equal(pa1, pa2)
    ccall((:isl_pw_aff_is_equal, libisl), isl_bool, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pa1, pa2)
end

function isl_pw_aff_union_min(pwaff1, pwaff2)
    ccall((:isl_pw_aff_union_min, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pwaff1, pwaff2)
end

function isl_pw_aff_union_max(pwaff1, pwaff2)
    ccall((:isl_pw_aff_union_max, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pwaff1, pwaff2)
end

function isl_pw_aff_union_add(pwaff1, pwaff2)
    ccall((:isl_pw_aff_union_add, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pwaff1, pwaff2)
end

function isl_pw_aff_copy(pwaff)
    ccall((:isl_pw_aff_copy, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff},), pwaff)
end

function isl_pw_aff_free(pwaff)
    ccall((:isl_pw_aff_free, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff},), pwaff)
end

function isl_pw_aff_dim(pwaff, type)
    ccall((:isl_pw_aff_dim, libisl), isl_size, (Ptr{isl_pw_aff}, isl_dim_type), pwaff, type)
end

function isl_pw_aff_involves_param_id(pa, id)
    ccall((:isl_pw_aff_involves_param_id, libisl), isl_bool, (Ptr{isl_pw_aff}, Ptr{isl_id}), pa, id)
end

function isl_pw_aff_involves_dims(pwaff, type, first, n)
    ccall((:isl_pw_aff_involves_dims, libisl), isl_bool, (Ptr{isl_pw_aff}, isl_dim_type, Cuint, Cuint), pwaff, type, first, n)
end

function isl_pw_aff_is_cst(pwaff)
    ccall((:isl_pw_aff_is_cst, libisl), isl_bool, (Ptr{isl_pw_aff},), pwaff)
end

function isl_pw_aff_project_domain_on_params(pa)
    ccall((:isl_pw_aff_project_domain_on_params, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff},), pa)
end

function isl_pw_aff_align_params(pwaff, model)
    ccall((:isl_pw_aff_align_params, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_space}), pwaff, model)
end

function isl_pw_aff_drop_unused_params(pa)
    ccall((:isl_pw_aff_drop_unused_params, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff},), pa)
end

function isl_pw_aff_has_tuple_id(pa, type)
    ccall((:isl_pw_aff_has_tuple_id, libisl), isl_bool, (Ptr{isl_pw_aff}, isl_dim_type), pa, type)
end

function isl_pw_aff_get_tuple_id(pa, type)
    ccall((:isl_pw_aff_get_tuple_id, libisl), Ptr{isl_id}, (Ptr{isl_pw_aff}, isl_dim_type), pa, type)
end

function isl_pw_aff_set_tuple_id(pwaff, type, id)
    ccall((:isl_pw_aff_set_tuple_id, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, isl_dim_type, Ptr{isl_id}), pwaff, type, id)
end

function isl_pw_aff_reset_tuple_id(pa, type)
    ccall((:isl_pw_aff_reset_tuple_id, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, isl_dim_type), pa, type)
end

function isl_pw_aff_reset_user(pa)
    ccall((:isl_pw_aff_reset_user, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff},), pa)
end

function isl_pw_aff_params(pwa)
    ccall((:isl_pw_aff_params, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff},), pwa)
end

function isl_pw_aff_domain(pwaff)
    ccall((:isl_pw_aff_domain, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff},), pwaff)
end

function isl_pw_aff_from_range(pwa)
    ccall((:isl_pw_aff_from_range, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff},), pwa)
end

function isl_pw_aff_min(pwaff1, pwaff2)
    ccall((:isl_pw_aff_min, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pwaff1, pwaff2)
end

function isl_pw_aff_max(pwaff1, pwaff2)
    ccall((:isl_pw_aff_max, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pwaff1, pwaff2)
end

function isl_pw_aff_mul(pwaff1, pwaff2)
    ccall((:isl_pw_aff_mul, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pwaff1, pwaff2)
end

function isl_pw_aff_div(pa1, pa2)
    ccall((:isl_pw_aff_div, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pa1, pa2)
end

function isl_pw_aff_add(pwaff1, pwaff2)
    ccall((:isl_pw_aff_add, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pwaff1, pwaff2)
end

function isl_pw_aff_sub(pwaff1, pwaff2)
    ccall((:isl_pw_aff_sub, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pwaff1, pwaff2)
end

function isl_pw_aff_neg(pwaff)
    ccall((:isl_pw_aff_neg, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff},), pwaff)
end

function isl_pw_aff_ceil(pwaff)
    ccall((:isl_pw_aff_ceil, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff},), pwaff)
end

function isl_pw_aff_floor(pwaff)
    ccall((:isl_pw_aff_floor, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff},), pwaff)
end

function isl_pw_aff_mod_val(pa, mod)
    ccall((:isl_pw_aff_mod_val, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_val}), pa, mod)
end

function isl_pw_aff_tdiv_q(pa1, pa2)
    ccall((:isl_pw_aff_tdiv_q, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pa1, pa2)
end

function isl_pw_aff_tdiv_r(pa1, pa2)
    ccall((:isl_pw_aff_tdiv_r, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pa1, pa2)
end

function isl_pw_aff_intersect_params(pa, set)
    ccall((:isl_pw_aff_intersect_params, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_set}), pa, set)
end

function isl_pw_aff_intersect_domain(pa, set)
    ccall((:isl_pw_aff_intersect_domain, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_set}), pa, set)
end

function isl_pw_aff_intersect_domain_wrapped_domain(pa, set)
    ccall((:isl_pw_aff_intersect_domain_wrapped_domain, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_set}), pa, set)
end

function isl_pw_aff_intersect_domain_wrapped_range(pa, set)
    ccall((:isl_pw_aff_intersect_domain_wrapped_range, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_set}), pa, set)
end

function isl_pw_aff_subtract_domain(pa, set)
    ccall((:isl_pw_aff_subtract_domain, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_set}), pa, set)
end

function isl_pw_aff_cond(cond, pwaff_true, pwaff_false)
    ccall((:isl_pw_aff_cond, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), cond, pwaff_true, pwaff_false)
end

function isl_pw_aff_scale_val(pa, v)
    ccall((:isl_pw_aff_scale_val, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_val}), pa, v)
end

function isl_pw_aff_scale_down_val(pa, f)
    ccall((:isl_pw_aff_scale_down_val, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_val}), pa, f)
end

function isl_pw_aff_insert_dims(pwaff, type, first, n)
    ccall((:isl_pw_aff_insert_dims, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, isl_dim_type, Cuint, Cuint), pwaff, type, first, n)
end

function isl_pw_aff_add_dims(pwaff, type, n)
    ccall((:isl_pw_aff_add_dims, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, isl_dim_type, Cuint), pwaff, type, n)
end

function isl_pw_aff_move_dims(pa, dst_type, dst_pos, src_type, src_pos, n)
    ccall((:isl_pw_aff_move_dims, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, isl_dim_type, Cuint, isl_dim_type, Cuint, Cuint), pa, dst_type, dst_pos, src_type, src_pos, n)
end

function isl_pw_aff_drop_dims(pwaff, type, first, n)
    ccall((:isl_pw_aff_drop_dims, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, isl_dim_type, Cuint, Cuint), pwaff, type, first, n)
end

function isl_pw_aff_coalesce(pwqp)
    ccall((:isl_pw_aff_coalesce, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff},), pwqp)
end

function isl_pw_aff_gist(pwaff, context)
    ccall((:isl_pw_aff_gist, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_set}), pwaff, context)
end

function isl_pw_aff_gist_params(pwaff, context)
    ccall((:isl_pw_aff_gist_params, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_set}), pwaff, context)
end

function isl_pw_aff_eval(pa, pnt)
    ccall((:isl_pw_aff_eval, libisl), Ptr{isl_val}, (Ptr{isl_pw_aff}, Ptr{isl_point}), pa, pnt)
end

function isl_pw_aff_pullback_multi_aff(pa, ma)
    ccall((:isl_pw_aff_pullback_multi_aff, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_multi_aff}), pa, ma)
end

mutable struct isl_pw_multi_aff end

function isl_pw_aff_pullback_pw_multi_aff(pa, pma)
    ccall((:isl_pw_aff_pullback_pw_multi_aff, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_pw_multi_aff}), pa, pma)
end

mutable struct isl_multi_pw_aff end

function isl_pw_aff_pullback_multi_pw_aff(pa, mpa)
    ccall((:isl_pw_aff_pullback_multi_pw_aff, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_multi_pw_aff}), pa, mpa)
end

function isl_pw_aff_n_piece(pwaff)
    ccall((:isl_pw_aff_n_piece, libisl), isl_size, (Ptr{isl_pw_aff},), pwaff)
end

@cenum isl_stat::Int32 begin
    isl_stat_error = -1
    isl_stat_ok = 0
end

function isl_pw_aff_foreach_piece(pwaff, fn, user)
    ccall((:isl_pw_aff_foreach_piece, libisl), isl_stat, (Ptr{isl_pw_aff}, Ptr{Cvoid}, Ptr{Cvoid}), pwaff, fn, user)
end

function isl_pw_aff_isa_aff(pa)
    ccall((:isl_pw_aff_isa_aff, libisl), isl_bool, (Ptr{isl_pw_aff},), pa)
end

function isl_pw_aff_as_aff(pa)
    ccall((:isl_pw_aff_as_aff, libisl), Ptr{isl_aff}, (Ptr{isl_pw_aff},), pa)
end

function isl_set_from_pw_aff(pwaff)
    ccall((:isl_set_from_pw_aff, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff},), pwaff)
end

mutable struct isl_map end

function isl_map_from_pw_aff(pwaff)
    ccall((:isl_map_from_pw_aff, libisl), Ptr{isl_map}, (Ptr{isl_pw_aff},), pwaff)
end

function isl_pw_aff_pos_set(pa)
    ccall((:isl_pw_aff_pos_set, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff},), pa)
end

function isl_pw_aff_nonneg_set(pwaff)
    ccall((:isl_pw_aff_nonneg_set, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff},), pwaff)
end

function isl_pw_aff_zero_set(pwaff)
    ccall((:isl_pw_aff_zero_set, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff},), pwaff)
end

function isl_pw_aff_non_zero_set(pwaff)
    ccall((:isl_pw_aff_non_zero_set, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff},), pwaff)
end

function isl_pw_aff_eq_set(pwaff1, pwaff2)
    ccall((:isl_pw_aff_eq_set, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pwaff1, pwaff2)
end

function isl_pw_aff_ne_set(pwaff1, pwaff2)
    ccall((:isl_pw_aff_ne_set, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pwaff1, pwaff2)
end

function isl_pw_aff_le_set(pwaff1, pwaff2)
    ccall((:isl_pw_aff_le_set, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pwaff1, pwaff2)
end

function isl_pw_aff_lt_set(pwaff1, pwaff2)
    ccall((:isl_pw_aff_lt_set, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pwaff1, pwaff2)
end

function isl_pw_aff_ge_set(pwaff1, pwaff2)
    ccall((:isl_pw_aff_ge_set, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pwaff1, pwaff2)
end

function isl_pw_aff_gt_set(pwaff1, pwaff2)
    ccall((:isl_pw_aff_gt_set, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pwaff1, pwaff2)
end

function isl_pw_aff_eq_map(pa1, pa2)
    ccall((:isl_pw_aff_eq_map, libisl), Ptr{isl_map}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pa1, pa2)
end

function isl_pw_aff_lt_map(pa1, pa2)
    ccall((:isl_pw_aff_lt_map, libisl), Ptr{isl_map}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pa1, pa2)
end

function isl_pw_aff_gt_map(pa1, pa2)
    ccall((:isl_pw_aff_gt_map, libisl), Ptr{isl_map}, (Ptr{isl_pw_aff}, Ptr{isl_pw_aff}), pa1, pa2)
end

function isl_pw_aff_bind_domain(pa, tuple)
    ccall((:isl_pw_aff_bind_domain, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_multi_id}), pa, tuple)
end

function isl_pw_aff_bind_domain_wrapped_domain(pa, tuple)
    ccall((:isl_pw_aff_bind_domain_wrapped_domain, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff}, Ptr{isl_multi_id}), pa, tuple)
end

function isl_pw_aff_bind_id(pa, id)
    ccall((:isl_pw_aff_bind_id, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff}, Ptr{isl_id}), pa, id)
end

function isl_pw_aff_read_from_str(ctx, str)
    ccall((:isl_pw_aff_read_from_str, libisl), Ptr{isl_pw_aff}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_pw_aff_to_str(pa)
    ccall((:isl_pw_aff_to_str, libisl), Ptr{Cchar}, (Ptr{isl_pw_aff},), pa)
end

function isl_printer_print_pw_aff(p, pwaff)
    ccall((:isl_printer_print_pw_aff, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_pw_aff}), p, pwaff)
end

function isl_pw_aff_dump(pwaff)
    ccall((:isl_pw_aff_dump, libisl), Cvoid, (Ptr{isl_pw_aff},), pwaff)
end

mutable struct isl_pw_aff_list end

function isl_pw_aff_list_min(list)
    ccall((:isl_pw_aff_list_min, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff_list},), list)
end

function isl_pw_aff_list_max(list)
    ccall((:isl_pw_aff_list_max, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff_list},), list)
end

function isl_pw_aff_list_eq_set(list1, list2)
    ccall((:isl_pw_aff_list_eq_set, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff_list}, Ptr{isl_pw_aff_list}), list1, list2)
end

function isl_pw_aff_list_ne_set(list1, list2)
    ccall((:isl_pw_aff_list_ne_set, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff_list}, Ptr{isl_pw_aff_list}), list1, list2)
end

function isl_pw_aff_list_le_set(list1, list2)
    ccall((:isl_pw_aff_list_le_set, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff_list}, Ptr{isl_pw_aff_list}), list1, list2)
end

function isl_pw_aff_list_lt_set(list1, list2)
    ccall((:isl_pw_aff_list_lt_set, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff_list}, Ptr{isl_pw_aff_list}), list1, list2)
end

function isl_pw_aff_list_ge_set(list1, list2)
    ccall((:isl_pw_aff_list_ge_set, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff_list}, Ptr{isl_pw_aff_list}), list1, list2)
end

function isl_pw_aff_list_gt_set(list1, list2)
    ccall((:isl_pw_aff_list_gt_set, libisl), Ptr{isl_set}, (Ptr{isl_pw_aff_list}, Ptr{isl_pw_aff_list}), list1, list2)
end

function isl_multi_aff_get_ctx(multi)
    ccall((:isl_multi_aff_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_multi_aff},), multi)
end

function isl_multi_aff_get_space(multi)
    ccall((:isl_multi_aff_get_space, libisl), Ptr{isl_space}, (Ptr{isl_multi_aff},), multi)
end

function isl_multi_aff_get_domain_space(multi)
    ccall((:isl_multi_aff_get_domain_space, libisl), Ptr{isl_space}, (Ptr{isl_multi_aff},), multi)
end

mutable struct isl_aff_list end

function isl_multi_aff_from_aff_list(space, list)
    ccall((:isl_multi_aff_from_aff_list, libisl), Ptr{isl_multi_aff}, (Ptr{isl_space}, Ptr{isl_aff_list}), space, list)
end

function isl_multi_aff_copy(multi)
    ccall((:isl_multi_aff_copy, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff},), multi)
end

function isl_multi_aff_free(multi)
    ccall((:isl_multi_aff_free, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff},), multi)
end

function isl_multi_aff_plain_is_equal(multi1, multi2)
    ccall((:isl_multi_aff_plain_is_equal, libisl), isl_bool, (Ptr{isl_multi_aff}, Ptr{isl_multi_aff}), multi1, multi2)
end

function isl_multi_aff_reset_user(multi)
    ccall((:isl_multi_aff_reset_user, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff},), multi)
end

function isl_multi_aff_size(multi)
    ccall((:isl_multi_aff_size, libisl), isl_size, (Ptr{isl_multi_aff},), multi)
end

function isl_multi_aff_get_at(multi, pos)
    ccall((:isl_multi_aff_get_at, libisl), Ptr{isl_aff}, (Ptr{isl_multi_aff}, Cint), multi, pos)
end

function isl_multi_aff_get_aff(multi, pos)
    ccall((:isl_multi_aff_get_aff, libisl), Ptr{isl_aff}, (Ptr{isl_multi_aff}, Cint), multi, pos)
end

function isl_multi_aff_set_at(multi, pos, el)
    ccall((:isl_multi_aff_set_at, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Cint, Ptr{isl_aff}), multi, pos, el)
end

function isl_multi_aff_set_aff(multi, pos, el)
    ccall((:isl_multi_aff_set_aff, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Cint, Ptr{isl_aff}), multi, pos, el)
end

function isl_multi_aff_range_splice(multi1, pos, multi2)
    ccall((:isl_multi_aff_range_splice, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Cuint, Ptr{isl_multi_aff}), multi1, pos, multi2)
end

function isl_multi_aff_flatten_range(multi)
    ccall((:isl_multi_aff_flatten_range, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff},), multi)
end

function isl_multi_aff_flat_range_product(multi1, multi2)
    ccall((:isl_multi_aff_flat_range_product, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Ptr{isl_multi_aff}), multi1, multi2)
end

function isl_multi_aff_range_product(multi1, multi2)
    ccall((:isl_multi_aff_range_product, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Ptr{isl_multi_aff}), multi1, multi2)
end

function isl_multi_aff_factor_range(multi)
    ccall((:isl_multi_aff_factor_range, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff},), multi)
end

function isl_multi_aff_range_is_wrapping(multi)
    ccall((:isl_multi_aff_range_is_wrapping, libisl), isl_bool, (Ptr{isl_multi_aff},), multi)
end

function isl_multi_aff_range_factor_domain(multi)
    ccall((:isl_multi_aff_range_factor_domain, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff},), multi)
end

function isl_multi_aff_range_factor_range(multi)
    ccall((:isl_multi_aff_range_factor_range, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff},), multi)
end

function isl_multi_aff_align_params(multi, model)
    ccall((:isl_multi_aff_align_params, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Ptr{isl_space}), multi, model)
end

function isl_multi_aff_from_range(multi)
    ccall((:isl_multi_aff_from_range, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff},), multi)
end

function isl_multi_aff_identity_multi_aff(multi)
    ccall((:isl_multi_aff_identity_multi_aff, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff},), multi)
end

function isl_multi_aff_identity(space)
    ccall((:isl_multi_aff_identity, libisl), Ptr{isl_multi_aff}, (Ptr{isl_space},), space)
end

function isl_multi_aff_identity_on_domain_space(space)
    ccall((:isl_multi_aff_identity_on_domain_space, libisl), Ptr{isl_multi_aff}, (Ptr{isl_space},), space)
end

function isl_multi_aff_plain_cmp(multi1, multi2)
    ccall((:isl_multi_aff_plain_cmp, libisl), Cint, (Ptr{isl_multi_aff}, Ptr{isl_multi_aff}), multi1, multi2)
end

function isl_multi_aff_scale_val(multi, v)
    ccall((:isl_multi_aff_scale_val, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Ptr{isl_val}), multi, v)
end

function isl_multi_aff_scale_down_val(multi, v)
    ccall((:isl_multi_aff_scale_down_val, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Ptr{isl_val}), multi, v)
end

mutable struct isl_multi_val end

function isl_multi_aff_scale_multi_val(multi, mv)
    ccall((:isl_multi_aff_scale_multi_val, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Ptr{isl_multi_val}), multi, mv)
end

function isl_multi_aff_scale_down_multi_val(multi, mv)
    ccall((:isl_multi_aff_scale_down_multi_val, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Ptr{isl_multi_val}), multi, mv)
end

function isl_multi_aff_mod_multi_val(multi, mv)
    ccall((:isl_multi_aff_mod_multi_val, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Ptr{isl_multi_val}), multi, mv)
end

function isl_multi_aff_add(multi1, multi2)
    ccall((:isl_multi_aff_add, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Ptr{isl_multi_aff}), multi1, multi2)
end

function isl_multi_aff_sub(multi1, multi2)
    ccall((:isl_multi_aff_sub, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Ptr{isl_multi_aff}), multi1, multi2)
end

function isl_multi_aff_neg(multi)
    ccall((:isl_multi_aff_neg, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff},), multi)
end

function isl_multi_aff_zero(space)
    ccall((:isl_multi_aff_zero, libisl), Ptr{isl_multi_aff}, (Ptr{isl_space},), space)
end

function isl_multi_aff_involves_nan(multi)
    ccall((:isl_multi_aff_involves_nan, libisl), isl_bool, (Ptr{isl_multi_aff},), multi)
end

function isl_multi_aff_dim(multi, type)
    ccall((:isl_multi_aff_dim, libisl), isl_size, (Ptr{isl_multi_aff}, isl_dim_type), multi, type)
end

function isl_multi_aff_drop_dims(multi, type, first, n)
    ccall((:isl_multi_aff_drop_dims, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, isl_dim_type, Cuint, Cuint), multi, type, first, n)
end

function isl_multi_aff_involves_dims(multi, type, first, n)
    ccall((:isl_multi_aff_involves_dims, libisl), isl_bool, (Ptr{isl_multi_aff}, isl_dim_type, Cuint, Cuint), multi, type, first, n)
end

function isl_multi_aff_insert_dims(multi, type, first, n)
    ccall((:isl_multi_aff_insert_dims, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, isl_dim_type, Cuint, Cuint), multi, type, first, n)
end

function isl_multi_aff_add_dims(multi, type, n)
    ccall((:isl_multi_aff_add_dims, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, isl_dim_type, Cuint), multi, type, n)
end

function isl_multi_aff_project_domain_on_params(multi)
    ccall((:isl_multi_aff_project_domain_on_params, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff},), multi)
end

function isl_multi_aff_involves_locals(multi)
    ccall((:isl_multi_aff_involves_locals, libisl), isl_bool, (Ptr{isl_multi_aff},), multi)
end

function isl_multi_aff_find_dim_by_name(multi, type, name)
    ccall((:isl_multi_aff_find_dim_by_name, libisl), Cint, (Ptr{isl_multi_aff}, isl_dim_type, Ptr{Cchar}), multi, type, name)
end

function isl_multi_aff_find_dim_by_id(multi, type, id)
    ccall((:isl_multi_aff_find_dim_by_id, libisl), Cint, (Ptr{isl_multi_aff}, isl_dim_type, Ptr{isl_id}), multi, type, id)
end

function isl_multi_aff_get_dim_id(multi, type, pos)
    ccall((:isl_multi_aff_get_dim_id, libisl), Ptr{isl_id}, (Ptr{isl_multi_aff}, isl_dim_type, Cuint), multi, type, pos)
end

function isl_multi_aff_set_dim_name(multi, type, pos, s)
    ccall((:isl_multi_aff_set_dim_name, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, isl_dim_type, Cuint, Ptr{Cchar}), multi, type, pos, s)
end

function isl_multi_aff_set_dim_id(multi, type, pos, id)
    ccall((:isl_multi_aff_set_dim_id, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, isl_dim_type, Cuint, Ptr{isl_id}), multi, type, pos, id)
end

function isl_multi_aff_get_tuple_name(multi, type)
    ccall((:isl_multi_aff_get_tuple_name, libisl), Ptr{Cchar}, (Ptr{isl_multi_aff}, isl_dim_type), multi, type)
end

function isl_multi_aff_has_tuple_id(multi, type)
    ccall((:isl_multi_aff_has_tuple_id, libisl), isl_bool, (Ptr{isl_multi_aff}, isl_dim_type), multi, type)
end

function isl_multi_aff_get_tuple_id(multi, type)
    ccall((:isl_multi_aff_get_tuple_id, libisl), Ptr{isl_id}, (Ptr{isl_multi_aff}, isl_dim_type), multi, type)
end

function isl_multi_aff_set_tuple_name(multi, type, s)
    ccall((:isl_multi_aff_set_tuple_name, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, isl_dim_type, Ptr{Cchar}), multi, type, s)
end

function isl_multi_aff_set_tuple_id(multi, type, id)
    ccall((:isl_multi_aff_set_tuple_id, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, isl_dim_type, Ptr{isl_id}), multi, type, id)
end

function isl_multi_aff_reset_tuple_id(multi, type)
    ccall((:isl_multi_aff_reset_tuple_id, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, isl_dim_type), multi, type)
end

function isl_multi_aff_product(multi1, multi2)
    ccall((:isl_multi_aff_product, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Ptr{isl_multi_aff}), multi1, multi2)
end

function isl_multi_aff_splice(multi1, in_pos, out_pos, multi2)
    ccall((:isl_multi_aff_splice, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Cuint, Cuint, Ptr{isl_multi_aff}), multi1, in_pos, out_pos, multi2)
end

function isl_multi_aff_bind_domain(multi, tuple)
    ccall((:isl_multi_aff_bind_domain, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Ptr{isl_multi_id}), multi, tuple)
end

function isl_multi_aff_bind_domain_wrapped_domain(multi, tuple)
    ccall((:isl_multi_aff_bind_domain_wrapped_domain, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Ptr{isl_multi_id}), multi, tuple)
end

function isl_multi_aff_from_aff(aff)
    ccall((:isl_multi_aff_from_aff, libisl), Ptr{isl_multi_aff}, (Ptr{isl_aff},), aff)
end

function isl_multi_aff_domain_map(space)
    ccall((:isl_multi_aff_domain_map, libisl), Ptr{isl_multi_aff}, (Ptr{isl_space},), space)
end

function isl_multi_aff_range_map(space)
    ccall((:isl_multi_aff_range_map, libisl), Ptr{isl_multi_aff}, (Ptr{isl_space},), space)
end

function isl_multi_aff_project_out_map(space, type, first, n)
    ccall((:isl_multi_aff_project_out_map, libisl), Ptr{isl_multi_aff}, (Ptr{isl_space}, isl_dim_type, Cuint, Cuint), space, type, first, n)
end

function isl_multi_aff_multi_val_on_space(space, mv)
    ccall((:isl_multi_aff_multi_val_on_space, libisl), Ptr{isl_multi_aff}, (Ptr{isl_space}, Ptr{isl_multi_val}), space, mv)
end

function isl_multi_aff_floor(ma)
    ccall((:isl_multi_aff_floor, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff},), ma)
end

function isl_multi_aff_gist_params(maff, context)
    ccall((:isl_multi_aff_gist_params, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Ptr{isl_set}), maff, context)
end

function isl_multi_aff_gist(maff, context)
    ccall((:isl_multi_aff_gist, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Ptr{isl_set}), maff, context)
end

function isl_multi_aff_lift(maff, ls)
    ccall((:isl_multi_aff_lift, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Ptr{Ptr{isl_local_space}}), maff, ls)
end

function isl_multi_aff_pullback_multi_aff(ma1, ma2)
    ccall((:isl_multi_aff_pullback_multi_aff, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, Ptr{isl_multi_aff}), ma1, ma2)
end

function isl_multi_aff_move_dims(ma, dst_type, dst_pos, src_type, src_pos, n)
    ccall((:isl_multi_aff_move_dims, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff}, isl_dim_type, Cuint, isl_dim_type, Cuint, Cuint), ma, dst_type, dst_pos, src_type, src_pos, n)
end

function isl_multi_aff_lex_lt_set(ma1, ma2)
    ccall((:isl_multi_aff_lex_lt_set, libisl), Ptr{isl_set}, (Ptr{isl_multi_aff}, Ptr{isl_multi_aff}), ma1, ma2)
end

function isl_multi_aff_lex_le_set(ma1, ma2)
    ccall((:isl_multi_aff_lex_le_set, libisl), Ptr{isl_set}, (Ptr{isl_multi_aff}, Ptr{isl_multi_aff}), ma1, ma2)
end

function isl_multi_aff_lex_gt_set(ma1, ma2)
    ccall((:isl_multi_aff_lex_gt_set, libisl), Ptr{isl_set}, (Ptr{isl_multi_aff}, Ptr{isl_multi_aff}), ma1, ma2)
end

function isl_multi_aff_lex_ge_set(ma1, ma2)
    ccall((:isl_multi_aff_lex_ge_set, libisl), Ptr{isl_set}, (Ptr{isl_multi_aff}, Ptr{isl_multi_aff}), ma1, ma2)
end

function isl_multi_aff_bind(ma, tuple)
    ccall((:isl_multi_aff_bind, libisl), Ptr{isl_basic_set}, (Ptr{isl_multi_aff}, Ptr{isl_multi_id}), ma, tuple)
end

function isl_multi_aff_to_str(ma)
    ccall((:isl_multi_aff_to_str, libisl), Ptr{Cchar}, (Ptr{isl_multi_aff},), ma)
end

function isl_printer_print_multi_aff(p, maff)
    ccall((:isl_printer_print_multi_aff, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_multi_aff}), p, maff)
end

function isl_multi_aff_read_from_str(ctx, str)
    ccall((:isl_multi_aff_read_from_str, libisl), Ptr{isl_multi_aff}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_multi_aff_dump(maff)
    ccall((:isl_multi_aff_dump, libisl), Cvoid, (Ptr{isl_multi_aff},), maff)
end

function isl_multi_pw_aff_get_ctx(multi)
    ccall((:isl_multi_pw_aff_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_multi_pw_aff},), multi)
end

function isl_multi_pw_aff_get_space(multi)
    ccall((:isl_multi_pw_aff_get_space, libisl), Ptr{isl_space}, (Ptr{isl_multi_pw_aff},), multi)
end

function isl_multi_pw_aff_get_domain_space(multi)
    ccall((:isl_multi_pw_aff_get_domain_space, libisl), Ptr{isl_space}, (Ptr{isl_multi_pw_aff},), multi)
end

function isl_multi_pw_aff_from_pw_aff_list(space, list)
    ccall((:isl_multi_pw_aff_from_pw_aff_list, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_space}, Ptr{isl_pw_aff_list}), space, list)
end

function isl_multi_pw_aff_copy(multi)
    ccall((:isl_multi_pw_aff_copy, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff},), multi)
end

function isl_multi_pw_aff_free(multi)
    ccall((:isl_multi_pw_aff_free, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff},), multi)
end

function isl_multi_pw_aff_plain_is_equal(multi1, multi2)
    ccall((:isl_multi_pw_aff_plain_is_equal, libisl), isl_bool, (Ptr{isl_multi_pw_aff}, Ptr{isl_multi_pw_aff}), multi1, multi2)
end

function isl_multi_pw_aff_reset_user(multi)
    ccall((:isl_multi_pw_aff_reset_user, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff},), multi)
end

function isl_multi_pw_aff_size(multi)
    ccall((:isl_multi_pw_aff_size, libisl), isl_size, (Ptr{isl_multi_pw_aff},), multi)
end

function isl_multi_pw_aff_get_at(multi, pos)
    ccall((:isl_multi_pw_aff_get_at, libisl), Ptr{isl_pw_aff}, (Ptr{isl_multi_pw_aff}, Cint), multi, pos)
end

function isl_multi_pw_aff_get_pw_aff(multi, pos)
    ccall((:isl_multi_pw_aff_get_pw_aff, libisl), Ptr{isl_pw_aff}, (Ptr{isl_multi_pw_aff}, Cint), multi, pos)
end

function isl_multi_pw_aff_set_at(multi, pos, el)
    ccall((:isl_multi_pw_aff_set_at, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Cint, Ptr{isl_pw_aff}), multi, pos, el)
end

function isl_multi_pw_aff_set_pw_aff(multi, pos, el)
    ccall((:isl_multi_pw_aff_set_pw_aff, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Cint, Ptr{isl_pw_aff}), multi, pos, el)
end

function isl_multi_pw_aff_range_splice(multi1, pos, multi2)
    ccall((:isl_multi_pw_aff_range_splice, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Cuint, Ptr{isl_multi_pw_aff}), multi1, pos, multi2)
end

function isl_multi_pw_aff_flatten_range(multi)
    ccall((:isl_multi_pw_aff_flatten_range, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff},), multi)
end

function isl_multi_pw_aff_flat_range_product(multi1, multi2)
    ccall((:isl_multi_pw_aff_flat_range_product, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_multi_pw_aff}), multi1, multi2)
end

function isl_multi_pw_aff_range_product(multi1, multi2)
    ccall((:isl_multi_pw_aff_range_product, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_multi_pw_aff}), multi1, multi2)
end

function isl_multi_pw_aff_factor_range(multi)
    ccall((:isl_multi_pw_aff_factor_range, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff},), multi)
end

function isl_multi_pw_aff_range_is_wrapping(multi)
    ccall((:isl_multi_pw_aff_range_is_wrapping, libisl), isl_bool, (Ptr{isl_multi_pw_aff},), multi)
end

function isl_multi_pw_aff_range_factor_domain(multi)
    ccall((:isl_multi_pw_aff_range_factor_domain, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff},), multi)
end

function isl_multi_pw_aff_range_factor_range(multi)
    ccall((:isl_multi_pw_aff_range_factor_range, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff},), multi)
end

function isl_multi_pw_aff_align_params(multi, model)
    ccall((:isl_multi_pw_aff_align_params, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_space}), multi, model)
end

function isl_multi_pw_aff_from_range(multi)
    ccall((:isl_multi_pw_aff_from_range, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff},), multi)
end

function isl_multi_pw_aff_identity_multi_pw_aff(multi)
    ccall((:isl_multi_pw_aff_identity_multi_pw_aff, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff},), multi)
end

function isl_multi_pw_aff_identity(space)
    ccall((:isl_multi_pw_aff_identity, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_space},), space)
end

function isl_multi_pw_aff_identity_on_domain_space(space)
    ccall((:isl_multi_pw_aff_identity_on_domain_space, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_space},), space)
end

function isl_multi_pw_aff_scale_val(multi, v)
    ccall((:isl_multi_pw_aff_scale_val, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_val}), multi, v)
end

function isl_multi_pw_aff_scale_down_val(multi, v)
    ccall((:isl_multi_pw_aff_scale_down_val, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_val}), multi, v)
end

function isl_multi_pw_aff_scale_multi_val(multi, mv)
    ccall((:isl_multi_pw_aff_scale_multi_val, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_multi_val}), multi, mv)
end

function isl_multi_pw_aff_scale_down_multi_val(multi, mv)
    ccall((:isl_multi_pw_aff_scale_down_multi_val, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_multi_val}), multi, mv)
end

function isl_multi_pw_aff_mod_multi_val(multi, mv)
    ccall((:isl_multi_pw_aff_mod_multi_val, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_multi_val}), multi, mv)
end

function isl_multi_pw_aff_add(multi1, multi2)
    ccall((:isl_multi_pw_aff_add, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_multi_pw_aff}), multi1, multi2)
end

function isl_multi_pw_aff_sub(multi1, multi2)
    ccall((:isl_multi_pw_aff_sub, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_multi_pw_aff}), multi1, multi2)
end

function isl_multi_pw_aff_neg(multi)
    ccall((:isl_multi_pw_aff_neg, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff},), multi)
end

function isl_multi_pw_aff_zero(space)
    ccall((:isl_multi_pw_aff_zero, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_space},), space)
end

function isl_multi_pw_aff_involves_nan(multi)
    ccall((:isl_multi_pw_aff_involves_nan, libisl), isl_bool, (Ptr{isl_multi_pw_aff},), multi)
end

function isl_multi_pw_aff_dim(multi, type)
    ccall((:isl_multi_pw_aff_dim, libisl), isl_size, (Ptr{isl_multi_pw_aff}, isl_dim_type), multi, type)
end

function isl_multi_pw_aff_drop_dims(multi, type, first, n)
    ccall((:isl_multi_pw_aff_drop_dims, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, isl_dim_type, Cuint, Cuint), multi, type, first, n)
end

function isl_multi_pw_aff_involves_dims(multi, type, first, n)
    ccall((:isl_multi_pw_aff_involves_dims, libisl), isl_bool, (Ptr{isl_multi_pw_aff}, isl_dim_type, Cuint, Cuint), multi, type, first, n)
end

function isl_multi_pw_aff_insert_dims(multi, type, first, n)
    ccall((:isl_multi_pw_aff_insert_dims, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, isl_dim_type, Cuint, Cuint), multi, type, first, n)
end

function isl_multi_pw_aff_add_dims(multi, type, n)
    ccall((:isl_multi_pw_aff_add_dims, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, isl_dim_type, Cuint), multi, type, n)
end

function isl_multi_pw_aff_project_domain_on_params(multi)
    ccall((:isl_multi_pw_aff_project_domain_on_params, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff},), multi)
end

function isl_multi_pw_aff_find_dim_by_name(multi, type, name)
    ccall((:isl_multi_pw_aff_find_dim_by_name, libisl), Cint, (Ptr{isl_multi_pw_aff}, isl_dim_type, Ptr{Cchar}), multi, type, name)
end

function isl_multi_pw_aff_find_dim_by_id(multi, type, id)
    ccall((:isl_multi_pw_aff_find_dim_by_id, libisl), Cint, (Ptr{isl_multi_pw_aff}, isl_dim_type, Ptr{isl_id}), multi, type, id)
end

function isl_multi_pw_aff_get_dim_id(multi, type, pos)
    ccall((:isl_multi_pw_aff_get_dim_id, libisl), Ptr{isl_id}, (Ptr{isl_multi_pw_aff}, isl_dim_type, Cuint), multi, type, pos)
end

function isl_multi_pw_aff_set_dim_name(multi, type, pos, s)
    ccall((:isl_multi_pw_aff_set_dim_name, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, isl_dim_type, Cuint, Ptr{Cchar}), multi, type, pos, s)
end

function isl_multi_pw_aff_set_dim_id(multi, type, pos, id)
    ccall((:isl_multi_pw_aff_set_dim_id, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, isl_dim_type, Cuint, Ptr{isl_id}), multi, type, pos, id)
end

function isl_multi_pw_aff_get_tuple_name(multi, type)
    ccall((:isl_multi_pw_aff_get_tuple_name, libisl), Ptr{Cchar}, (Ptr{isl_multi_pw_aff}, isl_dim_type), multi, type)
end

function isl_multi_pw_aff_has_tuple_id(multi, type)
    ccall((:isl_multi_pw_aff_has_tuple_id, libisl), isl_bool, (Ptr{isl_multi_pw_aff}, isl_dim_type), multi, type)
end

function isl_multi_pw_aff_get_tuple_id(multi, type)
    ccall((:isl_multi_pw_aff_get_tuple_id, libisl), Ptr{isl_id}, (Ptr{isl_multi_pw_aff}, isl_dim_type), multi, type)
end

function isl_multi_pw_aff_set_tuple_name(multi, type, s)
    ccall((:isl_multi_pw_aff_set_tuple_name, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, isl_dim_type, Ptr{Cchar}), multi, type, s)
end

function isl_multi_pw_aff_set_tuple_id(multi, type, id)
    ccall((:isl_multi_pw_aff_set_tuple_id, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, isl_dim_type, Ptr{isl_id}), multi, type, id)
end

function isl_multi_pw_aff_reset_tuple_id(multi, type)
    ccall((:isl_multi_pw_aff_reset_tuple_id, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, isl_dim_type), multi, type)
end

function isl_multi_pw_aff_product(multi1, multi2)
    ccall((:isl_multi_pw_aff_product, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_multi_pw_aff}), multi1, multi2)
end

function isl_multi_pw_aff_splice(multi1, in_pos, out_pos, multi2)
    ccall((:isl_multi_pw_aff_splice, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Cuint, Cuint, Ptr{isl_multi_pw_aff}), multi1, in_pos, out_pos, multi2)
end

function isl_multi_pw_aff_bind_domain(multi, tuple)
    ccall((:isl_multi_pw_aff_bind_domain, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_multi_id}), multi, tuple)
end

function isl_multi_pw_aff_bind_domain_wrapped_domain(multi, tuple)
    ccall((:isl_multi_pw_aff_bind_domain_wrapped_domain, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_multi_id}), multi, tuple)
end

function isl_multi_pw_aff_involves_param_id(multi, id)
    ccall((:isl_multi_pw_aff_involves_param_id, libisl), isl_bool, (Ptr{isl_multi_pw_aff}, Ptr{isl_id}), multi, id)
end

mutable struct isl_id_list end

function isl_multi_pw_aff_involves_param_id_list(multi, list)
    ccall((:isl_multi_pw_aff_involves_param_id_list, libisl), isl_bool, (Ptr{isl_multi_pw_aff}, Ptr{isl_id_list}), multi, list)
end

function isl_pw_multi_aff_zero(space)
    ccall((:isl_pw_multi_aff_zero, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_space},), space)
end

function isl_pw_multi_aff_identity(space)
    ccall((:isl_pw_multi_aff_identity, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_space},), space)
end

function isl_pw_multi_aff_range_map(space)
    ccall((:isl_pw_multi_aff_range_map, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_space},), space)
end

function isl_pw_multi_aff_project_out_map(space, type, first, n)
    ccall((:isl_pw_multi_aff_project_out_map, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_space}, isl_dim_type, Cuint, Cuint), space, type, first, n)
end

function isl_pw_multi_aff_from_multi_aff(ma)
    ccall((:isl_pw_multi_aff_from_multi_aff, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_multi_aff},), ma)
end

function isl_pw_multi_aff_from_pw_aff(pa)
    ccall((:isl_pw_multi_aff_from_pw_aff, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_aff},), pa)
end

function isl_pw_multi_aff_alloc(set, maff)
    ccall((:isl_pw_multi_aff_alloc, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_set}, Ptr{isl_multi_aff}), set, maff)
end

function isl_pw_multi_aff_copy(pma)
    ccall((:isl_pw_multi_aff_copy, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_pw_multi_aff_free(pma)
    ccall((:isl_pw_multi_aff_free, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_pw_multi_aff_dim(pma, type)
    ccall((:isl_pw_multi_aff_dim, libisl), isl_size, (Ptr{isl_pw_multi_aff}, isl_dim_type), pma, type)
end

function isl_pw_multi_aff_involves_param_id(pma, id)
    ccall((:isl_pw_multi_aff_involves_param_id, libisl), isl_bool, (Ptr{isl_pw_multi_aff}, Ptr{isl_id}), pma, id)
end

function isl_pw_multi_aff_involves_dims(pma, type, first, n)
    ccall((:isl_pw_multi_aff_involves_dims, libisl), isl_bool, (Ptr{isl_pw_multi_aff}, isl_dim_type, Cuint, Cuint), pma, type, first, n)
end

function isl_pw_multi_aff_get_pw_aff(pma, pos)
    ccall((:isl_pw_multi_aff_get_pw_aff, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_multi_aff}, Cint), pma, pos)
end

function isl_pw_multi_aff_set_pw_aff(pma, pos, pa)
    ccall((:isl_pw_multi_aff_set_pw_aff, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Cuint, Ptr{isl_pw_aff}), pma, pos, pa)
end

function isl_pw_multi_aff_get_ctx(pma)
    ccall((:isl_pw_multi_aff_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_pw_multi_aff_get_domain_space(pma)
    ccall((:isl_pw_multi_aff_get_domain_space, libisl), Ptr{isl_space}, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_pw_multi_aff_get_space(pma)
    ccall((:isl_pw_multi_aff_get_space, libisl), Ptr{isl_space}, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_pw_multi_aff_has_tuple_name(pma, type)
    ccall((:isl_pw_multi_aff_has_tuple_name, libisl), isl_bool, (Ptr{isl_pw_multi_aff}, isl_dim_type), pma, type)
end

function isl_pw_multi_aff_get_tuple_name(pma, type)
    ccall((:isl_pw_multi_aff_get_tuple_name, libisl), Ptr{Cchar}, (Ptr{isl_pw_multi_aff}, isl_dim_type), pma, type)
end

function isl_pw_multi_aff_get_tuple_id(pma, type)
    ccall((:isl_pw_multi_aff_get_tuple_id, libisl), Ptr{isl_id}, (Ptr{isl_pw_multi_aff}, isl_dim_type), pma, type)
end

function isl_pw_multi_aff_has_tuple_id(pma, type)
    ccall((:isl_pw_multi_aff_has_tuple_id, libisl), isl_bool, (Ptr{isl_pw_multi_aff}, isl_dim_type), pma, type)
end

function isl_pw_multi_aff_set_tuple_id(pma, type, id)
    ccall((:isl_pw_multi_aff_set_tuple_id, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, isl_dim_type, Ptr{isl_id}), pma, type, id)
end

function isl_pw_multi_aff_reset_tuple_id(pma, type)
    ccall((:isl_pw_multi_aff_reset_tuple_id, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, isl_dim_type), pma, type)
end

function isl_pw_multi_aff_reset_user(pma)
    ccall((:isl_pw_multi_aff_reset_user, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_pw_multi_aff_find_dim_by_name(pma, type, name)
    ccall((:isl_pw_multi_aff_find_dim_by_name, libisl), Cint, (Ptr{isl_pw_multi_aff}, isl_dim_type, Ptr{Cchar}), pma, type, name)
end

function isl_pw_multi_aff_drop_dims(pma, type, first, n)
    ccall((:isl_pw_multi_aff_drop_dims, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, isl_dim_type, Cuint, Cuint), pma, type, first, n)
end

function isl_pw_multi_aff_domain(pma)
    ccall((:isl_pw_multi_aff_domain, libisl), Ptr{isl_set}, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_pw_multi_aff_empty(space)
    ccall((:isl_pw_multi_aff_empty, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_space},), space)
end

function isl_pw_multi_aff_from_domain(set)
    ccall((:isl_pw_multi_aff_from_domain, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_set},), set)
end

function isl_pw_multi_aff_multi_val_on_domain(domain, mv)
    ccall((:isl_pw_multi_aff_multi_val_on_domain, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_set}, Ptr{isl_multi_val}), domain, mv)
end

function isl_pw_multi_aff_get_dim_name(pma, type, pos)
    ccall((:isl_pw_multi_aff_get_dim_name, libisl), Ptr{Cchar}, (Ptr{isl_pw_multi_aff}, isl_dim_type, Cuint), pma, type, pos)
end

function isl_pw_multi_aff_get_dim_id(pma, type, pos)
    ccall((:isl_pw_multi_aff_get_dim_id, libisl), Ptr{isl_id}, (Ptr{isl_pw_multi_aff}, isl_dim_type, Cuint), pma, type, pos)
end

function isl_pw_multi_aff_set_dim_id(pma, type, pos, id)
    ccall((:isl_pw_multi_aff_set_dim_id, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, isl_dim_type, Cuint, Ptr{isl_id}), pma, type, pos, id)
end

function isl_pw_multi_aff_involves_nan(pma)
    ccall((:isl_pw_multi_aff_involves_nan, libisl), isl_bool, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_pw_multi_aff_plain_is_equal(pma1, pma2)
    ccall((:isl_pw_multi_aff_plain_is_equal, libisl), isl_bool, (Ptr{isl_pw_multi_aff}, Ptr{isl_pw_multi_aff}), pma1, pma2)
end

function isl_pw_multi_aff_is_equal(pma1, pma2)
    ccall((:isl_pw_multi_aff_is_equal, libisl), isl_bool, (Ptr{isl_pw_multi_aff}, Ptr{isl_pw_multi_aff}), pma1, pma2)
end

function isl_pw_multi_aff_fix_si(pma, type, pos, value)
    ccall((:isl_pw_multi_aff_fix_si, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, isl_dim_type, Cuint, Cint), pma, type, pos, value)
end

function isl_pw_multi_aff_union_add(pma1, pma2)
    ccall((:isl_pw_multi_aff_union_add, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_pw_multi_aff}), pma1, pma2)
end

function isl_pw_multi_aff_neg(pma)
    ccall((:isl_pw_multi_aff_neg, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_pw_multi_aff_add(pma1, pma2)
    ccall((:isl_pw_multi_aff_add, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_pw_multi_aff}), pma1, pma2)
end

function isl_pw_multi_aff_sub(pma1, pma2)
    ccall((:isl_pw_multi_aff_sub, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_pw_multi_aff}), pma1, pma2)
end

function isl_pw_multi_aff_scale_val(pma, v)
    ccall((:isl_pw_multi_aff_scale_val, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_val}), pma, v)
end

function isl_pw_multi_aff_scale_down_val(pma, v)
    ccall((:isl_pw_multi_aff_scale_down_val, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_val}), pma, v)
end

function isl_pw_multi_aff_scale_multi_val(pma, mv)
    ccall((:isl_pw_multi_aff_scale_multi_val, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_multi_val}), pma, mv)
end

function isl_pw_multi_aff_union_lexmin(pma1, pma2)
    ccall((:isl_pw_multi_aff_union_lexmin, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_pw_multi_aff}), pma1, pma2)
end

function isl_pw_multi_aff_union_lexmax(pma1, pma2)
    ccall((:isl_pw_multi_aff_union_lexmax, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_pw_multi_aff}), pma1, pma2)
end

function isl_multi_aff_flatten_domain(ma)
    ccall((:isl_multi_aff_flatten_domain, libisl), Ptr{isl_multi_aff}, (Ptr{isl_multi_aff},), ma)
end

function isl_pw_multi_aff_range_product(pma1, pma2)
    ccall((:isl_pw_multi_aff_range_product, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_pw_multi_aff}), pma1, pma2)
end

function isl_pw_multi_aff_flat_range_product(pma1, pma2)
    ccall((:isl_pw_multi_aff_flat_range_product, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_pw_multi_aff}), pma1, pma2)
end

function isl_pw_multi_aff_product(pma1, pma2)
    ccall((:isl_pw_multi_aff_product, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_pw_multi_aff}), pma1, pma2)
end

function isl_pw_multi_aff_range_factor_domain(pma)
    ccall((:isl_pw_multi_aff_range_factor_domain, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_pw_multi_aff_range_factor_range(pma)
    ccall((:isl_pw_multi_aff_range_factor_range, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_pw_multi_aff_intersect_params(pma, set)
    ccall((:isl_pw_multi_aff_intersect_params, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_set}), pma, set)
end

function isl_pw_multi_aff_intersect_domain(pma, set)
    ccall((:isl_pw_multi_aff_intersect_domain, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_set}), pma, set)
end

function isl_pw_multi_aff_intersect_domain_wrapped_domain(pma, set)
    ccall((:isl_pw_multi_aff_intersect_domain_wrapped_domain, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_set}), pma, set)
end

function isl_pw_multi_aff_intersect_domain_wrapped_range(pma, set)
    ccall((:isl_pw_multi_aff_intersect_domain_wrapped_range, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_set}), pma, set)
end

function isl_pw_multi_aff_subtract_domain(pma, set)
    ccall((:isl_pw_multi_aff_subtract_domain, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_set}), pma, set)
end

function isl_pw_multi_aff_project_domain_on_params(pma)
    ccall((:isl_pw_multi_aff_project_domain_on_params, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_pw_multi_aff_align_params(pma, model)
    ccall((:isl_pw_multi_aff_align_params, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_space}), pma, model)
end

function isl_pw_multi_aff_drop_unused_params(pma)
    ccall((:isl_pw_multi_aff_drop_unused_params, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_pw_multi_aff_coalesce(pma)
    ccall((:isl_pw_multi_aff_coalesce, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_pw_multi_aff_gist_params(pma, set)
    ccall((:isl_pw_multi_aff_gist_params, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_set}), pma, set)
end

function isl_pw_multi_aff_gist(pma, set)
    ccall((:isl_pw_multi_aff_gist, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_set}), pma, set)
end

function isl_pw_multi_aff_pullback_multi_aff(pma, ma)
    ccall((:isl_pw_multi_aff_pullback_multi_aff, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_multi_aff}), pma, ma)
end

function isl_pw_multi_aff_pullback_pw_multi_aff(pma1, pma2)
    ccall((:isl_pw_multi_aff_pullback_pw_multi_aff, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_pw_multi_aff}), pma1, pma2)
end

function isl_pw_multi_aff_n_piece(pma)
    ccall((:isl_pw_multi_aff_n_piece, libisl), isl_size, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_pw_multi_aff_foreach_piece(pma, fn, user)
    ccall((:isl_pw_multi_aff_foreach_piece, libisl), isl_stat, (Ptr{isl_pw_multi_aff}, Ptr{Cvoid}, Ptr{Cvoid}), pma, fn, user)
end

function isl_pw_multi_aff_isa_multi_aff(pma)
    ccall((:isl_pw_multi_aff_isa_multi_aff, libisl), isl_bool, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_pw_multi_aff_as_multi_aff(pma)
    ccall((:isl_pw_multi_aff_as_multi_aff, libisl), Ptr{isl_multi_aff}, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_map_from_pw_multi_aff(pma)
    ccall((:isl_map_from_pw_multi_aff, libisl), Ptr{isl_map}, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_set_from_pw_multi_aff(pma)
    ccall((:isl_set_from_pw_multi_aff, libisl), Ptr{isl_set}, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_pw_multi_aff_to_str(pma)
    ccall((:isl_pw_multi_aff_to_str, libisl), Ptr{Cchar}, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_printer_print_pw_multi_aff(p, pma)
    ccall((:isl_printer_print_pw_multi_aff, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_pw_multi_aff}), p, pma)
end

function isl_pw_multi_aff_from_set(set)
    ccall((:isl_pw_multi_aff_from_set, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_set},), set)
end

function isl_pw_multi_aff_from_map(map)
    ccall((:isl_pw_multi_aff_from_map, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_map},), map)
end

function isl_pw_multi_aff_bind_domain(pma, tuple)
    ccall((:isl_pw_multi_aff_bind_domain, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_multi_id}), pma, tuple)
end

function isl_pw_multi_aff_bind_domain_wrapped_domain(pma, tuple)
    ccall((:isl_pw_multi_aff_bind_domain_wrapped_domain, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff}, Ptr{isl_multi_id}), pma, tuple)
end

function isl_pw_multi_aff_read_from_str(ctx, str)
    ccall((:isl_pw_multi_aff_read_from_str, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_pw_multi_aff_dump(pma)
    ccall((:isl_pw_multi_aff_dump, libisl), Cvoid, (Ptr{isl_pw_multi_aff},), pma)
end

mutable struct isl_union_pw_multi_aff end

function isl_union_pw_multi_aff_empty_ctx(ctx)
    ccall((:isl_union_pw_multi_aff_empty_ctx, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_ctx},), ctx)
end

function isl_union_pw_multi_aff_empty_space(space)
    ccall((:isl_union_pw_multi_aff_empty_space, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_space},), space)
end

function isl_union_pw_multi_aff_empty(space)
    ccall((:isl_union_pw_multi_aff_empty, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_space},), space)
end

function isl_union_pw_multi_aff_from_aff(aff)
    ccall((:isl_union_pw_multi_aff_from_aff, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_aff},), aff)
end

function isl_union_pw_multi_aff_from_pw_multi_aff(pma)
    ccall((:isl_union_pw_multi_aff_from_pw_multi_aff, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_pw_multi_aff},), pma)
end

mutable struct isl_union_set end

function isl_union_pw_multi_aff_from_domain(uset)
    ccall((:isl_union_pw_multi_aff_from_domain, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_set},), uset)
end

function isl_union_pw_multi_aff_multi_val_on_domain(domain, mv)
    ccall((:isl_union_pw_multi_aff_multi_val_on_domain, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_set}, Ptr{isl_multi_val}), domain, mv)
end

mutable struct isl_union_pw_aff end

function isl_union_pw_aff_param_on_domain_id(domain, id)
    ccall((:isl_union_pw_aff_param_on_domain_id, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_set}, Ptr{isl_id}), domain, id)
end

function isl_union_pw_multi_aff_copy(upma)
    ccall((:isl_union_pw_multi_aff_copy, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff},), upma)
end

function isl_union_pw_multi_aff_free(upma)
    ccall((:isl_union_pw_multi_aff_free, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff},), upma)
end

function isl_union_set_identity_union_pw_multi_aff(uset)
    ccall((:isl_union_set_identity_union_pw_multi_aff, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_set},), uset)
end

function isl_union_pw_multi_aff_get_union_pw_aff(upma, pos)
    ccall((:isl_union_pw_multi_aff_get_union_pw_aff, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_multi_aff}, Cint), upma, pos)
end

function isl_union_pw_multi_aff_add_pw_multi_aff(upma, pma)
    ccall((:isl_union_pw_multi_aff_add_pw_multi_aff, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, Ptr{isl_pw_multi_aff}), upma, pma)
end

function isl_union_pw_multi_aff_get_ctx(upma)
    ccall((:isl_union_pw_multi_aff_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_union_pw_multi_aff},), upma)
end

function isl_union_pw_multi_aff_get_space(upma)
    ccall((:isl_union_pw_multi_aff_get_space, libisl), Ptr{isl_space}, (Ptr{isl_union_pw_multi_aff},), upma)
end

mutable struct isl_pw_multi_aff_list end

function isl_union_pw_multi_aff_get_pw_multi_aff_list(upma)
    ccall((:isl_union_pw_multi_aff_get_pw_multi_aff_list, libisl), Ptr{isl_pw_multi_aff_list}, (Ptr{isl_union_pw_multi_aff},), upma)
end

function isl_union_pw_multi_aff_dim(upma, type)
    ccall((:isl_union_pw_multi_aff_dim, libisl), isl_size, (Ptr{isl_union_pw_multi_aff}, isl_dim_type), upma, type)
end

function isl_union_pw_multi_aff_set_dim_name(upma, type, pos, s)
    ccall((:isl_union_pw_multi_aff_set_dim_name, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, isl_dim_type, Cuint, Ptr{Cchar}), upma, type, pos, s)
end

function isl_union_pw_multi_aff_find_dim_by_name(upma, type, name)
    ccall((:isl_union_pw_multi_aff_find_dim_by_name, libisl), Cint, (Ptr{isl_union_pw_multi_aff}, isl_dim_type, Ptr{Cchar}), upma, type, name)
end

function isl_union_pw_multi_aff_drop_dims(upma, type, first, n)
    ccall((:isl_union_pw_multi_aff_drop_dims, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, isl_dim_type, Cuint, Cuint), upma, type, first, n)
end

function isl_union_pw_multi_aff_reset_user(upma)
    ccall((:isl_union_pw_multi_aff_reset_user, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff},), upma)
end

function isl_union_pw_multi_aff_coalesce(upma)
    ccall((:isl_union_pw_multi_aff_coalesce, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff},), upma)
end

function isl_union_pw_multi_aff_gist_params(upma, context)
    ccall((:isl_union_pw_multi_aff_gist_params, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, Ptr{isl_set}), upma, context)
end

function isl_union_pw_multi_aff_gist(upma, context)
    ccall((:isl_union_pw_multi_aff_gist, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, Ptr{isl_union_set}), upma, context)
end

function isl_union_pw_multi_aff_pullback_union_pw_multi_aff(upma1, upma2)
    ccall((:isl_union_pw_multi_aff_pullback_union_pw_multi_aff, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, Ptr{isl_union_pw_multi_aff}), upma1, upma2)
end

function isl_union_pw_multi_aff_align_params(upma, model)
    ccall((:isl_union_pw_multi_aff_align_params, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, Ptr{isl_space}), upma, model)
end

function isl_union_pw_multi_aff_n_pw_multi_aff(upma)
    ccall((:isl_union_pw_multi_aff_n_pw_multi_aff, libisl), isl_size, (Ptr{isl_union_pw_multi_aff},), upma)
end

function isl_union_pw_multi_aff_foreach_pw_multi_aff(upma, fn, user)
    ccall((:isl_union_pw_multi_aff_foreach_pw_multi_aff, libisl), isl_stat, (Ptr{isl_union_pw_multi_aff}, Ptr{Cvoid}, Ptr{Cvoid}), upma, fn, user)
end

function isl_union_pw_multi_aff_extract_pw_multi_aff(upma, space)
    ccall((:isl_union_pw_multi_aff_extract_pw_multi_aff, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, Ptr{isl_space}), upma, space)
end

function isl_union_pw_multi_aff_isa_pw_multi_aff(upma)
    ccall((:isl_union_pw_multi_aff_isa_pw_multi_aff, libisl), isl_bool, (Ptr{isl_union_pw_multi_aff},), upma)
end

function isl_union_pw_multi_aff_as_pw_multi_aff(upma)
    ccall((:isl_union_pw_multi_aff_as_pw_multi_aff, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff},), upma)
end

function isl_union_pw_multi_aff_involves_nan(upma)
    ccall((:isl_union_pw_multi_aff_involves_nan, libisl), isl_bool, (Ptr{isl_union_pw_multi_aff},), upma)
end

function isl_union_pw_multi_aff_plain_is_equal(upma1, upma2)
    ccall((:isl_union_pw_multi_aff_plain_is_equal, libisl), isl_bool, (Ptr{isl_union_pw_multi_aff}, Ptr{isl_union_pw_multi_aff}), upma1, upma2)
end

function isl_union_pw_multi_aff_domain(upma)
    ccall((:isl_union_pw_multi_aff_domain, libisl), Ptr{isl_union_set}, (Ptr{isl_union_pw_multi_aff},), upma)
end

function isl_union_pw_multi_aff_neg(upma)
    ccall((:isl_union_pw_multi_aff_neg, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff},), upma)
end

function isl_union_pw_multi_aff_add(upma1, upma2)
    ccall((:isl_union_pw_multi_aff_add, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, Ptr{isl_union_pw_multi_aff}), upma1, upma2)
end

function isl_union_pw_multi_aff_union_add(upma1, upma2)
    ccall((:isl_union_pw_multi_aff_union_add, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, Ptr{isl_union_pw_multi_aff}), upma1, upma2)
end

function isl_union_pw_multi_aff_sub(upma1, upma2)
    ccall((:isl_union_pw_multi_aff_sub, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, Ptr{isl_union_pw_multi_aff}), upma1, upma2)
end

function isl_union_pw_multi_aff_scale_val(upma, val)
    ccall((:isl_union_pw_multi_aff_scale_val, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, Ptr{isl_val}), upma, val)
end

function isl_union_pw_multi_aff_scale_down_val(upma, val)
    ccall((:isl_union_pw_multi_aff_scale_down_val, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, Ptr{isl_val}), upma, val)
end

function isl_union_pw_multi_aff_scale_multi_val(upma, mv)
    ccall((:isl_union_pw_multi_aff_scale_multi_val, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, Ptr{isl_multi_val}), upma, mv)
end

function isl_union_pw_multi_aff_flat_range_product(upma1, upma2)
    ccall((:isl_union_pw_multi_aff_flat_range_product, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, Ptr{isl_union_pw_multi_aff}), upma1, upma2)
end

function isl_union_pw_multi_aff_range_factor_domain(upma)
    ccall((:isl_union_pw_multi_aff_range_factor_domain, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff},), upma)
end

function isl_union_pw_multi_aff_range_factor_range(upma)
    ccall((:isl_union_pw_multi_aff_range_factor_range, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff},), upma)
end

function isl_union_pw_multi_aff_intersect_params(upma, set)
    ccall((:isl_union_pw_multi_aff_intersect_params, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, Ptr{isl_set}), upma, set)
end

function isl_union_pw_multi_aff_intersect_domain(upma, uset)
    ccall((:isl_union_pw_multi_aff_intersect_domain, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, Ptr{isl_union_set}), upma, uset)
end

function isl_union_pw_multi_aff_intersect_domain_wrapped_domain(upma, uset)
    ccall((:isl_union_pw_multi_aff_intersect_domain_wrapped_domain, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, Ptr{isl_union_set}), upma, uset)
end

function isl_union_pw_multi_aff_intersect_domain_wrapped_range(upma, uset)
    ccall((:isl_union_pw_multi_aff_intersect_domain_wrapped_range, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, Ptr{isl_union_set}), upma, uset)
end

function isl_union_pw_multi_aff_subtract_domain(upma, uset)
    ccall((:isl_union_pw_multi_aff_subtract_domain, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff}, Ptr{isl_union_set}), upma, uset)
end

mutable struct isl_union_map end

function isl_union_map_from_union_pw_multi_aff(upma)
    ccall((:isl_union_map_from_union_pw_multi_aff, libisl), Ptr{isl_union_map}, (Ptr{isl_union_pw_multi_aff},), upma)
end

function isl_printer_print_union_pw_multi_aff(p, upma)
    ccall((:isl_printer_print_union_pw_multi_aff, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_union_pw_multi_aff}), p, upma)
end

function isl_union_pw_multi_aff_from_union_set(uset)
    ccall((:isl_union_pw_multi_aff_from_union_set, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_set},), uset)
end

function isl_union_pw_multi_aff_from_union_map(umap)
    ccall((:isl_union_pw_multi_aff_from_union_map, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_map},), umap)
end

function isl_union_pw_multi_aff_read_from_str(ctx, str)
    ccall((:isl_union_pw_multi_aff_read_from_str, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_union_pw_multi_aff_dump(upma)
    ccall((:isl_union_pw_multi_aff_dump, libisl), Cvoid, (Ptr{isl_union_pw_multi_aff},), upma)
end

function isl_union_pw_multi_aff_to_str(upma)
    ccall((:isl_union_pw_multi_aff_to_str, libisl), Ptr{Cchar}, (Ptr{isl_union_pw_multi_aff},), upma)
end

function isl_multi_pw_aff_get_hash(mpa)
    ccall((:isl_multi_pw_aff_get_hash, libisl), UInt32, (Ptr{isl_multi_pw_aff},), mpa)
end

function isl_multi_pw_aff_from_multi_aff(ma)
    ccall((:isl_multi_pw_aff_from_multi_aff, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_aff},), ma)
end

function isl_multi_pw_aff_from_pw_aff(pa)
    ccall((:isl_multi_pw_aff_from_pw_aff, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_pw_aff},), pa)
end

function isl_multi_pw_aff_domain(mpa)
    ccall((:isl_multi_pw_aff_domain, libisl), Ptr{isl_set}, (Ptr{isl_multi_pw_aff},), mpa)
end

function isl_multi_pw_aff_intersect_params(mpa, set)
    ccall((:isl_multi_pw_aff_intersect_params, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_set}), mpa, set)
end

function isl_multi_pw_aff_intersect_domain(mpa, domain)
    ccall((:isl_multi_pw_aff_intersect_domain, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_set}), mpa, domain)
end

function isl_multi_pw_aff_coalesce(mpa)
    ccall((:isl_multi_pw_aff_coalesce, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff},), mpa)
end

function isl_multi_pw_aff_gist(mpa, set)
    ccall((:isl_multi_pw_aff_gist, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_set}), mpa, set)
end

function isl_multi_pw_aff_gist_params(mpa, set)
    ccall((:isl_multi_pw_aff_gist_params, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_set}), mpa, set)
end

function isl_multi_pw_aff_is_cst(mpa)
    ccall((:isl_multi_pw_aff_is_cst, libisl), isl_bool, (Ptr{isl_multi_pw_aff},), mpa)
end

function isl_multi_pw_aff_is_equal(mpa1, mpa2)
    ccall((:isl_multi_pw_aff_is_equal, libisl), isl_bool, (Ptr{isl_multi_pw_aff}, Ptr{isl_multi_pw_aff}), mpa1, mpa2)
end

function isl_multi_pw_aff_pullback_multi_aff(mpa, ma)
    ccall((:isl_multi_pw_aff_pullback_multi_aff, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_multi_aff}), mpa, ma)
end

function isl_multi_pw_aff_pullback_pw_multi_aff(mpa, pma)
    ccall((:isl_multi_pw_aff_pullback_pw_multi_aff, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_pw_multi_aff}), mpa, pma)
end

function isl_multi_pw_aff_pullback_multi_pw_aff(mpa1, mpa2)
    ccall((:isl_multi_pw_aff_pullback_multi_pw_aff, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, Ptr{isl_multi_pw_aff}), mpa1, mpa2)
end

function isl_multi_pw_aff_move_dims(pma, dst_type, dst_pos, src_type, src_pos, n)
    ccall((:isl_multi_pw_aff_move_dims, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_pw_aff}, isl_dim_type, Cuint, isl_dim_type, Cuint, Cuint), pma, dst_type, dst_pos, src_type, src_pos, n)
end

function isl_set_from_multi_pw_aff(mpa)
    ccall((:isl_set_from_multi_pw_aff, libisl), Ptr{isl_set}, (Ptr{isl_multi_pw_aff},), mpa)
end

function isl_map_from_multi_pw_aff(mpa)
    ccall((:isl_map_from_multi_pw_aff, libisl), Ptr{isl_map}, (Ptr{isl_multi_pw_aff},), mpa)
end

function isl_pw_multi_aff_from_multi_pw_aff(mpa)
    ccall((:isl_pw_multi_aff_from_multi_pw_aff, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_multi_pw_aff},), mpa)
end

function isl_multi_pw_aff_from_pw_multi_aff(pma)
    ccall((:isl_multi_pw_aff_from_pw_multi_aff, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_pw_multi_aff},), pma)
end

function isl_multi_pw_aff_eq_map(mpa1, mpa2)
    ccall((:isl_multi_pw_aff_eq_map, libisl), Ptr{isl_map}, (Ptr{isl_multi_pw_aff}, Ptr{isl_multi_pw_aff}), mpa1, mpa2)
end

function isl_multi_pw_aff_lex_lt_map(mpa1, mpa2)
    ccall((:isl_multi_pw_aff_lex_lt_map, libisl), Ptr{isl_map}, (Ptr{isl_multi_pw_aff}, Ptr{isl_multi_pw_aff}), mpa1, mpa2)
end

function isl_multi_pw_aff_lex_gt_map(mpa1, mpa2)
    ccall((:isl_multi_pw_aff_lex_gt_map, libisl), Ptr{isl_map}, (Ptr{isl_multi_pw_aff}, Ptr{isl_multi_pw_aff}), mpa1, mpa2)
end

function isl_multi_pw_aff_bind(mpa, tuple)
    ccall((:isl_multi_pw_aff_bind, libisl), Ptr{isl_set}, (Ptr{isl_multi_pw_aff}, Ptr{isl_multi_id}), mpa, tuple)
end

function isl_multi_pw_aff_read_from_str(ctx, str)
    ccall((:isl_multi_pw_aff_read_from_str, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_multi_pw_aff_to_str(mpa)
    ccall((:isl_multi_pw_aff_to_str, libisl), Ptr{Cchar}, (Ptr{isl_multi_pw_aff},), mpa)
end

function isl_printer_print_multi_pw_aff(p, mpa)
    ccall((:isl_printer_print_multi_pw_aff, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_multi_pw_aff}), p, mpa)
end

function isl_multi_pw_aff_dump(mpa)
    ccall((:isl_multi_pw_aff_dump, libisl), Cvoid, (Ptr{isl_multi_pw_aff},), mpa)
end

function isl_union_pw_aff_copy(upa)
    ccall((:isl_union_pw_aff_copy, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff},), upa)
end

function isl_union_pw_aff_free(upa)
    ccall((:isl_union_pw_aff_free, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff},), upa)
end

function isl_union_pw_aff_get_ctx(upa)
    ccall((:isl_union_pw_aff_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_union_pw_aff},), upa)
end

function isl_union_pw_aff_get_space(upa)
    ccall((:isl_union_pw_aff_get_space, libisl), Ptr{isl_space}, (Ptr{isl_union_pw_aff},), upa)
end

function isl_union_pw_aff_get_pw_aff_list(upa)
    ccall((:isl_union_pw_aff_get_pw_aff_list, libisl), Ptr{isl_pw_aff_list}, (Ptr{isl_union_pw_aff},), upa)
end

function isl_union_pw_aff_dim(upa, type)
    ccall((:isl_union_pw_aff_dim, libisl), isl_size, (Ptr{isl_union_pw_aff}, isl_dim_type), upa, type)
end

function isl_union_pw_aff_set_dim_name(upa, type, pos, s)
    ccall((:isl_union_pw_aff_set_dim_name, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff}, isl_dim_type, Cuint, Ptr{Cchar}), upa, type, pos, s)
end

function isl_union_pw_aff_find_dim_by_name(upa, type, name)
    ccall((:isl_union_pw_aff_find_dim_by_name, libisl), Cint, (Ptr{isl_union_pw_aff}, isl_dim_type, Ptr{Cchar}), upa, type, name)
end

function isl_union_pw_aff_drop_dims(upa, type, first, n)
    ccall((:isl_union_pw_aff_drop_dims, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff}, isl_dim_type, Cuint, Cuint), upa, type, first, n)
end

function isl_union_pw_aff_reset_user(upa)
    ccall((:isl_union_pw_aff_reset_user, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff},), upa)
end

function isl_union_pw_aff_empty_ctx(ctx)
    ccall((:isl_union_pw_aff_empty_ctx, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_ctx},), ctx)
end

function isl_union_pw_aff_empty_space(space)
    ccall((:isl_union_pw_aff_empty_space, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_space},), space)
end

function isl_union_pw_aff_empty(space)
    ccall((:isl_union_pw_aff_empty, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_space},), space)
end

function isl_union_pw_aff_from_pw_aff(pa)
    ccall((:isl_union_pw_aff_from_pw_aff, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_pw_aff},), pa)
end

function isl_union_pw_aff_val_on_domain(domain, v)
    ccall((:isl_union_pw_aff_val_on_domain, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_set}, Ptr{isl_val}), domain, v)
end

function isl_union_pw_aff_aff_on_domain(domain, aff)
    ccall((:isl_union_pw_aff_aff_on_domain, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_set}, Ptr{isl_aff}), domain, aff)
end

function isl_union_pw_aff_pw_aff_on_domain(domain, pa)
    ccall((:isl_union_pw_aff_pw_aff_on_domain, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_set}, Ptr{isl_pw_aff}), domain, pa)
end

function isl_union_pw_aff_add_pw_aff(upa, pa)
    ccall((:isl_union_pw_aff_add_pw_aff, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff}, Ptr{isl_pw_aff}), upa, pa)
end

function isl_union_pw_multi_aff_from_union_pw_aff(upa)
    ccall((:isl_union_pw_multi_aff_from_union_pw_aff, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_aff},), upa)
end

function isl_union_pw_aff_n_pw_aff(upa)
    ccall((:isl_union_pw_aff_n_pw_aff, libisl), isl_size, (Ptr{isl_union_pw_aff},), upa)
end

function isl_union_pw_aff_foreach_pw_aff(upa, fn, user)
    ccall((:isl_union_pw_aff_foreach_pw_aff, libisl), isl_stat, (Ptr{isl_union_pw_aff}, Ptr{Cvoid}, Ptr{Cvoid}), upa, fn, user)
end

function isl_union_pw_aff_extract_pw_aff(upa, space)
    ccall((:isl_union_pw_aff_extract_pw_aff, libisl), Ptr{isl_pw_aff}, (Ptr{isl_union_pw_aff}, Ptr{isl_space}), upa, space)
end

function isl_union_pw_aff_involves_nan(upa)
    ccall((:isl_union_pw_aff_involves_nan, libisl), isl_bool, (Ptr{isl_union_pw_aff},), upa)
end

function isl_union_pw_aff_plain_is_equal(upa1, upa2)
    ccall((:isl_union_pw_aff_plain_is_equal, libisl), isl_bool, (Ptr{isl_union_pw_aff}, Ptr{isl_union_pw_aff}), upa1, upa2)
end

function isl_union_pw_aff_domain(upa)
    ccall((:isl_union_pw_aff_domain, libisl), Ptr{isl_union_set}, (Ptr{isl_union_pw_aff},), upa)
end

function isl_union_pw_aff_neg(upa)
    ccall((:isl_union_pw_aff_neg, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff},), upa)
end

function isl_union_pw_aff_add(upa1, upa2)
    ccall((:isl_union_pw_aff_add, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff}, Ptr{isl_union_pw_aff}), upa1, upa2)
end

function isl_union_pw_aff_union_add(upa1, upa2)
    ccall((:isl_union_pw_aff_union_add, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff}, Ptr{isl_union_pw_aff}), upa1, upa2)
end

function isl_union_pw_aff_sub(upa1, upa2)
    ccall((:isl_union_pw_aff_sub, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff}, Ptr{isl_union_pw_aff}), upa1, upa2)
end

function isl_union_pw_aff_coalesce(upa)
    ccall((:isl_union_pw_aff_coalesce, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff},), upa)
end

function isl_union_pw_aff_gist(upa, context)
    ccall((:isl_union_pw_aff_gist, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff}, Ptr{isl_union_set}), upa, context)
end

function isl_union_pw_aff_gist_params(upa, context)
    ccall((:isl_union_pw_aff_gist_params, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff}, Ptr{isl_set}), upa, context)
end

function isl_union_pw_aff_pullback_union_pw_multi_aff(upa, upma)
    ccall((:isl_union_pw_aff_pullback_union_pw_multi_aff, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff}, Ptr{isl_union_pw_multi_aff}), upa, upma)
end

function isl_union_pw_aff_floor(upa)
    ccall((:isl_union_pw_aff_floor, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff},), upa)
end

function isl_union_pw_aff_scale_val(upa, v)
    ccall((:isl_union_pw_aff_scale_val, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff}, Ptr{isl_val}), upa, v)
end

function isl_union_pw_aff_scale_down_val(upa, v)
    ccall((:isl_union_pw_aff_scale_down_val, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff}, Ptr{isl_val}), upa, v)
end

function isl_union_pw_aff_mod_val(upa, f)
    ccall((:isl_union_pw_aff_mod_val, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff}, Ptr{isl_val}), upa, f)
end

function isl_union_pw_aff_align_params(upa, model)
    ccall((:isl_union_pw_aff_align_params, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff}, Ptr{isl_space}), upa, model)
end

function isl_union_pw_aff_intersect_params(upa, set)
    ccall((:isl_union_pw_aff_intersect_params, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff}, Ptr{isl_set}), upa, set)
end

function isl_union_pw_aff_intersect_domain(upa, uset)
    ccall((:isl_union_pw_aff_intersect_domain, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff}, Ptr{isl_union_set}), upa, uset)
end

function isl_union_pw_aff_intersect_domain_wrapped_domain(upa, uset)
    ccall((:isl_union_pw_aff_intersect_domain_wrapped_domain, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff}, Ptr{isl_union_set}), upa, uset)
end

function isl_union_pw_aff_intersect_domain_wrapped_range(upa, uset)
    ccall((:isl_union_pw_aff_intersect_domain_wrapped_range, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff}, Ptr{isl_union_set}), upa, uset)
end

function isl_union_pw_aff_subtract_domain(upa, uset)
    ccall((:isl_union_pw_aff_subtract_domain, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff}, Ptr{isl_union_set}), upa, uset)
end

function isl_union_pw_aff_zero_union_set(upa)
    ccall((:isl_union_pw_aff_zero_union_set, libisl), Ptr{isl_union_set}, (Ptr{isl_union_pw_aff},), upa)
end

function isl_union_map_from_union_pw_aff(upa)
    ccall((:isl_union_map_from_union_pw_aff, libisl), Ptr{isl_union_map}, (Ptr{isl_union_pw_aff},), upa)
end

function isl_union_pw_aff_bind_id(upa, id)
    ccall((:isl_union_pw_aff_bind_id, libisl), Ptr{isl_union_set}, (Ptr{isl_union_pw_aff}, Ptr{isl_id}), upa, id)
end

function isl_union_pw_aff_read_from_str(ctx, str)
    ccall((:isl_union_pw_aff_read_from_str, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_union_pw_aff_to_str(upa)
    ccall((:isl_union_pw_aff_to_str, libisl), Ptr{Cchar}, (Ptr{isl_union_pw_aff},), upa)
end

function isl_printer_print_union_pw_aff(p, upa)
    ccall((:isl_printer_print_union_pw_aff, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_union_pw_aff}), p, upa)
end

function isl_union_pw_aff_dump(upa)
    ccall((:isl_union_pw_aff_dump, libisl), Cvoid, (Ptr{isl_union_pw_aff},), upa)
end

mutable struct isl_multi_union_pw_aff end

function isl_multi_union_pw_aff_get_ctx(multi)
    ccall((:isl_multi_union_pw_aff_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_multi_union_pw_aff},), multi)
end

function isl_multi_union_pw_aff_get_space(multi)
    ccall((:isl_multi_union_pw_aff_get_space, libisl), Ptr{isl_space}, (Ptr{isl_multi_union_pw_aff},), multi)
end

function isl_multi_union_pw_aff_get_domain_space(multi)
    ccall((:isl_multi_union_pw_aff_get_domain_space, libisl), Ptr{isl_space}, (Ptr{isl_multi_union_pw_aff},), multi)
end

mutable struct isl_union_pw_aff_list end

function isl_multi_union_pw_aff_from_union_pw_aff_list(space, list)
    ccall((:isl_multi_union_pw_aff_from_union_pw_aff_list, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_space}, Ptr{isl_union_pw_aff_list}), space, list)
end

function isl_multi_union_pw_aff_copy(multi)
    ccall((:isl_multi_union_pw_aff_copy, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff},), multi)
end

function isl_multi_union_pw_aff_free(multi)
    ccall((:isl_multi_union_pw_aff_free, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff},), multi)
end

function isl_multi_union_pw_aff_plain_is_equal(multi1, multi2)
    ccall((:isl_multi_union_pw_aff_plain_is_equal, libisl), isl_bool, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_multi_union_pw_aff}), multi1, multi2)
end

function isl_multi_union_pw_aff_reset_user(multi)
    ccall((:isl_multi_union_pw_aff_reset_user, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff},), multi)
end

function isl_multi_union_pw_aff_size(multi)
    ccall((:isl_multi_union_pw_aff_size, libisl), isl_size, (Ptr{isl_multi_union_pw_aff},), multi)
end

function isl_multi_union_pw_aff_get_at(multi, pos)
    ccall((:isl_multi_union_pw_aff_get_at, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Cint), multi, pos)
end

function isl_multi_union_pw_aff_get_union_pw_aff(multi, pos)
    ccall((:isl_multi_union_pw_aff_get_union_pw_aff, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Cint), multi, pos)
end

function isl_multi_union_pw_aff_set_at(multi, pos, el)
    ccall((:isl_multi_union_pw_aff_set_at, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Cint, Ptr{isl_union_pw_aff}), multi, pos, el)
end

function isl_multi_union_pw_aff_set_union_pw_aff(multi, pos, el)
    ccall((:isl_multi_union_pw_aff_set_union_pw_aff, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Cint, Ptr{isl_union_pw_aff}), multi, pos, el)
end

function isl_multi_union_pw_aff_range_splice(multi1, pos, multi2)
    ccall((:isl_multi_union_pw_aff_range_splice, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Cuint, Ptr{isl_multi_union_pw_aff}), multi1, pos, multi2)
end

function isl_multi_union_pw_aff_flatten_range(multi)
    ccall((:isl_multi_union_pw_aff_flatten_range, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff},), multi)
end

function isl_multi_union_pw_aff_flat_range_product(multi1, multi2)
    ccall((:isl_multi_union_pw_aff_flat_range_product, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_multi_union_pw_aff}), multi1, multi2)
end

function isl_multi_union_pw_aff_range_product(multi1, multi2)
    ccall((:isl_multi_union_pw_aff_range_product, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_multi_union_pw_aff}), multi1, multi2)
end

function isl_multi_union_pw_aff_factor_range(multi)
    ccall((:isl_multi_union_pw_aff_factor_range, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff},), multi)
end

function isl_multi_union_pw_aff_range_is_wrapping(multi)
    ccall((:isl_multi_union_pw_aff_range_is_wrapping, libisl), isl_bool, (Ptr{isl_multi_union_pw_aff},), multi)
end

function isl_multi_union_pw_aff_range_factor_domain(multi)
    ccall((:isl_multi_union_pw_aff_range_factor_domain, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff},), multi)
end

function isl_multi_union_pw_aff_range_factor_range(multi)
    ccall((:isl_multi_union_pw_aff_range_factor_range, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff},), multi)
end

function isl_multi_union_pw_aff_align_params(multi, model)
    ccall((:isl_multi_union_pw_aff_align_params, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_space}), multi, model)
end

function isl_multi_union_pw_aff_from_range(multi)
    ccall((:isl_multi_union_pw_aff_from_range, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff},), multi)
end

function isl_multi_union_pw_aff_scale_val(multi, v)
    ccall((:isl_multi_union_pw_aff_scale_val, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_val}), multi, v)
end

function isl_multi_union_pw_aff_scale_down_val(multi, v)
    ccall((:isl_multi_union_pw_aff_scale_down_val, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_val}), multi, v)
end

function isl_multi_union_pw_aff_scale_multi_val(multi, mv)
    ccall((:isl_multi_union_pw_aff_scale_multi_val, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_multi_val}), multi, mv)
end

function isl_multi_union_pw_aff_scale_down_multi_val(multi, mv)
    ccall((:isl_multi_union_pw_aff_scale_down_multi_val, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_multi_val}), multi, mv)
end

function isl_multi_union_pw_aff_mod_multi_val(multi, mv)
    ccall((:isl_multi_union_pw_aff_mod_multi_val, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_multi_val}), multi, mv)
end

function isl_multi_union_pw_aff_add(multi1, multi2)
    ccall((:isl_multi_union_pw_aff_add, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_multi_union_pw_aff}), multi1, multi2)
end

function isl_multi_union_pw_aff_sub(multi1, multi2)
    ccall((:isl_multi_union_pw_aff_sub, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_multi_union_pw_aff}), multi1, multi2)
end

function isl_multi_union_pw_aff_neg(multi)
    ccall((:isl_multi_union_pw_aff_neg, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff},), multi)
end

function isl_multi_union_pw_aff_zero(space)
    ccall((:isl_multi_union_pw_aff_zero, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_space},), space)
end

function isl_multi_union_pw_aff_involves_nan(multi)
    ccall((:isl_multi_union_pw_aff_involves_nan, libisl), isl_bool, (Ptr{isl_multi_union_pw_aff},), multi)
end

function isl_multi_union_pw_aff_dim(multi, type)
    ccall((:isl_multi_union_pw_aff_dim, libisl), isl_size, (Ptr{isl_multi_union_pw_aff}, isl_dim_type), multi, type)
end

function isl_multi_union_pw_aff_drop_dims(multi, type, first, n)
    ccall((:isl_multi_union_pw_aff_drop_dims, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, isl_dim_type, Cuint, Cuint), multi, type, first, n)
end

function isl_multi_union_pw_aff_find_dim_by_name(multi, type, name)
    ccall((:isl_multi_union_pw_aff_find_dim_by_name, libisl), Cint, (Ptr{isl_multi_union_pw_aff}, isl_dim_type, Ptr{Cchar}), multi, type, name)
end

function isl_multi_union_pw_aff_find_dim_by_id(multi, type, id)
    ccall((:isl_multi_union_pw_aff_find_dim_by_id, libisl), Cint, (Ptr{isl_multi_union_pw_aff}, isl_dim_type, Ptr{isl_id}), multi, type, id)
end

function isl_multi_union_pw_aff_get_dim_id(multi, type, pos)
    ccall((:isl_multi_union_pw_aff_get_dim_id, libisl), Ptr{isl_id}, (Ptr{isl_multi_union_pw_aff}, isl_dim_type, Cuint), multi, type, pos)
end

function isl_multi_union_pw_aff_set_dim_name(multi, type, pos, s)
    ccall((:isl_multi_union_pw_aff_set_dim_name, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, isl_dim_type, Cuint, Ptr{Cchar}), multi, type, pos, s)
end

function isl_multi_union_pw_aff_set_dim_id(multi, type, pos, id)
    ccall((:isl_multi_union_pw_aff_set_dim_id, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, isl_dim_type, Cuint, Ptr{isl_id}), multi, type, pos, id)
end

function isl_multi_union_pw_aff_get_tuple_name(multi, type)
    ccall((:isl_multi_union_pw_aff_get_tuple_name, libisl), Ptr{Cchar}, (Ptr{isl_multi_union_pw_aff}, isl_dim_type), multi, type)
end

function isl_multi_union_pw_aff_has_tuple_id(multi, type)
    ccall((:isl_multi_union_pw_aff_has_tuple_id, libisl), isl_bool, (Ptr{isl_multi_union_pw_aff}, isl_dim_type), multi, type)
end

function isl_multi_union_pw_aff_get_tuple_id(multi, type)
    ccall((:isl_multi_union_pw_aff_get_tuple_id, libisl), Ptr{isl_id}, (Ptr{isl_multi_union_pw_aff}, isl_dim_type), multi, type)
end

function isl_multi_union_pw_aff_set_tuple_name(multi, type, s)
    ccall((:isl_multi_union_pw_aff_set_tuple_name, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, isl_dim_type, Ptr{Cchar}), multi, type, s)
end

function isl_multi_union_pw_aff_set_tuple_id(multi, type, id)
    ccall((:isl_multi_union_pw_aff_set_tuple_id, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, isl_dim_type, Ptr{isl_id}), multi, type, id)
end

function isl_multi_union_pw_aff_reset_tuple_id(multi, type)
    ccall((:isl_multi_union_pw_aff_reset_tuple_id, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, isl_dim_type), multi, type)
end

function isl_multi_union_pw_aff_from_multi_aff(ma)
    ccall((:isl_multi_union_pw_aff_from_multi_aff, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_aff},), ma)
end

function isl_multi_union_pw_aff_from_union_pw_aff(upa)
    ccall((:isl_multi_union_pw_aff_from_union_pw_aff, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_union_pw_aff},), upa)
end

function isl_multi_union_pw_aff_from_multi_pw_aff(mpa)
    ccall((:isl_multi_union_pw_aff_from_multi_pw_aff, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_pw_aff},), mpa)
end

function isl_multi_union_pw_aff_multi_val_on_domain(domain, mv)
    ccall((:isl_multi_union_pw_aff_multi_val_on_domain, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_union_set}, Ptr{isl_multi_val}), domain, mv)
end

function isl_multi_union_pw_aff_multi_aff_on_domain(domain, ma)
    ccall((:isl_multi_union_pw_aff_multi_aff_on_domain, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_union_set}, Ptr{isl_multi_aff}), domain, ma)
end

function isl_multi_union_pw_aff_pw_multi_aff_on_domain(domain, pma)
    ccall((:isl_multi_union_pw_aff_pw_multi_aff_on_domain, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_union_set}, Ptr{isl_pw_multi_aff}), domain, pma)
end

function isl_multi_union_pw_aff_floor(mupa)
    ccall((:isl_multi_union_pw_aff_floor, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff},), mupa)
end

function isl_multi_union_pw_aff_intersect_domain(mupa, uset)
    ccall((:isl_multi_union_pw_aff_intersect_domain, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_union_set}), mupa, uset)
end

function isl_multi_union_pw_aff_intersect_params(mupa, params)
    ccall((:isl_multi_union_pw_aff_intersect_params, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_set}), mupa, params)
end

function isl_multi_union_pw_aff_intersect_range(mupa, set)
    ccall((:isl_multi_union_pw_aff_intersect_range, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_set}), mupa, set)
end

function isl_multi_union_pw_aff_domain(mupa)
    ccall((:isl_multi_union_pw_aff_domain, libisl), Ptr{isl_union_set}, (Ptr{isl_multi_union_pw_aff},), mupa)
end

function isl_multi_union_pw_aff_coalesce(aff)
    ccall((:isl_multi_union_pw_aff_coalesce, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff},), aff)
end

function isl_multi_union_pw_aff_gist(aff, context)
    ccall((:isl_multi_union_pw_aff_gist, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_union_set}), aff, context)
end

function isl_multi_union_pw_aff_gist_params(aff, context)
    ccall((:isl_multi_union_pw_aff_gist_params, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_set}), aff, context)
end

function isl_multi_union_pw_aff_apply_aff(mupa, aff)
    ccall((:isl_multi_union_pw_aff_apply_aff, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_aff}), mupa, aff)
end

function isl_multi_union_pw_aff_apply_multi_aff(mupa, ma)
    ccall((:isl_multi_union_pw_aff_apply_multi_aff, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_multi_aff}), mupa, ma)
end

function isl_multi_union_pw_aff_apply_pw_aff(mupa, pa)
    ccall((:isl_multi_union_pw_aff_apply_pw_aff, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_pw_aff}), mupa, pa)
end

function isl_multi_union_pw_aff_apply_pw_multi_aff(mupa, pma)
    ccall((:isl_multi_union_pw_aff_apply_pw_multi_aff, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_pw_multi_aff}), mupa, pma)
end

function isl_multi_union_pw_aff_pullback_union_pw_multi_aff(mupa, upma)
    ccall((:isl_multi_union_pw_aff_pullback_union_pw_multi_aff, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_union_pw_multi_aff}), mupa, upma)
end

function isl_union_pw_multi_aff_from_multi_union_pw_aff(mupa)
    ccall((:isl_union_pw_multi_aff_from_multi_union_pw_aff, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_multi_union_pw_aff},), mupa)
end

function isl_multi_union_pw_aff_union_add(mupa1, mupa2)
    ccall((:isl_multi_union_pw_aff_union_add, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_multi_union_pw_aff}), mupa1, mupa2)
end

function isl_multi_union_pw_aff_from_union_pw_multi_aff(upma)
    ccall((:isl_multi_union_pw_aff_from_union_pw_multi_aff, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_union_pw_multi_aff},), upma)
end

function isl_multi_union_pw_aff_from_union_map(umap)
    ccall((:isl_multi_union_pw_aff_from_union_map, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_from_multi_union_pw_aff(mupa)
    ccall((:isl_union_map_from_multi_union_pw_aff, libisl), Ptr{isl_union_map}, (Ptr{isl_multi_union_pw_aff},), mupa)
end

function isl_multi_union_pw_aff_zero_union_set(mupa)
    ccall((:isl_multi_union_pw_aff_zero_union_set, libisl), Ptr{isl_union_set}, (Ptr{isl_multi_union_pw_aff},), mupa)
end

function isl_multi_union_pw_aff_bind(mupa, tuple)
    ccall((:isl_multi_union_pw_aff_bind, libisl), Ptr{isl_union_set}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_multi_id}), mupa, tuple)
end

function isl_multi_union_pw_aff_extract_multi_pw_aff(mupa, space)
    ccall((:isl_multi_union_pw_aff_extract_multi_pw_aff, libisl), Ptr{isl_multi_pw_aff}, (Ptr{isl_multi_union_pw_aff}, Ptr{isl_space}), mupa, space)
end

function isl_multi_union_pw_aff_read_from_str(ctx, str)
    ccall((:isl_multi_union_pw_aff_read_from_str, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_multi_union_pw_aff_to_str(mupa)
    ccall((:isl_multi_union_pw_aff_to_str, libisl), Ptr{Cchar}, (Ptr{isl_multi_union_pw_aff},), mupa)
end

function isl_printer_print_multi_union_pw_aff(p, mupa)
    ccall((:isl_printer_print_multi_union_pw_aff, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_multi_union_pw_aff}), p, mupa)
end

function isl_multi_union_pw_aff_dump(mupa)
    ccall((:isl_multi_union_pw_aff_dump, libisl), Cvoid, (Ptr{isl_multi_union_pw_aff},), mupa)
end

function isl_aff_list_get_ctx(list)
    ccall((:isl_aff_list_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_aff_list},), list)
end

function isl_aff_list_from_aff(el)
    ccall((:isl_aff_list_from_aff, libisl), Ptr{isl_aff_list}, (Ptr{isl_aff},), el)
end

function isl_aff_list_alloc(ctx, n)
    ccall((:isl_aff_list_alloc, libisl), Ptr{isl_aff_list}, (Ptr{isl_ctx}, Cint), ctx, n)
end

function isl_aff_list_copy(list)
    ccall((:isl_aff_list_copy, libisl), Ptr{isl_aff_list}, (Ptr{isl_aff_list},), list)
end

function isl_aff_list_free(list)
    ccall((:isl_aff_list_free, libisl), Ptr{isl_aff_list}, (Ptr{isl_aff_list},), list)
end

function isl_aff_list_add(list, el)
    ccall((:isl_aff_list_add, libisl), Ptr{isl_aff_list}, (Ptr{isl_aff_list}, Ptr{isl_aff}), list, el)
end

function isl_aff_list_insert(list, pos, el)
    ccall((:isl_aff_list_insert, libisl), Ptr{isl_aff_list}, (Ptr{isl_aff_list}, Cuint, Ptr{isl_aff}), list, pos, el)
end

function isl_aff_list_drop(list, first, n)
    ccall((:isl_aff_list_drop, libisl), Ptr{isl_aff_list}, (Ptr{isl_aff_list}, Cuint, Cuint), list, first, n)
end

function isl_aff_list_clear(list)
    ccall((:isl_aff_list_clear, libisl), Ptr{isl_aff_list}, (Ptr{isl_aff_list},), list)
end

function isl_aff_list_swap(list, pos1, pos2)
    ccall((:isl_aff_list_swap, libisl), Ptr{isl_aff_list}, (Ptr{isl_aff_list}, Cuint, Cuint), list, pos1, pos2)
end

function isl_aff_list_reverse(list)
    ccall((:isl_aff_list_reverse, libisl), Ptr{isl_aff_list}, (Ptr{isl_aff_list},), list)
end

function isl_aff_list_concat(list1, list2)
    ccall((:isl_aff_list_concat, libisl), Ptr{isl_aff_list}, (Ptr{isl_aff_list}, Ptr{isl_aff_list}), list1, list2)
end

function isl_aff_list_size(list)
    ccall((:isl_aff_list_size, libisl), isl_size, (Ptr{isl_aff_list},), list)
end

function isl_aff_list_n_aff(list)
    ccall((:isl_aff_list_n_aff, libisl), isl_size, (Ptr{isl_aff_list},), list)
end

function isl_aff_list_get_at(list, index)
    ccall((:isl_aff_list_get_at, libisl), Ptr{isl_aff}, (Ptr{isl_aff_list}, Cint), list, index)
end

function isl_aff_list_get_aff(list, index)
    ccall((:isl_aff_list_get_aff, libisl), Ptr{isl_aff}, (Ptr{isl_aff_list}, Cint), list, index)
end

function isl_aff_list_set_aff(list, index, el)
    ccall((:isl_aff_list_set_aff, libisl), Ptr{isl_aff_list}, (Ptr{isl_aff_list}, Cint, Ptr{isl_aff}), list, index, el)
end

function isl_aff_list_foreach(list, fn, user)
    ccall((:isl_aff_list_foreach, libisl), isl_stat, (Ptr{isl_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_aff_list_map(list, fn, user)
    ccall((:isl_aff_list_map, libisl), Ptr{isl_aff_list}, (Ptr{isl_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_aff_list_sort(list, cmp, user)
    ccall((:isl_aff_list_sort, libisl), Ptr{isl_aff_list}, (Ptr{isl_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, cmp, user)
end

function isl_aff_list_foreach_scc(list, follows, follows_user, fn, fn_user)
    ccall((:isl_aff_list_foreach_scc, libisl), isl_stat, (Ptr{isl_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), list, follows, follows_user, fn, fn_user)
end

function isl_aff_list_to_str(list)
    ccall((:isl_aff_list_to_str, libisl), Ptr{Cchar}, (Ptr{isl_aff_list},), list)
end

function isl_printer_print_aff_list(p, list)
    ccall((:isl_printer_print_aff_list, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_aff_list}), p, list)
end

function isl_aff_list_dump(list)
    ccall((:isl_aff_list_dump, libisl), Cvoid, (Ptr{isl_aff_list},), list)
end

function isl_pw_aff_list_get_ctx(list)
    ccall((:isl_pw_aff_list_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_pw_aff_list},), list)
end

function isl_pw_aff_list_from_pw_aff(el)
    ccall((:isl_pw_aff_list_from_pw_aff, libisl), Ptr{isl_pw_aff_list}, (Ptr{isl_pw_aff},), el)
end

function isl_pw_aff_list_alloc(ctx, n)
    ccall((:isl_pw_aff_list_alloc, libisl), Ptr{isl_pw_aff_list}, (Ptr{isl_ctx}, Cint), ctx, n)
end

function isl_pw_aff_list_copy(list)
    ccall((:isl_pw_aff_list_copy, libisl), Ptr{isl_pw_aff_list}, (Ptr{isl_pw_aff_list},), list)
end

function isl_pw_aff_list_free(list)
    ccall((:isl_pw_aff_list_free, libisl), Ptr{isl_pw_aff_list}, (Ptr{isl_pw_aff_list},), list)
end

function isl_pw_aff_list_add(list, el)
    ccall((:isl_pw_aff_list_add, libisl), Ptr{isl_pw_aff_list}, (Ptr{isl_pw_aff_list}, Ptr{isl_pw_aff}), list, el)
end

function isl_pw_aff_list_insert(list, pos, el)
    ccall((:isl_pw_aff_list_insert, libisl), Ptr{isl_pw_aff_list}, (Ptr{isl_pw_aff_list}, Cuint, Ptr{isl_pw_aff}), list, pos, el)
end

function isl_pw_aff_list_drop(list, first, n)
    ccall((:isl_pw_aff_list_drop, libisl), Ptr{isl_pw_aff_list}, (Ptr{isl_pw_aff_list}, Cuint, Cuint), list, first, n)
end

function isl_pw_aff_list_clear(list)
    ccall((:isl_pw_aff_list_clear, libisl), Ptr{isl_pw_aff_list}, (Ptr{isl_pw_aff_list},), list)
end

function isl_pw_aff_list_swap(list, pos1, pos2)
    ccall((:isl_pw_aff_list_swap, libisl), Ptr{isl_pw_aff_list}, (Ptr{isl_pw_aff_list}, Cuint, Cuint), list, pos1, pos2)
end

function isl_pw_aff_list_reverse(list)
    ccall((:isl_pw_aff_list_reverse, libisl), Ptr{isl_pw_aff_list}, (Ptr{isl_pw_aff_list},), list)
end

function isl_pw_aff_list_concat(list1, list2)
    ccall((:isl_pw_aff_list_concat, libisl), Ptr{isl_pw_aff_list}, (Ptr{isl_pw_aff_list}, Ptr{isl_pw_aff_list}), list1, list2)
end

function isl_pw_aff_list_size(list)
    ccall((:isl_pw_aff_list_size, libisl), isl_size, (Ptr{isl_pw_aff_list},), list)
end

function isl_pw_aff_list_n_pw_aff(list)
    ccall((:isl_pw_aff_list_n_pw_aff, libisl), isl_size, (Ptr{isl_pw_aff_list},), list)
end

function isl_pw_aff_list_get_at(list, index)
    ccall((:isl_pw_aff_list_get_at, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff_list}, Cint), list, index)
end

function isl_pw_aff_list_get_pw_aff(list, index)
    ccall((:isl_pw_aff_list_get_pw_aff, libisl), Ptr{isl_pw_aff}, (Ptr{isl_pw_aff_list}, Cint), list, index)
end

function isl_pw_aff_list_set_pw_aff(list, index, el)
    ccall((:isl_pw_aff_list_set_pw_aff, libisl), Ptr{isl_pw_aff_list}, (Ptr{isl_pw_aff_list}, Cint, Ptr{isl_pw_aff}), list, index, el)
end

function isl_pw_aff_list_foreach(list, fn, user)
    ccall((:isl_pw_aff_list_foreach, libisl), isl_stat, (Ptr{isl_pw_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_pw_aff_list_map(list, fn, user)
    ccall((:isl_pw_aff_list_map, libisl), Ptr{isl_pw_aff_list}, (Ptr{isl_pw_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_pw_aff_list_sort(list, cmp, user)
    ccall((:isl_pw_aff_list_sort, libisl), Ptr{isl_pw_aff_list}, (Ptr{isl_pw_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, cmp, user)
end

function isl_pw_aff_list_foreach_scc(list, follows, follows_user, fn, fn_user)
    ccall((:isl_pw_aff_list_foreach_scc, libisl), isl_stat, (Ptr{isl_pw_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), list, follows, follows_user, fn, fn_user)
end

function isl_pw_aff_list_to_str(list)
    ccall((:isl_pw_aff_list_to_str, libisl), Ptr{Cchar}, (Ptr{isl_pw_aff_list},), list)
end

function isl_printer_print_pw_aff_list(p, list)
    ccall((:isl_printer_print_pw_aff_list, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_pw_aff_list}), p, list)
end

function isl_pw_aff_list_dump(list)
    ccall((:isl_pw_aff_list_dump, libisl), Cvoid, (Ptr{isl_pw_aff_list},), list)
end

function isl_pw_multi_aff_list_get_ctx(list)
    ccall((:isl_pw_multi_aff_list_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_pw_multi_aff_list},), list)
end

function isl_pw_multi_aff_list_from_pw_multi_aff(el)
    ccall((:isl_pw_multi_aff_list_from_pw_multi_aff, libisl), Ptr{isl_pw_multi_aff_list}, (Ptr{isl_pw_multi_aff},), el)
end

function isl_pw_multi_aff_list_alloc(ctx, n)
    ccall((:isl_pw_multi_aff_list_alloc, libisl), Ptr{isl_pw_multi_aff_list}, (Ptr{isl_ctx}, Cint), ctx, n)
end

function isl_pw_multi_aff_list_copy(list)
    ccall((:isl_pw_multi_aff_list_copy, libisl), Ptr{isl_pw_multi_aff_list}, (Ptr{isl_pw_multi_aff_list},), list)
end

function isl_pw_multi_aff_list_free(list)
    ccall((:isl_pw_multi_aff_list_free, libisl), Ptr{isl_pw_multi_aff_list}, (Ptr{isl_pw_multi_aff_list},), list)
end

function isl_pw_multi_aff_list_add(list, el)
    ccall((:isl_pw_multi_aff_list_add, libisl), Ptr{isl_pw_multi_aff_list}, (Ptr{isl_pw_multi_aff_list}, Ptr{isl_pw_multi_aff}), list, el)
end

function isl_pw_multi_aff_list_insert(list, pos, el)
    ccall((:isl_pw_multi_aff_list_insert, libisl), Ptr{isl_pw_multi_aff_list}, (Ptr{isl_pw_multi_aff_list}, Cuint, Ptr{isl_pw_multi_aff}), list, pos, el)
end

function isl_pw_multi_aff_list_drop(list, first, n)
    ccall((:isl_pw_multi_aff_list_drop, libisl), Ptr{isl_pw_multi_aff_list}, (Ptr{isl_pw_multi_aff_list}, Cuint, Cuint), list, first, n)
end

function isl_pw_multi_aff_list_clear(list)
    ccall((:isl_pw_multi_aff_list_clear, libisl), Ptr{isl_pw_multi_aff_list}, (Ptr{isl_pw_multi_aff_list},), list)
end

function isl_pw_multi_aff_list_swap(list, pos1, pos2)
    ccall((:isl_pw_multi_aff_list_swap, libisl), Ptr{isl_pw_multi_aff_list}, (Ptr{isl_pw_multi_aff_list}, Cuint, Cuint), list, pos1, pos2)
end

function isl_pw_multi_aff_list_reverse(list)
    ccall((:isl_pw_multi_aff_list_reverse, libisl), Ptr{isl_pw_multi_aff_list}, (Ptr{isl_pw_multi_aff_list},), list)
end

function isl_pw_multi_aff_list_concat(list1, list2)
    ccall((:isl_pw_multi_aff_list_concat, libisl), Ptr{isl_pw_multi_aff_list}, (Ptr{isl_pw_multi_aff_list}, Ptr{isl_pw_multi_aff_list}), list1, list2)
end

function isl_pw_multi_aff_list_size(list)
    ccall((:isl_pw_multi_aff_list_size, libisl), isl_size, (Ptr{isl_pw_multi_aff_list},), list)
end

function isl_pw_multi_aff_list_n_pw_multi_aff(list)
    ccall((:isl_pw_multi_aff_list_n_pw_multi_aff, libisl), isl_size, (Ptr{isl_pw_multi_aff_list},), list)
end

function isl_pw_multi_aff_list_get_at(list, index)
    ccall((:isl_pw_multi_aff_list_get_at, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff_list}, Cint), list, index)
end

function isl_pw_multi_aff_list_get_pw_multi_aff(list, index)
    ccall((:isl_pw_multi_aff_list_get_pw_multi_aff, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_pw_multi_aff_list}, Cint), list, index)
end

function isl_pw_multi_aff_list_set_pw_multi_aff(list, index, el)
    ccall((:isl_pw_multi_aff_list_set_pw_multi_aff, libisl), Ptr{isl_pw_multi_aff_list}, (Ptr{isl_pw_multi_aff_list}, Cint, Ptr{isl_pw_multi_aff}), list, index, el)
end

function isl_pw_multi_aff_list_foreach(list, fn, user)
    ccall((:isl_pw_multi_aff_list_foreach, libisl), isl_stat, (Ptr{isl_pw_multi_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_pw_multi_aff_list_map(list, fn, user)
    ccall((:isl_pw_multi_aff_list_map, libisl), Ptr{isl_pw_multi_aff_list}, (Ptr{isl_pw_multi_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_pw_multi_aff_list_sort(list, cmp, user)
    ccall((:isl_pw_multi_aff_list_sort, libisl), Ptr{isl_pw_multi_aff_list}, (Ptr{isl_pw_multi_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, cmp, user)
end

function isl_pw_multi_aff_list_foreach_scc(list, follows, follows_user, fn, fn_user)
    ccall((:isl_pw_multi_aff_list_foreach_scc, libisl), isl_stat, (Ptr{isl_pw_multi_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), list, follows, follows_user, fn, fn_user)
end

function isl_pw_multi_aff_list_to_str(list)
    ccall((:isl_pw_multi_aff_list_to_str, libisl), Ptr{Cchar}, (Ptr{isl_pw_multi_aff_list},), list)
end

function isl_printer_print_pw_multi_aff_list(p, list)
    ccall((:isl_printer_print_pw_multi_aff_list, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_pw_multi_aff_list}), p, list)
end

function isl_pw_multi_aff_list_dump(list)
    ccall((:isl_pw_multi_aff_list_dump, libisl), Cvoid, (Ptr{isl_pw_multi_aff_list},), list)
end

function isl_union_pw_aff_list_get_ctx(list)
    ccall((:isl_union_pw_aff_list_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_union_pw_aff_list},), list)
end

function isl_union_pw_aff_list_from_union_pw_aff(el)
    ccall((:isl_union_pw_aff_list_from_union_pw_aff, libisl), Ptr{isl_union_pw_aff_list}, (Ptr{isl_union_pw_aff},), el)
end

function isl_union_pw_aff_list_alloc(ctx, n)
    ccall((:isl_union_pw_aff_list_alloc, libisl), Ptr{isl_union_pw_aff_list}, (Ptr{isl_ctx}, Cint), ctx, n)
end

function isl_union_pw_aff_list_copy(list)
    ccall((:isl_union_pw_aff_list_copy, libisl), Ptr{isl_union_pw_aff_list}, (Ptr{isl_union_pw_aff_list},), list)
end

function isl_union_pw_aff_list_free(list)
    ccall((:isl_union_pw_aff_list_free, libisl), Ptr{isl_union_pw_aff_list}, (Ptr{isl_union_pw_aff_list},), list)
end

function isl_union_pw_aff_list_add(list, el)
    ccall((:isl_union_pw_aff_list_add, libisl), Ptr{isl_union_pw_aff_list}, (Ptr{isl_union_pw_aff_list}, Ptr{isl_union_pw_aff}), list, el)
end

function isl_union_pw_aff_list_insert(list, pos, el)
    ccall((:isl_union_pw_aff_list_insert, libisl), Ptr{isl_union_pw_aff_list}, (Ptr{isl_union_pw_aff_list}, Cuint, Ptr{isl_union_pw_aff}), list, pos, el)
end

function isl_union_pw_aff_list_drop(list, first, n)
    ccall((:isl_union_pw_aff_list_drop, libisl), Ptr{isl_union_pw_aff_list}, (Ptr{isl_union_pw_aff_list}, Cuint, Cuint), list, first, n)
end

function isl_union_pw_aff_list_clear(list)
    ccall((:isl_union_pw_aff_list_clear, libisl), Ptr{isl_union_pw_aff_list}, (Ptr{isl_union_pw_aff_list},), list)
end

function isl_union_pw_aff_list_swap(list, pos1, pos2)
    ccall((:isl_union_pw_aff_list_swap, libisl), Ptr{isl_union_pw_aff_list}, (Ptr{isl_union_pw_aff_list}, Cuint, Cuint), list, pos1, pos2)
end

function isl_union_pw_aff_list_reverse(list)
    ccall((:isl_union_pw_aff_list_reverse, libisl), Ptr{isl_union_pw_aff_list}, (Ptr{isl_union_pw_aff_list},), list)
end

function isl_union_pw_aff_list_concat(list1, list2)
    ccall((:isl_union_pw_aff_list_concat, libisl), Ptr{isl_union_pw_aff_list}, (Ptr{isl_union_pw_aff_list}, Ptr{isl_union_pw_aff_list}), list1, list2)
end

function isl_union_pw_aff_list_size(list)
    ccall((:isl_union_pw_aff_list_size, libisl), isl_size, (Ptr{isl_union_pw_aff_list},), list)
end

function isl_union_pw_aff_list_n_union_pw_aff(list)
    ccall((:isl_union_pw_aff_list_n_union_pw_aff, libisl), isl_size, (Ptr{isl_union_pw_aff_list},), list)
end

function isl_union_pw_aff_list_get_at(list, index)
    ccall((:isl_union_pw_aff_list_get_at, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff_list}, Cint), list, index)
end

function isl_union_pw_aff_list_get_union_pw_aff(list, index)
    ccall((:isl_union_pw_aff_list_get_union_pw_aff, libisl), Ptr{isl_union_pw_aff}, (Ptr{isl_union_pw_aff_list}, Cint), list, index)
end

function isl_union_pw_aff_list_set_union_pw_aff(list, index, el)
    ccall((:isl_union_pw_aff_list_set_union_pw_aff, libisl), Ptr{isl_union_pw_aff_list}, (Ptr{isl_union_pw_aff_list}, Cint, Ptr{isl_union_pw_aff}), list, index, el)
end

function isl_union_pw_aff_list_foreach(list, fn, user)
    ccall((:isl_union_pw_aff_list_foreach, libisl), isl_stat, (Ptr{isl_union_pw_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_union_pw_aff_list_map(list, fn, user)
    ccall((:isl_union_pw_aff_list_map, libisl), Ptr{isl_union_pw_aff_list}, (Ptr{isl_union_pw_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_union_pw_aff_list_sort(list, cmp, user)
    ccall((:isl_union_pw_aff_list_sort, libisl), Ptr{isl_union_pw_aff_list}, (Ptr{isl_union_pw_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, cmp, user)
end

function isl_union_pw_aff_list_foreach_scc(list, follows, follows_user, fn, fn_user)
    ccall((:isl_union_pw_aff_list_foreach_scc, libisl), isl_stat, (Ptr{isl_union_pw_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), list, follows, follows_user, fn, fn_user)
end

function isl_union_pw_aff_list_to_str(list)
    ccall((:isl_union_pw_aff_list_to_str, libisl), Ptr{Cchar}, (Ptr{isl_union_pw_aff_list},), list)
end

function isl_printer_print_union_pw_aff_list(p, list)
    ccall((:isl_printer_print_union_pw_aff_list, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_union_pw_aff_list}), p, list)
end

function isl_union_pw_aff_list_dump(list)
    ccall((:isl_union_pw_aff_list_dump, libisl), Cvoid, (Ptr{isl_union_pw_aff_list},), list)
end

mutable struct isl_union_pw_multi_aff_list end

function isl_union_pw_multi_aff_list_get_ctx(list)
    ccall((:isl_union_pw_multi_aff_list_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_union_pw_multi_aff_list},), list)
end

function isl_union_pw_multi_aff_list_from_union_pw_multi_aff(el)
    ccall((:isl_union_pw_multi_aff_list_from_union_pw_multi_aff, libisl), Ptr{isl_union_pw_multi_aff_list}, (Ptr{isl_union_pw_multi_aff},), el)
end

function isl_union_pw_multi_aff_list_alloc(ctx, n)
    ccall((:isl_union_pw_multi_aff_list_alloc, libisl), Ptr{isl_union_pw_multi_aff_list}, (Ptr{isl_ctx}, Cint), ctx, n)
end

function isl_union_pw_multi_aff_list_copy(list)
    ccall((:isl_union_pw_multi_aff_list_copy, libisl), Ptr{isl_union_pw_multi_aff_list}, (Ptr{isl_union_pw_multi_aff_list},), list)
end

function isl_union_pw_multi_aff_list_free(list)
    ccall((:isl_union_pw_multi_aff_list_free, libisl), Ptr{isl_union_pw_multi_aff_list}, (Ptr{isl_union_pw_multi_aff_list},), list)
end

function isl_union_pw_multi_aff_list_add(list, el)
    ccall((:isl_union_pw_multi_aff_list_add, libisl), Ptr{isl_union_pw_multi_aff_list}, (Ptr{isl_union_pw_multi_aff_list}, Ptr{isl_union_pw_multi_aff}), list, el)
end

function isl_union_pw_multi_aff_list_insert(list, pos, el)
    ccall((:isl_union_pw_multi_aff_list_insert, libisl), Ptr{isl_union_pw_multi_aff_list}, (Ptr{isl_union_pw_multi_aff_list}, Cuint, Ptr{isl_union_pw_multi_aff}), list, pos, el)
end

function isl_union_pw_multi_aff_list_drop(list, first, n)
    ccall((:isl_union_pw_multi_aff_list_drop, libisl), Ptr{isl_union_pw_multi_aff_list}, (Ptr{isl_union_pw_multi_aff_list}, Cuint, Cuint), list, first, n)
end

function isl_union_pw_multi_aff_list_clear(list)
    ccall((:isl_union_pw_multi_aff_list_clear, libisl), Ptr{isl_union_pw_multi_aff_list}, (Ptr{isl_union_pw_multi_aff_list},), list)
end

function isl_union_pw_multi_aff_list_swap(list, pos1, pos2)
    ccall((:isl_union_pw_multi_aff_list_swap, libisl), Ptr{isl_union_pw_multi_aff_list}, (Ptr{isl_union_pw_multi_aff_list}, Cuint, Cuint), list, pos1, pos2)
end

function isl_union_pw_multi_aff_list_reverse(list)
    ccall((:isl_union_pw_multi_aff_list_reverse, libisl), Ptr{isl_union_pw_multi_aff_list}, (Ptr{isl_union_pw_multi_aff_list},), list)
end

function isl_union_pw_multi_aff_list_concat(list1, list2)
    ccall((:isl_union_pw_multi_aff_list_concat, libisl), Ptr{isl_union_pw_multi_aff_list}, (Ptr{isl_union_pw_multi_aff_list}, Ptr{isl_union_pw_multi_aff_list}), list1, list2)
end

function isl_union_pw_multi_aff_list_size(list)
    ccall((:isl_union_pw_multi_aff_list_size, libisl), isl_size, (Ptr{isl_union_pw_multi_aff_list},), list)
end

function isl_union_pw_multi_aff_list_n_union_pw_multi_aff(list)
    ccall((:isl_union_pw_multi_aff_list_n_union_pw_multi_aff, libisl), isl_size, (Ptr{isl_union_pw_multi_aff_list},), list)
end

function isl_union_pw_multi_aff_list_get_at(list, index)
    ccall((:isl_union_pw_multi_aff_list_get_at, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff_list}, Cint), list, index)
end

function isl_union_pw_multi_aff_list_get_union_pw_multi_aff(list, index)
    ccall((:isl_union_pw_multi_aff_list_get_union_pw_multi_aff, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_pw_multi_aff_list}, Cint), list, index)
end

function isl_union_pw_multi_aff_list_set_union_pw_multi_aff(list, index, el)
    ccall((:isl_union_pw_multi_aff_list_set_union_pw_multi_aff, libisl), Ptr{isl_union_pw_multi_aff_list}, (Ptr{isl_union_pw_multi_aff_list}, Cint, Ptr{isl_union_pw_multi_aff}), list, index, el)
end

function isl_union_pw_multi_aff_list_foreach(list, fn, user)
    ccall((:isl_union_pw_multi_aff_list_foreach, libisl), isl_stat, (Ptr{isl_union_pw_multi_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_union_pw_multi_aff_list_map(list, fn, user)
    ccall((:isl_union_pw_multi_aff_list_map, libisl), Ptr{isl_union_pw_multi_aff_list}, (Ptr{isl_union_pw_multi_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_union_pw_multi_aff_list_sort(list, cmp, user)
    ccall((:isl_union_pw_multi_aff_list_sort, libisl), Ptr{isl_union_pw_multi_aff_list}, (Ptr{isl_union_pw_multi_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, cmp, user)
end

function isl_union_pw_multi_aff_list_foreach_scc(list, follows, follows_user, fn, fn_user)
    ccall((:isl_union_pw_multi_aff_list_foreach_scc, libisl), isl_stat, (Ptr{isl_union_pw_multi_aff_list}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), list, follows, follows_user, fn, fn_user)
end

function isl_union_pw_multi_aff_list_to_str(list)
    ccall((:isl_union_pw_multi_aff_list_to_str, libisl), Ptr{Cchar}, (Ptr{isl_union_pw_multi_aff_list},), list)
end

function isl_printer_print_union_pw_multi_aff_list(p, list)
    ccall((:isl_printer_print_union_pw_multi_aff_list, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_union_pw_multi_aff_list}), p, list)
end

function isl_union_pw_multi_aff_list_dump(list)
    ccall((:isl_union_pw_multi_aff_list_dump, libisl), Cvoid, (Ptr{isl_union_pw_multi_aff_list},), list)
end

struct isl_arg_choice
    name::Ptr{Cchar}
    value::Cuint
end

struct isl_arg_flags
    name::Ptr{Cchar}
    mask::Cuint
    value::Cuint
end

@cenum isl_arg_type::UInt32 begin
    isl_arg_end = 0
    isl_arg_alias = 1
    isl_arg_arg = 2
    isl_arg_bool = 3
    isl_arg_child = 4
    __isl_arg_choice = 5
    __isl_arg_flags = 6
    isl_arg_footer = 7
    isl_arg_int = 8
    isl_arg_user = 9
    isl_arg_long = 10
    isl_arg_ulong = 11
    isl_arg_str = 12
    isl_arg_str_list = 13
    isl_arg_version = 14
end

struct isl_arg
    data::NTuple{72, UInt8}
end

function Base.getproperty(x::Ptr{isl_arg}, f::Symbol)
    f === :type && return Ptr{isl_arg_type}(x + 0)
    f === :short_name && return Ptr{Cchar}(x + 32)
    f === :long_name && return Ptr{Ptr{Cchar}}(x + 64)
    f === :argument_name && return Ptr{Ptr{Cchar}}(x + 128)
    f === :offset && return Ptr{Csize_t}(x + 192)
    f === :help_msg && return Ptr{Ptr{Cchar}}(x + 256)
    f === :flags && return Ptr{Cuint}(x + 320)
    f === :u && return Ptr{var"##Ctag#255"}(x + 384)
    return getfield(x, f)
end

function Base.getproperty(x::isl_arg, f::Symbol)
    r = Ref{isl_arg}(x)
    ptr = Base.unsafe_convert(Ptr{isl_arg}, r)
    GC.@preserve r unsafe_load(getproperty(ptr, f))
end

function Base.setproperty!(x::Ptr{isl_arg}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct isl_args
    options_size::Csize_t
    args::Ptr{isl_arg}
end

function isl_args_set_defaults(args, opt)
    ccall((:isl_args_set_defaults, libisl), Cvoid, (Ptr{isl_args}, Ptr{Cvoid}), args, opt)
end

function isl_args_free(args, opt)
    ccall((:isl_args_free, libisl), Cvoid, (Ptr{isl_args}, Ptr{Cvoid}), args, opt)
end

function isl_args_parse(args, argc, argv, opt, flags)
    ccall((:isl_args_parse, libisl), Cint, (Ptr{isl_args}, Cint, Ptr{Ptr{Cchar}}, Ptr{Cvoid}, Cuint), args, argc, argv, opt, flags)
end

mutable struct isl_ast_expr end

struct isl_maybe_isl_ast_expr
    valid::isl_bool
    value::Ptr{isl_ast_expr}
end

mutable struct isl_id_to_ast_expr end

function isl_id_to_ast_expr_alloc(ctx, min_size)
    ccall((:isl_id_to_ast_expr_alloc, libisl), Ptr{isl_id_to_ast_expr}, (Ptr{isl_ctx}, Cint), ctx, min_size)
end

function isl_id_to_ast_expr_copy(hmap)
    ccall((:isl_id_to_ast_expr_copy, libisl), Ptr{isl_id_to_ast_expr}, (Ptr{isl_id_to_ast_expr},), hmap)
end

function isl_id_to_ast_expr_free(hmap)
    ccall((:isl_id_to_ast_expr_free, libisl), Ptr{isl_id_to_ast_expr}, (Ptr{isl_id_to_ast_expr},), hmap)
end

function isl_id_to_ast_expr_get_ctx(hmap)
    ccall((:isl_id_to_ast_expr_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_id_to_ast_expr},), hmap)
end

function isl_id_to_ast_expr_try_get(hmap, key)
    ccall((:isl_id_to_ast_expr_try_get, libisl), isl_maybe_isl_ast_expr, (Ptr{isl_id_to_ast_expr}, Ptr{isl_id}), hmap, key)
end

function isl_id_to_ast_expr_has(hmap, key)
    ccall((:isl_id_to_ast_expr_has, libisl), isl_bool, (Ptr{isl_id_to_ast_expr}, Ptr{isl_id}), hmap, key)
end

function isl_id_to_ast_expr_get(hmap, key)
    ccall((:isl_id_to_ast_expr_get, libisl), Ptr{isl_ast_expr}, (Ptr{isl_id_to_ast_expr}, Ptr{isl_id}), hmap, key)
end

function isl_id_to_ast_expr_set(hmap, key, val)
    ccall((:isl_id_to_ast_expr_set, libisl), Ptr{isl_id_to_ast_expr}, (Ptr{isl_id_to_ast_expr}, Ptr{isl_id}, Ptr{isl_ast_expr}), hmap, key, val)
end

function isl_id_to_ast_expr_drop(hmap, key)
    ccall((:isl_id_to_ast_expr_drop, libisl), Ptr{isl_id_to_ast_expr}, (Ptr{isl_id_to_ast_expr}, Ptr{isl_id}), hmap, key)
end

function isl_id_to_ast_expr_foreach(hmap, fn, user)
    ccall((:isl_id_to_ast_expr_foreach, libisl), isl_stat, (Ptr{isl_id_to_ast_expr}, Ptr{Cvoid}, Ptr{Cvoid}), hmap, fn, user)
end

function isl_printer_print_id_to_ast_expr(p, hmap)
    ccall((:isl_printer_print_id_to_ast_expr, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_id_to_ast_expr}), p, hmap)
end

function isl_id_to_ast_expr_dump(hmap)
    ccall((:isl_id_to_ast_expr_dump, libisl), Cvoid, (Ptr{isl_id_to_ast_expr},), hmap)
end

function isl_options_set_ast_iterator_type(ctx, val)
    ccall((:isl_options_set_ast_iterator_type, libisl), isl_stat, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, val)
end

function isl_options_get_ast_iterator_type(ctx)
    ccall((:isl_options_get_ast_iterator_type, libisl), Ptr{Cchar}, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_ast_always_print_block(ctx, val)
    ccall((:isl_options_set_ast_always_print_block, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_ast_always_print_block(ctx)
    ccall((:isl_options_get_ast_always_print_block, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_ast_expr_from_val(v)
    ccall((:isl_ast_expr_from_val, libisl), Ptr{isl_ast_expr}, (Ptr{isl_val},), v)
end

function isl_ast_expr_from_id(id)
    ccall((:isl_ast_expr_from_id, libisl), Ptr{isl_ast_expr}, (Ptr{isl_id},), id)
end

function isl_ast_expr_neg(expr)
    ccall((:isl_ast_expr_neg, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr},), expr)
end

function isl_ast_expr_add(expr1, expr2)
    ccall((:isl_ast_expr_add, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Ptr{isl_ast_expr}), expr1, expr2)
end

function isl_ast_expr_sub(expr1, expr2)
    ccall((:isl_ast_expr_sub, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Ptr{isl_ast_expr}), expr1, expr2)
end

function isl_ast_expr_mul(expr1, expr2)
    ccall((:isl_ast_expr_mul, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Ptr{isl_ast_expr}), expr1, expr2)
end

function isl_ast_expr_div(expr1, expr2)
    ccall((:isl_ast_expr_div, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Ptr{isl_ast_expr}), expr1, expr2)
end

function isl_ast_expr_pdiv_q(expr1, expr2)
    ccall((:isl_ast_expr_pdiv_q, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Ptr{isl_ast_expr}), expr1, expr2)
end

function isl_ast_expr_pdiv_r(expr1, expr2)
    ccall((:isl_ast_expr_pdiv_r, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Ptr{isl_ast_expr}), expr1, expr2)
end

function isl_ast_expr_and(expr1, expr2)
    ccall((:isl_ast_expr_and, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Ptr{isl_ast_expr}), expr1, expr2)
end

function isl_ast_expr_and_then(expr1, expr2)
    ccall((:isl_ast_expr_and_then, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Ptr{isl_ast_expr}), expr1, expr2)
end

function isl_ast_expr_or(expr1, expr2)
    ccall((:isl_ast_expr_or, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Ptr{isl_ast_expr}), expr1, expr2)
end

function isl_ast_expr_or_else(expr1, expr2)
    ccall((:isl_ast_expr_or_else, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Ptr{isl_ast_expr}), expr1, expr2)
end

function isl_ast_expr_le(expr1, expr2)
    ccall((:isl_ast_expr_le, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Ptr{isl_ast_expr}), expr1, expr2)
end

function isl_ast_expr_lt(expr1, expr2)
    ccall((:isl_ast_expr_lt, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Ptr{isl_ast_expr}), expr1, expr2)
end

function isl_ast_expr_ge(expr1, expr2)
    ccall((:isl_ast_expr_ge, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Ptr{isl_ast_expr}), expr1, expr2)
end

function isl_ast_expr_gt(expr1, expr2)
    ccall((:isl_ast_expr_gt, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Ptr{isl_ast_expr}), expr1, expr2)
end

function isl_ast_expr_eq(expr1, expr2)
    ccall((:isl_ast_expr_eq, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Ptr{isl_ast_expr}), expr1, expr2)
end

mutable struct isl_ast_expr_list end

function isl_ast_expr_access(array, indices)
    ccall((:isl_ast_expr_access, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Ptr{isl_ast_expr_list}), array, indices)
end

function isl_ast_expr_call(_function, arguments)
    ccall((:isl_ast_expr_call, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Ptr{isl_ast_expr_list}), _function, arguments)
end

function isl_ast_expr_address_of(expr)
    ccall((:isl_ast_expr_address_of, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr},), expr)
end

function isl_ast_expr_copy(expr)
    ccall((:isl_ast_expr_copy, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr},), expr)
end

function isl_ast_expr_free(expr)
    ccall((:isl_ast_expr_free, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr},), expr)
end

function isl_ast_expr_get_ctx(expr)
    ccall((:isl_ast_expr_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_ast_expr},), expr)
end

@cenum isl_ast_expr_type::Int32 begin
    isl_ast_expr_error = -1
    isl_ast_expr_op = 0
    isl_ast_expr_id = 1
    isl_ast_expr_int = 2
end

function isl_ast_expr_get_type(expr)
    ccall((:isl_ast_expr_get_type, libisl), isl_ast_expr_type, (Ptr{isl_ast_expr},), expr)
end

function isl_ast_expr_int_get_val(expr)
    ccall((:isl_ast_expr_int_get_val, libisl), Ptr{isl_val}, (Ptr{isl_ast_expr},), expr)
end

function isl_ast_expr_get_val(expr)
    ccall((:isl_ast_expr_get_val, libisl), Ptr{isl_val}, (Ptr{isl_ast_expr},), expr)
end

function isl_ast_expr_id_get_id(expr)
    ccall((:isl_ast_expr_id_get_id, libisl), Ptr{isl_id}, (Ptr{isl_ast_expr},), expr)
end

function isl_ast_expr_get_id(expr)
    ccall((:isl_ast_expr_get_id, libisl), Ptr{isl_id}, (Ptr{isl_ast_expr},), expr)
end

@cenum isl_ast_expr_op_type::Int32 begin
    isl_ast_expr_op_error = -1
    isl_ast_expr_op_and = 0
    isl_ast_expr_op_and_then = 1
    isl_ast_expr_op_or = 2
    isl_ast_expr_op_or_else = 3
    isl_ast_expr_op_max = 4
    isl_ast_expr_op_min = 5
    isl_ast_expr_op_minus = 6
    isl_ast_expr_op_add = 7
    isl_ast_expr_op_sub = 8
    isl_ast_expr_op_mul = 9
    isl_ast_expr_op_div = 10
    isl_ast_expr_op_fdiv_q = 11
    isl_ast_expr_op_pdiv_q = 12
    isl_ast_expr_op_pdiv_r = 13
    isl_ast_expr_op_zdiv_r = 14
    isl_ast_expr_op_cond = 15
    isl_ast_expr_op_select = 16
    isl_ast_expr_op_eq = 17
    isl_ast_expr_op_le = 18
    isl_ast_expr_op_lt = 19
    isl_ast_expr_op_ge = 20
    isl_ast_expr_op_gt = 21
    isl_ast_expr_op_call = 22
    isl_ast_expr_op_access = 23
    isl_ast_expr_op_member = 24
    isl_ast_expr_op_address_of = 25
end

function isl_ast_expr_op_get_type(expr)
    ccall((:isl_ast_expr_op_get_type, libisl), isl_ast_expr_op_type, (Ptr{isl_ast_expr},), expr)
end

function isl_ast_expr_get_op_type(expr)
    ccall((:isl_ast_expr_get_op_type, libisl), isl_ast_expr_op_type, (Ptr{isl_ast_expr},), expr)
end

function isl_ast_expr_op_get_n_arg(expr)
    ccall((:isl_ast_expr_op_get_n_arg, libisl), isl_size, (Ptr{isl_ast_expr},), expr)
end

function isl_ast_expr_get_op_n_arg(expr)
    ccall((:isl_ast_expr_get_op_n_arg, libisl), isl_size, (Ptr{isl_ast_expr},), expr)
end

function isl_ast_expr_op_get_arg(expr, pos)
    ccall((:isl_ast_expr_op_get_arg, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Cint), expr, pos)
end

function isl_ast_expr_get_op_arg(expr, pos)
    ccall((:isl_ast_expr_get_op_arg, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Cint), expr, pos)
end

function isl_ast_expr_set_op_arg(expr, pos, arg)
    ccall((:isl_ast_expr_set_op_arg, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Cint, Ptr{isl_ast_expr}), expr, pos, arg)
end

function isl_ast_expr_is_equal(expr1, expr2)
    ccall((:isl_ast_expr_is_equal, libisl), isl_bool, (Ptr{isl_ast_expr}, Ptr{isl_ast_expr}), expr1, expr2)
end

function isl_ast_expr_substitute_ids(expr, id2expr)
    ccall((:isl_ast_expr_substitute_ids, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr}, Ptr{isl_id_to_ast_expr}), expr, id2expr)
end

function isl_printer_print_ast_expr(p, expr)
    ccall((:isl_printer_print_ast_expr, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_ast_expr}), p, expr)
end

function isl_ast_expr_dump(expr)
    ccall((:isl_ast_expr_dump, libisl), Cvoid, (Ptr{isl_ast_expr},), expr)
end

function isl_ast_expr_to_str(expr)
    ccall((:isl_ast_expr_to_str, libisl), Ptr{Cchar}, (Ptr{isl_ast_expr},), expr)
end

function isl_ast_expr_to_C_str(expr)
    ccall((:isl_ast_expr_to_C_str, libisl), Ptr{Cchar}, (Ptr{isl_ast_expr},), expr)
end

mutable struct isl_ast_node end

function isl_ast_node_alloc_user(expr)
    ccall((:isl_ast_node_alloc_user, libisl), Ptr{isl_ast_node}, (Ptr{isl_ast_expr},), expr)
end

function isl_ast_node_copy(node)
    ccall((:isl_ast_node_copy, libisl), Ptr{isl_ast_node}, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_free(node)
    ccall((:isl_ast_node_free, libisl), Ptr{isl_ast_node}, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_get_ctx(node)
    ccall((:isl_ast_node_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_ast_node},), node)
end

@cenum isl_ast_node_type::Int32 begin
    isl_ast_node_error = -1
    isl_ast_node_for = 1
    isl_ast_node_if = 2
    isl_ast_node_block = 3
    isl_ast_node_mark = 4
    isl_ast_node_user = 5
end

function isl_ast_node_get_type(node)
    ccall((:isl_ast_node_get_type, libisl), isl_ast_node_type, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_set_annotation(node, annotation)
    ccall((:isl_ast_node_set_annotation, libisl), Ptr{isl_ast_node}, (Ptr{isl_ast_node}, Ptr{isl_id}), node, annotation)
end

function isl_ast_node_get_annotation(node)
    ccall((:isl_ast_node_get_annotation, libisl), Ptr{isl_id}, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_for_get_iterator(node)
    ccall((:isl_ast_node_for_get_iterator, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_for_get_init(node)
    ccall((:isl_ast_node_for_get_init, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_for_get_cond(node)
    ccall((:isl_ast_node_for_get_cond, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_for_get_inc(node)
    ccall((:isl_ast_node_for_get_inc, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_for_get_body(node)
    ccall((:isl_ast_node_for_get_body, libisl), Ptr{isl_ast_node}, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_for_is_degenerate(node)
    ccall((:isl_ast_node_for_is_degenerate, libisl), isl_bool, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_if_get_cond(node)
    ccall((:isl_ast_node_if_get_cond, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_if_get_then_node(node)
    ccall((:isl_ast_node_if_get_then_node, libisl), Ptr{isl_ast_node}, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_if_get_then(node)
    ccall((:isl_ast_node_if_get_then, libisl), Ptr{isl_ast_node}, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_if_has_else_node(node)
    ccall((:isl_ast_node_if_has_else_node, libisl), isl_bool, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_if_has_else(node)
    ccall((:isl_ast_node_if_has_else, libisl), isl_bool, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_if_get_else_node(node)
    ccall((:isl_ast_node_if_get_else_node, libisl), Ptr{isl_ast_node}, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_if_get_else(node)
    ccall((:isl_ast_node_if_get_else, libisl), Ptr{isl_ast_node}, (Ptr{isl_ast_node},), node)
end

mutable struct isl_ast_node_list end

function isl_ast_node_block_get_children(node)
    ccall((:isl_ast_node_block_get_children, libisl), Ptr{isl_ast_node_list}, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_mark_get_id(node)
    ccall((:isl_ast_node_mark_get_id, libisl), Ptr{isl_id}, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_mark_get_node(node)
    ccall((:isl_ast_node_mark_get_node, libisl), Ptr{isl_ast_node}, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_user_get_expr(node)
    ccall((:isl_ast_node_user_get_expr, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_foreach_descendant_top_down(node, fn, user)
    ccall((:isl_ast_node_foreach_descendant_top_down, libisl), isl_stat, (Ptr{isl_ast_node}, Ptr{Cvoid}, Ptr{Cvoid}), node, fn, user)
end

function isl_printer_print_ast_node(p, node)
    ccall((:isl_printer_print_ast_node, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_ast_node}), p, node)
end

function isl_ast_node_dump(node)
    ccall((:isl_ast_node_dump, libisl), Cvoid, (Ptr{isl_ast_node},), node)
end

function isl_ast_node_to_str(node)
    ccall((:isl_ast_node_to_str, libisl), Ptr{Cchar}, (Ptr{isl_ast_node},), node)
end

mutable struct isl_ast_print_options end

function isl_ast_print_options_alloc(ctx)
    ccall((:isl_ast_print_options_alloc, libisl), Ptr{isl_ast_print_options}, (Ptr{isl_ctx},), ctx)
end

function isl_ast_print_options_copy(options)
    ccall((:isl_ast_print_options_copy, libisl), Ptr{isl_ast_print_options}, (Ptr{isl_ast_print_options},), options)
end

function isl_ast_print_options_free(options)
    ccall((:isl_ast_print_options_free, libisl), Ptr{isl_ast_print_options}, (Ptr{isl_ast_print_options},), options)
end

function isl_ast_print_options_get_ctx(options)
    ccall((:isl_ast_print_options_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_ast_print_options},), options)
end

function isl_ast_print_options_set_print_user(options, print_user, user)
    ccall((:isl_ast_print_options_set_print_user, libisl), Ptr{isl_ast_print_options}, (Ptr{isl_ast_print_options}, Ptr{Cvoid}, Ptr{Cvoid}), options, print_user, user)
end

function isl_ast_print_options_set_print_for(options, print_for, user)
    ccall((:isl_ast_print_options_set_print_for, libisl), Ptr{isl_ast_print_options}, (Ptr{isl_ast_print_options}, Ptr{Cvoid}, Ptr{Cvoid}), options, print_for, user)
end

function isl_options_set_ast_print_macro_once(ctx, val)
    ccall((:isl_options_set_ast_print_macro_once, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_ast_print_macro_once(ctx)
    ccall((:isl_options_get_ast_print_macro_once, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_ast_expr_foreach_ast_expr_op_type(expr, fn, user)
    ccall((:isl_ast_expr_foreach_ast_expr_op_type, libisl), isl_stat, (Ptr{isl_ast_expr}, Ptr{Cvoid}, Ptr{Cvoid}), expr, fn, user)
end

function isl_ast_expr_foreach_ast_op_type(expr, fn, user)
    ccall((:isl_ast_expr_foreach_ast_op_type, libisl), isl_stat, (Ptr{isl_ast_expr}, Ptr{Cvoid}, Ptr{Cvoid}), expr, fn, user)
end

function isl_ast_node_foreach_ast_expr_op_type(node, fn, user)
    ccall((:isl_ast_node_foreach_ast_expr_op_type, libisl), isl_stat, (Ptr{isl_ast_node}, Ptr{Cvoid}, Ptr{Cvoid}), node, fn, user)
end

function isl_ast_node_foreach_ast_op_type(node, fn, user)
    ccall((:isl_ast_node_foreach_ast_op_type, libisl), isl_stat, (Ptr{isl_ast_node}, Ptr{Cvoid}, Ptr{Cvoid}), node, fn, user)
end

function isl_ast_expr_op_type_set_print_name(p, type, name)
    ccall((:isl_ast_expr_op_type_set_print_name, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, isl_ast_expr_op_type, Ptr{Cchar}), p, type, name)
end

function isl_ast_op_type_set_print_name(p, type, name)
    ccall((:isl_ast_op_type_set_print_name, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, isl_ast_expr_op_type, Ptr{Cchar}), p, type, name)
end

function isl_ast_expr_op_type_print_macro(type, p)
    ccall((:isl_ast_expr_op_type_print_macro, libisl), Ptr{isl_printer}, (isl_ast_expr_op_type, Ptr{isl_printer}), type, p)
end

function isl_ast_op_type_print_macro(type, p)
    ccall((:isl_ast_op_type_print_macro, libisl), Ptr{isl_printer}, (isl_ast_expr_op_type, Ptr{isl_printer}), type, p)
end

function isl_ast_expr_print_macros(expr, p)
    ccall((:isl_ast_expr_print_macros, libisl), Ptr{isl_printer}, (Ptr{isl_ast_expr}, Ptr{isl_printer}), expr, p)
end

function isl_ast_node_print_macros(node, p)
    ccall((:isl_ast_node_print_macros, libisl), Ptr{isl_printer}, (Ptr{isl_ast_node}, Ptr{isl_printer}), node, p)
end

function isl_ast_node_print(node, p, options)
    ccall((:isl_ast_node_print, libisl), Ptr{isl_printer}, (Ptr{isl_ast_node}, Ptr{isl_printer}, Ptr{isl_ast_print_options}), node, p, options)
end

function isl_ast_node_for_print(node, p, options)
    ccall((:isl_ast_node_for_print, libisl), Ptr{isl_printer}, (Ptr{isl_ast_node}, Ptr{isl_printer}, Ptr{isl_ast_print_options}), node, p, options)
end

function isl_ast_node_if_print(node, p, options)
    ccall((:isl_ast_node_if_print, libisl), Ptr{isl_printer}, (Ptr{isl_ast_node}, Ptr{isl_printer}, Ptr{isl_ast_print_options}), node, p, options)
end

function isl_ast_node_to_C_str(node)
    ccall((:isl_ast_node_to_C_str, libisl), Ptr{Cchar}, (Ptr{isl_ast_node},), node)
end

mutable struct isl_ast_build end

function isl_options_set_ast_build_atomic_upper_bound(ctx, val)
    ccall((:isl_options_set_ast_build_atomic_upper_bound, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_ast_build_atomic_upper_bound(ctx)
    ccall((:isl_options_get_ast_build_atomic_upper_bound, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_ast_build_prefer_pdiv(ctx, val)
    ccall((:isl_options_set_ast_build_prefer_pdiv, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_ast_build_prefer_pdiv(ctx)
    ccall((:isl_options_get_ast_build_prefer_pdiv, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_ast_build_detect_min_max(ctx, val)
    ccall((:isl_options_set_ast_build_detect_min_max, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_ast_build_detect_min_max(ctx)
    ccall((:isl_options_get_ast_build_detect_min_max, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_ast_build_exploit_nested_bounds(ctx, val)
    ccall((:isl_options_set_ast_build_exploit_nested_bounds, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_ast_build_exploit_nested_bounds(ctx)
    ccall((:isl_options_get_ast_build_exploit_nested_bounds, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_ast_build_group_coscheduled(ctx, val)
    ccall((:isl_options_set_ast_build_group_coscheduled, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_ast_build_group_coscheduled(ctx)
    ccall((:isl_options_get_ast_build_group_coscheduled, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_ast_build_separation_bounds(ctx, val)
    ccall((:isl_options_set_ast_build_separation_bounds, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_ast_build_separation_bounds(ctx)
    ccall((:isl_options_get_ast_build_separation_bounds, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_ast_build_scale_strides(ctx, val)
    ccall((:isl_options_set_ast_build_scale_strides, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_ast_build_scale_strides(ctx)
    ccall((:isl_options_get_ast_build_scale_strides, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_ast_build_allow_else(ctx, val)
    ccall((:isl_options_set_ast_build_allow_else, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_ast_build_allow_else(ctx)
    ccall((:isl_options_get_ast_build_allow_else, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_ast_build_allow_or(ctx, val)
    ccall((:isl_options_set_ast_build_allow_or, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_ast_build_allow_or(ctx)
    ccall((:isl_options_get_ast_build_allow_or, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_ast_build_get_ctx(build)
    ccall((:isl_ast_build_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_ast_build},), build)
end

function isl_ast_build_alloc(ctx)
    ccall((:isl_ast_build_alloc, libisl), Ptr{isl_ast_build}, (Ptr{isl_ctx},), ctx)
end

function isl_ast_build_from_context(set)
    ccall((:isl_ast_build_from_context, libisl), Ptr{isl_ast_build}, (Ptr{isl_set},), set)
end

function isl_ast_build_get_schedule_space(build)
    ccall((:isl_ast_build_get_schedule_space, libisl), Ptr{isl_space}, (Ptr{isl_ast_build},), build)
end

function isl_ast_build_get_schedule(build)
    ccall((:isl_ast_build_get_schedule, libisl), Ptr{isl_union_map}, (Ptr{isl_ast_build},), build)
end

function isl_ast_build_restrict(build, set)
    ccall((:isl_ast_build_restrict, libisl), Ptr{isl_ast_build}, (Ptr{isl_ast_build}, Ptr{isl_set}), build, set)
end

function isl_ast_build_copy(build)
    ccall((:isl_ast_build_copy, libisl), Ptr{isl_ast_build}, (Ptr{isl_ast_build},), build)
end

function isl_ast_build_free(build)
    ccall((:isl_ast_build_free, libisl), Ptr{isl_ast_build}, (Ptr{isl_ast_build},), build)
end

function isl_ast_build_set_options(build, options)
    ccall((:isl_ast_build_set_options, libisl), Ptr{isl_ast_build}, (Ptr{isl_ast_build}, Ptr{isl_union_map}), build, options)
end

function isl_ast_build_set_iterators(build, iterators)
    ccall((:isl_ast_build_set_iterators, libisl), Ptr{isl_ast_build}, (Ptr{isl_ast_build}, Ptr{isl_id_list}), build, iterators)
end

function isl_ast_build_set_at_each_domain(build, fn, user)
    ccall((:isl_ast_build_set_at_each_domain, libisl), Ptr{isl_ast_build}, (Ptr{isl_ast_build}, Ptr{Cvoid}, Ptr{Cvoid}), build, fn, user)
end

function isl_ast_build_set_before_each_for(build, fn, user)
    ccall((:isl_ast_build_set_before_each_for, libisl), Ptr{isl_ast_build}, (Ptr{isl_ast_build}, Ptr{Cvoid}, Ptr{Cvoid}), build, fn, user)
end

function isl_ast_build_set_after_each_for(build, fn, user)
    ccall((:isl_ast_build_set_after_each_for, libisl), Ptr{isl_ast_build}, (Ptr{isl_ast_build}, Ptr{Cvoid}, Ptr{Cvoid}), build, fn, user)
end

function isl_ast_build_set_before_each_mark(build, fn, user)
    ccall((:isl_ast_build_set_before_each_mark, libisl), Ptr{isl_ast_build}, (Ptr{isl_ast_build}, Ptr{Cvoid}, Ptr{Cvoid}), build, fn, user)
end

function isl_ast_build_set_after_each_mark(build, fn, user)
    ccall((:isl_ast_build_set_after_each_mark, libisl), Ptr{isl_ast_build}, (Ptr{isl_ast_build}, Ptr{Cvoid}, Ptr{Cvoid}), build, fn, user)
end

function isl_ast_build_set_create_leaf(build, fn, user)
    ccall((:isl_ast_build_set_create_leaf, libisl), Ptr{isl_ast_build}, (Ptr{isl_ast_build}, Ptr{Cvoid}, Ptr{Cvoid}), build, fn, user)
end

function isl_ast_build_expr_from_set(build, set)
    ccall((:isl_ast_build_expr_from_set, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_build}, Ptr{isl_set}), build, set)
end

function isl_ast_build_expr_from_pw_aff(build, pa)
    ccall((:isl_ast_build_expr_from_pw_aff, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_build}, Ptr{isl_pw_aff}), build, pa)
end

function isl_ast_build_access_from_pw_multi_aff(build, pma)
    ccall((:isl_ast_build_access_from_pw_multi_aff, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_build}, Ptr{isl_pw_multi_aff}), build, pma)
end

function isl_ast_build_access_from_multi_pw_aff(build, mpa)
    ccall((:isl_ast_build_access_from_multi_pw_aff, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_build}, Ptr{isl_multi_pw_aff}), build, mpa)
end

function isl_ast_build_call_from_pw_multi_aff(build, pma)
    ccall((:isl_ast_build_call_from_pw_multi_aff, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_build}, Ptr{isl_pw_multi_aff}), build, pma)
end

function isl_ast_build_call_from_multi_pw_aff(build, mpa)
    ccall((:isl_ast_build_call_from_multi_pw_aff, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_build}, Ptr{isl_multi_pw_aff}), build, mpa)
end

mutable struct isl_schedule end

function isl_ast_build_node_from_schedule(build, schedule)
    ccall((:isl_ast_build_node_from_schedule, libisl), Ptr{isl_ast_node}, (Ptr{isl_ast_build}, Ptr{isl_schedule}), build, schedule)
end

function isl_ast_build_node_from_schedule_map(build, schedule)
    ccall((:isl_ast_build_node_from_schedule_map, libisl), Ptr{isl_ast_node}, (Ptr{isl_ast_build}, Ptr{isl_union_map}), build, schedule)
end

function isl_ast_build_ast_from_schedule(build, schedule)
    ccall((:isl_ast_build_ast_from_schedule, libisl), Ptr{isl_ast_node}, (Ptr{isl_ast_build}, Ptr{isl_union_map}), build, schedule)
end

@cenum isl_ast_loop_type::Int32 begin
    isl_ast_loop_error = -1
    isl_ast_loop_default = 0
    isl_ast_loop_atomic = 1
    isl_ast_loop_unroll = 2
    isl_ast_loop_separate = 3
end

function isl_ast_expr_list_get_ctx(list)
    ccall((:isl_ast_expr_list_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_ast_expr_list},), list)
end

function isl_ast_expr_list_from_ast_expr(el)
    ccall((:isl_ast_expr_list_from_ast_expr, libisl), Ptr{isl_ast_expr_list}, (Ptr{isl_ast_expr},), el)
end

function isl_ast_expr_list_alloc(ctx, n)
    ccall((:isl_ast_expr_list_alloc, libisl), Ptr{isl_ast_expr_list}, (Ptr{isl_ctx}, Cint), ctx, n)
end

function isl_ast_expr_list_copy(list)
    ccall((:isl_ast_expr_list_copy, libisl), Ptr{isl_ast_expr_list}, (Ptr{isl_ast_expr_list},), list)
end

function isl_ast_expr_list_free(list)
    ccall((:isl_ast_expr_list_free, libisl), Ptr{isl_ast_expr_list}, (Ptr{isl_ast_expr_list},), list)
end

function isl_ast_expr_list_add(list, el)
    ccall((:isl_ast_expr_list_add, libisl), Ptr{isl_ast_expr_list}, (Ptr{isl_ast_expr_list}, Ptr{isl_ast_expr}), list, el)
end

function isl_ast_expr_list_insert(list, pos, el)
    ccall((:isl_ast_expr_list_insert, libisl), Ptr{isl_ast_expr_list}, (Ptr{isl_ast_expr_list}, Cuint, Ptr{isl_ast_expr}), list, pos, el)
end

function isl_ast_expr_list_drop(list, first, n)
    ccall((:isl_ast_expr_list_drop, libisl), Ptr{isl_ast_expr_list}, (Ptr{isl_ast_expr_list}, Cuint, Cuint), list, first, n)
end

function isl_ast_expr_list_clear(list)
    ccall((:isl_ast_expr_list_clear, libisl), Ptr{isl_ast_expr_list}, (Ptr{isl_ast_expr_list},), list)
end

function isl_ast_expr_list_swap(list, pos1, pos2)
    ccall((:isl_ast_expr_list_swap, libisl), Ptr{isl_ast_expr_list}, (Ptr{isl_ast_expr_list}, Cuint, Cuint), list, pos1, pos2)
end

function isl_ast_expr_list_reverse(list)
    ccall((:isl_ast_expr_list_reverse, libisl), Ptr{isl_ast_expr_list}, (Ptr{isl_ast_expr_list},), list)
end

function isl_ast_expr_list_concat(list1, list2)
    ccall((:isl_ast_expr_list_concat, libisl), Ptr{isl_ast_expr_list}, (Ptr{isl_ast_expr_list}, Ptr{isl_ast_expr_list}), list1, list2)
end

function isl_ast_expr_list_size(list)
    ccall((:isl_ast_expr_list_size, libisl), isl_size, (Ptr{isl_ast_expr_list},), list)
end

function isl_ast_expr_list_n_ast_expr(list)
    ccall((:isl_ast_expr_list_n_ast_expr, libisl), isl_size, (Ptr{isl_ast_expr_list},), list)
end

function isl_ast_expr_list_get_at(list, index)
    ccall((:isl_ast_expr_list_get_at, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr_list}, Cint), list, index)
end

function isl_ast_expr_list_get_ast_expr(list, index)
    ccall((:isl_ast_expr_list_get_ast_expr, libisl), Ptr{isl_ast_expr}, (Ptr{isl_ast_expr_list}, Cint), list, index)
end

function isl_ast_expr_list_set_ast_expr(list, index, el)
    ccall((:isl_ast_expr_list_set_ast_expr, libisl), Ptr{isl_ast_expr_list}, (Ptr{isl_ast_expr_list}, Cint, Ptr{isl_ast_expr}), list, index, el)
end

function isl_ast_expr_list_foreach(list, fn, user)
    ccall((:isl_ast_expr_list_foreach, libisl), isl_stat, (Ptr{isl_ast_expr_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_ast_expr_list_map(list, fn, user)
    ccall((:isl_ast_expr_list_map, libisl), Ptr{isl_ast_expr_list}, (Ptr{isl_ast_expr_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_ast_expr_list_sort(list, cmp, user)
    ccall((:isl_ast_expr_list_sort, libisl), Ptr{isl_ast_expr_list}, (Ptr{isl_ast_expr_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, cmp, user)
end

function isl_ast_expr_list_foreach_scc(list, follows, follows_user, fn, fn_user)
    ccall((:isl_ast_expr_list_foreach_scc, libisl), isl_stat, (Ptr{isl_ast_expr_list}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), list, follows, follows_user, fn, fn_user)
end

function isl_ast_expr_list_to_str(list)
    ccall((:isl_ast_expr_list_to_str, libisl), Ptr{Cchar}, (Ptr{isl_ast_expr_list},), list)
end

function isl_printer_print_ast_expr_list(p, list)
    ccall((:isl_printer_print_ast_expr_list, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_ast_expr_list}), p, list)
end

function isl_ast_expr_list_dump(list)
    ccall((:isl_ast_expr_list_dump, libisl), Cvoid, (Ptr{isl_ast_expr_list},), list)
end

function isl_ast_node_list_get_ctx(list)
    ccall((:isl_ast_node_list_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_ast_node_list},), list)
end

function isl_ast_node_list_from_ast_node(el)
    ccall((:isl_ast_node_list_from_ast_node, libisl), Ptr{isl_ast_node_list}, (Ptr{isl_ast_node},), el)
end

function isl_ast_node_list_alloc(ctx, n)
    ccall((:isl_ast_node_list_alloc, libisl), Ptr{isl_ast_node_list}, (Ptr{isl_ctx}, Cint), ctx, n)
end

function isl_ast_node_list_copy(list)
    ccall((:isl_ast_node_list_copy, libisl), Ptr{isl_ast_node_list}, (Ptr{isl_ast_node_list},), list)
end

function isl_ast_node_list_free(list)
    ccall((:isl_ast_node_list_free, libisl), Ptr{isl_ast_node_list}, (Ptr{isl_ast_node_list},), list)
end

function isl_ast_node_list_add(list, el)
    ccall((:isl_ast_node_list_add, libisl), Ptr{isl_ast_node_list}, (Ptr{isl_ast_node_list}, Ptr{isl_ast_node}), list, el)
end

function isl_ast_node_list_insert(list, pos, el)
    ccall((:isl_ast_node_list_insert, libisl), Ptr{isl_ast_node_list}, (Ptr{isl_ast_node_list}, Cuint, Ptr{isl_ast_node}), list, pos, el)
end

function isl_ast_node_list_drop(list, first, n)
    ccall((:isl_ast_node_list_drop, libisl), Ptr{isl_ast_node_list}, (Ptr{isl_ast_node_list}, Cuint, Cuint), list, first, n)
end

function isl_ast_node_list_clear(list)
    ccall((:isl_ast_node_list_clear, libisl), Ptr{isl_ast_node_list}, (Ptr{isl_ast_node_list},), list)
end

function isl_ast_node_list_swap(list, pos1, pos2)
    ccall((:isl_ast_node_list_swap, libisl), Ptr{isl_ast_node_list}, (Ptr{isl_ast_node_list}, Cuint, Cuint), list, pos1, pos2)
end

function isl_ast_node_list_reverse(list)
    ccall((:isl_ast_node_list_reverse, libisl), Ptr{isl_ast_node_list}, (Ptr{isl_ast_node_list},), list)
end

function isl_ast_node_list_concat(list1, list2)
    ccall((:isl_ast_node_list_concat, libisl), Ptr{isl_ast_node_list}, (Ptr{isl_ast_node_list}, Ptr{isl_ast_node_list}), list1, list2)
end

function isl_ast_node_list_size(list)
    ccall((:isl_ast_node_list_size, libisl), isl_size, (Ptr{isl_ast_node_list},), list)
end

function isl_ast_node_list_n_ast_node(list)
    ccall((:isl_ast_node_list_n_ast_node, libisl), isl_size, (Ptr{isl_ast_node_list},), list)
end

function isl_ast_node_list_get_at(list, index)
    ccall((:isl_ast_node_list_get_at, libisl), Ptr{isl_ast_node}, (Ptr{isl_ast_node_list}, Cint), list, index)
end

function isl_ast_node_list_get_ast_node(list, index)
    ccall((:isl_ast_node_list_get_ast_node, libisl), Ptr{isl_ast_node}, (Ptr{isl_ast_node_list}, Cint), list, index)
end

function isl_ast_node_list_set_ast_node(list, index, el)
    ccall((:isl_ast_node_list_set_ast_node, libisl), Ptr{isl_ast_node_list}, (Ptr{isl_ast_node_list}, Cint, Ptr{isl_ast_node}), list, index, el)
end

function isl_ast_node_list_foreach(list, fn, user)
    ccall((:isl_ast_node_list_foreach, libisl), isl_stat, (Ptr{isl_ast_node_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_ast_node_list_map(list, fn, user)
    ccall((:isl_ast_node_list_map, libisl), Ptr{isl_ast_node_list}, (Ptr{isl_ast_node_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_ast_node_list_sort(list, cmp, user)
    ccall((:isl_ast_node_list_sort, libisl), Ptr{isl_ast_node_list}, (Ptr{isl_ast_node_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, cmp, user)
end

function isl_ast_node_list_foreach_scc(list, follows, follows_user, fn, fn_user)
    ccall((:isl_ast_node_list_foreach_scc, libisl), isl_stat, (Ptr{isl_ast_node_list}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), list, follows, follows_user, fn, fn_user)
end

function isl_ast_node_list_to_str(list)
    ccall((:isl_ast_node_list_to_str, libisl), Ptr{Cchar}, (Ptr{isl_ast_node_list},), list)
end

function isl_printer_print_ast_node_list(p, list)
    ccall((:isl_printer_print_ast_node_list, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_ast_node_list}), p, list)
end

function isl_ast_node_list_dump(list)
    ccall((:isl_ast_node_list_dump, libisl), Cvoid, (Ptr{isl_ast_node_list},), list)
end

mutable struct isl_constraint end

mutable struct isl_constraint_list end

function isl_constraint_list_get_ctx(list)
    ccall((:isl_constraint_list_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_constraint_list},), list)
end

function isl_constraint_list_from_constraint(el)
    ccall((:isl_constraint_list_from_constraint, libisl), Ptr{isl_constraint_list}, (Ptr{isl_constraint},), el)
end

function isl_constraint_list_alloc(ctx, n)
    ccall((:isl_constraint_list_alloc, libisl), Ptr{isl_constraint_list}, (Ptr{isl_ctx}, Cint), ctx, n)
end

function isl_constraint_list_copy(list)
    ccall((:isl_constraint_list_copy, libisl), Ptr{isl_constraint_list}, (Ptr{isl_constraint_list},), list)
end

function isl_constraint_list_free(list)
    ccall((:isl_constraint_list_free, libisl), Ptr{isl_constraint_list}, (Ptr{isl_constraint_list},), list)
end

function isl_constraint_list_add(list, el)
    ccall((:isl_constraint_list_add, libisl), Ptr{isl_constraint_list}, (Ptr{isl_constraint_list}, Ptr{isl_constraint}), list, el)
end

function isl_constraint_list_insert(list, pos, el)
    ccall((:isl_constraint_list_insert, libisl), Ptr{isl_constraint_list}, (Ptr{isl_constraint_list}, Cuint, Ptr{isl_constraint}), list, pos, el)
end

function isl_constraint_list_drop(list, first, n)
    ccall((:isl_constraint_list_drop, libisl), Ptr{isl_constraint_list}, (Ptr{isl_constraint_list}, Cuint, Cuint), list, first, n)
end

function isl_constraint_list_clear(list)
    ccall((:isl_constraint_list_clear, libisl), Ptr{isl_constraint_list}, (Ptr{isl_constraint_list},), list)
end

function isl_constraint_list_swap(list, pos1, pos2)
    ccall((:isl_constraint_list_swap, libisl), Ptr{isl_constraint_list}, (Ptr{isl_constraint_list}, Cuint, Cuint), list, pos1, pos2)
end

function isl_constraint_list_reverse(list)
    ccall((:isl_constraint_list_reverse, libisl), Ptr{isl_constraint_list}, (Ptr{isl_constraint_list},), list)
end

function isl_constraint_list_concat(list1, list2)
    ccall((:isl_constraint_list_concat, libisl), Ptr{isl_constraint_list}, (Ptr{isl_constraint_list}, Ptr{isl_constraint_list}), list1, list2)
end

function isl_constraint_list_size(list)
    ccall((:isl_constraint_list_size, libisl), isl_size, (Ptr{isl_constraint_list},), list)
end

function isl_constraint_list_n_constraint(list)
    ccall((:isl_constraint_list_n_constraint, libisl), isl_size, (Ptr{isl_constraint_list},), list)
end

function isl_constraint_list_get_at(list, index)
    ccall((:isl_constraint_list_get_at, libisl), Ptr{isl_constraint}, (Ptr{isl_constraint_list}, Cint), list, index)
end

function isl_constraint_list_get_constraint(list, index)
    ccall((:isl_constraint_list_get_constraint, libisl), Ptr{isl_constraint}, (Ptr{isl_constraint_list}, Cint), list, index)
end

function isl_constraint_list_set_constraint(list, index, el)
    ccall((:isl_constraint_list_set_constraint, libisl), Ptr{isl_constraint_list}, (Ptr{isl_constraint_list}, Cint, Ptr{isl_constraint}), list, index, el)
end

function isl_constraint_list_foreach(list, fn, user)
    ccall((:isl_constraint_list_foreach, libisl), isl_stat, (Ptr{isl_constraint_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_constraint_list_map(list, fn, user)
    ccall((:isl_constraint_list_map, libisl), Ptr{isl_constraint_list}, (Ptr{isl_constraint_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_constraint_list_sort(list, cmp, user)
    ccall((:isl_constraint_list_sort, libisl), Ptr{isl_constraint_list}, (Ptr{isl_constraint_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, cmp, user)
end

function isl_constraint_list_foreach_scc(list, follows, follows_user, fn, fn_user)
    ccall((:isl_constraint_list_foreach_scc, libisl), isl_stat, (Ptr{isl_constraint_list}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), list, follows, follows_user, fn, fn_user)
end

function isl_constraint_list_to_str(list)
    ccall((:isl_constraint_list_to_str, libisl), Ptr{Cchar}, (Ptr{isl_constraint_list},), list)
end

function isl_printer_print_constraint_list(p, list)
    ccall((:isl_printer_print_constraint_list, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_constraint_list}), p, list)
end

function isl_constraint_list_dump(list)
    ccall((:isl_constraint_list_dump, libisl), Cvoid, (Ptr{isl_constraint_list},), list)
end

function isl_constraint_get_ctx(c)
    ccall((:isl_constraint_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_constraint},), c)
end

function isl_constraint_alloc_equality(ls)
    ccall((:isl_constraint_alloc_equality, libisl), Ptr{isl_constraint}, (Ptr{isl_local_space},), ls)
end

function isl_constraint_alloc_inequality(ls)
    ccall((:isl_constraint_alloc_inequality, libisl), Ptr{isl_constraint}, (Ptr{isl_local_space},), ls)
end

function isl_equality_alloc(ls)
    ccall((:isl_equality_alloc, libisl), Ptr{isl_constraint}, (Ptr{isl_local_space},), ls)
end

function isl_inequality_alloc(ls)
    ccall((:isl_inequality_alloc, libisl), Ptr{isl_constraint}, (Ptr{isl_local_space},), ls)
end

function isl_constraint_copy(c)
    ccall((:isl_constraint_copy, libisl), Ptr{isl_constraint}, (Ptr{isl_constraint},), c)
end

function isl_constraint_free(c)
    ccall((:isl_constraint_free, libisl), Ptr{isl_constraint}, (Ptr{isl_constraint},), c)
end

mutable struct isl_basic_map end

function isl_basic_map_n_constraint(bmap)
    ccall((:isl_basic_map_n_constraint, libisl), isl_size, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_set_n_constraint(bset)
    ccall((:isl_basic_set_n_constraint, libisl), isl_size, (Ptr{isl_basic_set},), bset)
end

function isl_basic_map_foreach_constraint(bmap, fn, user)
    ccall((:isl_basic_map_foreach_constraint, libisl), isl_stat, (Ptr{isl_basic_map}, Ptr{Cvoid}, Ptr{Cvoid}), bmap, fn, user)
end

function isl_basic_set_foreach_constraint(bset, fn, user)
    ccall((:isl_basic_set_foreach_constraint, libisl), isl_stat, (Ptr{isl_basic_set}, Ptr{Cvoid}, Ptr{Cvoid}), bset, fn, user)
end

function isl_basic_map_get_constraint_list(bmap)
    ccall((:isl_basic_map_get_constraint_list, libisl), Ptr{isl_constraint_list}, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_set_get_constraint_list(bset)
    ccall((:isl_basic_set_get_constraint_list, libisl), Ptr{isl_constraint_list}, (Ptr{isl_basic_set},), bset)
end

function isl_constraint_is_equal(constraint1, constraint2)
    ccall((:isl_constraint_is_equal, libisl), Cint, (Ptr{isl_constraint}, Ptr{isl_constraint}), constraint1, constraint2)
end

function isl_basic_set_foreach_bound_pair(bset, type, pos, fn, user)
    ccall((:isl_basic_set_foreach_bound_pair, libisl), isl_stat, (Ptr{isl_basic_set}, isl_dim_type, Cuint, Ptr{Cvoid}, Ptr{Cvoid}), bset, type, pos, fn, user)
end

function isl_basic_map_add_constraint(bmap, constraint)
    ccall((:isl_basic_map_add_constraint, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, Ptr{isl_constraint}), bmap, constraint)
end

function isl_basic_set_add_constraint(bset, constraint)
    ccall((:isl_basic_set_add_constraint, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, Ptr{isl_constraint}), bset, constraint)
end

function isl_map_add_constraint(map, constraint)
    ccall((:isl_map_add_constraint, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_constraint}), map, constraint)
end

function isl_set_add_constraint(set, constraint)
    ccall((:isl_set_add_constraint, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_constraint}), set, constraint)
end

function isl_basic_map_has_defining_equality(bmap, type, pos, c)
    ccall((:isl_basic_map_has_defining_equality, libisl), isl_bool, (Ptr{isl_basic_map}, isl_dim_type, Cint, Ptr{Ptr{isl_constraint}}), bmap, type, pos, c)
end

function isl_basic_set_has_defining_equality(bset, type, pos, constraint)
    ccall((:isl_basic_set_has_defining_equality, libisl), isl_bool, (Ptr{isl_basic_set}, isl_dim_type, Cint, Ptr{Ptr{isl_constraint}}), bset, type, pos, constraint)
end

function isl_basic_set_has_defining_inequalities(bset, type, pos, lower, upper)
    ccall((:isl_basic_set_has_defining_inequalities, libisl), isl_bool, (Ptr{isl_basic_set}, isl_dim_type, Cint, Ptr{Ptr{isl_constraint}}, Ptr{Ptr{isl_constraint}}), bset, type, pos, lower, upper)
end

function isl_constraint_get_space(constraint)
    ccall((:isl_constraint_get_space, libisl), Ptr{isl_space}, (Ptr{isl_constraint},), constraint)
end

function isl_constraint_get_local_space(constraint)
    ccall((:isl_constraint_get_local_space, libisl), Ptr{isl_local_space}, (Ptr{isl_constraint},), constraint)
end

function isl_constraint_dim(constraint, type)
    ccall((:isl_constraint_dim, libisl), isl_size, (Ptr{isl_constraint}, isl_dim_type), constraint, type)
end

function isl_constraint_involves_dims(constraint, type, first, n)
    ccall((:isl_constraint_involves_dims, libisl), isl_bool, (Ptr{isl_constraint}, isl_dim_type, Cuint, Cuint), constraint, type, first, n)
end

function isl_constraint_get_dim_name(constraint, type, pos)
    ccall((:isl_constraint_get_dim_name, libisl), Ptr{Cchar}, (Ptr{isl_constraint}, isl_dim_type, Cuint), constraint, type, pos)
end

function isl_constraint_get_constant_val(constraint)
    ccall((:isl_constraint_get_constant_val, libisl), Ptr{isl_val}, (Ptr{isl_constraint},), constraint)
end

function isl_constraint_get_coefficient_val(constraint, type, pos)
    ccall((:isl_constraint_get_coefficient_val, libisl), Ptr{isl_val}, (Ptr{isl_constraint}, isl_dim_type, Cint), constraint, type, pos)
end

function isl_constraint_set_constant_si(constraint, v)
    ccall((:isl_constraint_set_constant_si, libisl), Ptr{isl_constraint}, (Ptr{isl_constraint}, Cint), constraint, v)
end

function isl_constraint_set_constant_val(constraint, v)
    ccall((:isl_constraint_set_constant_val, libisl), Ptr{isl_constraint}, (Ptr{isl_constraint}, Ptr{isl_val}), constraint, v)
end

function isl_constraint_set_coefficient_si(constraint, type, pos, v)
    ccall((:isl_constraint_set_coefficient_si, libisl), Ptr{isl_constraint}, (Ptr{isl_constraint}, isl_dim_type, Cint, Cint), constraint, type, pos, v)
end

function isl_constraint_set_coefficient_val(constraint, type, pos, v)
    ccall((:isl_constraint_set_coefficient_val, libisl), Ptr{isl_constraint}, (Ptr{isl_constraint}, isl_dim_type, Cint, Ptr{isl_val}), constraint, type, pos, v)
end

function isl_constraint_get_div(constraint, pos)
    ccall((:isl_constraint_get_div, libisl), Ptr{isl_aff}, (Ptr{isl_constraint}, Cint), constraint, pos)
end

function isl_constraint_negate(constraint)
    ccall((:isl_constraint_negate, libisl), Ptr{isl_constraint}, (Ptr{isl_constraint},), constraint)
end

function isl_constraint_is_equality(constraint)
    ccall((:isl_constraint_is_equality, libisl), isl_bool, (Ptr{isl_constraint},), constraint)
end

function isl_constraint_is_div_constraint(constraint)
    ccall((:isl_constraint_is_div_constraint, libisl), isl_bool, (Ptr{isl_constraint},), constraint)
end

function isl_constraint_is_lower_bound(constraint, type, pos)
    ccall((:isl_constraint_is_lower_bound, libisl), isl_bool, (Ptr{isl_constraint}, isl_dim_type, Cuint), constraint, type, pos)
end

function isl_constraint_is_upper_bound(constraint, type, pos)
    ccall((:isl_constraint_is_upper_bound, libisl), isl_bool, (Ptr{isl_constraint}, isl_dim_type, Cuint), constraint, type, pos)
end

function isl_basic_map_from_constraint(constraint)
    ccall((:isl_basic_map_from_constraint, libisl), Ptr{isl_basic_map}, (Ptr{isl_constraint},), constraint)
end

function isl_basic_set_from_constraint(constraint)
    ccall((:isl_basic_set_from_constraint, libisl), Ptr{isl_basic_set}, (Ptr{isl_constraint},), constraint)
end

function isl_constraint_get_bound(constraint, type, pos)
    ccall((:isl_constraint_get_bound, libisl), Ptr{isl_aff}, (Ptr{isl_constraint}, isl_dim_type, Cint), constraint, type, pos)
end

function isl_constraint_get_aff(constraint)
    ccall((:isl_constraint_get_aff, libisl), Ptr{isl_aff}, (Ptr{isl_constraint},), constraint)
end

function isl_equality_from_aff(aff)
    ccall((:isl_equality_from_aff, libisl), Ptr{isl_constraint}, (Ptr{isl_aff},), aff)
end

function isl_inequality_from_aff(aff)
    ccall((:isl_inequality_from_aff, libisl), Ptr{isl_constraint}, (Ptr{isl_aff},), aff)
end

function isl_constraint_plain_cmp(c1, c2)
    ccall((:isl_constraint_plain_cmp, libisl), Cint, (Ptr{isl_constraint}, Ptr{isl_constraint}), c1, c2)
end

function isl_constraint_cmp_last_non_zero(c1, c2)
    ccall((:isl_constraint_cmp_last_non_zero, libisl), Cint, (Ptr{isl_constraint}, Ptr{isl_constraint}), c1, c2)
end

function isl_printer_print_constraint(p, c)
    ccall((:isl_printer_print_constraint, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_constraint}), p, c)
end

function isl_constraint_dump(c)
    ccall((:isl_constraint_dump, libisl), Cvoid, (Ptr{isl_constraint},), c)
end

struct isl_stats
    gbr_solved_lps::Clong
end

@cenum isl_error::UInt32 begin
    isl_error_none = 0
    isl_error_abort = 1
    isl_error_alloc = 2
    isl_error_unknown = 3
    isl_error_internal = 4
    isl_error_invalid = 5
    isl_error_quota = 6
    isl_error_unsupported = 7
end

function isl_stat_non_null(obj)
    ccall((:isl_stat_non_null, libisl), isl_stat, (Ptr{Cvoid},), obj)
end

function isl_bool_not(b)
    ccall((:isl_bool_not, libisl), isl_bool, (isl_bool,), b)
end

function isl_bool_ok(b)
    ccall((:isl_bool_ok, libisl), isl_bool, (Cint,), b)
end

function isl_malloc_or_die(ctx, size)
    ccall((:isl_malloc_or_die, libisl), Ptr{Cvoid}, (Ptr{isl_ctx}, Csize_t), ctx, size)
end

function isl_calloc_or_die(ctx, nmemb, size)
    ccall((:isl_calloc_or_die, libisl), Ptr{Cvoid}, (Ptr{isl_ctx}, Csize_t, Csize_t), ctx, nmemb, size)
end

function isl_realloc_or_die(ctx, ptr, size)
    ccall((:isl_realloc_or_die, libisl), Ptr{Cvoid}, (Ptr{isl_ctx}, Ptr{Cvoid}, Csize_t), ctx, ptr, size)
end

function isl_handle_error(ctx, error, msg, file, line)
    ccall((:isl_handle_error, libisl), Cvoid, (Ptr{isl_ctx}, isl_error, Ptr{Cchar}, Ptr{Cchar}, Cint), ctx, error, msg, file, line)
end

mutable struct isl_options end

function isl_ctx_options(ctx)
    ccall((:isl_ctx_options, libisl), Ptr{isl_options}, (Ptr{isl_ctx},), ctx)
end

function isl_ctx_alloc_with_options(args, opt)
    ccall((:isl_ctx_alloc_with_options, libisl), Ptr{isl_ctx}, (Ptr{isl_args}, Ptr{Cvoid}), args, opt)
end

function isl_ctx_alloc()
    ccall((:isl_ctx_alloc, libisl), Ptr{isl_ctx}, ())
end

function isl_ctx_peek_options(ctx, args)
    ccall((:isl_ctx_peek_options, libisl), Ptr{Cvoid}, (Ptr{isl_ctx}, Ptr{isl_args}), ctx, args)
end

function isl_ctx_parse_options(ctx, argc, argv, flags)
    ccall((:isl_ctx_parse_options, libisl), Cint, (Ptr{isl_ctx}, Cint, Ptr{Ptr{Cchar}}, Cuint), ctx, argc, argv, flags)
end

function isl_ctx_ref(ctx)
    ccall((:isl_ctx_ref, libisl), Cvoid, (Ptr{isl_ctx},), ctx)
end

function isl_ctx_deref(ctx)
    ccall((:isl_ctx_deref, libisl), Cvoid, (Ptr{isl_ctx},), ctx)
end

function isl_ctx_free(ctx)
    ccall((:isl_ctx_free, libisl), Cvoid, (Ptr{isl_ctx},), ctx)
end

function isl_ctx_abort(ctx)
    ccall((:isl_ctx_abort, libisl), Cvoid, (Ptr{isl_ctx},), ctx)
end

function isl_ctx_resume(ctx)
    ccall((:isl_ctx_resume, libisl), Cvoid, (Ptr{isl_ctx},), ctx)
end

function isl_ctx_aborted(ctx)
    ccall((:isl_ctx_aborted, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_ctx_set_max_operations(ctx, max_operations)
    ccall((:isl_ctx_set_max_operations, libisl), Cvoid, (Ptr{isl_ctx}, Culong), ctx, max_operations)
end

function isl_ctx_get_max_operations(ctx)
    ccall((:isl_ctx_get_max_operations, libisl), Culong, (Ptr{isl_ctx},), ctx)
end

function isl_ctx_reset_operations(ctx)
    ccall((:isl_ctx_reset_operations, libisl), Cvoid, (Ptr{isl_ctx},), ctx)
end

function isl_ctx_last_error(ctx)
    ccall((:isl_ctx_last_error, libisl), isl_error, (Ptr{isl_ctx},), ctx)
end

function isl_ctx_last_error_msg(ctx)
    ccall((:isl_ctx_last_error_msg, libisl), Ptr{Cchar}, (Ptr{isl_ctx},), ctx)
end

function isl_ctx_last_error_file(ctx)
    ccall((:isl_ctx_last_error_file, libisl), Ptr{Cchar}, (Ptr{isl_ctx},), ctx)
end

function isl_ctx_last_error_line(ctx)
    ccall((:isl_ctx_last_error_line, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_ctx_reset_error(ctx)
    ccall((:isl_ctx_reset_error, libisl), Cvoid, (Ptr{isl_ctx},), ctx)
end

function isl_ctx_set_error(ctx, error)
    ccall((:isl_ctx_set_error, libisl), Cvoid, (Ptr{isl_ctx}, isl_error), ctx, error)
end

mutable struct isl_fixed_box end

function isl_fixed_box_get_ctx(box)
    ccall((:isl_fixed_box_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_fixed_box},), box)
end

function isl_fixed_box_get_space(box)
    ccall((:isl_fixed_box_get_space, libisl), Ptr{isl_space}, (Ptr{isl_fixed_box},), box)
end

function isl_fixed_box_is_valid(box)
    ccall((:isl_fixed_box_is_valid, libisl), isl_bool, (Ptr{isl_fixed_box},), box)
end

function isl_fixed_box_get_offset(box)
    ccall((:isl_fixed_box_get_offset, libisl), Ptr{isl_multi_aff}, (Ptr{isl_fixed_box},), box)
end

function isl_fixed_box_get_size(box)
    ccall((:isl_fixed_box_get_size, libisl), Ptr{isl_multi_val}, (Ptr{isl_fixed_box},), box)
end

function isl_fixed_box_copy(box)
    ccall((:isl_fixed_box_copy, libisl), Ptr{isl_fixed_box}, (Ptr{isl_fixed_box},), box)
end

function isl_fixed_box_free(box)
    ccall((:isl_fixed_box_free, libisl), Ptr{isl_fixed_box}, (Ptr{isl_fixed_box},), box)
end

function isl_printer_print_fixed_box(p, box)
    ccall((:isl_printer_print_fixed_box, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_fixed_box}), p, box)
end

function isl_fixed_box_to_str(box)
    ccall((:isl_fixed_box_to_str, libisl), Ptr{Cchar}, (Ptr{isl_fixed_box},), box)
end

function isl_fixed_box_dump(box)
    ccall((:isl_fixed_box_dump, libisl), Cvoid, (Ptr{isl_fixed_box},), box)
end

# C code:
# typedef int ( * isl_access_level_before ) ( void * first , void * second )
const isl_access_level_before = Ptr{Cvoid}

mutable struct isl_restriction end

function isl_restriction_free(restr)
    ccall((:isl_restriction_free, libisl), Ptr{isl_restriction}, (Ptr{isl_restriction},), restr)
end

function isl_restriction_empty(source_map)
    ccall((:isl_restriction_empty, libisl), Ptr{isl_restriction}, (Ptr{isl_map},), source_map)
end

function isl_restriction_none(source_map)
    ccall((:isl_restriction_none, libisl), Ptr{isl_restriction}, (Ptr{isl_map},), source_map)
end

function isl_restriction_input(source_restr, sink_restr)
    ccall((:isl_restriction_input, libisl), Ptr{isl_restriction}, (Ptr{isl_set}, Ptr{isl_set}), source_restr, sink_restr)
end

function isl_restriction_output(source_restr)
    ccall((:isl_restriction_output, libisl), Ptr{isl_restriction}, (Ptr{isl_set},), source_restr)
end

function isl_restriction_get_ctx(restr)
    ccall((:isl_restriction_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_restriction},), restr)
end

# C code:
# typedef __isl_give isl_restriction * ( * isl_access_restrict ) ( __isl_keep isl_map * source_map , __isl_keep isl_set * sink , void * source_user , void * user )
const isl_access_restrict = Ptr{Cvoid}

mutable struct isl_access_info end

mutable struct isl_flow end

function isl_access_info_alloc(sink, sink_user, fn, max_source)
    ccall((:isl_access_info_alloc, libisl), Ptr{isl_access_info}, (Ptr{isl_map}, Ptr{Cvoid}, isl_access_level_before, Cint), sink, sink_user, fn, max_source)
end

function isl_access_info_set_restrict(acc, fn, user)
    ccall((:isl_access_info_set_restrict, libisl), Ptr{isl_access_info}, (Ptr{isl_access_info}, isl_access_restrict, Ptr{Cvoid}), acc, fn, user)
end

function isl_access_info_add_source(acc, source, must, source_user)
    ccall((:isl_access_info_add_source, libisl), Ptr{isl_access_info}, (Ptr{isl_access_info}, Ptr{isl_map}, Cint, Ptr{Cvoid}), acc, source, must, source_user)
end

function isl_access_info_free(acc)
    ccall((:isl_access_info_free, libisl), Ptr{isl_access_info}, (Ptr{isl_access_info},), acc)
end

function isl_access_info_get_ctx(acc)
    ccall((:isl_access_info_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_access_info},), acc)
end

function isl_access_info_compute_flow(acc)
    ccall((:isl_access_info_compute_flow, libisl), Ptr{isl_flow}, (Ptr{isl_access_info},), acc)
end

function isl_flow_foreach(deps, fn, user)
    ccall((:isl_flow_foreach, libisl), isl_stat, (Ptr{isl_flow}, Ptr{Cvoid}, Ptr{Cvoid}), deps, fn, user)
end

function isl_flow_get_no_source(deps, must)
    ccall((:isl_flow_get_no_source, libisl), Ptr{isl_map}, (Ptr{isl_flow}, Cint), deps, must)
end

function isl_flow_free(deps)
    ccall((:isl_flow_free, libisl), Ptr{isl_flow}, (Ptr{isl_flow},), deps)
end

function isl_flow_get_ctx(deps)
    ccall((:isl_flow_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_flow},), deps)
end

mutable struct isl_union_access_info end

mutable struct isl_union_flow end

function isl_union_access_info_from_sink(sink)
    ccall((:isl_union_access_info_from_sink, libisl), Ptr{isl_union_access_info}, (Ptr{isl_union_map},), sink)
end

function isl_union_access_info_set_must_source(access, must_source)
    ccall((:isl_union_access_info_set_must_source, libisl), Ptr{isl_union_access_info}, (Ptr{isl_union_access_info}, Ptr{isl_union_map}), access, must_source)
end

function isl_union_access_info_set_may_source(access, may_source)
    ccall((:isl_union_access_info_set_may_source, libisl), Ptr{isl_union_access_info}, (Ptr{isl_union_access_info}, Ptr{isl_union_map}), access, may_source)
end

function isl_union_access_info_set_kill(access, kill)
    ccall((:isl_union_access_info_set_kill, libisl), Ptr{isl_union_access_info}, (Ptr{isl_union_access_info}, Ptr{isl_union_map}), access, kill)
end

function isl_union_access_info_set_schedule(access, schedule)
    ccall((:isl_union_access_info_set_schedule, libisl), Ptr{isl_union_access_info}, (Ptr{isl_union_access_info}, Ptr{isl_schedule}), access, schedule)
end

function isl_union_access_info_set_schedule_map(access, schedule_map)
    ccall((:isl_union_access_info_set_schedule_map, libisl), Ptr{isl_union_access_info}, (Ptr{isl_union_access_info}, Ptr{isl_union_map}), access, schedule_map)
end

function isl_union_access_info_copy(access)
    ccall((:isl_union_access_info_copy, libisl), Ptr{isl_union_access_info}, (Ptr{isl_union_access_info},), access)
end

function isl_union_access_info_free(access)
    ccall((:isl_union_access_info_free, libisl), Ptr{isl_union_access_info}, (Ptr{isl_union_access_info},), access)
end

function isl_union_access_info_get_ctx(access)
    ccall((:isl_union_access_info_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_union_access_info},), access)
end

function isl_union_access_info_read_from_file(ctx, input)
    ccall((:isl_union_access_info_read_from_file, libisl), Ptr{isl_union_access_info}, (Ptr{isl_ctx}, Ptr{Libc.FILE}), ctx, input)
end

function isl_printer_print_union_access_info(p, access)
    ccall((:isl_printer_print_union_access_info, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_union_access_info}), p, access)
end

function isl_union_access_info_to_str(access)
    ccall((:isl_union_access_info_to_str, libisl), Ptr{Cchar}, (Ptr{isl_union_access_info},), access)
end

function isl_union_access_info_compute_flow(access)
    ccall((:isl_union_access_info_compute_flow, libisl), Ptr{isl_union_flow}, (Ptr{isl_union_access_info},), access)
end

function isl_union_flow_get_ctx(flow)
    ccall((:isl_union_flow_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_union_flow},), flow)
end

function isl_union_flow_copy(flow)
    ccall((:isl_union_flow_copy, libisl), Ptr{isl_union_flow}, (Ptr{isl_union_flow},), flow)
end

function isl_union_flow_get_must_dependence(flow)
    ccall((:isl_union_flow_get_must_dependence, libisl), Ptr{isl_union_map}, (Ptr{isl_union_flow},), flow)
end

function isl_union_flow_get_may_dependence(flow)
    ccall((:isl_union_flow_get_may_dependence, libisl), Ptr{isl_union_map}, (Ptr{isl_union_flow},), flow)
end

function isl_union_flow_get_full_must_dependence(flow)
    ccall((:isl_union_flow_get_full_must_dependence, libisl), Ptr{isl_union_map}, (Ptr{isl_union_flow},), flow)
end

function isl_union_flow_get_full_may_dependence(flow)
    ccall((:isl_union_flow_get_full_may_dependence, libisl), Ptr{isl_union_map}, (Ptr{isl_union_flow},), flow)
end

function isl_union_flow_get_must_no_source(flow)
    ccall((:isl_union_flow_get_must_no_source, libisl), Ptr{isl_union_map}, (Ptr{isl_union_flow},), flow)
end

function isl_union_flow_get_may_no_source(flow)
    ccall((:isl_union_flow_get_may_no_source, libisl), Ptr{isl_union_map}, (Ptr{isl_union_flow},), flow)
end

function isl_union_flow_free(flow)
    ccall((:isl_union_flow_free, libisl), Ptr{isl_union_flow}, (Ptr{isl_union_flow},), flow)
end

function isl_printer_print_union_flow(p, flow)
    ccall((:isl_printer_print_union_flow, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_union_flow}), p, flow)
end

function isl_union_flow_to_str(flow)
    ccall((:isl_union_flow_to_str, libisl), Ptr{Cchar}, (Ptr{isl_union_flow},), flow)
end

function isl_union_map_compute_flow(sink, must_source, may_source, schedule, must_dep, may_dep, must_no_source, may_no_source)
    ccall((:isl_union_map_compute_flow, libisl), Cint, (Ptr{isl_union_map}, Ptr{isl_union_map}, Ptr{isl_union_map}, Ptr{isl_union_map}, Ptr{Ptr{isl_union_map}}, Ptr{Ptr{isl_union_map}}, Ptr{Ptr{isl_union_map}}, Ptr{Ptr{isl_union_map}}), sink, must_source, may_source, schedule, must_dep, may_dep, must_no_source, may_no_source)
end

function isl_hash_string(hash, s)
    ccall((:isl_hash_string, libisl), UInt32, (UInt32, Ptr{Cchar}), hash, s)
end

function isl_hash_mem(hash, p, len)
    ccall((:isl_hash_mem, libisl), UInt32, (UInt32, Ptr{Cvoid}, Csize_t), hash, p, len)
end

struct isl_hash_table_entry
    hash::UInt32
    data::Ptr{Cvoid}
end

struct isl_hash_table
    bits::Cint
    n::Cint
    entries::Ptr{isl_hash_table_entry}
end

function isl_hash_table_alloc(ctx, min_size)
    ccall((:isl_hash_table_alloc, libisl), Ptr{isl_hash_table}, (Ptr{isl_ctx}, Cint), ctx, min_size)
end

function isl_hash_table_free(ctx, table)
    ccall((:isl_hash_table_free, libisl), Cvoid, (Ptr{isl_ctx}, Ptr{isl_hash_table}), ctx, table)
end

function isl_hash_table_init(ctx, table, min_size)
    ccall((:isl_hash_table_init, libisl), Cint, (Ptr{isl_ctx}, Ptr{isl_hash_table}, Cint), ctx, table, min_size)
end

function isl_hash_table_clear(table)
    ccall((:isl_hash_table_clear, libisl), Cvoid, (Ptr{isl_hash_table},), table)
end

function isl_hash_table_find(ctx, table, key_hash, eq, val, reserve)
    ccall((:isl_hash_table_find, libisl), Ptr{isl_hash_table_entry}, (Ptr{isl_ctx}, Ptr{isl_hash_table}, UInt32, Ptr{Cvoid}, Ptr{Cvoid}, Cint), ctx, table, key_hash, eq, val, reserve)
end

function isl_hash_table_foreach(ctx, table, fn, user)
    ccall((:isl_hash_table_foreach, libisl), isl_stat, (Ptr{isl_ctx}, Ptr{isl_hash_table}, Ptr{Cvoid}, Ptr{Cvoid}), ctx, table, fn, user)
end

function isl_hash_table_remove(ctx, table, entry)
    ccall((:isl_hash_table_remove, libisl), Cvoid, (Ptr{isl_ctx}, Ptr{isl_hash_table}, Ptr{isl_hash_table_entry}), ctx, table, entry)
end

function isl_id_list_get_ctx(list)
    ccall((:isl_id_list_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_id_list},), list)
end

function isl_id_list_from_id(el)
    ccall((:isl_id_list_from_id, libisl), Ptr{isl_id_list}, (Ptr{isl_id},), el)
end

function isl_id_list_alloc(ctx, n)
    ccall((:isl_id_list_alloc, libisl), Ptr{isl_id_list}, (Ptr{isl_ctx}, Cint), ctx, n)
end

function isl_id_list_copy(list)
    ccall((:isl_id_list_copy, libisl), Ptr{isl_id_list}, (Ptr{isl_id_list},), list)
end

function isl_id_list_free(list)
    ccall((:isl_id_list_free, libisl), Ptr{isl_id_list}, (Ptr{isl_id_list},), list)
end

function isl_id_list_add(list, el)
    ccall((:isl_id_list_add, libisl), Ptr{isl_id_list}, (Ptr{isl_id_list}, Ptr{isl_id}), list, el)
end

function isl_id_list_insert(list, pos, el)
    ccall((:isl_id_list_insert, libisl), Ptr{isl_id_list}, (Ptr{isl_id_list}, Cuint, Ptr{isl_id}), list, pos, el)
end

function isl_id_list_drop(list, first, n)
    ccall((:isl_id_list_drop, libisl), Ptr{isl_id_list}, (Ptr{isl_id_list}, Cuint, Cuint), list, first, n)
end

function isl_id_list_clear(list)
    ccall((:isl_id_list_clear, libisl), Ptr{isl_id_list}, (Ptr{isl_id_list},), list)
end

function isl_id_list_swap(list, pos1, pos2)
    ccall((:isl_id_list_swap, libisl), Ptr{isl_id_list}, (Ptr{isl_id_list}, Cuint, Cuint), list, pos1, pos2)
end

function isl_id_list_reverse(list)
    ccall((:isl_id_list_reverse, libisl), Ptr{isl_id_list}, (Ptr{isl_id_list},), list)
end

function isl_id_list_concat(list1, list2)
    ccall((:isl_id_list_concat, libisl), Ptr{isl_id_list}, (Ptr{isl_id_list}, Ptr{isl_id_list}), list1, list2)
end

function isl_id_list_size(list)
    ccall((:isl_id_list_size, libisl), isl_size, (Ptr{isl_id_list},), list)
end

function isl_id_list_n_id(list)
    ccall((:isl_id_list_n_id, libisl), isl_size, (Ptr{isl_id_list},), list)
end

function isl_id_list_get_at(list, index)
    ccall((:isl_id_list_get_at, libisl), Ptr{isl_id}, (Ptr{isl_id_list}, Cint), list, index)
end

function isl_id_list_get_id(list, index)
    ccall((:isl_id_list_get_id, libisl), Ptr{isl_id}, (Ptr{isl_id_list}, Cint), list, index)
end

function isl_id_list_set_id(list, index, el)
    ccall((:isl_id_list_set_id, libisl), Ptr{isl_id_list}, (Ptr{isl_id_list}, Cint, Ptr{isl_id}), list, index, el)
end

function isl_id_list_foreach(list, fn, user)
    ccall((:isl_id_list_foreach, libisl), isl_stat, (Ptr{isl_id_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_id_list_map(list, fn, user)
    ccall((:isl_id_list_map, libisl), Ptr{isl_id_list}, (Ptr{isl_id_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_id_list_sort(list, cmp, user)
    ccall((:isl_id_list_sort, libisl), Ptr{isl_id_list}, (Ptr{isl_id_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, cmp, user)
end

function isl_id_list_foreach_scc(list, follows, follows_user, fn, fn_user)
    ccall((:isl_id_list_foreach_scc, libisl), isl_stat, (Ptr{isl_id_list}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), list, follows, follows_user, fn, fn_user)
end

function isl_id_list_to_str(list)
    ccall((:isl_id_list_to_str, libisl), Ptr{Cchar}, (Ptr{isl_id_list},), list)
end

function isl_printer_print_id_list(p, list)
    ccall((:isl_printer_print_id_list, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_id_list}), p, list)
end

function isl_id_list_dump(list)
    ccall((:isl_id_list_dump, libisl), Cvoid, (Ptr{isl_id_list},), list)
end

function isl_multi_id_get_ctx(multi)
    ccall((:isl_multi_id_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_multi_id},), multi)
end

function isl_multi_id_get_space(multi)
    ccall((:isl_multi_id_get_space, libisl), Ptr{isl_space}, (Ptr{isl_multi_id},), multi)
end

function isl_multi_id_get_domain_space(multi)
    ccall((:isl_multi_id_get_domain_space, libisl), Ptr{isl_space}, (Ptr{isl_multi_id},), multi)
end

function isl_multi_id_from_id_list(space, list)
    ccall((:isl_multi_id_from_id_list, libisl), Ptr{isl_multi_id}, (Ptr{isl_space}, Ptr{isl_id_list}), space, list)
end

function isl_multi_id_copy(multi)
    ccall((:isl_multi_id_copy, libisl), Ptr{isl_multi_id}, (Ptr{isl_multi_id},), multi)
end

function isl_multi_id_free(multi)
    ccall((:isl_multi_id_free, libisl), Ptr{isl_multi_id}, (Ptr{isl_multi_id},), multi)
end

function isl_multi_id_plain_is_equal(multi1, multi2)
    ccall((:isl_multi_id_plain_is_equal, libisl), isl_bool, (Ptr{isl_multi_id}, Ptr{isl_multi_id}), multi1, multi2)
end

function isl_multi_id_reset_user(multi)
    ccall((:isl_multi_id_reset_user, libisl), Ptr{isl_multi_id}, (Ptr{isl_multi_id},), multi)
end

function isl_multi_id_size(multi)
    ccall((:isl_multi_id_size, libisl), isl_size, (Ptr{isl_multi_id},), multi)
end

function isl_multi_id_get_at(multi, pos)
    ccall((:isl_multi_id_get_at, libisl), Ptr{isl_id}, (Ptr{isl_multi_id}, Cint), multi, pos)
end

function isl_multi_id_get_id(multi, pos)
    ccall((:isl_multi_id_get_id, libisl), Ptr{isl_id}, (Ptr{isl_multi_id}, Cint), multi, pos)
end

function isl_multi_id_set_at(multi, pos, el)
    ccall((:isl_multi_id_set_at, libisl), Ptr{isl_multi_id}, (Ptr{isl_multi_id}, Cint, Ptr{isl_id}), multi, pos, el)
end

function isl_multi_id_set_id(multi, pos, el)
    ccall((:isl_multi_id_set_id, libisl), Ptr{isl_multi_id}, (Ptr{isl_multi_id}, Cint, Ptr{isl_id}), multi, pos, el)
end

function isl_multi_id_range_splice(multi1, pos, multi2)
    ccall((:isl_multi_id_range_splice, libisl), Ptr{isl_multi_id}, (Ptr{isl_multi_id}, Cuint, Ptr{isl_multi_id}), multi1, pos, multi2)
end

function isl_multi_id_flatten_range(multi)
    ccall((:isl_multi_id_flatten_range, libisl), Ptr{isl_multi_id}, (Ptr{isl_multi_id},), multi)
end

function isl_multi_id_flat_range_product(multi1, multi2)
    ccall((:isl_multi_id_flat_range_product, libisl), Ptr{isl_multi_id}, (Ptr{isl_multi_id}, Ptr{isl_multi_id}), multi1, multi2)
end

function isl_multi_id_range_product(multi1, multi2)
    ccall((:isl_multi_id_range_product, libisl), Ptr{isl_multi_id}, (Ptr{isl_multi_id}, Ptr{isl_multi_id}), multi1, multi2)
end

function isl_multi_id_factor_range(multi)
    ccall((:isl_multi_id_factor_range, libisl), Ptr{isl_multi_id}, (Ptr{isl_multi_id},), multi)
end

function isl_multi_id_range_is_wrapping(multi)
    ccall((:isl_multi_id_range_is_wrapping, libisl), isl_bool, (Ptr{isl_multi_id},), multi)
end

function isl_multi_id_range_factor_domain(multi)
    ccall((:isl_multi_id_range_factor_domain, libisl), Ptr{isl_multi_id}, (Ptr{isl_multi_id},), multi)
end

function isl_multi_id_range_factor_range(multi)
    ccall((:isl_multi_id_range_factor_range, libisl), Ptr{isl_multi_id}, (Ptr{isl_multi_id},), multi)
end

function isl_multi_id_align_params(multi, model)
    ccall((:isl_multi_id_align_params, libisl), Ptr{isl_multi_id}, (Ptr{isl_multi_id}, Ptr{isl_space}), multi, model)
end

function isl_multi_id_from_range(multi)
    ccall((:isl_multi_id_from_range, libisl), Ptr{isl_multi_id}, (Ptr{isl_multi_id},), multi)
end

function isl_id_get_ctx(id)
    ccall((:isl_id_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_id},), id)
end

function isl_id_get_hash(id)
    ccall((:isl_id_get_hash, libisl), UInt32, (Ptr{isl_id},), id)
end

function isl_id_alloc(ctx, name, user)
    ccall((:isl_id_alloc, libisl), Ptr{isl_id}, (Ptr{isl_ctx}, Ptr{Cchar}, Ptr{Cvoid}), ctx, name, user)
end

function isl_id_copy(id)
    ccall((:isl_id_copy, libisl), Ptr{isl_id}, (Ptr{isl_id},), id)
end

function isl_id_free(id)
    ccall((:isl_id_free, libisl), Ptr{isl_id}, (Ptr{isl_id},), id)
end

function isl_id_get_user(id)
    ccall((:isl_id_get_user, libisl), Ptr{Cvoid}, (Ptr{isl_id},), id)
end

function isl_id_get_name(id)
    ccall((:isl_id_get_name, libisl), Ptr{Cchar}, (Ptr{isl_id},), id)
end

function isl_id_set_free_user(id, free_user)
    ccall((:isl_id_set_free_user, libisl), Ptr{isl_id}, (Ptr{isl_id}, Ptr{Cvoid}), id, free_user)
end

function isl_id_read_from_str(ctx, str)
    ccall((:isl_id_read_from_str, libisl), Ptr{isl_id}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_id_to_str(id)
    ccall((:isl_id_to_str, libisl), Ptr{Cchar}, (Ptr{isl_id},), id)
end

function isl_printer_print_id(p, id)
    ccall((:isl_printer_print_id, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_id}), p, id)
end

function isl_id_dump(id)
    ccall((:isl_id_dump, libisl), Cvoid, (Ptr{isl_id},), id)
end

function isl_multi_id_read_from_str(ctx, str)
    ccall((:isl_multi_id_read_from_str, libisl), Ptr{isl_multi_id}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_printer_print_multi_id(p, mi)
    ccall((:isl_printer_print_multi_id, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_multi_id}), p, mi)
end

function isl_multi_id_dump(mi)
    ccall((:isl_multi_id_dump, libisl), Cvoid, (Ptr{isl_multi_id},), mi)
end

function isl_multi_id_to_str(mi)
    ccall((:isl_multi_id_to_str, libisl), Ptr{Cchar}, (Ptr{isl_multi_id},), mi)
end

struct isl_maybe_isl_id
    valid::isl_bool
    value::Ptr{isl_id}
end

mutable struct isl_id_to_id end

function isl_id_to_id_alloc(ctx, min_size)
    ccall((:isl_id_to_id_alloc, libisl), Ptr{isl_id_to_id}, (Ptr{isl_ctx}, Cint), ctx, min_size)
end

function isl_id_to_id_copy(hmap)
    ccall((:isl_id_to_id_copy, libisl), Ptr{isl_id_to_id}, (Ptr{isl_id_to_id},), hmap)
end

function isl_id_to_id_free(hmap)
    ccall((:isl_id_to_id_free, libisl), Ptr{isl_id_to_id}, (Ptr{isl_id_to_id},), hmap)
end

function isl_id_to_id_get_ctx(hmap)
    ccall((:isl_id_to_id_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_id_to_id},), hmap)
end

function isl_id_to_id_try_get(hmap, key)
    ccall((:isl_id_to_id_try_get, libisl), isl_maybe_isl_id, (Ptr{isl_id_to_id}, Ptr{isl_id}), hmap, key)
end

function isl_id_to_id_has(hmap, key)
    ccall((:isl_id_to_id_has, libisl), isl_bool, (Ptr{isl_id_to_id}, Ptr{isl_id}), hmap, key)
end

function isl_id_to_id_get(hmap, key)
    ccall((:isl_id_to_id_get, libisl), Ptr{isl_id}, (Ptr{isl_id_to_id}, Ptr{isl_id}), hmap, key)
end

function isl_id_to_id_set(hmap, key, val)
    ccall((:isl_id_to_id_set, libisl), Ptr{isl_id_to_id}, (Ptr{isl_id_to_id}, Ptr{isl_id}, Ptr{isl_id}), hmap, key, val)
end

function isl_id_to_id_drop(hmap, key)
    ccall((:isl_id_to_id_drop, libisl), Ptr{isl_id_to_id}, (Ptr{isl_id_to_id}, Ptr{isl_id}), hmap, key)
end

function isl_id_to_id_foreach(hmap, fn, user)
    ccall((:isl_id_to_id_foreach, libisl), isl_stat, (Ptr{isl_id_to_id}, Ptr{Cvoid}, Ptr{Cvoid}), hmap, fn, user)
end

function isl_printer_print_id_to_id(p, hmap)
    ccall((:isl_printer_print_id_to_id, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_id_to_id}), p, hmap)
end

function isl_id_to_id_dump(hmap)
    ccall((:isl_id_to_id_dump, libisl), Cvoid, (Ptr{isl_id_to_id},), hmap)
end

struct isl_maybe_isl_pw_aff
    valid::isl_bool
    value::Ptr{isl_pw_aff}
end

mutable struct isl_id_to_pw_aff end

function isl_id_to_pw_aff_alloc(ctx, min_size)
    ccall((:isl_id_to_pw_aff_alloc, libisl), Ptr{isl_id_to_pw_aff}, (Ptr{isl_ctx}, Cint), ctx, min_size)
end

function isl_id_to_pw_aff_copy(hmap)
    ccall((:isl_id_to_pw_aff_copy, libisl), Ptr{isl_id_to_pw_aff}, (Ptr{isl_id_to_pw_aff},), hmap)
end

function isl_id_to_pw_aff_free(hmap)
    ccall((:isl_id_to_pw_aff_free, libisl), Ptr{isl_id_to_pw_aff}, (Ptr{isl_id_to_pw_aff},), hmap)
end

function isl_id_to_pw_aff_get_ctx(hmap)
    ccall((:isl_id_to_pw_aff_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_id_to_pw_aff},), hmap)
end

function isl_id_to_pw_aff_try_get(hmap, key)
    ccall((:isl_id_to_pw_aff_try_get, libisl), isl_maybe_isl_pw_aff, (Ptr{isl_id_to_pw_aff}, Ptr{isl_id}), hmap, key)
end

function isl_id_to_pw_aff_has(hmap, key)
    ccall((:isl_id_to_pw_aff_has, libisl), isl_bool, (Ptr{isl_id_to_pw_aff}, Ptr{isl_id}), hmap, key)
end

function isl_id_to_pw_aff_get(hmap, key)
    ccall((:isl_id_to_pw_aff_get, libisl), Ptr{isl_pw_aff}, (Ptr{isl_id_to_pw_aff}, Ptr{isl_id}), hmap, key)
end

function isl_id_to_pw_aff_set(hmap, key, val)
    ccall((:isl_id_to_pw_aff_set, libisl), Ptr{isl_id_to_pw_aff}, (Ptr{isl_id_to_pw_aff}, Ptr{isl_id}, Ptr{isl_pw_aff}), hmap, key, val)
end

function isl_id_to_pw_aff_drop(hmap, key)
    ccall((:isl_id_to_pw_aff_drop, libisl), Ptr{isl_id_to_pw_aff}, (Ptr{isl_id_to_pw_aff}, Ptr{isl_id}), hmap, key)
end

function isl_id_to_pw_aff_foreach(hmap, fn, user)
    ccall((:isl_id_to_pw_aff_foreach, libisl), isl_stat, (Ptr{isl_id_to_pw_aff}, Ptr{Cvoid}, Ptr{Cvoid}), hmap, fn, user)
end

function isl_printer_print_id_to_pw_aff(p, hmap)
    ccall((:isl_printer_print_id_to_pw_aff, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_id_to_pw_aff}), p, hmap)
end

function isl_id_to_pw_aff_dump(hmap)
    ccall((:isl_id_to_pw_aff_dump, libisl), Cvoid, (Ptr{isl_id_to_pw_aff},), hmap)
end

function isl_basic_set_max_val(bset, obj)
    ccall((:isl_basic_set_max_val, libisl), Ptr{isl_val}, (Ptr{isl_basic_set}, Ptr{isl_aff}), bset, obj)
end

function isl_set_min_val(set, obj)
    ccall((:isl_set_min_val, libisl), Ptr{isl_val}, (Ptr{isl_set}, Ptr{isl_aff}), set, obj)
end

function isl_set_max_val(set, obj)
    ccall((:isl_set_max_val, libisl), Ptr{isl_val}, (Ptr{isl_set}, Ptr{isl_aff}), set, obj)
end

function isl_union_set_min_multi_union_pw_aff(uset, obj)
    ccall((:isl_union_set_min_multi_union_pw_aff, libisl), Ptr{isl_multi_val}, (Ptr{isl_union_set}, Ptr{isl_multi_union_pw_aff}), uset, obj)
end

function isl_union_pw_aff_min_val(upa)
    ccall((:isl_union_pw_aff_min_val, libisl), Ptr{isl_val}, (Ptr{isl_union_pw_aff},), upa)
end

function isl_union_pw_aff_max_val(upa)
    ccall((:isl_union_pw_aff_max_val, libisl), Ptr{isl_val}, (Ptr{isl_union_pw_aff},), upa)
end

function isl_multi_union_pw_aff_min_multi_val(mupa)
    ccall((:isl_multi_union_pw_aff_min_multi_val, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_union_pw_aff},), mupa)
end

function isl_multi_union_pw_aff_max_multi_val(mupa)
    ccall((:isl_multi_union_pw_aff_max_multi_val, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_union_pw_aff},), mupa)
end

function isl_basic_set_dim_max_val(bset, pos)
    ccall((:isl_basic_set_dim_max_val, libisl), Ptr{isl_val}, (Ptr{isl_basic_set}, Cint), bset, pos)
end

function isl_local_space_get_ctx(ls)
    ccall((:isl_local_space_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_local_space},), ls)
end

function isl_local_space_from_space(dim)
    ccall((:isl_local_space_from_space, libisl), Ptr{isl_local_space}, (Ptr{isl_space},), dim)
end

function isl_local_space_copy(ls)
    ccall((:isl_local_space_copy, libisl), Ptr{isl_local_space}, (Ptr{isl_local_space},), ls)
end

function isl_local_space_free(ls)
    ccall((:isl_local_space_free, libisl), Ptr{isl_local_space}, (Ptr{isl_local_space},), ls)
end

function isl_local_space_is_params(ls)
    ccall((:isl_local_space_is_params, libisl), isl_bool, (Ptr{isl_local_space},), ls)
end

function isl_local_space_is_set(ls)
    ccall((:isl_local_space_is_set, libisl), isl_bool, (Ptr{isl_local_space},), ls)
end

function isl_local_space_set_tuple_id(ls, type, id)
    ccall((:isl_local_space_set_tuple_id, libisl), Ptr{isl_local_space}, (Ptr{isl_local_space}, isl_dim_type, Ptr{isl_id}), ls, type, id)
end

function isl_local_space_dim(ls, type)
    ccall((:isl_local_space_dim, libisl), isl_size, (Ptr{isl_local_space}, isl_dim_type), ls, type)
end

function isl_local_space_has_dim_name(ls, type, pos)
    ccall((:isl_local_space_has_dim_name, libisl), isl_bool, (Ptr{isl_local_space}, isl_dim_type, Cuint), ls, type, pos)
end

function isl_local_space_get_dim_name(ls, type, pos)
    ccall((:isl_local_space_get_dim_name, libisl), Ptr{Cchar}, (Ptr{isl_local_space}, isl_dim_type, Cuint), ls, type, pos)
end

function isl_local_space_set_dim_name(ls, type, pos, s)
    ccall((:isl_local_space_set_dim_name, libisl), Ptr{isl_local_space}, (Ptr{isl_local_space}, isl_dim_type, Cuint, Ptr{Cchar}), ls, type, pos, s)
end

function isl_local_space_has_dim_id(ls, type, pos)
    ccall((:isl_local_space_has_dim_id, libisl), isl_bool, (Ptr{isl_local_space}, isl_dim_type, Cuint), ls, type, pos)
end

function isl_local_space_get_dim_id(ls, type, pos)
    ccall((:isl_local_space_get_dim_id, libisl), Ptr{isl_id}, (Ptr{isl_local_space}, isl_dim_type, Cuint), ls, type, pos)
end

function isl_local_space_set_dim_id(ls, type, pos, id)
    ccall((:isl_local_space_set_dim_id, libisl), Ptr{isl_local_space}, (Ptr{isl_local_space}, isl_dim_type, Cuint, Ptr{isl_id}), ls, type, pos, id)
end

function isl_local_space_get_space(ls)
    ccall((:isl_local_space_get_space, libisl), Ptr{isl_space}, (Ptr{isl_local_space},), ls)
end

function isl_local_space_get_div(ls, pos)
    ccall((:isl_local_space_get_div, libisl), Ptr{isl_aff}, (Ptr{isl_local_space}, Cint), ls, pos)
end

function isl_local_space_find_dim_by_name(ls, type, name)
    ccall((:isl_local_space_find_dim_by_name, libisl), Cint, (Ptr{isl_local_space}, isl_dim_type, Ptr{Cchar}), ls, type, name)
end

function isl_local_space_domain(ls)
    ccall((:isl_local_space_domain, libisl), Ptr{isl_local_space}, (Ptr{isl_local_space},), ls)
end

function isl_local_space_range(ls)
    ccall((:isl_local_space_range, libisl), Ptr{isl_local_space}, (Ptr{isl_local_space},), ls)
end

function isl_local_space_from_domain(ls)
    ccall((:isl_local_space_from_domain, libisl), Ptr{isl_local_space}, (Ptr{isl_local_space},), ls)
end

function isl_local_space_add_dims(ls, type, n)
    ccall((:isl_local_space_add_dims, libisl), Ptr{isl_local_space}, (Ptr{isl_local_space}, isl_dim_type, Cuint), ls, type, n)
end

function isl_local_space_drop_dims(ls, type, first, n)
    ccall((:isl_local_space_drop_dims, libisl), Ptr{isl_local_space}, (Ptr{isl_local_space}, isl_dim_type, Cuint, Cuint), ls, type, first, n)
end

function isl_local_space_insert_dims(ls, type, first, n)
    ccall((:isl_local_space_insert_dims, libisl), Ptr{isl_local_space}, (Ptr{isl_local_space}, isl_dim_type, Cuint, Cuint), ls, type, first, n)
end

function isl_local_space_set_from_params(ls)
    ccall((:isl_local_space_set_from_params, libisl), Ptr{isl_local_space}, (Ptr{isl_local_space},), ls)
end

function isl_local_space_intersect(ls1, ls2)
    ccall((:isl_local_space_intersect, libisl), Ptr{isl_local_space}, (Ptr{isl_local_space}, Ptr{isl_local_space}), ls1, ls2)
end

function isl_local_space_wrap(ls)
    ccall((:isl_local_space_wrap, libisl), Ptr{isl_local_space}, (Ptr{isl_local_space},), ls)
end

function isl_local_space_is_equal(ls1, ls2)
    ccall((:isl_local_space_is_equal, libisl), isl_bool, (Ptr{isl_local_space}, Ptr{isl_local_space}), ls1, ls2)
end

function isl_local_space_lifting(ls)
    ccall((:isl_local_space_lifting, libisl), Ptr{isl_basic_map}, (Ptr{isl_local_space},), ls)
end

function isl_local_space_flatten_domain(ls)
    ccall((:isl_local_space_flatten_domain, libisl), Ptr{isl_local_space}, (Ptr{isl_local_space},), ls)
end

function isl_local_space_flatten_range(ls)
    ccall((:isl_local_space_flatten_range, libisl), Ptr{isl_local_space}, (Ptr{isl_local_space},), ls)
end

function isl_printer_print_local_space(p, ls)
    ccall((:isl_printer_print_local_space, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_local_space}), p, ls)
end

function isl_local_space_dump(ls)
    ccall((:isl_local_space_dump, libisl), Cvoid, (Ptr{isl_local_space},), ls)
end

@cenum isl_lp_result::Int32 begin
    isl_lp_error = -1
    isl_lp_ok = 0
    isl_lp_unbounded = 1
    isl_lp_empty = 2
end

function isl_basic_set_min_lp_val(bset, obj)
    ccall((:isl_basic_set_min_lp_val, libisl), Ptr{isl_val}, (Ptr{isl_basic_set}, Ptr{isl_aff}), bset, obj)
end

function isl_basic_set_max_lp_val(bset, obj)
    ccall((:isl_basic_set_max_lp_val, libisl), Ptr{isl_val}, (Ptr{isl_basic_set}, Ptr{isl_aff}), bset, obj)
end

function isl_basic_map_total_dim(bmap)
    ccall((:isl_basic_map_total_dim, libisl), isl_size, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_dim(bmap, type)
    ccall((:isl_basic_map_dim, libisl), isl_size, (Ptr{isl_basic_map}, isl_dim_type), bmap, type)
end

function isl_map_dim(map, type)
    ccall((:isl_map_dim, libisl), isl_size, (Ptr{isl_map}, isl_dim_type), map, type)
end

function isl_basic_map_get_ctx(bmap)
    ccall((:isl_basic_map_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_basic_map},), bmap)
end

function isl_map_get_ctx(map)
    ccall((:isl_map_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_map},), map)
end

function isl_basic_map_get_space(bmap)
    ccall((:isl_basic_map_get_space, libisl), Ptr{isl_space}, (Ptr{isl_basic_map},), bmap)
end

function isl_map_get_space(map)
    ccall((:isl_map_get_space, libisl), Ptr{isl_space}, (Ptr{isl_map},), map)
end

function isl_basic_map_get_div(bmap, pos)
    ccall((:isl_basic_map_get_div, libisl), Ptr{isl_aff}, (Ptr{isl_basic_map}, Cint), bmap, pos)
end

function isl_basic_map_get_local_space(bmap)
    ccall((:isl_basic_map_get_local_space, libisl), Ptr{isl_local_space}, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_set_tuple_name(bmap, type, s)
    ccall((:isl_basic_map_set_tuple_name, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, isl_dim_type, Ptr{Cchar}), bmap, type, s)
end

function isl_basic_map_get_tuple_name(bmap, type)
    ccall((:isl_basic_map_get_tuple_name, libisl), Ptr{Cchar}, (Ptr{isl_basic_map}, isl_dim_type), bmap, type)
end

function isl_map_has_tuple_name(map, type)
    ccall((:isl_map_has_tuple_name, libisl), isl_bool, (Ptr{isl_map}, isl_dim_type), map, type)
end

function isl_map_get_tuple_name(map, type)
    ccall((:isl_map_get_tuple_name, libisl), Ptr{Cchar}, (Ptr{isl_map}, isl_dim_type), map, type)
end

function isl_map_set_tuple_name(map, type, s)
    ccall((:isl_map_set_tuple_name, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Ptr{Cchar}), map, type, s)
end

function isl_basic_map_get_dim_name(bmap, type, pos)
    ccall((:isl_basic_map_get_dim_name, libisl), Ptr{Cchar}, (Ptr{isl_basic_map}, isl_dim_type, Cuint), bmap, type, pos)
end

function isl_map_has_dim_name(map, type, pos)
    ccall((:isl_map_has_dim_name, libisl), isl_bool, (Ptr{isl_map}, isl_dim_type, Cuint), map, type, pos)
end

function isl_map_get_dim_name(map, type, pos)
    ccall((:isl_map_get_dim_name, libisl), Ptr{Cchar}, (Ptr{isl_map}, isl_dim_type, Cuint), map, type, pos)
end

function isl_basic_map_set_dim_name(bmap, type, pos, s)
    ccall((:isl_basic_map_set_dim_name, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, isl_dim_type, Cuint, Ptr{Cchar}), bmap, type, pos, s)
end

function isl_map_set_dim_name(map, type, pos, s)
    ccall((:isl_map_set_dim_name, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cuint, Ptr{Cchar}), map, type, pos, s)
end

function isl_basic_map_set_tuple_id(bmap, type, id)
    ccall((:isl_basic_map_set_tuple_id, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, isl_dim_type, Ptr{isl_id}), bmap, type, id)
end

function isl_map_set_dim_id(map, type, pos, id)
    ccall((:isl_map_set_dim_id, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cuint, Ptr{isl_id}), map, type, pos, id)
end

function isl_basic_map_has_dim_id(bmap, type, pos)
    ccall((:isl_basic_map_has_dim_id, libisl), isl_bool, (Ptr{isl_basic_map}, isl_dim_type, Cuint), bmap, type, pos)
end

function isl_map_has_dim_id(map, type, pos)
    ccall((:isl_map_has_dim_id, libisl), isl_bool, (Ptr{isl_map}, isl_dim_type, Cuint), map, type, pos)
end

function isl_map_get_dim_id(map, type, pos)
    ccall((:isl_map_get_dim_id, libisl), Ptr{isl_id}, (Ptr{isl_map}, isl_dim_type, Cuint), map, type, pos)
end

function isl_map_set_tuple_id(map, type, id)
    ccall((:isl_map_set_tuple_id, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Ptr{isl_id}), map, type, id)
end

function isl_map_reset_tuple_id(map, type)
    ccall((:isl_map_reset_tuple_id, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type), map, type)
end

function isl_map_has_tuple_id(map, type)
    ccall((:isl_map_has_tuple_id, libisl), isl_bool, (Ptr{isl_map}, isl_dim_type), map, type)
end

function isl_map_get_tuple_id(map, type)
    ccall((:isl_map_get_tuple_id, libisl), Ptr{isl_id}, (Ptr{isl_map}, isl_dim_type), map, type)
end

function isl_map_reset_user(map)
    ccall((:isl_map_reset_user, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_basic_map_find_dim_by_name(bmap, type, name)
    ccall((:isl_basic_map_find_dim_by_name, libisl), Cint, (Ptr{isl_basic_map}, isl_dim_type, Ptr{Cchar}), bmap, type, name)
end

function isl_map_find_dim_by_id(map, type, id)
    ccall((:isl_map_find_dim_by_id, libisl), Cint, (Ptr{isl_map}, isl_dim_type, Ptr{isl_id}), map, type, id)
end

function isl_map_find_dim_by_name(map, type, name)
    ccall((:isl_map_find_dim_by_name, libisl), Cint, (Ptr{isl_map}, isl_dim_type, Ptr{Cchar}), map, type, name)
end

function isl_basic_map_is_rational(bmap)
    ccall((:isl_basic_map_is_rational, libisl), isl_bool, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_identity(space)
    ccall((:isl_basic_map_identity, libisl), Ptr{isl_basic_map}, (Ptr{isl_space},), space)
end

function isl_basic_map_free(bmap)
    ccall((:isl_basic_map_free, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_copy(bmap)
    ccall((:isl_basic_map_copy, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_equal(space, n_equal)
    ccall((:isl_basic_map_equal, libisl), Ptr{isl_basic_map}, (Ptr{isl_space}, Cuint), space, n_equal)
end

function isl_basic_map_less_at(space, pos)
    ccall((:isl_basic_map_less_at, libisl), Ptr{isl_basic_map}, (Ptr{isl_space}, Cuint), space, pos)
end

function isl_basic_map_more_at(space, pos)
    ccall((:isl_basic_map_more_at, libisl), Ptr{isl_basic_map}, (Ptr{isl_space}, Cuint), space, pos)
end

function isl_basic_map_empty(space)
    ccall((:isl_basic_map_empty, libisl), Ptr{isl_basic_map}, (Ptr{isl_space},), space)
end

function isl_basic_map_universe(space)
    ccall((:isl_basic_map_universe, libisl), Ptr{isl_basic_map}, (Ptr{isl_space},), space)
end

function isl_basic_map_nat_universe(space)
    ccall((:isl_basic_map_nat_universe, libisl), Ptr{isl_basic_map}, (Ptr{isl_space},), space)
end

function isl_basic_map_remove_redundancies(bmap)
    ccall((:isl_basic_map_remove_redundancies, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_map_remove_redundancies(map)
    ccall((:isl_map_remove_redundancies, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_simple_hull(map)
    ccall((:isl_map_simple_hull, libisl), Ptr{isl_basic_map}, (Ptr{isl_map},), map)
end

function isl_map_unshifted_simple_hull(map)
    ccall((:isl_map_unshifted_simple_hull, libisl), Ptr{isl_basic_map}, (Ptr{isl_map},), map)
end

function isl_map_plain_unshifted_simple_hull(map)
    ccall((:isl_map_plain_unshifted_simple_hull, libisl), Ptr{isl_basic_map}, (Ptr{isl_map},), map)
end

mutable struct isl_map_list end

function isl_map_unshifted_simple_hull_from_map_list(map, list)
    ccall((:isl_map_unshifted_simple_hull_from_map_list, libisl), Ptr{isl_basic_map}, (Ptr{isl_map}, Ptr{isl_map_list}), map, list)
end

function isl_basic_map_intersect_domain(bmap, bset)
    ccall((:isl_basic_map_intersect_domain, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, Ptr{isl_basic_set}), bmap, bset)
end

function isl_basic_map_intersect_range(bmap, bset)
    ccall((:isl_basic_map_intersect_range, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, Ptr{isl_basic_set}), bmap, bset)
end

function isl_basic_map_intersect(bmap1, bmap2)
    ccall((:isl_basic_map_intersect, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, Ptr{isl_basic_map}), bmap1, bmap2)
end

mutable struct isl_basic_map_list end

function isl_basic_map_list_intersect(list)
    ccall((:isl_basic_map_list_intersect, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map_list},), list)
end

function isl_basic_map_union(bmap1, bmap2)
    ccall((:isl_basic_map_union, libisl), Ptr{isl_map}, (Ptr{isl_basic_map}, Ptr{isl_basic_map}), bmap1, bmap2)
end

function isl_basic_map_apply_domain(bmap1, bmap2)
    ccall((:isl_basic_map_apply_domain, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, Ptr{isl_basic_map}), bmap1, bmap2)
end

function isl_basic_map_apply_range(bmap1, bmap2)
    ccall((:isl_basic_map_apply_range, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, Ptr{isl_basic_map}), bmap1, bmap2)
end

function isl_basic_map_affine_hull(bmap)
    ccall((:isl_basic_map_affine_hull, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_preimage_domain_multi_aff(bmap, ma)
    ccall((:isl_basic_map_preimage_domain_multi_aff, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, Ptr{isl_multi_aff}), bmap, ma)
end

function isl_basic_map_preimage_range_multi_aff(bmap, ma)
    ccall((:isl_basic_map_preimage_range_multi_aff, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, Ptr{isl_multi_aff}), bmap, ma)
end

function isl_basic_map_reverse(bmap)
    ccall((:isl_basic_map_reverse, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_domain(bmap)
    ccall((:isl_basic_map_domain, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_range(bmap)
    ccall((:isl_basic_map_range, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_domain_map(bmap)
    ccall((:isl_basic_map_domain_map, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_range_map(bmap)
    ccall((:isl_basic_map_range_map, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_remove_dims(bmap, type, first, n)
    ccall((:isl_basic_map_remove_dims, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, isl_dim_type, Cuint, Cuint), bmap, type, first, n)
end

function isl_basic_map_eliminate(bmap, type, first, n)
    ccall((:isl_basic_map_eliminate, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, isl_dim_type, Cuint, Cuint), bmap, type, first, n)
end

function isl_basic_map_sample(bmap)
    ccall((:isl_basic_map_sample, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_detect_equalities(bmap)
    ccall((:isl_basic_map_detect_equalities, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_read_from_file(ctx, input)
    ccall((:isl_basic_map_read_from_file, libisl), Ptr{isl_basic_map}, (Ptr{isl_ctx}, Ptr{Libc.FILE}), ctx, input)
end

function isl_basic_map_read_from_str(ctx, str)
    ccall((:isl_basic_map_read_from_str, libisl), Ptr{isl_basic_map}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_map_read_from_file(ctx, input)
    ccall((:isl_map_read_from_file, libisl), Ptr{isl_map}, (Ptr{isl_ctx}, Ptr{Libc.FILE}), ctx, input)
end

function isl_map_read_from_str(ctx, str)
    ccall((:isl_map_read_from_str, libisl), Ptr{isl_map}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_basic_map_dump(bmap)
    ccall((:isl_basic_map_dump, libisl), Cvoid, (Ptr{isl_basic_map},), bmap)
end

function isl_map_dump(map)
    ccall((:isl_map_dump, libisl), Cvoid, (Ptr{isl_map},), map)
end

function isl_basic_map_to_str(bmap)
    ccall((:isl_basic_map_to_str, libisl), Ptr{Cchar}, (Ptr{isl_basic_map},), bmap)
end

function isl_printer_print_basic_map(printer, bmap)
    ccall((:isl_printer_print_basic_map, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_basic_map}), printer, bmap)
end

function isl_map_to_str(map)
    ccall((:isl_map_to_str, libisl), Ptr{Cchar}, (Ptr{isl_map},), map)
end

function isl_printer_print_map(printer, map)
    ccall((:isl_printer_print_map, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_map}), printer, map)
end

function isl_basic_map_fix_si(bmap, type, pos, value)
    ccall((:isl_basic_map_fix_si, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, isl_dim_type, Cuint, Cint), bmap, type, pos, value)
end

function isl_basic_map_fix_val(bmap, type, pos, v)
    ccall((:isl_basic_map_fix_val, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, isl_dim_type, Cuint, Ptr{isl_val}), bmap, type, pos, v)
end

function isl_basic_map_lower_bound_si(bmap, type, pos, value)
    ccall((:isl_basic_map_lower_bound_si, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, isl_dim_type, Cuint, Cint), bmap, type, pos, value)
end

function isl_basic_map_upper_bound_si(bmap, type, pos, value)
    ccall((:isl_basic_map_upper_bound_si, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, isl_dim_type, Cuint, Cint), bmap, type, pos, value)
end

function isl_basic_map_sum(bmap1, bmap2)
    ccall((:isl_basic_map_sum, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, Ptr{isl_basic_map}), bmap1, bmap2)
end

function isl_basic_map_neg(bmap)
    ccall((:isl_basic_map_neg, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_map_sum(map1, map2)
    ccall((:isl_map_sum, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_map_neg(map)
    ccall((:isl_map_neg, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_floordiv_val(map, d)
    ccall((:isl_map_floordiv_val, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_val}), map, d)
end

function isl_basic_map_is_equal(bmap1, bmap2)
    ccall((:isl_basic_map_is_equal, libisl), isl_bool, (Ptr{isl_basic_map}, Ptr{isl_basic_map}), bmap1, bmap2)
end

function isl_basic_map_is_disjoint(bmap1, bmap2)
    ccall((:isl_basic_map_is_disjoint, libisl), isl_bool, (Ptr{isl_basic_map}, Ptr{isl_basic_map}), bmap1, bmap2)
end

function isl_basic_map_partial_lexmax(bmap, dom, empty)
    ccall((:isl_basic_map_partial_lexmax, libisl), Ptr{isl_map}, (Ptr{isl_basic_map}, Ptr{isl_basic_set}, Ptr{Ptr{isl_set}}), bmap, dom, empty)
end

function isl_basic_map_partial_lexmin(bmap, dom, empty)
    ccall((:isl_basic_map_partial_lexmin, libisl), Ptr{isl_map}, (Ptr{isl_basic_map}, Ptr{isl_basic_set}, Ptr{Ptr{isl_set}}), bmap, dom, empty)
end

function isl_map_partial_lexmax(map, dom, empty)
    ccall((:isl_map_partial_lexmax, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_set}, Ptr{Ptr{isl_set}}), map, dom, empty)
end

function isl_map_partial_lexmin(map, dom, empty)
    ccall((:isl_map_partial_lexmin, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_set}, Ptr{Ptr{isl_set}}), map, dom, empty)
end

function isl_basic_map_lexmin(bmap)
    ccall((:isl_basic_map_lexmin, libisl), Ptr{isl_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_lexmax(bmap)
    ccall((:isl_basic_map_lexmax, libisl), Ptr{isl_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_map_lexmin(map)
    ccall((:isl_map_lexmin, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_lexmax(map)
    ccall((:isl_map_lexmax, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_basic_map_partial_lexmin_pw_multi_aff(bmap, dom, empty)
    ccall((:isl_basic_map_partial_lexmin_pw_multi_aff, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_basic_map}, Ptr{isl_basic_set}, Ptr{Ptr{isl_set}}), bmap, dom, empty)
end

function isl_basic_map_partial_lexmax_pw_multi_aff(bmap, dom, empty)
    ccall((:isl_basic_map_partial_lexmax_pw_multi_aff, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_basic_map}, Ptr{isl_basic_set}, Ptr{Ptr{isl_set}}), bmap, dom, empty)
end

function isl_basic_map_lexmin_pw_multi_aff(bmap)
    ccall((:isl_basic_map_lexmin_pw_multi_aff, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_basic_map},), bmap)
end

function isl_map_lexmin_pw_multi_aff(map)
    ccall((:isl_map_lexmin_pw_multi_aff, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_map},), map)
end

function isl_map_lexmax_pw_multi_aff(map)
    ccall((:isl_map_lexmax_pw_multi_aff, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_map},), map)
end

function isl_basic_map_print_internal(bmap, out, indent)
    ccall((:isl_basic_map_print_internal, libisl), Cvoid, (Ptr{isl_basic_map}, Ptr{Libc.FILE}, Cint), bmap, out, indent)
end

function isl_basic_map_plain_get_val_if_fixed(bmap, type, pos)
    ccall((:isl_basic_map_plain_get_val_if_fixed, libisl), Ptr{isl_val}, (Ptr{isl_basic_map}, isl_dim_type, Cuint), bmap, type, pos)
end

function isl_basic_map_image_is_bounded(bmap)
    ccall((:isl_basic_map_image_is_bounded, libisl), isl_bool, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_plain_is_universe(bmap)
    ccall((:isl_basic_map_plain_is_universe, libisl), isl_bool, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_is_universe(bmap)
    ccall((:isl_basic_map_is_universe, libisl), isl_bool, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_plain_is_empty(bmap)
    ccall((:isl_basic_map_plain_is_empty, libisl), isl_bool, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_is_empty(bmap)
    ccall((:isl_basic_map_is_empty, libisl), isl_bool, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_is_subset(bmap1, bmap2)
    ccall((:isl_basic_map_is_subset, libisl), isl_bool, (Ptr{isl_basic_map}, Ptr{isl_basic_map}), bmap1, bmap2)
end

function isl_basic_map_is_strict_subset(bmap1, bmap2)
    ccall((:isl_basic_map_is_strict_subset, libisl), isl_bool, (Ptr{isl_basic_map}, Ptr{isl_basic_map}), bmap1, bmap2)
end

function isl_map_universe(space)
    ccall((:isl_map_universe, libisl), Ptr{isl_map}, (Ptr{isl_space},), space)
end

function isl_map_nat_universe(dim)
    ccall((:isl_map_nat_universe, libisl), Ptr{isl_map}, (Ptr{isl_space},), dim)
end

function isl_map_empty(space)
    ccall((:isl_map_empty, libisl), Ptr{isl_map}, (Ptr{isl_space},), space)
end

function isl_map_identity(dim)
    ccall((:isl_map_identity, libisl), Ptr{isl_map}, (Ptr{isl_space},), dim)
end

function isl_map_lex_lt_first(dim, n)
    ccall((:isl_map_lex_lt_first, libisl), Ptr{isl_map}, (Ptr{isl_space}, Cuint), dim, n)
end

function isl_map_lex_le_first(dim, n)
    ccall((:isl_map_lex_le_first, libisl), Ptr{isl_map}, (Ptr{isl_space}, Cuint), dim, n)
end

function isl_map_lex_lt(set_dim)
    ccall((:isl_map_lex_lt, libisl), Ptr{isl_map}, (Ptr{isl_space},), set_dim)
end

function isl_map_lex_le(set_dim)
    ccall((:isl_map_lex_le, libisl), Ptr{isl_map}, (Ptr{isl_space},), set_dim)
end

function isl_map_lex_gt_first(dim, n)
    ccall((:isl_map_lex_gt_first, libisl), Ptr{isl_map}, (Ptr{isl_space}, Cuint), dim, n)
end

function isl_map_lex_ge_first(dim, n)
    ccall((:isl_map_lex_ge_first, libisl), Ptr{isl_map}, (Ptr{isl_space}, Cuint), dim, n)
end

function isl_map_lex_gt(set_dim)
    ccall((:isl_map_lex_gt, libisl), Ptr{isl_map}, (Ptr{isl_space},), set_dim)
end

function isl_map_lex_ge(set_dim)
    ccall((:isl_map_lex_ge, libisl), Ptr{isl_map}, (Ptr{isl_space},), set_dim)
end

function isl_map_free(map)
    ccall((:isl_map_free, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_copy(map)
    ccall((:isl_map_copy, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_reverse(map)
    ccall((:isl_map_reverse, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_range_reverse(map)
    ccall((:isl_map_range_reverse, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_union(map1, map2)
    ccall((:isl_map_union, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_map_union_disjoint(map1, map2)
    ccall((:isl_map_union_disjoint, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_map_intersect_domain(map, set)
    ccall((:isl_map_intersect_domain, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_set}), map, set)
end

function isl_map_intersect_range(map, set)
    ccall((:isl_map_intersect_range, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_set}), map, set)
end

function isl_map_intersect_domain_factor_range(map, factor)
    ccall((:isl_map_intersect_domain_factor_range, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map, factor)
end

function isl_map_intersect_range_factor_domain(map, factor)
    ccall((:isl_map_intersect_range_factor_domain, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map, factor)
end

function isl_map_intersect_range_factor_range(map, factor)
    ccall((:isl_map_intersect_range_factor_range, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map, factor)
end

function isl_map_apply_domain(map1, map2)
    ccall((:isl_map_apply_domain, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_map_apply_range(map1, map2)
    ccall((:isl_map_apply_range, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_map_preimage_domain_multi_aff(map, ma)
    ccall((:isl_map_preimage_domain_multi_aff, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_multi_aff}), map, ma)
end

function isl_map_preimage_range_multi_aff(map, ma)
    ccall((:isl_map_preimage_range_multi_aff, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_multi_aff}), map, ma)
end

function isl_map_preimage_domain_pw_multi_aff(map, pma)
    ccall((:isl_map_preimage_domain_pw_multi_aff, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_pw_multi_aff}), map, pma)
end

function isl_map_preimage_range_pw_multi_aff(map, pma)
    ccall((:isl_map_preimage_range_pw_multi_aff, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_pw_multi_aff}), map, pma)
end

function isl_map_preimage_domain_multi_pw_aff(map, mpa)
    ccall((:isl_map_preimage_domain_multi_pw_aff, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_multi_pw_aff}), map, mpa)
end

function isl_basic_map_product(bmap1, bmap2)
    ccall((:isl_basic_map_product, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, Ptr{isl_basic_map}), bmap1, bmap2)
end

function isl_map_product(map1, map2)
    ccall((:isl_map_product, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_basic_map_domain_product(bmap1, bmap2)
    ccall((:isl_basic_map_domain_product, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, Ptr{isl_basic_map}), bmap1, bmap2)
end

function isl_basic_map_range_product(bmap1, bmap2)
    ccall((:isl_basic_map_range_product, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, Ptr{isl_basic_map}), bmap1, bmap2)
end

function isl_map_domain_product(map1, map2)
    ccall((:isl_map_domain_product, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_map_range_product(map1, map2)
    ccall((:isl_map_range_product, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_basic_map_flat_product(bmap1, bmap2)
    ccall((:isl_basic_map_flat_product, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, Ptr{isl_basic_map}), bmap1, bmap2)
end

function isl_map_flat_product(map1, map2)
    ccall((:isl_map_flat_product, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_basic_map_flat_range_product(bmap1, bmap2)
    ccall((:isl_basic_map_flat_range_product, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, Ptr{isl_basic_map}), bmap1, bmap2)
end

function isl_map_flat_domain_product(map1, map2)
    ccall((:isl_map_flat_domain_product, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_map_flat_range_product(map1, map2)
    ccall((:isl_map_flat_range_product, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_map_domain_is_wrapping(map)
    ccall((:isl_map_domain_is_wrapping, libisl), isl_bool, (Ptr{isl_map},), map)
end

function isl_map_range_is_wrapping(map)
    ccall((:isl_map_range_is_wrapping, libisl), isl_bool, (Ptr{isl_map},), map)
end

function isl_map_is_product(map)
    ccall((:isl_map_is_product, libisl), isl_bool, (Ptr{isl_map},), map)
end

function isl_map_factor_domain(map)
    ccall((:isl_map_factor_domain, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_factor_range(map)
    ccall((:isl_map_factor_range, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_domain_factor_domain(map)
    ccall((:isl_map_domain_factor_domain, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_domain_factor_range(map)
    ccall((:isl_map_domain_factor_range, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_range_factor_domain(map)
    ccall((:isl_map_range_factor_domain, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_range_factor_range(map)
    ccall((:isl_map_range_factor_range, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_intersect(map1, map2)
    ccall((:isl_map_intersect, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_map_intersect_params(map, params)
    ccall((:isl_map_intersect_params, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_set}), map, params)
end

function isl_map_subtract(map1, map2)
    ccall((:isl_map_subtract, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_map_subtract_domain(map, dom)
    ccall((:isl_map_subtract_domain, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_set}), map, dom)
end

function isl_map_subtract_range(map, dom)
    ccall((:isl_map_subtract_range, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_set}), map, dom)
end

function isl_map_complement(map)
    ccall((:isl_map_complement, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_fix_input_si(map, input, value)
    ccall((:isl_map_fix_input_si, libisl), Ptr{isl_map}, (Ptr{isl_map}, Cuint, Cint), map, input, value)
end

function isl_map_fix_si(map, type, pos, value)
    ccall((:isl_map_fix_si, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cuint, Cint), map, type, pos, value)
end

function isl_map_fix_val(map, type, pos, v)
    ccall((:isl_map_fix_val, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cuint, Ptr{isl_val}), map, type, pos, v)
end

function isl_map_lower_bound_si(map, type, pos, value)
    ccall((:isl_map_lower_bound_si, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cuint, Cint), map, type, pos, value)
end

function isl_map_upper_bound_si(map, type, pos, value)
    ccall((:isl_map_upper_bound_si, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cuint, Cint), map, type, pos, value)
end

function isl_basic_map_deltas(bmap)
    ccall((:isl_basic_map_deltas, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_map},), bmap)
end

function isl_map_deltas(map)
    ccall((:isl_map_deltas, libisl), Ptr{isl_set}, (Ptr{isl_map},), map)
end

function isl_basic_map_deltas_map(bmap)
    ccall((:isl_basic_map_deltas_map, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_map_deltas_map(map)
    ccall((:isl_map_deltas_map, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_detect_equalities(map)
    ccall((:isl_map_detect_equalities, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_affine_hull(map)
    ccall((:isl_map_affine_hull, libisl), Ptr{isl_basic_map}, (Ptr{isl_map},), map)
end

function isl_map_convex_hull(map)
    ccall((:isl_map_convex_hull, libisl), Ptr{isl_basic_map}, (Ptr{isl_map},), map)
end

function isl_map_polyhedral_hull(map)
    ccall((:isl_map_polyhedral_hull, libisl), Ptr{isl_basic_map}, (Ptr{isl_map},), map)
end

function isl_basic_map_add_dims(bmap, type, n)
    ccall((:isl_basic_map_add_dims, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, isl_dim_type, Cuint), bmap, type, n)
end

function isl_map_add_dims(map, type, n)
    ccall((:isl_map_add_dims, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cuint), map, type, n)
end

function isl_basic_map_insert_dims(bmap, type, pos, n)
    ccall((:isl_basic_map_insert_dims, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, isl_dim_type, Cuint, Cuint), bmap, type, pos, n)
end

function isl_map_insert_dims(map, type, pos, n)
    ccall((:isl_map_insert_dims, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cuint, Cuint), map, type, pos, n)
end

function isl_basic_map_move_dims(bmap, dst_type, dst_pos, src_type, src_pos, n)
    ccall((:isl_basic_map_move_dims, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, isl_dim_type, Cuint, isl_dim_type, Cuint, Cuint), bmap, dst_type, dst_pos, src_type, src_pos, n)
end

function isl_map_move_dims(map, dst_type, dst_pos, src_type, src_pos, n)
    ccall((:isl_map_move_dims, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cuint, isl_dim_type, Cuint, Cuint), map, dst_type, dst_pos, src_type, src_pos, n)
end

function isl_basic_map_project_out(bmap, type, first, n)
    ccall((:isl_basic_map_project_out, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, isl_dim_type, Cuint, Cuint), bmap, type, first, n)
end

function isl_map_project_out(map, type, first, n)
    ccall((:isl_map_project_out, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cuint, Cuint), map, type, first, n)
end

function isl_map_project_out_all_params(map)
    ccall((:isl_map_project_out_all_params, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_basic_map_remove_divs(bmap)
    ccall((:isl_basic_map_remove_divs, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_map_remove_unknown_divs(map)
    ccall((:isl_map_remove_unknown_divs, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_remove_divs(map)
    ccall((:isl_map_remove_divs, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_eliminate(map, type, first, n)
    ccall((:isl_map_eliminate, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cuint, Cuint), map, type, first, n)
end

function isl_map_remove_dims(map, type, first, n)
    ccall((:isl_map_remove_dims, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cuint, Cuint), map, type, first, n)
end

function isl_basic_map_remove_divs_involving_dims(bmap, type, first, n)
    ccall((:isl_basic_map_remove_divs_involving_dims, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, isl_dim_type, Cuint, Cuint), bmap, type, first, n)
end

function isl_map_remove_divs_involving_dims(map, type, first, n)
    ccall((:isl_map_remove_divs_involving_dims, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cuint, Cuint), map, type, first, n)
end

function isl_map_remove_inputs(map, first, n)
    ccall((:isl_map_remove_inputs, libisl), Ptr{isl_map}, (Ptr{isl_map}, Cuint, Cuint), map, first, n)
end

function isl_basic_map_equate(bmap, type1, pos1, type2, pos2)
    ccall((:isl_basic_map_equate, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, isl_dim_type, Cint, isl_dim_type, Cint), bmap, type1, pos1, type2, pos2)
end

function isl_basic_map_order_ge(bmap, type1, pos1, type2, pos2)
    ccall((:isl_basic_map_order_ge, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, isl_dim_type, Cint, isl_dim_type, Cint), bmap, type1, pos1, type2, pos2)
end

function isl_map_order_ge(map, type1, pos1, type2, pos2)
    ccall((:isl_map_order_ge, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cint, isl_dim_type, Cint), map, type1, pos1, type2, pos2)
end

function isl_map_order_le(map, type1, pos1, type2, pos2)
    ccall((:isl_map_order_le, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cint, isl_dim_type, Cint), map, type1, pos1, type2, pos2)
end

function isl_map_equate(map, type1, pos1, type2, pos2)
    ccall((:isl_map_equate, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cint, isl_dim_type, Cint), map, type1, pos1, type2, pos2)
end

function isl_map_oppose(map, type1, pos1, type2, pos2)
    ccall((:isl_map_oppose, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cint, isl_dim_type, Cint), map, type1, pos1, type2, pos2)
end

function isl_map_order_lt(map, type1, pos1, type2, pos2)
    ccall((:isl_map_order_lt, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cint, isl_dim_type, Cint), map, type1, pos1, type2, pos2)
end

function isl_basic_map_order_gt(bmap, type1, pos1, type2, pos2)
    ccall((:isl_basic_map_order_gt, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, isl_dim_type, Cint, isl_dim_type, Cint), bmap, type1, pos1, type2, pos2)
end

function isl_map_order_gt(map, type1, pos1, type2, pos2)
    ccall((:isl_map_order_gt, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cint, isl_dim_type, Cint), map, type1, pos1, type2, pos2)
end

function isl_set_identity(set)
    ccall((:isl_set_identity, libisl), Ptr{isl_map}, (Ptr{isl_set},), set)
end

function isl_basic_set_is_wrapping(bset)
    ccall((:isl_basic_set_is_wrapping, libisl), isl_bool, (Ptr{isl_basic_set},), bset)
end

function isl_set_is_wrapping(set)
    ccall((:isl_set_is_wrapping, libisl), isl_bool, (Ptr{isl_set},), set)
end

function isl_basic_map_wrap(bmap)
    ccall((:isl_basic_map_wrap, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_map},), bmap)
end

function isl_map_wrap(map)
    ccall((:isl_map_wrap, libisl), Ptr{isl_set}, (Ptr{isl_map},), map)
end

function isl_basic_set_unwrap(bset)
    ccall((:isl_basic_set_unwrap, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_set},), bset)
end

function isl_set_unwrap(set)
    ccall((:isl_set_unwrap, libisl), Ptr{isl_map}, (Ptr{isl_set},), set)
end

function isl_basic_map_flatten(bmap)
    ccall((:isl_basic_map_flatten, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_map_flatten(map)
    ccall((:isl_map_flatten, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_basic_map_flatten_domain(bmap)
    ccall((:isl_basic_map_flatten_domain, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_basic_map_flatten_range(bmap)
    ccall((:isl_basic_map_flatten_range, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_map_flatten_domain(map)
    ccall((:isl_map_flatten_domain, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_flatten_range(map)
    ccall((:isl_map_flatten_range, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_basic_set_flatten(bset)
    ccall((:isl_basic_set_flatten, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set},), bset)
end

function isl_set_flatten(set)
    ccall((:isl_set_flatten, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_set_flatten_map(set)
    ccall((:isl_set_flatten_map, libisl), Ptr{isl_map}, (Ptr{isl_set},), set)
end

function isl_map_params(map)
    ccall((:isl_map_params, libisl), Ptr{isl_set}, (Ptr{isl_map},), map)
end

function isl_map_domain(bmap)
    ccall((:isl_map_domain, libisl), Ptr{isl_set}, (Ptr{isl_map},), bmap)
end

function isl_map_range(map)
    ccall((:isl_map_range, libisl), Ptr{isl_set}, (Ptr{isl_map},), map)
end

function isl_map_domain_map(map)
    ccall((:isl_map_domain_map, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_range_map(map)
    ccall((:isl_map_range_map, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_set_wrapped_domain_map(set)
    ccall((:isl_set_wrapped_domain_map, libisl), Ptr{isl_map}, (Ptr{isl_set},), set)
end

function isl_map_from_basic_map(bmap)
    ccall((:isl_map_from_basic_map, libisl), Ptr{isl_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_map_from_domain(set)
    ccall((:isl_map_from_domain, libisl), Ptr{isl_map}, (Ptr{isl_set},), set)
end

function isl_basic_map_from_domain(bset)
    ccall((:isl_basic_map_from_domain, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_set},), bset)
end

function isl_basic_map_from_range(bset)
    ccall((:isl_basic_map_from_range, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_set},), bset)
end

function isl_map_from_range(set)
    ccall((:isl_map_from_range, libisl), Ptr{isl_map}, (Ptr{isl_set},), set)
end

function isl_basic_map_from_domain_and_range(domain, range)
    ccall((:isl_basic_map_from_domain_and_range, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_set}, Ptr{isl_basic_set}), domain, range)
end

function isl_map_from_domain_and_range(domain, range)
    ccall((:isl_map_from_domain_and_range, libisl), Ptr{isl_map}, (Ptr{isl_set}, Ptr{isl_set}), domain, range)
end

function isl_map_sample(map)
    ccall((:isl_map_sample, libisl), Ptr{isl_basic_map}, (Ptr{isl_map},), map)
end

function isl_map_bind_domain(map, tuple)
    ccall((:isl_map_bind_domain, libisl), Ptr{isl_set}, (Ptr{isl_map}, Ptr{isl_multi_id}), map, tuple)
end

function isl_map_bind_range(map, tuple)
    ccall((:isl_map_bind_range, libisl), Ptr{isl_set}, (Ptr{isl_map}, Ptr{isl_multi_id}), map, tuple)
end

function isl_map_plain_is_empty(map)
    ccall((:isl_map_plain_is_empty, libisl), isl_bool, (Ptr{isl_map},), map)
end

function isl_map_plain_is_universe(map)
    ccall((:isl_map_plain_is_universe, libisl), isl_bool, (Ptr{isl_map},), map)
end

function isl_map_is_empty(map)
    ccall((:isl_map_is_empty, libisl), isl_bool, (Ptr{isl_map},), map)
end

function isl_map_is_subset(map1, map2)
    ccall((:isl_map_is_subset, libisl), isl_bool, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_map_is_strict_subset(map1, map2)
    ccall((:isl_map_is_strict_subset, libisl), isl_bool, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_map_is_equal(map1, map2)
    ccall((:isl_map_is_equal, libisl), isl_bool, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_map_is_disjoint(map1, map2)
    ccall((:isl_map_is_disjoint, libisl), isl_bool, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_basic_map_is_single_valued(bmap)
    ccall((:isl_basic_map_is_single_valued, libisl), isl_bool, (Ptr{isl_basic_map},), bmap)
end

function isl_map_plain_is_single_valued(map)
    ccall((:isl_map_plain_is_single_valued, libisl), isl_bool, (Ptr{isl_map},), map)
end

function isl_map_is_single_valued(map)
    ccall((:isl_map_is_single_valued, libisl), isl_bool, (Ptr{isl_map},), map)
end

function isl_map_plain_is_injective(map)
    ccall((:isl_map_plain_is_injective, libisl), isl_bool, (Ptr{isl_map},), map)
end

function isl_map_is_injective(map)
    ccall((:isl_map_is_injective, libisl), isl_bool, (Ptr{isl_map},), map)
end

function isl_map_is_bijective(map)
    ccall((:isl_map_is_bijective, libisl), isl_bool, (Ptr{isl_map},), map)
end

function isl_map_is_identity(map)
    ccall((:isl_map_is_identity, libisl), isl_bool, (Ptr{isl_map},), map)
end

function isl_map_is_translation(map)
    ccall((:isl_map_is_translation, libisl), Cint, (Ptr{isl_map},), map)
end

function isl_map_has_equal_space(map1, map2)
    ccall((:isl_map_has_equal_space, libisl), isl_bool, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_basic_map_can_zip(bmap)
    ccall((:isl_basic_map_can_zip, libisl), isl_bool, (Ptr{isl_basic_map},), bmap)
end

function isl_map_can_zip(map)
    ccall((:isl_map_can_zip, libisl), isl_bool, (Ptr{isl_map},), map)
end

function isl_basic_map_zip(bmap)
    ccall((:isl_basic_map_zip, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_map_zip(map)
    ccall((:isl_map_zip, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_basic_map_can_curry(bmap)
    ccall((:isl_basic_map_can_curry, libisl), isl_bool, (Ptr{isl_basic_map},), bmap)
end

function isl_map_can_curry(map)
    ccall((:isl_map_can_curry, libisl), isl_bool, (Ptr{isl_map},), map)
end

function isl_basic_map_curry(bmap)
    ccall((:isl_basic_map_curry, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_map_curry(map)
    ccall((:isl_map_curry, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_can_range_curry(map)
    ccall((:isl_map_can_range_curry, libisl), isl_bool, (Ptr{isl_map},), map)
end

function isl_map_range_curry(map)
    ccall((:isl_map_range_curry, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_basic_map_can_uncurry(bmap)
    ccall((:isl_basic_map_can_uncurry, libisl), isl_bool, (Ptr{isl_basic_map},), bmap)
end

function isl_map_can_uncurry(map)
    ccall((:isl_map_can_uncurry, libisl), isl_bool, (Ptr{isl_map},), map)
end

function isl_basic_map_uncurry(bmap)
    ccall((:isl_basic_map_uncurry, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_map_uncurry(map)
    ccall((:isl_map_uncurry, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_make_disjoint(map)
    ccall((:isl_map_make_disjoint, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_basic_map_compute_divs(bmap)
    ccall((:isl_basic_map_compute_divs, libisl), Ptr{isl_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_map_compute_divs(map)
    ccall((:isl_map_compute_divs, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_align_divs(map)
    ccall((:isl_map_align_divs, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_basic_map_drop_constraints_involving_dims(bmap, type, first, n)
    ccall((:isl_basic_map_drop_constraints_involving_dims, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, isl_dim_type, Cuint, Cuint), bmap, type, first, n)
end

function isl_basic_map_drop_constraints_not_involving_dims(bmap, type, first, n)
    ccall((:isl_basic_map_drop_constraints_not_involving_dims, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, isl_dim_type, Cuint, Cuint), bmap, type, first, n)
end

function isl_map_drop_constraints_involving_dims(map, type, first, n)
    ccall((:isl_map_drop_constraints_involving_dims, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cuint, Cuint), map, type, first, n)
end

function isl_map_drop_constraints_not_involving_dims(map, type, first, n)
    ccall((:isl_map_drop_constraints_not_involving_dims, libisl), Ptr{isl_map}, (Ptr{isl_map}, isl_dim_type, Cuint, Cuint), map, type, first, n)
end

function isl_basic_map_involves_dims(bmap, type, first, n)
    ccall((:isl_basic_map_involves_dims, libisl), isl_bool, (Ptr{isl_basic_map}, isl_dim_type, Cuint, Cuint), bmap, type, first, n)
end

function isl_map_involves_dims(map, type, first, n)
    ccall((:isl_map_involves_dims, libisl), isl_bool, (Ptr{isl_map}, isl_dim_type, Cuint, Cuint), map, type, first, n)
end

function isl_map_print_internal(map, out, indent)
    ccall((:isl_map_print_internal, libisl), Cvoid, (Ptr{isl_map}, Ptr{Libc.FILE}, Cint), map, out, indent)
end

function isl_map_plain_get_val_if_fixed(map, type, pos)
    ccall((:isl_map_plain_get_val_if_fixed, libisl), Ptr{isl_val}, (Ptr{isl_map}, isl_dim_type, Cuint), map, type, pos)
end

function isl_basic_map_gist_domain(bmap, context)
    ccall((:isl_basic_map_gist_domain, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, Ptr{isl_basic_set}), bmap, context)
end

function isl_basic_map_gist(bmap, context)
    ccall((:isl_basic_map_gist, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, Ptr{isl_basic_map}), bmap, context)
end

function isl_map_gist(map, context)
    ccall((:isl_map_gist, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map, context)
end

function isl_map_gist_domain(map, context)
    ccall((:isl_map_gist_domain, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_set}), map, context)
end

function isl_map_gist_range(map, context)
    ccall((:isl_map_gist_range, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_set}), map, context)
end

function isl_map_gist_params(map, context)
    ccall((:isl_map_gist_params, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_set}), map, context)
end

function isl_map_gist_basic_map(map, context)
    ccall((:isl_map_gist_basic_map, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_basic_map}), map, context)
end

mutable struct isl_stride_info end

function isl_map_get_range_stride_info(map, pos)
    ccall((:isl_map_get_range_stride_info, libisl), Ptr{isl_stride_info}, (Ptr{isl_map}, Cint), map, pos)
end

function isl_map_get_range_simple_fixed_box_hull(map)
    ccall((:isl_map_get_range_simple_fixed_box_hull, libisl), Ptr{isl_fixed_box}, (Ptr{isl_map},), map)
end

function isl_map_coalesce(map)
    ccall((:isl_map_coalesce, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

function isl_map_plain_is_equal(map1, map2)
    ccall((:isl_map_plain_is_equal, libisl), isl_bool, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_map_get_hash(map)
    ccall((:isl_map_get_hash, libisl), UInt32, (Ptr{isl_map},), map)
end

function isl_map_n_basic_map(map)
    ccall((:isl_map_n_basic_map, libisl), isl_size, (Ptr{isl_map},), map)
end

function isl_map_foreach_basic_map(map, fn, user)
    ccall((:isl_map_foreach_basic_map, libisl), isl_stat, (Ptr{isl_map}, Ptr{Cvoid}, Ptr{Cvoid}), map, fn, user)
end

function isl_map_get_basic_map_list(map)
    ccall((:isl_map_get_basic_map_list, libisl), Ptr{isl_basic_map_list}, (Ptr{isl_map},), map)
end

function isl_map_fixed_power_val(map, exp)
    ccall((:isl_map_fixed_power_val, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_val}), map, exp)
end

function isl_map_power(map, exact)
    ccall((:isl_map_power, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_bool}), map, exact)
end

function isl_map_reaching_path_lengths(map, exact)
    ccall((:isl_map_reaching_path_lengths, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_bool}), map, exact)
end

function isl_map_transitive_closure(map, exact)
    ccall((:isl_map_transitive_closure, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_bool}), map, exact)
end

function isl_map_lex_le_map(map1, map2)
    ccall((:isl_map_lex_le_map, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_map_lex_lt_map(map1, map2)
    ccall((:isl_map_lex_lt_map, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_map_lex_ge_map(map1, map2)
    ccall((:isl_map_lex_ge_map, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_map_lex_gt_map(map1, map2)
    ccall((:isl_map_lex_gt_map, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_map}), map1, map2)
end

function isl_basic_map_align_params(bmap, model)
    ccall((:isl_basic_map_align_params, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map}, Ptr{isl_space}), bmap, model)
end

function isl_map_align_params(map, model)
    ccall((:isl_map_align_params, libisl), Ptr{isl_map}, (Ptr{isl_map}, Ptr{isl_space}), map, model)
end

function isl_basic_map_drop_unused_params(bmap)
    ccall((:isl_basic_map_drop_unused_params, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_map_drop_unused_params(map)
    ccall((:isl_map_drop_unused_params, libisl), Ptr{isl_map}, (Ptr{isl_map},), map)
end

mutable struct isl_mat end

function isl_basic_map_equalities_matrix(bmap, c1, c2, c3, c4, c5)
    ccall((:isl_basic_map_equalities_matrix, libisl), Ptr{isl_mat}, (Ptr{isl_basic_map}, isl_dim_type, isl_dim_type, isl_dim_type, isl_dim_type, isl_dim_type), bmap, c1, c2, c3, c4, c5)
end

function isl_basic_map_inequalities_matrix(bmap, c1, c2, c3, c4, c5)
    ccall((:isl_basic_map_inequalities_matrix, libisl), Ptr{isl_mat}, (Ptr{isl_basic_map}, isl_dim_type, isl_dim_type, isl_dim_type, isl_dim_type, isl_dim_type), bmap, c1, c2, c3, c4, c5)
end

function isl_basic_map_from_constraint_matrices(dim, eq, ineq, c1, c2, c3, c4, c5)
    ccall((:isl_basic_map_from_constraint_matrices, libisl), Ptr{isl_basic_map}, (Ptr{isl_space}, Ptr{isl_mat}, Ptr{isl_mat}, isl_dim_type, isl_dim_type, isl_dim_type, isl_dim_type, isl_dim_type), dim, eq, ineq, c1, c2, c3, c4, c5)
end

function isl_basic_map_from_aff(aff)
    ccall((:isl_basic_map_from_aff, libisl), Ptr{isl_basic_map}, (Ptr{isl_aff},), aff)
end

function isl_basic_map_from_multi_aff(maff)
    ccall((:isl_basic_map_from_multi_aff, libisl), Ptr{isl_basic_map}, (Ptr{isl_multi_aff},), maff)
end

function isl_basic_map_from_aff_list(domain_space, list)
    ccall((:isl_basic_map_from_aff_list, libisl), Ptr{isl_basic_map}, (Ptr{isl_space}, Ptr{isl_aff_list}), domain_space, list)
end

function isl_map_from_aff(aff)
    ccall((:isl_map_from_aff, libisl), Ptr{isl_map}, (Ptr{isl_aff},), aff)
end

function isl_map_from_multi_aff(maff)
    ccall((:isl_map_from_multi_aff, libisl), Ptr{isl_map}, (Ptr{isl_multi_aff},), maff)
end

function isl_map_dim_min(map, pos)
    ccall((:isl_map_dim_min, libisl), Ptr{isl_pw_aff}, (Ptr{isl_map}, Cint), map, pos)
end

function isl_map_dim_max(map, pos)
    ccall((:isl_map_dim_max, libisl), Ptr{isl_pw_aff}, (Ptr{isl_map}, Cint), map, pos)
end

function isl_basic_map_list_get_ctx(list)
    ccall((:isl_basic_map_list_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_basic_map_list},), list)
end

function isl_basic_map_list_from_basic_map(el)
    ccall((:isl_basic_map_list_from_basic_map, libisl), Ptr{isl_basic_map_list}, (Ptr{isl_basic_map},), el)
end

function isl_basic_map_list_alloc(ctx, n)
    ccall((:isl_basic_map_list_alloc, libisl), Ptr{isl_basic_map_list}, (Ptr{isl_ctx}, Cint), ctx, n)
end

function isl_basic_map_list_copy(list)
    ccall((:isl_basic_map_list_copy, libisl), Ptr{isl_basic_map_list}, (Ptr{isl_basic_map_list},), list)
end

function isl_basic_map_list_free(list)
    ccall((:isl_basic_map_list_free, libisl), Ptr{isl_basic_map_list}, (Ptr{isl_basic_map_list},), list)
end

function isl_basic_map_list_add(list, el)
    ccall((:isl_basic_map_list_add, libisl), Ptr{isl_basic_map_list}, (Ptr{isl_basic_map_list}, Ptr{isl_basic_map}), list, el)
end

function isl_basic_map_list_insert(list, pos, el)
    ccall((:isl_basic_map_list_insert, libisl), Ptr{isl_basic_map_list}, (Ptr{isl_basic_map_list}, Cuint, Ptr{isl_basic_map}), list, pos, el)
end

function isl_basic_map_list_drop(list, first, n)
    ccall((:isl_basic_map_list_drop, libisl), Ptr{isl_basic_map_list}, (Ptr{isl_basic_map_list}, Cuint, Cuint), list, first, n)
end

function isl_basic_map_list_clear(list)
    ccall((:isl_basic_map_list_clear, libisl), Ptr{isl_basic_map_list}, (Ptr{isl_basic_map_list},), list)
end

function isl_basic_map_list_swap(list, pos1, pos2)
    ccall((:isl_basic_map_list_swap, libisl), Ptr{isl_basic_map_list}, (Ptr{isl_basic_map_list}, Cuint, Cuint), list, pos1, pos2)
end

function isl_basic_map_list_reverse(list)
    ccall((:isl_basic_map_list_reverse, libisl), Ptr{isl_basic_map_list}, (Ptr{isl_basic_map_list},), list)
end

function isl_basic_map_list_concat(list1, list2)
    ccall((:isl_basic_map_list_concat, libisl), Ptr{isl_basic_map_list}, (Ptr{isl_basic_map_list}, Ptr{isl_basic_map_list}), list1, list2)
end

function isl_basic_map_list_size(list)
    ccall((:isl_basic_map_list_size, libisl), isl_size, (Ptr{isl_basic_map_list},), list)
end

function isl_basic_map_list_n_basic_map(list)
    ccall((:isl_basic_map_list_n_basic_map, libisl), isl_size, (Ptr{isl_basic_map_list},), list)
end

function isl_basic_map_list_get_at(list, index)
    ccall((:isl_basic_map_list_get_at, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map_list}, Cint), list, index)
end

function isl_basic_map_list_get_basic_map(list, index)
    ccall((:isl_basic_map_list_get_basic_map, libisl), Ptr{isl_basic_map}, (Ptr{isl_basic_map_list}, Cint), list, index)
end

function isl_basic_map_list_set_basic_map(list, index, el)
    ccall((:isl_basic_map_list_set_basic_map, libisl), Ptr{isl_basic_map_list}, (Ptr{isl_basic_map_list}, Cint, Ptr{isl_basic_map}), list, index, el)
end

function isl_basic_map_list_foreach(list, fn, user)
    ccall((:isl_basic_map_list_foreach, libisl), isl_stat, (Ptr{isl_basic_map_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_basic_map_list_map(list, fn, user)
    ccall((:isl_basic_map_list_map, libisl), Ptr{isl_basic_map_list}, (Ptr{isl_basic_map_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_basic_map_list_sort(list, cmp, user)
    ccall((:isl_basic_map_list_sort, libisl), Ptr{isl_basic_map_list}, (Ptr{isl_basic_map_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, cmp, user)
end

function isl_basic_map_list_foreach_scc(list, follows, follows_user, fn, fn_user)
    ccall((:isl_basic_map_list_foreach_scc, libisl), isl_stat, (Ptr{isl_basic_map_list}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), list, follows, follows_user, fn, fn_user)
end

function isl_basic_map_list_to_str(list)
    ccall((:isl_basic_map_list_to_str, libisl), Ptr{Cchar}, (Ptr{isl_basic_map_list},), list)
end

function isl_printer_print_basic_map_list(p, list)
    ccall((:isl_printer_print_basic_map_list, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_basic_map_list}), p, list)
end

function isl_basic_map_list_dump(list)
    ccall((:isl_basic_map_list_dump, libisl), Cvoid, (Ptr{isl_basic_map_list},), list)
end

function isl_map_list_get_ctx(list)
    ccall((:isl_map_list_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_map_list},), list)
end

function isl_map_list_from_map(el)
    ccall((:isl_map_list_from_map, libisl), Ptr{isl_map_list}, (Ptr{isl_map},), el)
end

function isl_map_list_alloc(ctx, n)
    ccall((:isl_map_list_alloc, libisl), Ptr{isl_map_list}, (Ptr{isl_ctx}, Cint), ctx, n)
end

function isl_map_list_copy(list)
    ccall((:isl_map_list_copy, libisl), Ptr{isl_map_list}, (Ptr{isl_map_list},), list)
end

function isl_map_list_free(list)
    ccall((:isl_map_list_free, libisl), Ptr{isl_map_list}, (Ptr{isl_map_list},), list)
end

function isl_map_list_add(list, el)
    ccall((:isl_map_list_add, libisl), Ptr{isl_map_list}, (Ptr{isl_map_list}, Ptr{isl_map}), list, el)
end

function isl_map_list_insert(list, pos, el)
    ccall((:isl_map_list_insert, libisl), Ptr{isl_map_list}, (Ptr{isl_map_list}, Cuint, Ptr{isl_map}), list, pos, el)
end

function isl_map_list_drop(list, first, n)
    ccall((:isl_map_list_drop, libisl), Ptr{isl_map_list}, (Ptr{isl_map_list}, Cuint, Cuint), list, first, n)
end

function isl_map_list_clear(list)
    ccall((:isl_map_list_clear, libisl), Ptr{isl_map_list}, (Ptr{isl_map_list},), list)
end

function isl_map_list_swap(list, pos1, pos2)
    ccall((:isl_map_list_swap, libisl), Ptr{isl_map_list}, (Ptr{isl_map_list}, Cuint, Cuint), list, pos1, pos2)
end

function isl_map_list_reverse(list)
    ccall((:isl_map_list_reverse, libisl), Ptr{isl_map_list}, (Ptr{isl_map_list},), list)
end

function isl_map_list_concat(list1, list2)
    ccall((:isl_map_list_concat, libisl), Ptr{isl_map_list}, (Ptr{isl_map_list}, Ptr{isl_map_list}), list1, list2)
end

function isl_map_list_size(list)
    ccall((:isl_map_list_size, libisl), isl_size, (Ptr{isl_map_list},), list)
end

function isl_map_list_n_map(list)
    ccall((:isl_map_list_n_map, libisl), isl_size, (Ptr{isl_map_list},), list)
end

function isl_map_list_get_at(list, index)
    ccall((:isl_map_list_get_at, libisl), Ptr{isl_map}, (Ptr{isl_map_list}, Cint), list, index)
end

function isl_map_list_get_map(list, index)
    ccall((:isl_map_list_get_map, libisl), Ptr{isl_map}, (Ptr{isl_map_list}, Cint), list, index)
end

function isl_map_list_set_map(list, index, el)
    ccall((:isl_map_list_set_map, libisl), Ptr{isl_map_list}, (Ptr{isl_map_list}, Cint, Ptr{isl_map}), list, index, el)
end

function isl_map_list_foreach(list, fn, user)
    ccall((:isl_map_list_foreach, libisl), isl_stat, (Ptr{isl_map_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_map_list_map(list, fn, user)
    ccall((:isl_map_list_map, libisl), Ptr{isl_map_list}, (Ptr{isl_map_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_map_list_sort(list, cmp, user)
    ccall((:isl_map_list_sort, libisl), Ptr{isl_map_list}, (Ptr{isl_map_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, cmp, user)
end

function isl_map_list_foreach_scc(list, follows, follows_user, fn, fn_user)
    ccall((:isl_map_list_foreach_scc, libisl), isl_stat, (Ptr{isl_map_list}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), list, follows, follows_user, fn, fn_user)
end

function isl_map_list_to_str(list)
    ccall((:isl_map_list_to_str, libisl), Ptr{Cchar}, (Ptr{isl_map_list},), list)
end

function isl_printer_print_map_list(p, list)
    ccall((:isl_printer_print_map_list, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_map_list}), p, list)
end

function isl_map_list_dump(list)
    ccall((:isl_map_list_dump, libisl), Cvoid, (Ptr{isl_map_list},), list)
end

struct isl_maybe_isl_basic_set
    valid::isl_bool
    value::Ptr{isl_basic_set}
end

mutable struct isl_map_to_basic_set end

function isl_map_to_basic_set_alloc(ctx, min_size)
    ccall((:isl_map_to_basic_set_alloc, libisl), Ptr{isl_map_to_basic_set}, (Ptr{isl_ctx}, Cint), ctx, min_size)
end

function isl_map_to_basic_set_copy(hmap)
    ccall((:isl_map_to_basic_set_copy, libisl), Ptr{isl_map_to_basic_set}, (Ptr{isl_map_to_basic_set},), hmap)
end

function isl_map_to_basic_set_free(hmap)
    ccall((:isl_map_to_basic_set_free, libisl), Ptr{isl_map_to_basic_set}, (Ptr{isl_map_to_basic_set},), hmap)
end

function isl_map_to_basic_set_get_ctx(hmap)
    ccall((:isl_map_to_basic_set_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_map_to_basic_set},), hmap)
end

function isl_map_to_basic_set_try_get(hmap, key)
    ccall((:isl_map_to_basic_set_try_get, libisl), isl_maybe_isl_basic_set, (Ptr{isl_map_to_basic_set}, Ptr{isl_map}), hmap, key)
end

function isl_map_to_basic_set_has(hmap, key)
    ccall((:isl_map_to_basic_set_has, libisl), isl_bool, (Ptr{isl_map_to_basic_set}, Ptr{isl_map}), hmap, key)
end

function isl_map_to_basic_set_get(hmap, key)
    ccall((:isl_map_to_basic_set_get, libisl), Ptr{isl_basic_set}, (Ptr{isl_map_to_basic_set}, Ptr{isl_map}), hmap, key)
end

function isl_map_to_basic_set_set(hmap, key, val)
    ccall((:isl_map_to_basic_set_set, libisl), Ptr{isl_map_to_basic_set}, (Ptr{isl_map_to_basic_set}, Ptr{isl_map}, Ptr{isl_basic_set}), hmap, key, val)
end

function isl_map_to_basic_set_drop(hmap, key)
    ccall((:isl_map_to_basic_set_drop, libisl), Ptr{isl_map_to_basic_set}, (Ptr{isl_map_to_basic_set}, Ptr{isl_map}), hmap, key)
end

function isl_map_to_basic_set_foreach(hmap, fn, user)
    ccall((:isl_map_to_basic_set_foreach, libisl), isl_stat, (Ptr{isl_map_to_basic_set}, Ptr{Cvoid}, Ptr{Cvoid}), hmap, fn, user)
end

function isl_printer_print_map_to_basic_set(p, hmap)
    ccall((:isl_printer_print_map_to_basic_set, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_map_to_basic_set}), p, hmap)
end

function isl_map_to_basic_set_dump(hmap)
    ccall((:isl_map_to_basic_set_dump, libisl), Cvoid, (Ptr{isl_map_to_basic_set},), hmap)
end

mutable struct isl_basic_set_list end

mutable struct isl_set_list end

function isl_basic_set_list_get_ctx(list)
    ccall((:isl_basic_set_list_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_basic_set_list},), list)
end

function isl_basic_set_list_from_basic_set(el)
    ccall((:isl_basic_set_list_from_basic_set, libisl), Ptr{isl_basic_set_list}, (Ptr{isl_basic_set},), el)
end

function isl_basic_set_list_alloc(ctx, n)
    ccall((:isl_basic_set_list_alloc, libisl), Ptr{isl_basic_set_list}, (Ptr{isl_ctx}, Cint), ctx, n)
end

function isl_basic_set_list_copy(list)
    ccall((:isl_basic_set_list_copy, libisl), Ptr{isl_basic_set_list}, (Ptr{isl_basic_set_list},), list)
end

function isl_basic_set_list_free(list)
    ccall((:isl_basic_set_list_free, libisl), Ptr{isl_basic_set_list}, (Ptr{isl_basic_set_list},), list)
end

function isl_basic_set_list_add(list, el)
    ccall((:isl_basic_set_list_add, libisl), Ptr{isl_basic_set_list}, (Ptr{isl_basic_set_list}, Ptr{isl_basic_set}), list, el)
end

function isl_basic_set_list_insert(list, pos, el)
    ccall((:isl_basic_set_list_insert, libisl), Ptr{isl_basic_set_list}, (Ptr{isl_basic_set_list}, Cuint, Ptr{isl_basic_set}), list, pos, el)
end

function isl_basic_set_list_drop(list, first, n)
    ccall((:isl_basic_set_list_drop, libisl), Ptr{isl_basic_set_list}, (Ptr{isl_basic_set_list}, Cuint, Cuint), list, first, n)
end

function isl_basic_set_list_clear(list)
    ccall((:isl_basic_set_list_clear, libisl), Ptr{isl_basic_set_list}, (Ptr{isl_basic_set_list},), list)
end

function isl_basic_set_list_swap(list, pos1, pos2)
    ccall((:isl_basic_set_list_swap, libisl), Ptr{isl_basic_set_list}, (Ptr{isl_basic_set_list}, Cuint, Cuint), list, pos1, pos2)
end

function isl_basic_set_list_reverse(list)
    ccall((:isl_basic_set_list_reverse, libisl), Ptr{isl_basic_set_list}, (Ptr{isl_basic_set_list},), list)
end

function isl_basic_set_list_concat(list1, list2)
    ccall((:isl_basic_set_list_concat, libisl), Ptr{isl_basic_set_list}, (Ptr{isl_basic_set_list}, Ptr{isl_basic_set_list}), list1, list2)
end

function isl_basic_set_list_size(list)
    ccall((:isl_basic_set_list_size, libisl), isl_size, (Ptr{isl_basic_set_list},), list)
end

function isl_basic_set_list_n_basic_set(list)
    ccall((:isl_basic_set_list_n_basic_set, libisl), isl_size, (Ptr{isl_basic_set_list},), list)
end

function isl_basic_set_list_get_at(list, index)
    ccall((:isl_basic_set_list_get_at, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set_list}, Cint), list, index)
end

function isl_basic_set_list_get_basic_set(list, index)
    ccall((:isl_basic_set_list_get_basic_set, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set_list}, Cint), list, index)
end

function isl_basic_set_list_set_basic_set(list, index, el)
    ccall((:isl_basic_set_list_set_basic_set, libisl), Ptr{isl_basic_set_list}, (Ptr{isl_basic_set_list}, Cint, Ptr{isl_basic_set}), list, index, el)
end

function isl_basic_set_list_foreach(list, fn, user)
    ccall((:isl_basic_set_list_foreach, libisl), isl_stat, (Ptr{isl_basic_set_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_basic_set_list_map(list, fn, user)
    ccall((:isl_basic_set_list_map, libisl), Ptr{isl_basic_set_list}, (Ptr{isl_basic_set_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_basic_set_list_sort(list, cmp, user)
    ccall((:isl_basic_set_list_sort, libisl), Ptr{isl_basic_set_list}, (Ptr{isl_basic_set_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, cmp, user)
end

function isl_basic_set_list_foreach_scc(list, follows, follows_user, fn, fn_user)
    ccall((:isl_basic_set_list_foreach_scc, libisl), isl_stat, (Ptr{isl_basic_set_list}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), list, follows, follows_user, fn, fn_user)
end

function isl_basic_set_list_to_str(list)
    ccall((:isl_basic_set_list_to_str, libisl), Ptr{Cchar}, (Ptr{isl_basic_set_list},), list)
end

function isl_printer_print_basic_set_list(p, list)
    ccall((:isl_printer_print_basic_set_list, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_basic_set_list}), p, list)
end

function isl_basic_set_list_dump(list)
    ccall((:isl_basic_set_list_dump, libisl), Cvoid, (Ptr{isl_basic_set_list},), list)
end

function isl_set_list_get_ctx(list)
    ccall((:isl_set_list_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_set_list},), list)
end

function isl_set_list_from_set(el)
    ccall((:isl_set_list_from_set, libisl), Ptr{isl_set_list}, (Ptr{isl_set},), el)
end

function isl_set_list_alloc(ctx, n)
    ccall((:isl_set_list_alloc, libisl), Ptr{isl_set_list}, (Ptr{isl_ctx}, Cint), ctx, n)
end

function isl_set_list_copy(list)
    ccall((:isl_set_list_copy, libisl), Ptr{isl_set_list}, (Ptr{isl_set_list},), list)
end

function isl_set_list_free(list)
    ccall((:isl_set_list_free, libisl), Ptr{isl_set_list}, (Ptr{isl_set_list},), list)
end

function isl_set_list_add(list, el)
    ccall((:isl_set_list_add, libisl), Ptr{isl_set_list}, (Ptr{isl_set_list}, Ptr{isl_set}), list, el)
end

function isl_set_list_insert(list, pos, el)
    ccall((:isl_set_list_insert, libisl), Ptr{isl_set_list}, (Ptr{isl_set_list}, Cuint, Ptr{isl_set}), list, pos, el)
end

function isl_set_list_drop(list, first, n)
    ccall((:isl_set_list_drop, libisl), Ptr{isl_set_list}, (Ptr{isl_set_list}, Cuint, Cuint), list, first, n)
end

function isl_set_list_clear(list)
    ccall((:isl_set_list_clear, libisl), Ptr{isl_set_list}, (Ptr{isl_set_list},), list)
end

function isl_set_list_swap(list, pos1, pos2)
    ccall((:isl_set_list_swap, libisl), Ptr{isl_set_list}, (Ptr{isl_set_list}, Cuint, Cuint), list, pos1, pos2)
end

function isl_set_list_reverse(list)
    ccall((:isl_set_list_reverse, libisl), Ptr{isl_set_list}, (Ptr{isl_set_list},), list)
end

function isl_set_list_concat(list1, list2)
    ccall((:isl_set_list_concat, libisl), Ptr{isl_set_list}, (Ptr{isl_set_list}, Ptr{isl_set_list}), list1, list2)
end

function isl_set_list_size(list)
    ccall((:isl_set_list_size, libisl), isl_size, (Ptr{isl_set_list},), list)
end

function isl_set_list_n_set(list)
    ccall((:isl_set_list_n_set, libisl), isl_size, (Ptr{isl_set_list},), list)
end

function isl_set_list_get_at(list, index)
    ccall((:isl_set_list_get_at, libisl), Ptr{isl_set}, (Ptr{isl_set_list}, Cint), list, index)
end

function isl_set_list_get_set(list, index)
    ccall((:isl_set_list_get_set, libisl), Ptr{isl_set}, (Ptr{isl_set_list}, Cint), list, index)
end

function isl_set_list_set_set(list, index, el)
    ccall((:isl_set_list_set_set, libisl), Ptr{isl_set_list}, (Ptr{isl_set_list}, Cint, Ptr{isl_set}), list, index, el)
end

function isl_set_list_foreach(list, fn, user)
    ccall((:isl_set_list_foreach, libisl), isl_stat, (Ptr{isl_set_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_set_list_map(list, fn, user)
    ccall((:isl_set_list_map, libisl), Ptr{isl_set_list}, (Ptr{isl_set_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_set_list_sort(list, cmp, user)
    ccall((:isl_set_list_sort, libisl), Ptr{isl_set_list}, (Ptr{isl_set_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, cmp, user)
end

function isl_set_list_foreach_scc(list, follows, follows_user, fn, fn_user)
    ccall((:isl_set_list_foreach_scc, libisl), isl_stat, (Ptr{isl_set_list}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), list, follows, follows_user, fn, fn_user)
end

function isl_set_list_to_str(list)
    ccall((:isl_set_list_to_str, libisl), Ptr{Cchar}, (Ptr{isl_set_list},), list)
end

function isl_printer_print_set_list(p, list)
    ccall((:isl_printer_print_set_list, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_set_list}), p, list)
end

function isl_set_list_dump(list)
    ccall((:isl_set_list_dump, libisl), Cvoid, (Ptr{isl_set_list},), list)
end

function isl_mat_get_ctx(mat)
    ccall((:isl_mat_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_mat},), mat)
end

function isl_mat_alloc(ctx, n_row, n_col)
    ccall((:isl_mat_alloc, libisl), Ptr{isl_mat}, (Ptr{isl_ctx}, Cuint, Cuint), ctx, n_row, n_col)
end

function isl_mat_extend(mat, n_row, n_col)
    ccall((:isl_mat_extend, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Cuint, Cuint), mat, n_row, n_col)
end

function isl_mat_identity(ctx, n_row)
    ccall((:isl_mat_identity, libisl), Ptr{isl_mat}, (Ptr{isl_ctx}, Cuint), ctx, n_row)
end

function isl_mat_copy(mat)
    ccall((:isl_mat_copy, libisl), Ptr{isl_mat}, (Ptr{isl_mat},), mat)
end

function isl_mat_free(mat)
    ccall((:isl_mat_free, libisl), Ptr{isl_mat}, (Ptr{isl_mat},), mat)
end

function isl_mat_rows(mat)
    ccall((:isl_mat_rows, libisl), isl_size, (Ptr{isl_mat},), mat)
end

function isl_mat_cols(mat)
    ccall((:isl_mat_cols, libisl), isl_size, (Ptr{isl_mat},), mat)
end

function isl_mat_get_element_val(mat, row, col)
    ccall((:isl_mat_get_element_val, libisl), Ptr{isl_val}, (Ptr{isl_mat}, Cint, Cint), mat, row, col)
end

function isl_mat_set_element_si(mat, row, col, v)
    ccall((:isl_mat_set_element_si, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Cint, Cint, Cint), mat, row, col, v)
end

function isl_mat_set_element_val(mat, row, col, v)
    ccall((:isl_mat_set_element_val, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Cint, Cint, Ptr{isl_val}), mat, row, col, v)
end

function isl_mat_swap_cols(mat, i, j)
    ccall((:isl_mat_swap_cols, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Cuint, Cuint), mat, i, j)
end

function isl_mat_swap_rows(mat, i, j)
    ccall((:isl_mat_swap_rows, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Cuint, Cuint), mat, i, j)
end

mutable struct isl_vec end

function isl_mat_vec_product(mat, vec)
    ccall((:isl_mat_vec_product, libisl), Ptr{isl_vec}, (Ptr{isl_mat}, Ptr{isl_vec}), mat, vec)
end

function isl_vec_mat_product(vec, mat)
    ccall((:isl_vec_mat_product, libisl), Ptr{isl_vec}, (Ptr{isl_vec}, Ptr{isl_mat}), vec, mat)
end

function isl_mat_vec_inverse_product(mat, vec)
    ccall((:isl_mat_vec_inverse_product, libisl), Ptr{isl_vec}, (Ptr{isl_mat}, Ptr{isl_vec}), mat, vec)
end

function isl_mat_aff_direct_sum(left, right)
    ccall((:isl_mat_aff_direct_sum, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Ptr{isl_mat}), left, right)
end

function isl_mat_diagonal(mat1, mat2)
    ccall((:isl_mat_diagonal, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Ptr{isl_mat}), mat1, mat2)
end

function isl_mat_left_hermite(M, neg, U, Q)
    ccall((:isl_mat_left_hermite, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Cint, Ptr{Ptr{isl_mat}}, Ptr{Ptr{isl_mat}}), M, neg, U, Q)
end

function isl_mat_lin_to_aff(mat)
    ccall((:isl_mat_lin_to_aff, libisl), Ptr{isl_mat}, (Ptr{isl_mat},), mat)
end

function isl_mat_inverse_product(left, right)
    ccall((:isl_mat_inverse_product, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Ptr{isl_mat}), left, right)
end

function isl_mat_product(left, right)
    ccall((:isl_mat_product, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Ptr{isl_mat}), left, right)
end

function isl_mat_transpose(mat)
    ccall((:isl_mat_transpose, libisl), Ptr{isl_mat}, (Ptr{isl_mat},), mat)
end

function isl_mat_right_inverse(mat)
    ccall((:isl_mat_right_inverse, libisl), Ptr{isl_mat}, (Ptr{isl_mat},), mat)
end

function isl_mat_right_kernel(mat)
    ccall((:isl_mat_right_kernel, libisl), Ptr{isl_mat}, (Ptr{isl_mat},), mat)
end

function isl_mat_normalize(mat)
    ccall((:isl_mat_normalize, libisl), Ptr{isl_mat}, (Ptr{isl_mat},), mat)
end

function isl_mat_normalize_row(mat, row)
    ccall((:isl_mat_normalize_row, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Cint), mat, row)
end

function isl_mat_drop_cols(mat, col, n)
    ccall((:isl_mat_drop_cols, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Cuint, Cuint), mat, col, n)
end

function isl_mat_drop_rows(mat, row, n)
    ccall((:isl_mat_drop_rows, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Cuint, Cuint), mat, row, n)
end

function isl_mat_insert_cols(mat, col, n)
    ccall((:isl_mat_insert_cols, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Cuint, Cuint), mat, col, n)
end

function isl_mat_insert_rows(mat, row, n)
    ccall((:isl_mat_insert_rows, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Cuint, Cuint), mat, row, n)
end

function isl_mat_move_cols(mat, dst_col, src_col, n)
    ccall((:isl_mat_move_cols, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Cuint, Cuint, Cuint), mat, dst_col, src_col, n)
end

function isl_mat_add_rows(mat, n)
    ccall((:isl_mat_add_rows, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Cuint), mat, n)
end

function isl_mat_insert_zero_cols(mat, first, n)
    ccall((:isl_mat_insert_zero_cols, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Cuint, Cuint), mat, first, n)
end

function isl_mat_add_zero_cols(mat, n)
    ccall((:isl_mat_add_zero_cols, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Cuint), mat, n)
end

function isl_mat_insert_zero_rows(mat, row, n)
    ccall((:isl_mat_insert_zero_rows, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Cuint, Cuint), mat, row, n)
end

function isl_mat_add_zero_rows(mat, n)
    ccall((:isl_mat_add_zero_rows, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Cuint), mat, n)
end

function isl_mat_col_add(mat, dst_col, src_col)
    ccall((:isl_mat_col_add, libisl), Cvoid, (Ptr{isl_mat}, Cint, Cint), mat, dst_col, src_col)
end

function isl_mat_unimodular_complete(M, row)
    ccall((:isl_mat_unimodular_complete, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Cint), M, row)
end

function isl_mat_row_basis(mat)
    ccall((:isl_mat_row_basis, libisl), Ptr{isl_mat}, (Ptr{isl_mat},), mat)
end

function isl_mat_row_basis_extension(mat1, mat2)
    ccall((:isl_mat_row_basis_extension, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Ptr{isl_mat}), mat1, mat2)
end

function isl_mat_from_row_vec(vec)
    ccall((:isl_mat_from_row_vec, libisl), Ptr{isl_mat}, (Ptr{isl_vec},), vec)
end

function isl_mat_concat(top, bot)
    ccall((:isl_mat_concat, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Ptr{isl_mat}), top, bot)
end

function isl_mat_vec_concat(top, bot)
    ccall((:isl_mat_vec_concat, libisl), Ptr{isl_mat}, (Ptr{isl_mat}, Ptr{isl_vec}), top, bot)
end

function isl_mat_is_equal(mat1, mat2)
    ccall((:isl_mat_is_equal, libisl), isl_bool, (Ptr{isl_mat}, Ptr{isl_mat}), mat1, mat2)
end

function isl_mat_has_linearly_independent_rows(mat1, mat2)
    ccall((:isl_mat_has_linearly_independent_rows, libisl), isl_bool, (Ptr{isl_mat}, Ptr{isl_mat}), mat1, mat2)
end

function isl_mat_rank(mat)
    ccall((:isl_mat_rank, libisl), isl_size, (Ptr{isl_mat},), mat)
end

function isl_mat_initial_non_zero_cols(mat)
    ccall((:isl_mat_initial_non_zero_cols, libisl), Cint, (Ptr{isl_mat},), mat)
end

function isl_mat_print_internal(mat, out, indent)
    ccall((:isl_mat_print_internal, libisl), Cvoid, (Ptr{isl_mat}, Ptr{Libc.FILE}, Cint), mat, out, indent)
end

function isl_mat_dump(mat)
    ccall((:isl_mat_dump, libisl), Cvoid, (Ptr{isl_mat},), mat)
end

mutable struct isl_qpolynomial end

mutable struct isl_term end

mutable struct isl_pw_qpolynomial end

mutable struct isl_pw_qpolynomial_list end

@cenum isl_fold::Int32 begin
    isl_fold_error = -1
    isl_fold_min = 0
    isl_fold_max = 1
    isl_fold_list = 2
end

mutable struct isl_qpolynomial_fold end

mutable struct isl_pw_qpolynomial_fold end

mutable struct isl_pw_qpolynomial_fold_list end

mutable struct isl_union_pw_qpolynomial end

mutable struct isl_union_pw_qpolynomial_fold end

struct isl_obj_vtable
    copy::Ptr{Cvoid}
    add::Ptr{Cvoid}
    print::Ptr{Cvoid}
    free::Ptr{Cvoid}
end

const isl_obj_type = Ptr{isl_obj_vtable}

struct isl_obj
    type::isl_obj_type
    v::Ptr{Cvoid}
end

function isl_options_new_with_defaults()
    ccall((:isl_options_new_with_defaults, libisl), Ptr{isl_options}, ())
end

function isl_options_free(opt)
    ccall((:isl_options_free, libisl), Cvoid, (Ptr{isl_options},), opt)
end

function isl_options_parse(opt, argc, argv, flags)
    ccall((:isl_options_parse, libisl), Cint, (Ptr{isl_options}, Cint, Ptr{Ptr{Cchar}}, Cuint), opt, argc, argv, flags)
end

function isl_options_set_bound(ctx, val)
    ccall((:isl_options_set_bound, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_bound(ctx)
    ccall((:isl_options_get_bound, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_on_error(ctx, val)
    ccall((:isl_options_set_on_error, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_on_error(ctx)
    ccall((:isl_options_get_on_error, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_gbr_only_first(ctx, val)
    ccall((:isl_options_set_gbr_only_first, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_gbr_only_first(ctx)
    ccall((:isl_options_get_gbr_only_first, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_schedule_algorithm(ctx, val)
    ccall((:isl_options_set_schedule_algorithm, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_schedule_algorithm(ctx)
    ccall((:isl_options_get_schedule_algorithm, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_pip_symmetry(ctx, val)
    ccall((:isl_options_set_pip_symmetry, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_pip_symmetry(ctx)
    ccall((:isl_options_get_pip_symmetry, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_coalesce_bounded_wrapping(ctx, val)
    ccall((:isl_options_set_coalesce_bounded_wrapping, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_coalesce_bounded_wrapping(ctx)
    ccall((:isl_options_get_coalesce_bounded_wrapping, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_coalesce_preserve_locals(ctx, val)
    ccall((:isl_options_set_coalesce_preserve_locals, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_coalesce_preserve_locals(ctx)
    ccall((:isl_options_get_coalesce_preserve_locals, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_point_get_ctx(pnt)
    ccall((:isl_point_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_point},), pnt)
end

function isl_point_get_space(pnt)
    ccall((:isl_point_get_space, libisl), Ptr{isl_space}, (Ptr{isl_point},), pnt)
end

function isl_point_zero(space)
    ccall((:isl_point_zero, libisl), Ptr{isl_point}, (Ptr{isl_space},), space)
end

function isl_point_copy(pnt)
    ccall((:isl_point_copy, libisl), Ptr{isl_point}, (Ptr{isl_point},), pnt)
end

function isl_point_free(pnt)
    ccall((:isl_point_free, libisl), Ptr{isl_point}, (Ptr{isl_point},), pnt)
end

function isl_point_get_coordinate_val(pnt, type, pos)
    ccall((:isl_point_get_coordinate_val, libisl), Ptr{isl_val}, (Ptr{isl_point}, isl_dim_type, Cint), pnt, type, pos)
end

function isl_point_set_coordinate_val(pnt, type, pos, v)
    ccall((:isl_point_set_coordinate_val, libisl), Ptr{isl_point}, (Ptr{isl_point}, isl_dim_type, Cint, Ptr{isl_val}), pnt, type, pos, v)
end

function isl_point_add_ui(pnt, type, pos, val)
    ccall((:isl_point_add_ui, libisl), Ptr{isl_point}, (Ptr{isl_point}, isl_dim_type, Cint, Cuint), pnt, type, pos, val)
end

function isl_point_sub_ui(pnt, type, pos, val)
    ccall((:isl_point_sub_ui, libisl), Ptr{isl_point}, (Ptr{isl_point}, isl_dim_type, Cint, Cuint), pnt, type, pos, val)
end

function isl_point_void(space)
    ccall((:isl_point_void, libisl), Ptr{isl_point}, (Ptr{isl_space},), space)
end

function isl_point_is_void(pnt)
    ccall((:isl_point_is_void, libisl), isl_bool, (Ptr{isl_point},), pnt)
end

function isl_printer_print_point(printer, pnt)
    ccall((:isl_printer_print_point, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_point}), printer, pnt)
end

function isl_point_to_str(pnt)
    ccall((:isl_point_to_str, libisl), Ptr{Cchar}, (Ptr{isl_point},), pnt)
end

function isl_point_dump(pnt)
    ccall((:isl_point_dump, libisl), Cvoid, (Ptr{isl_point},), pnt)
end

function isl_qpolynomial_get_ctx(qp)
    ccall((:isl_qpolynomial_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_qpolynomial},), qp)
end

function isl_qpolynomial_get_domain_space(qp)
    ccall((:isl_qpolynomial_get_domain_space, libisl), Ptr{isl_space}, (Ptr{isl_qpolynomial},), qp)
end

function isl_qpolynomial_get_space(qp)
    ccall((:isl_qpolynomial_get_space, libisl), Ptr{isl_space}, (Ptr{isl_qpolynomial},), qp)
end

function isl_qpolynomial_dim(qp, type)
    ccall((:isl_qpolynomial_dim, libisl), isl_size, (Ptr{isl_qpolynomial}, isl_dim_type), qp, type)
end

function isl_qpolynomial_involves_dims(qp, type, first, n)
    ccall((:isl_qpolynomial_involves_dims, libisl), isl_bool, (Ptr{isl_qpolynomial}, isl_dim_type, Cuint, Cuint), qp, type, first, n)
end

function isl_qpolynomial_get_constant_val(qp)
    ccall((:isl_qpolynomial_get_constant_val, libisl), Ptr{isl_val}, (Ptr{isl_qpolynomial},), qp)
end

function isl_qpolynomial_set_dim_name(qp, type, pos, s)
    ccall((:isl_qpolynomial_set_dim_name, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial}, isl_dim_type, Cuint, Ptr{Cchar}), qp, type, pos, s)
end

function isl_qpolynomial_zero_on_domain(domain)
    ccall((:isl_qpolynomial_zero_on_domain, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_space},), domain)
end

function isl_qpolynomial_one_on_domain(domain)
    ccall((:isl_qpolynomial_one_on_domain, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_space},), domain)
end

function isl_qpolynomial_infty_on_domain(domain)
    ccall((:isl_qpolynomial_infty_on_domain, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_space},), domain)
end

function isl_qpolynomial_neginfty_on_domain(domain)
    ccall((:isl_qpolynomial_neginfty_on_domain, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_space},), domain)
end

function isl_qpolynomial_nan_on_domain(domain)
    ccall((:isl_qpolynomial_nan_on_domain, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_space},), domain)
end

function isl_qpolynomial_val_on_domain(space, val)
    ccall((:isl_qpolynomial_val_on_domain, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_space}, Ptr{isl_val}), space, val)
end

function isl_qpolynomial_var_on_domain(domain, type, pos)
    ccall((:isl_qpolynomial_var_on_domain, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_space}, isl_dim_type, Cuint), domain, type, pos)
end

function isl_qpolynomial_copy(qp)
    ccall((:isl_qpolynomial_copy, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial},), qp)
end

function isl_qpolynomial_free(qp)
    ccall((:isl_qpolynomial_free, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial},), qp)
end

function isl_qpolynomial_plain_is_equal(qp1, qp2)
    ccall((:isl_qpolynomial_plain_is_equal, libisl), isl_bool, (Ptr{isl_qpolynomial}, Ptr{isl_qpolynomial}), qp1, qp2)
end

function isl_qpolynomial_is_zero(qp)
    ccall((:isl_qpolynomial_is_zero, libisl), isl_bool, (Ptr{isl_qpolynomial},), qp)
end

function isl_qpolynomial_is_nan(qp)
    ccall((:isl_qpolynomial_is_nan, libisl), isl_bool, (Ptr{isl_qpolynomial},), qp)
end

function isl_qpolynomial_is_infty(qp)
    ccall((:isl_qpolynomial_is_infty, libisl), isl_bool, (Ptr{isl_qpolynomial},), qp)
end

function isl_qpolynomial_is_neginfty(qp)
    ccall((:isl_qpolynomial_is_neginfty, libisl), isl_bool, (Ptr{isl_qpolynomial},), qp)
end

function isl_qpolynomial_sgn(qp)
    ccall((:isl_qpolynomial_sgn, libisl), Cint, (Ptr{isl_qpolynomial},), qp)
end

function isl_qpolynomial_neg(qp)
    ccall((:isl_qpolynomial_neg, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial},), qp)
end

function isl_qpolynomial_add(qp1, qp2)
    ccall((:isl_qpolynomial_add, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial}, Ptr{isl_qpolynomial}), qp1, qp2)
end

function isl_qpolynomial_sub(qp1, qp2)
    ccall((:isl_qpolynomial_sub, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial}, Ptr{isl_qpolynomial}), qp1, qp2)
end

function isl_qpolynomial_mul(qp1, qp2)
    ccall((:isl_qpolynomial_mul, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial}, Ptr{isl_qpolynomial}), qp1, qp2)
end

function isl_qpolynomial_pow(qp, power)
    ccall((:isl_qpolynomial_pow, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial}, Cuint), qp, power)
end

function isl_qpolynomial_scale_val(qp, v)
    ccall((:isl_qpolynomial_scale_val, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial}, Ptr{isl_val}), qp, v)
end

function isl_qpolynomial_scale_down_val(qp, v)
    ccall((:isl_qpolynomial_scale_down_val, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial}, Ptr{isl_val}), qp, v)
end

function isl_qpolynomial_insert_dims(qp, type, first, n)
    ccall((:isl_qpolynomial_insert_dims, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial}, isl_dim_type, Cuint, Cuint), qp, type, first, n)
end

function isl_qpolynomial_add_dims(qp, type, n)
    ccall((:isl_qpolynomial_add_dims, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial}, isl_dim_type, Cuint), qp, type, n)
end

function isl_qpolynomial_move_dims(qp, dst_type, dst_pos, src_type, src_pos, n)
    ccall((:isl_qpolynomial_move_dims, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial}, isl_dim_type, Cuint, isl_dim_type, Cuint, Cuint), qp, dst_type, dst_pos, src_type, src_pos, n)
end

function isl_qpolynomial_project_domain_on_params(qp)
    ccall((:isl_qpolynomial_project_domain_on_params, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial},), qp)
end

function isl_qpolynomial_drop_dims(qp, type, first, n)
    ccall((:isl_qpolynomial_drop_dims, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial}, isl_dim_type, Cuint, Cuint), qp, type, first, n)
end

function isl_qpolynomial_substitute(qp, type, first, n, subs)
    ccall((:isl_qpolynomial_substitute, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial}, isl_dim_type, Cuint, Cuint, Ptr{Ptr{isl_qpolynomial}}), qp, type, first, n, subs)
end

function isl_qpolynomial_as_polynomial_on_domain(qp, bset, fn, user)
    ccall((:isl_qpolynomial_as_polynomial_on_domain, libisl), isl_stat, (Ptr{isl_qpolynomial}, Ptr{isl_basic_set}, Ptr{Cvoid}, Ptr{Cvoid}), qp, bset, fn, user)
end

function isl_qpolynomial_homogenize(poly)
    ccall((:isl_qpolynomial_homogenize, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial},), poly)
end

function isl_qpolynomial_align_params(qp, model)
    ccall((:isl_qpolynomial_align_params, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial}, Ptr{isl_space}), qp, model)
end

function isl_term_get_ctx(term)
    ccall((:isl_term_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_term},), term)
end

function isl_term_copy(term)
    ccall((:isl_term_copy, libisl), Ptr{isl_term}, (Ptr{isl_term},), term)
end

function isl_term_free(term)
    ccall((:isl_term_free, libisl), Ptr{isl_term}, (Ptr{isl_term},), term)
end

function isl_term_dim(term, type)
    ccall((:isl_term_dim, libisl), isl_size, (Ptr{isl_term}, isl_dim_type), term, type)
end

function isl_term_get_coefficient_val(term)
    ccall((:isl_term_get_coefficient_val, libisl), Ptr{isl_val}, (Ptr{isl_term},), term)
end

function isl_term_get_exp(term, type, pos)
    ccall((:isl_term_get_exp, libisl), isl_size, (Ptr{isl_term}, isl_dim_type, Cuint), term, type, pos)
end

function isl_term_get_div(term, pos)
    ccall((:isl_term_get_div, libisl), Ptr{isl_aff}, (Ptr{isl_term}, Cuint), term, pos)
end

function isl_qpolynomial_foreach_term(qp, fn, user)
    ccall((:isl_qpolynomial_foreach_term, libisl), isl_stat, (Ptr{isl_qpolynomial}, Ptr{Cvoid}, Ptr{Cvoid}), qp, fn, user)
end

function isl_qpolynomial_eval(qp, pnt)
    ccall((:isl_qpolynomial_eval, libisl), Ptr{isl_val}, (Ptr{isl_qpolynomial}, Ptr{isl_point}), qp, pnt)
end

function isl_qpolynomial_gist_params(qp, context)
    ccall((:isl_qpolynomial_gist_params, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial}, Ptr{isl_set}), qp, context)
end

function isl_qpolynomial_gist(qp, context)
    ccall((:isl_qpolynomial_gist, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_qpolynomial}, Ptr{isl_set}), qp, context)
end

function isl_qpolynomial_from_constraint(c, type, pos)
    ccall((:isl_qpolynomial_from_constraint, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_constraint}, isl_dim_type, Cuint), c, type, pos)
end

function isl_qpolynomial_from_term(term)
    ccall((:isl_qpolynomial_from_term, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_term},), term)
end

function isl_qpolynomial_from_aff(aff)
    ccall((:isl_qpolynomial_from_aff, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_aff},), aff)
end

function isl_basic_map_from_qpolynomial(qp)
    ccall((:isl_basic_map_from_qpolynomial, libisl), Ptr{isl_basic_map}, (Ptr{isl_qpolynomial},), qp)
end

function isl_printer_print_qpolynomial(p, qp)
    ccall((:isl_printer_print_qpolynomial, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_qpolynomial}), p, qp)
end

function isl_qpolynomial_print(qp, out, output_format)
    ccall((:isl_qpolynomial_print, libisl), Cvoid, (Ptr{isl_qpolynomial}, Ptr{Libc.FILE}, Cuint), qp, out, output_format)
end

function isl_qpolynomial_dump(qp)
    ccall((:isl_qpolynomial_dump, libisl), Cvoid, (Ptr{isl_qpolynomial},), qp)
end

function isl_pw_qpolynomial_get_ctx(pwqp)
    ccall((:isl_pw_qpolynomial_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_involves_nan(pwqp)
    ccall((:isl_pw_qpolynomial_involves_nan, libisl), isl_bool, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_plain_is_equal(pwqp1, pwqp2)
    ccall((:isl_pw_qpolynomial_plain_is_equal, libisl), isl_bool, (Ptr{isl_pw_qpolynomial}, Ptr{isl_pw_qpolynomial}), pwqp1, pwqp2)
end

function isl_pw_qpolynomial_zero(space)
    ccall((:isl_pw_qpolynomial_zero, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_space},), space)
end

function isl_pw_qpolynomial_alloc(set, qp)
    ccall((:isl_pw_qpolynomial_alloc, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_set}, Ptr{isl_qpolynomial}), set, qp)
end

function isl_pw_qpolynomial_from_qpolynomial(qp)
    ccall((:isl_pw_qpolynomial_from_qpolynomial, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_qpolynomial},), qp)
end

function isl_pw_qpolynomial_copy(pwqp)
    ccall((:isl_pw_qpolynomial_copy, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_free(pwqp)
    ccall((:isl_pw_qpolynomial_free, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_is_zero(pwqp)
    ccall((:isl_pw_qpolynomial_is_zero, libisl), isl_bool, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_get_domain_space(pwqp)
    ccall((:isl_pw_qpolynomial_get_domain_space, libisl), Ptr{isl_space}, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_get_space(pwqp)
    ccall((:isl_pw_qpolynomial_get_space, libisl), Ptr{isl_space}, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_reset_domain_space(pwqp, dim)
    ccall((:isl_pw_qpolynomial_reset_domain_space, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, Ptr{isl_space}), pwqp, dim)
end

function isl_pw_qpolynomial_dim(pwqp, type)
    ccall((:isl_pw_qpolynomial_dim, libisl), isl_size, (Ptr{isl_pw_qpolynomial}, isl_dim_type), pwqp, type)
end

function isl_pw_qpolynomial_involves_param_id(pwqp, id)
    ccall((:isl_pw_qpolynomial_involves_param_id, libisl), isl_bool, (Ptr{isl_pw_qpolynomial}, Ptr{isl_id}), pwqp, id)
end

function isl_pw_qpolynomial_involves_dims(pwqp, type, first, n)
    ccall((:isl_pw_qpolynomial_involves_dims, libisl), isl_bool, (Ptr{isl_pw_qpolynomial}, isl_dim_type, Cuint, Cuint), pwqp, type, first, n)
end

function isl_pw_qpolynomial_has_equal_space(pwqp1, pwqp2)
    ccall((:isl_pw_qpolynomial_has_equal_space, libisl), isl_bool, (Ptr{isl_pw_qpolynomial}, Ptr{isl_pw_qpolynomial}), pwqp1, pwqp2)
end

function isl_pw_qpolynomial_set_dim_name(pwqp, type, pos, s)
    ccall((:isl_pw_qpolynomial_set_dim_name, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, isl_dim_type, Cuint, Ptr{Cchar}), pwqp, type, pos, s)
end

function isl_pw_qpolynomial_find_dim_by_name(pwqp, type, name)
    ccall((:isl_pw_qpolynomial_find_dim_by_name, libisl), Cint, (Ptr{isl_pw_qpolynomial}, isl_dim_type, Ptr{Cchar}), pwqp, type, name)
end

function isl_pw_qpolynomial_reset_user(pwqp)
    ccall((:isl_pw_qpolynomial_reset_user, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_domain(pwqp)
    ccall((:isl_pw_qpolynomial_domain, libisl), Ptr{isl_set}, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_intersect_domain(pwpq, set)
    ccall((:isl_pw_qpolynomial_intersect_domain, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, Ptr{isl_set}), pwpq, set)
end

function isl_pw_qpolynomial_intersect_domain_wrapped_domain(pwpq, set)
    ccall((:isl_pw_qpolynomial_intersect_domain_wrapped_domain, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, Ptr{isl_set}), pwpq, set)
end

function isl_pw_qpolynomial_intersect_domain_wrapped_range(pwpq, set)
    ccall((:isl_pw_qpolynomial_intersect_domain_wrapped_range, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, Ptr{isl_set}), pwpq, set)
end

function isl_pw_qpolynomial_intersect_params(pwpq, set)
    ccall((:isl_pw_qpolynomial_intersect_params, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, Ptr{isl_set}), pwpq, set)
end

function isl_pw_qpolynomial_subtract_domain(pwpq, set)
    ccall((:isl_pw_qpolynomial_subtract_domain, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, Ptr{isl_set}), pwpq, set)
end

function isl_pw_qpolynomial_project_domain_on_params(pwqp)
    ccall((:isl_pw_qpolynomial_project_domain_on_params, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_from_range(pwqp)
    ccall((:isl_pw_qpolynomial_from_range, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_drop_dims(pwqp, type, first, n)
    ccall((:isl_pw_qpolynomial_drop_dims, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, isl_dim_type, Cuint, Cuint), pwqp, type, first, n)
end

function isl_pw_qpolynomial_split_dims(pwqp, type, first, n)
    ccall((:isl_pw_qpolynomial_split_dims, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, isl_dim_type, Cuint, Cuint), pwqp, type, first, n)
end

function isl_pw_qpolynomial_drop_unused_params(pwqp)
    ccall((:isl_pw_qpolynomial_drop_unused_params, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_add(pwqp1, pwqp2)
    ccall((:isl_pw_qpolynomial_add, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, Ptr{isl_pw_qpolynomial}), pwqp1, pwqp2)
end

function isl_pw_qpolynomial_sub(pwqp1, pwqp2)
    ccall((:isl_pw_qpolynomial_sub, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, Ptr{isl_pw_qpolynomial}), pwqp1, pwqp2)
end

function isl_pw_qpolynomial_add_disjoint(pwqp1, pwqp2)
    ccall((:isl_pw_qpolynomial_add_disjoint, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, Ptr{isl_pw_qpolynomial}), pwqp1, pwqp2)
end

function isl_pw_qpolynomial_neg(pwqp)
    ccall((:isl_pw_qpolynomial_neg, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_mul(pwqp1, pwqp2)
    ccall((:isl_pw_qpolynomial_mul, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, Ptr{isl_pw_qpolynomial}), pwqp1, pwqp2)
end

function isl_pw_qpolynomial_scale_val(pwqp, v)
    ccall((:isl_pw_qpolynomial_scale_val, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, Ptr{isl_val}), pwqp, v)
end

function isl_pw_qpolynomial_scale_down_val(pwqp, v)
    ccall((:isl_pw_qpolynomial_scale_down_val, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, Ptr{isl_val}), pwqp, v)
end

function isl_pw_qpolynomial_pow(pwqp, exponent)
    ccall((:isl_pw_qpolynomial_pow, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, Cuint), pwqp, exponent)
end

function isl_pw_qpolynomial_insert_dims(pwqp, type, first, n)
    ccall((:isl_pw_qpolynomial_insert_dims, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, isl_dim_type, Cuint, Cuint), pwqp, type, first, n)
end

function isl_pw_qpolynomial_add_dims(pwqp, type, n)
    ccall((:isl_pw_qpolynomial_add_dims, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, isl_dim_type, Cuint), pwqp, type, n)
end

function isl_pw_qpolynomial_move_dims(pwqp, dst_type, dst_pos, src_type, src_pos, n)
    ccall((:isl_pw_qpolynomial_move_dims, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, isl_dim_type, Cuint, isl_dim_type, Cuint, Cuint), pwqp, dst_type, dst_pos, src_type, src_pos, n)
end

function isl_pw_qpolynomial_fix_val(pwqp, type, n, v)
    ccall((:isl_pw_qpolynomial_fix_val, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, isl_dim_type, Cuint, Ptr{isl_val}), pwqp, type, n, v)
end

function isl_pw_qpolynomial_eval(pwqp, pnt)
    ccall((:isl_pw_qpolynomial_eval, libisl), Ptr{isl_val}, (Ptr{isl_pw_qpolynomial}, Ptr{isl_point}), pwqp, pnt)
end

function isl_pw_qpolynomial_max(pwqp)
    ccall((:isl_pw_qpolynomial_max, libisl), Ptr{isl_val}, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_min(pwqp)
    ccall((:isl_pw_qpolynomial_min, libisl), Ptr{isl_val}, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_n_piece(pwqp)
    ccall((:isl_pw_qpolynomial_n_piece, libisl), isl_size, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_foreach_piece(pwqp, fn, user)
    ccall((:isl_pw_qpolynomial_foreach_piece, libisl), isl_stat, (Ptr{isl_pw_qpolynomial}, Ptr{Cvoid}, Ptr{Cvoid}), pwqp, fn, user)
end

function isl_pw_qpolynomial_foreach_lifted_piece(pwqp, fn, user)
    ccall((:isl_pw_qpolynomial_foreach_lifted_piece, libisl), isl_stat, (Ptr{isl_pw_qpolynomial}, Ptr{Cvoid}, Ptr{Cvoid}), pwqp, fn, user)
end

function isl_pw_qpolynomial_isa_qpolynomial(pwqp)
    ccall((:isl_pw_qpolynomial_isa_qpolynomial, libisl), isl_bool, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_as_qpolynomial(pwqp)
    ccall((:isl_pw_qpolynomial_as_qpolynomial, libisl), Ptr{isl_qpolynomial}, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_from_pw_aff(pwaff)
    ccall((:isl_pw_qpolynomial_from_pw_aff, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_aff},), pwaff)
end

function isl_pw_qpolynomial_read_from_str(ctx, str)
    ccall((:isl_pw_qpolynomial_read_from_str, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_pw_qpolynomial_read_from_file(ctx, input)
    ccall((:isl_pw_qpolynomial_read_from_file, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_ctx}, Ptr{Libc.FILE}), ctx, input)
end

function isl_pw_qpolynomial_to_str(pwqp)
    ccall((:isl_pw_qpolynomial_to_str, libisl), Ptr{Cchar}, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_printer_print_pw_qpolynomial(p, pwqp)
    ccall((:isl_printer_print_pw_qpolynomial, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_pw_qpolynomial}), p, pwqp)
end

function isl_pw_qpolynomial_print(pwqp, out, output_format)
    ccall((:isl_pw_qpolynomial_print, libisl), Cvoid, (Ptr{isl_pw_qpolynomial}, Ptr{Libc.FILE}, Cuint), pwqp, out, output_format)
end

function isl_pw_qpolynomial_dump(pwqp)
    ccall((:isl_pw_qpolynomial_dump, libisl), Cvoid, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_coalesce(pwqp)
    ccall((:isl_pw_qpolynomial_coalesce, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_pw_qpolynomial_gist(pwqp, context)
    ccall((:isl_pw_qpolynomial_gist, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, Ptr{isl_set}), pwqp, context)
end

function isl_pw_qpolynomial_gist_params(pwqp, context)
    ccall((:isl_pw_qpolynomial_gist_params, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, Ptr{isl_set}), pwqp, context)
end

function isl_pw_qpolynomial_split_periods(pwqp, max_periods)
    ccall((:isl_pw_qpolynomial_split_periods, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, Cint), pwqp, max_periods)
end

function isl_basic_set_multiplicative_call(bset, fn)
    ccall((:isl_basic_set_multiplicative_call, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_basic_set}, Ptr{Cvoid}), bset, fn)
end

function isl_qpolynomial_fold_get_ctx(fold)
    ccall((:isl_qpolynomial_fold_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_qpolynomial_fold},), fold)
end

function isl_qpolynomial_fold_get_type(fold)
    ccall((:isl_qpolynomial_fold_get_type, libisl), isl_fold, (Ptr{isl_qpolynomial_fold},), fold)
end

function isl_qpolynomial_fold_empty(type, dim)
    ccall((:isl_qpolynomial_fold_empty, libisl), Ptr{isl_qpolynomial_fold}, (isl_fold, Ptr{isl_space}), type, dim)
end

function isl_qpolynomial_fold_alloc(type, qp)
    ccall((:isl_qpolynomial_fold_alloc, libisl), Ptr{isl_qpolynomial_fold}, (isl_fold, Ptr{isl_qpolynomial}), type, qp)
end

function isl_qpolynomial_fold_copy(fold)
    ccall((:isl_qpolynomial_fold_copy, libisl), Ptr{isl_qpolynomial_fold}, (Ptr{isl_qpolynomial_fold},), fold)
end

function isl_qpolynomial_fold_free(fold)
    ccall((:isl_qpolynomial_fold_free, libisl), Ptr{isl_qpolynomial_fold}, (Ptr{isl_qpolynomial_fold},), fold)
end

function isl_qpolynomial_fold_is_empty(fold)
    ccall((:isl_qpolynomial_fold_is_empty, libisl), isl_bool, (Ptr{isl_qpolynomial_fold},), fold)
end

function isl_qpolynomial_fold_is_nan(fold)
    ccall((:isl_qpolynomial_fold_is_nan, libisl), isl_bool, (Ptr{isl_qpolynomial_fold},), fold)
end

function isl_qpolynomial_fold_plain_is_equal(fold1, fold2)
    ccall((:isl_qpolynomial_fold_plain_is_equal, libisl), Cint, (Ptr{isl_qpolynomial_fold}, Ptr{isl_qpolynomial_fold}), fold1, fold2)
end

function isl_qpolynomial_fold_get_domain_space(fold)
    ccall((:isl_qpolynomial_fold_get_domain_space, libisl), Ptr{isl_space}, (Ptr{isl_qpolynomial_fold},), fold)
end

function isl_qpolynomial_fold_get_space(fold)
    ccall((:isl_qpolynomial_fold_get_space, libisl), Ptr{isl_space}, (Ptr{isl_qpolynomial_fold},), fold)
end

function isl_qpolynomial_fold_fold(fold1, fold2)
    ccall((:isl_qpolynomial_fold_fold, libisl), Ptr{isl_qpolynomial_fold}, (Ptr{isl_qpolynomial_fold}, Ptr{isl_qpolynomial_fold}), fold1, fold2)
end

function isl_qpolynomial_fold_scale_val(fold, v)
    ccall((:isl_qpolynomial_fold_scale_val, libisl), Ptr{isl_qpolynomial_fold}, (Ptr{isl_qpolynomial_fold}, Ptr{isl_val}), fold, v)
end

function isl_qpolynomial_fold_scale_down_val(fold, v)
    ccall((:isl_qpolynomial_fold_scale_down_val, libisl), Ptr{isl_qpolynomial_fold}, (Ptr{isl_qpolynomial_fold}, Ptr{isl_val}), fold, v)
end

function isl_qpolynomial_fold_move_dims(fold, dst_type, dst_pos, src_type, src_pos, n)
    ccall((:isl_qpolynomial_fold_move_dims, libisl), Ptr{isl_qpolynomial_fold}, (Ptr{isl_qpolynomial_fold}, isl_dim_type, Cuint, isl_dim_type, Cuint, Cuint), fold, dst_type, dst_pos, src_type, src_pos, n)
end

function isl_qpolynomial_fold_substitute(fold, type, first, n, subs)
    ccall((:isl_qpolynomial_fold_substitute, libisl), Ptr{isl_qpolynomial_fold}, (Ptr{isl_qpolynomial_fold}, isl_dim_type, Cuint, Cuint, Ptr{Ptr{isl_qpolynomial}}), fold, type, first, n, subs)
end

function isl_pw_qpolynomial_fold_fix_val(pwf, type, n, v)
    ccall((:isl_pw_qpolynomial_fold_fix_val, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold}, isl_dim_type, Cuint, Ptr{isl_val}), pwf, type, n, v)
end

function isl_qpolynomial_fold_eval(fold, pnt)
    ccall((:isl_qpolynomial_fold_eval, libisl), Ptr{isl_val}, (Ptr{isl_qpolynomial_fold}, Ptr{isl_point}), fold, pnt)
end

function isl_qpolynomial_fold_gist_params(fold, context)
    ccall((:isl_qpolynomial_fold_gist_params, libisl), Ptr{isl_qpolynomial_fold}, (Ptr{isl_qpolynomial_fold}, Ptr{isl_set}), fold, context)
end

function isl_qpolynomial_fold_gist(fold, context)
    ccall((:isl_qpolynomial_fold_gist, libisl), Ptr{isl_qpolynomial_fold}, (Ptr{isl_qpolynomial_fold}, Ptr{isl_set}), fold, context)
end

function isl_qpolynomial_fold_foreach_qpolynomial(fold, fn, user)
    ccall((:isl_qpolynomial_fold_foreach_qpolynomial, libisl), isl_stat, (Ptr{isl_qpolynomial_fold}, Ptr{Cvoid}, Ptr{Cvoid}), fold, fn, user)
end

function isl_printer_print_qpolynomial_fold(p, fold)
    ccall((:isl_printer_print_qpolynomial_fold, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_qpolynomial_fold}), p, fold)
end

function isl_qpolynomial_fold_print(fold, out, output_format)
    ccall((:isl_qpolynomial_fold_print, libisl), Cvoid, (Ptr{isl_qpolynomial_fold}, Ptr{Libc.FILE}, Cuint), fold, out, output_format)
end

function isl_qpolynomial_fold_dump(fold)
    ccall((:isl_qpolynomial_fold_dump, libisl), Cvoid, (Ptr{isl_qpolynomial_fold},), fold)
end

function isl_pw_qpolynomial_fold_get_ctx(pwf)
    ccall((:isl_pw_qpolynomial_fold_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_fold_get_type(pwf)
    ccall((:isl_pw_qpolynomial_fold_get_type, libisl), isl_fold, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_fold_involves_nan(pwf)
    ccall((:isl_pw_qpolynomial_fold_involves_nan, libisl), isl_bool, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_fold_plain_is_equal(pwf1, pwf2)
    ccall((:isl_pw_qpolynomial_fold_plain_is_equal, libisl), isl_bool, (Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_pw_qpolynomial_fold}), pwf1, pwf2)
end

function isl_pw_qpolynomial_fold_from_pw_qpolynomial(type, pwqp)
    ccall((:isl_pw_qpolynomial_fold_from_pw_qpolynomial, libisl), Ptr{isl_pw_qpolynomial_fold}, (isl_fold, Ptr{isl_pw_qpolynomial}), type, pwqp)
end

function isl_pw_qpolynomial_fold_alloc(type, set, fold)
    ccall((:isl_pw_qpolynomial_fold_alloc, libisl), Ptr{isl_pw_qpolynomial_fold}, (isl_fold, Ptr{isl_set}, Ptr{isl_qpolynomial_fold}), type, set, fold)
end

function isl_pw_qpolynomial_fold_from_qpolynomial_fold(fold)
    ccall((:isl_pw_qpolynomial_fold_from_qpolynomial_fold, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_qpolynomial_fold},), fold)
end

function isl_pw_qpolynomial_fold_copy(pwf)
    ccall((:isl_pw_qpolynomial_fold_copy, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_fold_free(pwf)
    ccall((:isl_pw_qpolynomial_fold_free, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_fold_is_zero(pwf)
    ccall((:isl_pw_qpolynomial_fold_is_zero, libisl), isl_bool, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_fold_get_domain_space(pwf)
    ccall((:isl_pw_qpolynomial_fold_get_domain_space, libisl), Ptr{isl_space}, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_fold_get_space(pwf)
    ccall((:isl_pw_qpolynomial_fold_get_space, libisl), Ptr{isl_space}, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_fold_reset_space(pwf, dim)
    ccall((:isl_pw_qpolynomial_fold_reset_space, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_space}), pwf, dim)
end

function isl_pw_qpolynomial_fold_dim(pwf, type)
    ccall((:isl_pw_qpolynomial_fold_dim, libisl), isl_size, (Ptr{isl_pw_qpolynomial_fold}, isl_dim_type), pwf, type)
end

function isl_pw_qpolynomial_fold_involves_param_id(pwf, id)
    ccall((:isl_pw_qpolynomial_fold_involves_param_id, libisl), isl_bool, (Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_id}), pwf, id)
end

function isl_pw_qpolynomial_fold_has_equal_space(pwf1, pwf2)
    ccall((:isl_pw_qpolynomial_fold_has_equal_space, libisl), isl_bool, (Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_pw_qpolynomial_fold}), pwf1, pwf2)
end

function isl_pw_qpolynomial_fold_size(pwf)
    ccall((:isl_pw_qpolynomial_fold_size, libisl), Csize_t, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_fold_zero(space, type)
    ccall((:isl_pw_qpolynomial_fold_zero, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_space}, isl_fold), space, type)
end

function isl_pw_qpolynomial_fold_set_dim_name(pwf, type, pos, s)
    ccall((:isl_pw_qpolynomial_fold_set_dim_name, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold}, isl_dim_type, Cuint, Ptr{Cchar}), pwf, type, pos, s)
end

function isl_pw_qpolynomial_fold_find_dim_by_name(pwf, type, name)
    ccall((:isl_pw_qpolynomial_fold_find_dim_by_name, libisl), Cint, (Ptr{isl_pw_qpolynomial_fold}, isl_dim_type, Ptr{Cchar}), pwf, type, name)
end

function isl_pw_qpolynomial_fold_reset_user(pwf)
    ccall((:isl_pw_qpolynomial_fold_reset_user, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_fold_domain(pwf)
    ccall((:isl_pw_qpolynomial_fold_domain, libisl), Ptr{isl_set}, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_fold_intersect_domain(pwf, set)
    ccall((:isl_pw_qpolynomial_fold_intersect_domain, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_set}), pwf, set)
end

function isl_pw_qpolynomial_fold_intersect_domain_wrapped_domain(pwf, set)
    ccall((:isl_pw_qpolynomial_fold_intersect_domain_wrapped_domain, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_set}), pwf, set)
end

function isl_pw_qpolynomial_fold_intersect_domain_wrapped_range(pwf, set)
    ccall((:isl_pw_qpolynomial_fold_intersect_domain_wrapped_range, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_set}), pwf, set)
end

function isl_pw_qpolynomial_fold_intersect_params(pwf, set)
    ccall((:isl_pw_qpolynomial_fold_intersect_params, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_set}), pwf, set)
end

function isl_pw_qpolynomial_fold_subtract_domain(pwf, set)
    ccall((:isl_pw_qpolynomial_fold_subtract_domain, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_set}), pwf, set)
end

function isl_pw_qpolynomial_fold_add(pwf1, pwf2)
    ccall((:isl_pw_qpolynomial_fold_add, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_pw_qpolynomial_fold}), pwf1, pwf2)
end

function isl_pw_qpolynomial_fold_fold(pwf1, pwf2)
    ccall((:isl_pw_qpolynomial_fold_fold, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_pw_qpolynomial_fold}), pwf1, pwf2)
end

function isl_pw_qpolynomial_fold_add_disjoint(pwf1, pwf2)
    ccall((:isl_pw_qpolynomial_fold_add_disjoint, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_pw_qpolynomial_fold}), pwf1, pwf2)
end

function isl_pw_qpolynomial_fold_scale_val(pwf, v)
    ccall((:isl_pw_qpolynomial_fold_scale_val, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_val}), pwf, v)
end

function isl_pw_qpolynomial_fold_scale_down_val(pwf, v)
    ccall((:isl_pw_qpolynomial_fold_scale_down_val, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_val}), pwf, v)
end

function isl_pw_qpolynomial_fold_project_domain_on_params(pwf)
    ccall((:isl_pw_qpolynomial_fold_project_domain_on_params, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_fold_from_range(pwf)
    ccall((:isl_pw_qpolynomial_fold_from_range, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_fold_drop_dims(pwf, type, first, n)
    ccall((:isl_pw_qpolynomial_fold_drop_dims, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold}, isl_dim_type, Cuint, Cuint), pwf, type, first, n)
end

function isl_pw_qpolynomial_fold_move_dims(pwf, dst_type, dst_pos, src_type, src_pos, n)
    ccall((:isl_pw_qpolynomial_fold_move_dims, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold}, isl_dim_type, Cuint, isl_dim_type, Cuint, Cuint), pwf, dst_type, dst_pos, src_type, src_pos, n)
end

function isl_pw_qpolynomial_fold_drop_unused_params(pwf)
    ccall((:isl_pw_qpolynomial_fold_drop_unused_params, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_fold_eval(pwf, pnt)
    ccall((:isl_pw_qpolynomial_fold_eval, libisl), Ptr{isl_val}, (Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_point}), pwf, pnt)
end

function isl_pw_qpolynomial_fold_n_piece(pwf)
    ccall((:isl_pw_qpolynomial_fold_n_piece, libisl), isl_size, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_fold_foreach_piece(pwf, fn, user)
    ccall((:isl_pw_qpolynomial_fold_foreach_piece, libisl), isl_stat, (Ptr{isl_pw_qpolynomial_fold}, Ptr{Cvoid}, Ptr{Cvoid}), pwf, fn, user)
end

function isl_pw_qpolynomial_fold_foreach_lifted_piece(pwf, fn, user)
    ccall((:isl_pw_qpolynomial_fold_foreach_lifted_piece, libisl), isl_stat, (Ptr{isl_pw_qpolynomial_fold}, Ptr{Cvoid}, Ptr{Cvoid}), pwf, fn, user)
end

function isl_pw_qpolynomial_fold_isa_qpolynomial_fold(pwf)
    ccall((:isl_pw_qpolynomial_fold_isa_qpolynomial_fold, libisl), isl_bool, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_fold_as_qpolynomial_fold(pwf)
    ccall((:isl_pw_qpolynomial_fold_as_qpolynomial_fold, libisl), Ptr{isl_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_printer_print_pw_qpolynomial_fold(p, pwf)
    ccall((:isl_printer_print_pw_qpolynomial_fold, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_pw_qpolynomial_fold}), p, pwf)
end

function isl_pw_qpolynomial_fold_print(pwf, out, output_format)
    ccall((:isl_pw_qpolynomial_fold_print, libisl), Cvoid, (Ptr{isl_pw_qpolynomial_fold}, Ptr{Libc.FILE}, Cuint), pwf, out, output_format)
end

function isl_pw_qpolynomial_fold_dump(pwf)
    ccall((:isl_pw_qpolynomial_fold_dump, libisl), Cvoid, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_fold_coalesce(pwf)
    ccall((:isl_pw_qpolynomial_fold_coalesce, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_fold_gist(pwf, context)
    ccall((:isl_pw_qpolynomial_fold_gist, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_set}), pwf, context)
end

function isl_pw_qpolynomial_fold_gist_params(pwf, context)
    ccall((:isl_pw_qpolynomial_fold_gist_params, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_set}), pwf, context)
end

function isl_pw_qpolynomial_fold_max(pwf)
    ccall((:isl_pw_qpolynomial_fold_max, libisl), Ptr{isl_val}, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_fold_min(pwf)
    ccall((:isl_pw_qpolynomial_fold_min, libisl), Ptr{isl_val}, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_pw_qpolynomial_bound(pwqp, type, tight)
    ccall((:isl_pw_qpolynomial_bound, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial}, isl_fold, Ptr{isl_bool}), pwqp, type, tight)
end

function isl_pw_qpolynomial_fold_bound(pwf, tight)
    ccall((:isl_pw_qpolynomial_fold_bound, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_bool}), pwf, tight)
end

function isl_set_apply_pw_qpolynomial_fold(set, pwf, tight)
    ccall((:isl_set_apply_pw_qpolynomial_fold, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_set}, Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_bool}), set, pwf, tight)
end

function isl_map_apply_pw_qpolynomial_fold(map, pwf, tight)
    ccall((:isl_map_apply_pw_qpolynomial_fold, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_map}, Ptr{isl_pw_qpolynomial_fold}, Ptr{isl_bool}), map, pwf, tight)
end

function isl_pw_qpolynomial_to_polynomial(pwqp, sign)
    ccall((:isl_pw_qpolynomial_to_polynomial, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial}, Cint), pwqp, sign)
end

function isl_union_pw_qpolynomial_get_ctx(upwqp)
    ccall((:isl_union_pw_qpolynomial_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_union_pw_qpolynomial},), upwqp)
end

function isl_union_pw_qpolynomial_dim(upwqp, type)
    ccall((:isl_union_pw_qpolynomial_dim, libisl), isl_size, (Ptr{isl_union_pw_qpolynomial}, isl_dim_type), upwqp, type)
end

function isl_union_pw_qpolynomial_involves_nan(upwqp)
    ccall((:isl_union_pw_qpolynomial_involves_nan, libisl), isl_bool, (Ptr{isl_union_pw_qpolynomial},), upwqp)
end

function isl_union_pw_qpolynomial_plain_is_equal(upwqp1, upwqp2)
    ccall((:isl_union_pw_qpolynomial_plain_is_equal, libisl), isl_bool, (Ptr{isl_union_pw_qpolynomial}, Ptr{isl_union_pw_qpolynomial}), upwqp1, upwqp2)
end

function isl_union_pw_qpolynomial_from_pw_qpolynomial(pwqp)
    ccall((:isl_union_pw_qpolynomial_from_pw_qpolynomial, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial},), pwqp)
end

function isl_union_pw_qpolynomial_zero_ctx(ctx)
    ccall((:isl_union_pw_qpolynomial_zero_ctx, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_ctx},), ctx)
end

function isl_union_pw_qpolynomial_zero_space(space)
    ccall((:isl_union_pw_qpolynomial_zero_space, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_space},), space)
end

function isl_union_pw_qpolynomial_zero(space)
    ccall((:isl_union_pw_qpolynomial_zero, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_space},), space)
end

function isl_union_pw_qpolynomial_add_pw_qpolynomial(upwqp, pwqp)
    ccall((:isl_union_pw_qpolynomial_add_pw_qpolynomial, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial}, Ptr{isl_pw_qpolynomial}), upwqp, pwqp)
end

function isl_union_pw_qpolynomial_copy(upwqp)
    ccall((:isl_union_pw_qpolynomial_copy, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial},), upwqp)
end

function isl_union_pw_qpolynomial_free(upwqp)
    ccall((:isl_union_pw_qpolynomial_free, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial},), upwqp)
end

function isl_union_pw_qpolynomial_read_from_str(ctx, str)
    ccall((:isl_union_pw_qpolynomial_read_from_str, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_union_pw_qpolynomial_to_str(upwqp)
    ccall((:isl_union_pw_qpolynomial_to_str, libisl), Ptr{Cchar}, (Ptr{isl_union_pw_qpolynomial},), upwqp)
end

function isl_union_pw_qpolynomial_neg(upwqp)
    ccall((:isl_union_pw_qpolynomial_neg, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial},), upwqp)
end

function isl_union_pw_qpolynomial_add(upwqp1, upwqp2)
    ccall((:isl_union_pw_qpolynomial_add, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial}, Ptr{isl_union_pw_qpolynomial}), upwqp1, upwqp2)
end

function isl_union_pw_qpolynomial_sub(upwqp1, upwqp2)
    ccall((:isl_union_pw_qpolynomial_sub, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial}, Ptr{isl_union_pw_qpolynomial}), upwqp1, upwqp2)
end

function isl_union_pw_qpolynomial_mul(upwqp1, upwqp2)
    ccall((:isl_union_pw_qpolynomial_mul, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial}, Ptr{isl_union_pw_qpolynomial}), upwqp1, upwqp2)
end

function isl_union_pw_qpolynomial_scale_val(upwqp, v)
    ccall((:isl_union_pw_qpolynomial_scale_val, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial}, Ptr{isl_val}), upwqp, v)
end

function isl_union_pw_qpolynomial_scale_down_val(upwqp, v)
    ccall((:isl_union_pw_qpolynomial_scale_down_val, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial}, Ptr{isl_val}), upwqp, v)
end

function isl_union_pw_qpolynomial_domain(upwqp)
    ccall((:isl_union_pw_qpolynomial_domain, libisl), Ptr{isl_union_set}, (Ptr{isl_union_pw_qpolynomial},), upwqp)
end

function isl_union_pw_qpolynomial_intersect_domain(upwpq, uset)
    ccall((:isl_union_pw_qpolynomial_intersect_domain, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial}, Ptr{isl_union_set}), upwpq, uset)
end

function isl_union_pw_qpolynomial_intersect_domain_wrapped_domain(upwpq, uset)
    ccall((:isl_union_pw_qpolynomial_intersect_domain_wrapped_domain, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial}, Ptr{isl_union_set}), upwpq, uset)
end

function isl_union_pw_qpolynomial_intersect_domain_wrapped_range(upwpq, uset)
    ccall((:isl_union_pw_qpolynomial_intersect_domain_wrapped_range, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial}, Ptr{isl_union_set}), upwpq, uset)
end

function isl_union_pw_qpolynomial_intersect_params(upwpq, set)
    ccall((:isl_union_pw_qpolynomial_intersect_params, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial}, Ptr{isl_set}), upwpq, set)
end

function isl_union_pw_qpolynomial_subtract_domain(upwpq, uset)
    ccall((:isl_union_pw_qpolynomial_subtract_domain, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial}, Ptr{isl_union_set}), upwpq, uset)
end

function isl_union_pw_qpolynomial_get_space(upwqp)
    ccall((:isl_union_pw_qpolynomial_get_space, libisl), Ptr{isl_space}, (Ptr{isl_union_pw_qpolynomial},), upwqp)
end

function isl_union_pw_qpolynomial_get_pw_qpolynomial_list(upwqp)
    ccall((:isl_union_pw_qpolynomial_get_pw_qpolynomial_list, libisl), Ptr{isl_pw_qpolynomial_list}, (Ptr{isl_union_pw_qpolynomial},), upwqp)
end

function isl_union_pw_qpolynomial_set_dim_name(upwqp, type, pos, s)
    ccall((:isl_union_pw_qpolynomial_set_dim_name, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial}, isl_dim_type, Cuint, Ptr{Cchar}), upwqp, type, pos, s)
end

function isl_union_pw_qpolynomial_find_dim_by_name(upwqp, type, name)
    ccall((:isl_union_pw_qpolynomial_find_dim_by_name, libisl), Cint, (Ptr{isl_union_pw_qpolynomial}, isl_dim_type, Ptr{Cchar}), upwqp, type, name)
end

function isl_union_pw_qpolynomial_drop_dims(upwqp, type, first, n)
    ccall((:isl_union_pw_qpolynomial_drop_dims, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial}, isl_dim_type, Cuint, Cuint), upwqp, type, first, n)
end

function isl_union_pw_qpolynomial_reset_user(upwqp)
    ccall((:isl_union_pw_qpolynomial_reset_user, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial},), upwqp)
end

function isl_union_pw_qpolynomial_eval(upwqp, pnt)
    ccall((:isl_union_pw_qpolynomial_eval, libisl), Ptr{isl_val}, (Ptr{isl_union_pw_qpolynomial}, Ptr{isl_point}), upwqp, pnt)
end

function isl_union_pw_qpolynomial_coalesce(upwqp)
    ccall((:isl_union_pw_qpolynomial_coalesce, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial},), upwqp)
end

function isl_union_pw_qpolynomial_gist(upwqp, context)
    ccall((:isl_union_pw_qpolynomial_gist, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial}, Ptr{isl_union_set}), upwqp, context)
end

function isl_union_pw_qpolynomial_gist_params(upwqp, context)
    ccall((:isl_union_pw_qpolynomial_gist_params, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial}, Ptr{isl_set}), upwqp, context)
end

function isl_union_pw_qpolynomial_align_params(upwqp, model)
    ccall((:isl_union_pw_qpolynomial_align_params, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial}, Ptr{isl_space}), upwqp, model)
end

function isl_union_pw_qpolynomial_n_pw_qpolynomial(upwqp)
    ccall((:isl_union_pw_qpolynomial_n_pw_qpolynomial, libisl), isl_size, (Ptr{isl_union_pw_qpolynomial},), upwqp)
end

function isl_union_pw_qpolynomial_foreach_pw_qpolynomial(upwqp, fn, user)
    ccall((:isl_union_pw_qpolynomial_foreach_pw_qpolynomial, libisl), isl_stat, (Ptr{isl_union_pw_qpolynomial}, Ptr{Cvoid}, Ptr{Cvoid}), upwqp, fn, user)
end

function isl_union_pw_qpolynomial_extract_pw_qpolynomial(upwqp, dim)
    ccall((:isl_union_pw_qpolynomial_extract_pw_qpolynomial, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial}, Ptr{isl_space}), upwqp, dim)
end

function isl_printer_print_union_pw_qpolynomial(p, upwqp)
    ccall((:isl_printer_print_union_pw_qpolynomial, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_union_pw_qpolynomial}), p, upwqp)
end

function isl_union_pw_qpolynomial_fold_get_ctx(upwf)
    ccall((:isl_union_pw_qpolynomial_fold_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_union_pw_qpolynomial_fold},), upwf)
end

function isl_union_pw_qpolynomial_fold_dim(upwf, type)
    ccall((:isl_union_pw_qpolynomial_fold_dim, libisl), isl_size, (Ptr{isl_union_pw_qpolynomial_fold}, isl_dim_type), upwf, type)
end

function isl_union_pw_qpolynomial_fold_involves_nan(upwf)
    ccall((:isl_union_pw_qpolynomial_fold_involves_nan, libisl), isl_bool, (Ptr{isl_union_pw_qpolynomial_fold},), upwf)
end

function isl_union_pw_qpolynomial_fold_plain_is_equal(upwf1, upwf2)
    ccall((:isl_union_pw_qpolynomial_fold_plain_is_equal, libisl), isl_bool, (Ptr{isl_union_pw_qpolynomial_fold}, Ptr{isl_union_pw_qpolynomial_fold}), upwf1, upwf2)
end

function isl_union_pw_qpolynomial_fold_from_pw_qpolynomial_fold(pwf)
    ccall((:isl_union_pw_qpolynomial_fold_from_pw_qpolynomial_fold, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold},), pwf)
end

function isl_union_pw_qpolynomial_fold_zero_ctx(ctx, type)
    ccall((:isl_union_pw_qpolynomial_fold_zero_ctx, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_ctx}, isl_fold), ctx, type)
end

function isl_union_pw_qpolynomial_fold_zero_space(space, type)
    ccall((:isl_union_pw_qpolynomial_fold_zero_space, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_space}, isl_fold), space, type)
end

function isl_union_pw_qpolynomial_fold_zero(space, type)
    ccall((:isl_union_pw_qpolynomial_fold_zero, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_space}, isl_fold), space, type)
end

function isl_union_pw_qpolynomial_fold_fold_pw_qpolynomial_fold(upwqp, pwqp)
    ccall((:isl_union_pw_qpolynomial_fold_fold_pw_qpolynomial_fold, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold}, Ptr{isl_pw_qpolynomial_fold}), upwqp, pwqp)
end

function isl_union_pw_qpolynomial_fold_free(upwf)
    ccall((:isl_union_pw_qpolynomial_fold_free, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold},), upwf)
end

function isl_union_pw_qpolynomial_fold_copy(upwf)
    ccall((:isl_union_pw_qpolynomial_fold_copy, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold},), upwf)
end

function isl_union_pw_qpolynomial_fold_fold(upwf1, upwf2)
    ccall((:isl_union_pw_qpolynomial_fold_fold, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold}, Ptr{isl_union_pw_qpolynomial_fold}), upwf1, upwf2)
end

function isl_union_pw_qpolynomial_fold_add_union_pw_qpolynomial(upwf, upwqp)
    ccall((:isl_union_pw_qpolynomial_fold_add_union_pw_qpolynomial, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold}, Ptr{isl_union_pw_qpolynomial}), upwf, upwqp)
end

function isl_union_pw_qpolynomial_fold_scale_val(upwf, v)
    ccall((:isl_union_pw_qpolynomial_fold_scale_val, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold}, Ptr{isl_val}), upwf, v)
end

function isl_union_pw_qpolynomial_fold_scale_down_val(upwf, v)
    ccall((:isl_union_pw_qpolynomial_fold_scale_down_val, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold}, Ptr{isl_val}), upwf, v)
end

function isl_union_pw_qpolynomial_fold_domain(upwf)
    ccall((:isl_union_pw_qpolynomial_fold_domain, libisl), Ptr{isl_union_set}, (Ptr{isl_union_pw_qpolynomial_fold},), upwf)
end

function isl_union_pw_qpolynomial_fold_intersect_domain(upwf, uset)
    ccall((:isl_union_pw_qpolynomial_fold_intersect_domain, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold}, Ptr{isl_union_set}), upwf, uset)
end

function isl_union_pw_qpolynomial_fold_intersect_domain_wrapped_domain(upwf, uset)
    ccall((:isl_union_pw_qpolynomial_fold_intersect_domain_wrapped_domain, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold}, Ptr{isl_union_set}), upwf, uset)
end

function isl_union_pw_qpolynomial_fold_intersect_domain_wrapped_range(upwf, uset)
    ccall((:isl_union_pw_qpolynomial_fold_intersect_domain_wrapped_range, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold}, Ptr{isl_union_set}), upwf, uset)
end

function isl_union_pw_qpolynomial_fold_intersect_params(upwf, set)
    ccall((:isl_union_pw_qpolynomial_fold_intersect_params, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold}, Ptr{isl_set}), upwf, set)
end

function isl_union_pw_qpolynomial_fold_subtract_domain(upwf, uset)
    ccall((:isl_union_pw_qpolynomial_fold_subtract_domain, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold}, Ptr{isl_union_set}), upwf, uset)
end

function isl_union_pw_qpolynomial_fold_get_type(upwf)
    ccall((:isl_union_pw_qpolynomial_fold_get_type, libisl), isl_fold, (Ptr{isl_union_pw_qpolynomial_fold},), upwf)
end

function isl_union_pw_qpolynomial_fold_get_space(upwf)
    ccall((:isl_union_pw_qpolynomial_fold_get_space, libisl), Ptr{isl_space}, (Ptr{isl_union_pw_qpolynomial_fold},), upwf)
end

function isl_union_pw_qpolynomial_fold_get_pw_qpolynomial_fold_list(upwf)
    ccall((:isl_union_pw_qpolynomial_fold_get_pw_qpolynomial_fold_list, libisl), Ptr{isl_pw_qpolynomial_fold_list}, (Ptr{isl_union_pw_qpolynomial_fold},), upwf)
end

function isl_union_pw_qpolynomial_fold_set_dim_name(upwf, type, pos, s)
    ccall((:isl_union_pw_qpolynomial_fold_set_dim_name, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold}, isl_dim_type, Cuint, Ptr{Cchar}), upwf, type, pos, s)
end

function isl_union_pw_qpolynomial_fold_find_dim_by_name(upwf, type, name)
    ccall((:isl_union_pw_qpolynomial_fold_find_dim_by_name, libisl), Cint, (Ptr{isl_union_pw_qpolynomial_fold}, isl_dim_type, Ptr{Cchar}), upwf, type, name)
end

function isl_union_pw_qpolynomial_fold_drop_dims(upwf, type, first, n)
    ccall((:isl_union_pw_qpolynomial_fold_drop_dims, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold}, isl_dim_type, Cuint, Cuint), upwf, type, first, n)
end

function isl_union_pw_qpolynomial_fold_reset_user(upwf)
    ccall((:isl_union_pw_qpolynomial_fold_reset_user, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold},), upwf)
end

function isl_union_pw_qpolynomial_fold_eval(upwf, pnt)
    ccall((:isl_union_pw_qpolynomial_fold_eval, libisl), Ptr{isl_val}, (Ptr{isl_union_pw_qpolynomial_fold}, Ptr{isl_point}), upwf, pnt)
end

function isl_union_pw_qpolynomial_fold_coalesce(upwf)
    ccall((:isl_union_pw_qpolynomial_fold_coalesce, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold},), upwf)
end

function isl_union_pw_qpolynomial_fold_gist(upwf, context)
    ccall((:isl_union_pw_qpolynomial_fold_gist, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold}, Ptr{isl_union_set}), upwf, context)
end

function isl_union_pw_qpolynomial_fold_gist_params(upwf, context)
    ccall((:isl_union_pw_qpolynomial_fold_gist_params, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold}, Ptr{isl_set}), upwf, context)
end

function isl_union_pw_qpolynomial_fold_align_params(upwf, model)
    ccall((:isl_union_pw_qpolynomial_fold_align_params, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold}, Ptr{isl_space}), upwf, model)
end

function isl_union_pw_qpolynomial_fold_n_pw_qpolynomial_fold(upwf)
    ccall((:isl_union_pw_qpolynomial_fold_n_pw_qpolynomial_fold, libisl), isl_size, (Ptr{isl_union_pw_qpolynomial_fold},), upwf)
end

function isl_union_pw_qpolynomial_fold_foreach_pw_qpolynomial_fold(upwf, fn, user)
    ccall((:isl_union_pw_qpolynomial_fold_foreach_pw_qpolynomial_fold, libisl), isl_stat, (Ptr{isl_union_pw_qpolynomial_fold}, Ptr{Cvoid}, Ptr{Cvoid}), upwf, fn, user)
end

function isl_union_pw_qpolynomial_fold_extract_pw_qpolynomial_fold(upwf, dim)
    ccall((:isl_union_pw_qpolynomial_fold_extract_pw_qpolynomial_fold, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial_fold}, Ptr{isl_space}), upwf, dim)
end

function isl_printer_print_union_pw_qpolynomial_fold(p, upwf)
    ccall((:isl_printer_print_union_pw_qpolynomial_fold, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_union_pw_qpolynomial_fold}), p, upwf)
end

function isl_union_pw_qpolynomial_bound(upwqp, type, tight)
    ccall((:isl_union_pw_qpolynomial_bound, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_pw_qpolynomial}, isl_fold, Ptr{isl_bool}), upwqp, type, tight)
end

function isl_union_set_apply_union_pw_qpolynomial_fold(uset, upwf, tight)
    ccall((:isl_union_set_apply_union_pw_qpolynomial_fold, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_set}, Ptr{isl_union_pw_qpolynomial_fold}, Ptr{isl_bool}), uset, upwf, tight)
end

function isl_union_map_apply_union_pw_qpolynomial_fold(umap, upwf, tight)
    ccall((:isl_union_map_apply_union_pw_qpolynomial_fold, libisl), Ptr{isl_union_pw_qpolynomial_fold}, (Ptr{isl_union_map}, Ptr{isl_union_pw_qpolynomial_fold}, Ptr{isl_bool}), umap, upwf, tight)
end

function isl_union_pw_qpolynomial_to_polynomial(upwqp, sign)
    ccall((:isl_union_pw_qpolynomial_to_polynomial, libisl), Ptr{isl_union_pw_qpolynomial}, (Ptr{isl_union_pw_qpolynomial}, Cint), upwqp, sign)
end

function isl_pw_qpolynomial_list_get_ctx(list)
    ccall((:isl_pw_qpolynomial_list_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_pw_qpolynomial_list},), list)
end

function isl_pw_qpolynomial_list_from_pw_qpolynomial(el)
    ccall((:isl_pw_qpolynomial_list_from_pw_qpolynomial, libisl), Ptr{isl_pw_qpolynomial_list}, (Ptr{isl_pw_qpolynomial},), el)
end

function isl_pw_qpolynomial_list_alloc(ctx, n)
    ccall((:isl_pw_qpolynomial_list_alloc, libisl), Ptr{isl_pw_qpolynomial_list}, (Ptr{isl_ctx}, Cint), ctx, n)
end

function isl_pw_qpolynomial_list_copy(list)
    ccall((:isl_pw_qpolynomial_list_copy, libisl), Ptr{isl_pw_qpolynomial_list}, (Ptr{isl_pw_qpolynomial_list},), list)
end

function isl_pw_qpolynomial_list_free(list)
    ccall((:isl_pw_qpolynomial_list_free, libisl), Ptr{isl_pw_qpolynomial_list}, (Ptr{isl_pw_qpolynomial_list},), list)
end

function isl_pw_qpolynomial_list_add(list, el)
    ccall((:isl_pw_qpolynomial_list_add, libisl), Ptr{isl_pw_qpolynomial_list}, (Ptr{isl_pw_qpolynomial_list}, Ptr{isl_pw_qpolynomial}), list, el)
end

function isl_pw_qpolynomial_list_insert(list, pos, el)
    ccall((:isl_pw_qpolynomial_list_insert, libisl), Ptr{isl_pw_qpolynomial_list}, (Ptr{isl_pw_qpolynomial_list}, Cuint, Ptr{isl_pw_qpolynomial}), list, pos, el)
end

function isl_pw_qpolynomial_list_drop(list, first, n)
    ccall((:isl_pw_qpolynomial_list_drop, libisl), Ptr{isl_pw_qpolynomial_list}, (Ptr{isl_pw_qpolynomial_list}, Cuint, Cuint), list, first, n)
end

function isl_pw_qpolynomial_list_clear(list)
    ccall((:isl_pw_qpolynomial_list_clear, libisl), Ptr{isl_pw_qpolynomial_list}, (Ptr{isl_pw_qpolynomial_list},), list)
end

function isl_pw_qpolynomial_list_swap(list, pos1, pos2)
    ccall((:isl_pw_qpolynomial_list_swap, libisl), Ptr{isl_pw_qpolynomial_list}, (Ptr{isl_pw_qpolynomial_list}, Cuint, Cuint), list, pos1, pos2)
end

function isl_pw_qpolynomial_list_reverse(list)
    ccall((:isl_pw_qpolynomial_list_reverse, libisl), Ptr{isl_pw_qpolynomial_list}, (Ptr{isl_pw_qpolynomial_list},), list)
end

function isl_pw_qpolynomial_list_concat(list1, list2)
    ccall((:isl_pw_qpolynomial_list_concat, libisl), Ptr{isl_pw_qpolynomial_list}, (Ptr{isl_pw_qpolynomial_list}, Ptr{isl_pw_qpolynomial_list}), list1, list2)
end

function isl_pw_qpolynomial_list_size(list)
    ccall((:isl_pw_qpolynomial_list_size, libisl), isl_size, (Ptr{isl_pw_qpolynomial_list},), list)
end

function isl_pw_qpolynomial_list_n_pw_qpolynomial(list)
    ccall((:isl_pw_qpolynomial_list_n_pw_qpolynomial, libisl), isl_size, (Ptr{isl_pw_qpolynomial_list},), list)
end

function isl_pw_qpolynomial_list_get_at(list, index)
    ccall((:isl_pw_qpolynomial_list_get_at, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial_list}, Cint), list, index)
end

function isl_pw_qpolynomial_list_get_pw_qpolynomial(list, index)
    ccall((:isl_pw_qpolynomial_list_get_pw_qpolynomial, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_pw_qpolynomial_list}, Cint), list, index)
end

function isl_pw_qpolynomial_list_set_pw_qpolynomial(list, index, el)
    ccall((:isl_pw_qpolynomial_list_set_pw_qpolynomial, libisl), Ptr{isl_pw_qpolynomial_list}, (Ptr{isl_pw_qpolynomial_list}, Cint, Ptr{isl_pw_qpolynomial}), list, index, el)
end

function isl_pw_qpolynomial_list_foreach(list, fn, user)
    ccall((:isl_pw_qpolynomial_list_foreach, libisl), isl_stat, (Ptr{isl_pw_qpolynomial_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_pw_qpolynomial_list_map(list, fn, user)
    ccall((:isl_pw_qpolynomial_list_map, libisl), Ptr{isl_pw_qpolynomial_list}, (Ptr{isl_pw_qpolynomial_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_pw_qpolynomial_list_sort(list, cmp, user)
    ccall((:isl_pw_qpolynomial_list_sort, libisl), Ptr{isl_pw_qpolynomial_list}, (Ptr{isl_pw_qpolynomial_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, cmp, user)
end

function isl_pw_qpolynomial_list_foreach_scc(list, follows, follows_user, fn, fn_user)
    ccall((:isl_pw_qpolynomial_list_foreach_scc, libisl), isl_stat, (Ptr{isl_pw_qpolynomial_list}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), list, follows, follows_user, fn, fn_user)
end

function isl_pw_qpolynomial_list_to_str(list)
    ccall((:isl_pw_qpolynomial_list_to_str, libisl), Ptr{Cchar}, (Ptr{isl_pw_qpolynomial_list},), list)
end

function isl_printer_print_pw_qpolynomial_list(p, list)
    ccall((:isl_printer_print_pw_qpolynomial_list, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_pw_qpolynomial_list}), p, list)
end

function isl_pw_qpolynomial_list_dump(list)
    ccall((:isl_pw_qpolynomial_list_dump, libisl), Cvoid, (Ptr{isl_pw_qpolynomial_list},), list)
end

function isl_pw_qpolynomial_fold_list_get_ctx(list)
    ccall((:isl_pw_qpolynomial_fold_list_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_pw_qpolynomial_fold_list},), list)
end

function isl_pw_qpolynomial_fold_list_from_pw_qpolynomial_fold(el)
    ccall((:isl_pw_qpolynomial_fold_list_from_pw_qpolynomial_fold, libisl), Ptr{isl_pw_qpolynomial_fold_list}, (Ptr{isl_pw_qpolynomial_fold},), el)
end

function isl_pw_qpolynomial_fold_list_alloc(ctx, n)
    ccall((:isl_pw_qpolynomial_fold_list_alloc, libisl), Ptr{isl_pw_qpolynomial_fold_list}, (Ptr{isl_ctx}, Cint), ctx, n)
end

function isl_pw_qpolynomial_fold_list_copy(list)
    ccall((:isl_pw_qpolynomial_fold_list_copy, libisl), Ptr{isl_pw_qpolynomial_fold_list}, (Ptr{isl_pw_qpolynomial_fold_list},), list)
end

function isl_pw_qpolynomial_fold_list_free(list)
    ccall((:isl_pw_qpolynomial_fold_list_free, libisl), Ptr{isl_pw_qpolynomial_fold_list}, (Ptr{isl_pw_qpolynomial_fold_list},), list)
end

function isl_pw_qpolynomial_fold_list_add(list, el)
    ccall((:isl_pw_qpolynomial_fold_list_add, libisl), Ptr{isl_pw_qpolynomial_fold_list}, (Ptr{isl_pw_qpolynomial_fold_list}, Ptr{isl_pw_qpolynomial_fold}), list, el)
end

function isl_pw_qpolynomial_fold_list_insert(list, pos, el)
    ccall((:isl_pw_qpolynomial_fold_list_insert, libisl), Ptr{isl_pw_qpolynomial_fold_list}, (Ptr{isl_pw_qpolynomial_fold_list}, Cuint, Ptr{isl_pw_qpolynomial_fold}), list, pos, el)
end

function isl_pw_qpolynomial_fold_list_drop(list, first, n)
    ccall((:isl_pw_qpolynomial_fold_list_drop, libisl), Ptr{isl_pw_qpolynomial_fold_list}, (Ptr{isl_pw_qpolynomial_fold_list}, Cuint, Cuint), list, first, n)
end

function isl_pw_qpolynomial_fold_list_clear(list)
    ccall((:isl_pw_qpolynomial_fold_list_clear, libisl), Ptr{isl_pw_qpolynomial_fold_list}, (Ptr{isl_pw_qpolynomial_fold_list},), list)
end

function isl_pw_qpolynomial_fold_list_swap(list, pos1, pos2)
    ccall((:isl_pw_qpolynomial_fold_list_swap, libisl), Ptr{isl_pw_qpolynomial_fold_list}, (Ptr{isl_pw_qpolynomial_fold_list}, Cuint, Cuint), list, pos1, pos2)
end

function isl_pw_qpolynomial_fold_list_reverse(list)
    ccall((:isl_pw_qpolynomial_fold_list_reverse, libisl), Ptr{isl_pw_qpolynomial_fold_list}, (Ptr{isl_pw_qpolynomial_fold_list},), list)
end

function isl_pw_qpolynomial_fold_list_concat(list1, list2)
    ccall((:isl_pw_qpolynomial_fold_list_concat, libisl), Ptr{isl_pw_qpolynomial_fold_list}, (Ptr{isl_pw_qpolynomial_fold_list}, Ptr{isl_pw_qpolynomial_fold_list}), list1, list2)
end

function isl_pw_qpolynomial_fold_list_size(list)
    ccall((:isl_pw_qpolynomial_fold_list_size, libisl), isl_size, (Ptr{isl_pw_qpolynomial_fold_list},), list)
end

function isl_pw_qpolynomial_fold_list_n_pw_qpolynomial_fold(list)
    ccall((:isl_pw_qpolynomial_fold_list_n_pw_qpolynomial_fold, libisl), isl_size, (Ptr{isl_pw_qpolynomial_fold_list},), list)
end

function isl_pw_qpolynomial_fold_list_get_at(list, index)
    ccall((:isl_pw_qpolynomial_fold_list_get_at, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold_list}, Cint), list, index)
end

function isl_pw_qpolynomial_fold_list_get_pw_qpolynomial_fold(list, index)
    ccall((:isl_pw_qpolynomial_fold_list_get_pw_qpolynomial_fold, libisl), Ptr{isl_pw_qpolynomial_fold}, (Ptr{isl_pw_qpolynomial_fold_list}, Cint), list, index)
end

function isl_pw_qpolynomial_fold_list_set_pw_qpolynomial_fold(list, index, el)
    ccall((:isl_pw_qpolynomial_fold_list_set_pw_qpolynomial_fold, libisl), Ptr{isl_pw_qpolynomial_fold_list}, (Ptr{isl_pw_qpolynomial_fold_list}, Cint, Ptr{isl_pw_qpolynomial_fold}), list, index, el)
end

function isl_pw_qpolynomial_fold_list_foreach(list, fn, user)
    ccall((:isl_pw_qpolynomial_fold_list_foreach, libisl), isl_stat, (Ptr{isl_pw_qpolynomial_fold_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_pw_qpolynomial_fold_list_map(list, fn, user)
    ccall((:isl_pw_qpolynomial_fold_list_map, libisl), Ptr{isl_pw_qpolynomial_fold_list}, (Ptr{isl_pw_qpolynomial_fold_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_pw_qpolynomial_fold_list_sort(list, cmp, user)
    ccall((:isl_pw_qpolynomial_fold_list_sort, libisl), Ptr{isl_pw_qpolynomial_fold_list}, (Ptr{isl_pw_qpolynomial_fold_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, cmp, user)
end

function isl_pw_qpolynomial_fold_list_foreach_scc(list, follows, follows_user, fn, fn_user)
    ccall((:isl_pw_qpolynomial_fold_list_foreach_scc, libisl), isl_stat, (Ptr{isl_pw_qpolynomial_fold_list}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), list, follows, follows_user, fn, fn_user)
end

function isl_pw_qpolynomial_fold_list_to_str(list)
    ccall((:isl_pw_qpolynomial_fold_list_to_str, libisl), Ptr{Cchar}, (Ptr{isl_pw_qpolynomial_fold_list},), list)
end

function isl_printer_print_pw_qpolynomial_fold_list(p, list)
    ccall((:isl_printer_print_pw_qpolynomial_fold_list, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_pw_qpolynomial_fold_list}), p, list)
end

function isl_pw_qpolynomial_fold_list_dump(list)
    ccall((:isl_pw_qpolynomial_fold_list_dump, libisl), Cvoid, (Ptr{isl_pw_qpolynomial_fold_list},), list)
end

function isl_printer_to_file(ctx, file)
    ccall((:isl_printer_to_file, libisl), Ptr{isl_printer}, (Ptr{isl_ctx}, Ptr{Libc.FILE}), ctx, file)
end

function isl_printer_to_str(ctx)
    ccall((:isl_printer_to_str, libisl), Ptr{isl_printer}, (Ptr{isl_ctx},), ctx)
end

function isl_printer_free(printer)
    ccall((:isl_printer_free, libisl), Ptr{isl_printer}, (Ptr{isl_printer},), printer)
end

function isl_printer_get_ctx(printer)
    ccall((:isl_printer_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_printer},), printer)
end

function isl_printer_get_file(printer)
    ccall((:isl_printer_get_file, libisl), Ptr{Libc.FILE}, (Ptr{isl_printer},), printer)
end

function isl_printer_get_str(printer)
    ccall((:isl_printer_get_str, libisl), Ptr{Cchar}, (Ptr{isl_printer},), printer)
end

function isl_printer_set_indent(p, indent)
    ccall((:isl_printer_set_indent, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Cint), p, indent)
end

function isl_printer_indent(p, indent)
    ccall((:isl_printer_indent, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Cint), p, indent)
end

function isl_printer_set_output_format(p, output_format)
    ccall((:isl_printer_set_output_format, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Cint), p, output_format)
end

function isl_printer_get_output_format(p)
    ccall((:isl_printer_get_output_format, libisl), Cint, (Ptr{isl_printer},), p)
end

function isl_printer_set_yaml_style(p, yaml_style)
    ccall((:isl_printer_set_yaml_style, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Cint), p, yaml_style)
end

function isl_printer_get_yaml_style(p)
    ccall((:isl_printer_get_yaml_style, libisl), Cint, (Ptr{isl_printer},), p)
end

function isl_printer_set_indent_prefix(p, prefix)
    ccall((:isl_printer_set_indent_prefix, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{Cchar}), p, prefix)
end

function isl_printer_set_prefix(p, prefix)
    ccall((:isl_printer_set_prefix, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{Cchar}), p, prefix)
end

function isl_printer_set_suffix(p, suffix)
    ccall((:isl_printer_set_suffix, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{Cchar}), p, suffix)
end

function isl_printer_set_isl_int_width(p, width)
    ccall((:isl_printer_set_isl_int_width, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Cint), p, width)
end

function isl_printer_has_note(p, id)
    ccall((:isl_printer_has_note, libisl), isl_bool, (Ptr{isl_printer}, Ptr{isl_id}), p, id)
end

function isl_printer_get_note(p, id)
    ccall((:isl_printer_get_note, libisl), Ptr{isl_id}, (Ptr{isl_printer}, Ptr{isl_id}), p, id)
end

function isl_printer_set_note(p, id, note)
    ccall((:isl_printer_set_note, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_id}, Ptr{isl_id}), p, id, note)
end

function isl_printer_start_line(p)
    ccall((:isl_printer_start_line, libisl), Ptr{isl_printer}, (Ptr{isl_printer},), p)
end

function isl_printer_end_line(p)
    ccall((:isl_printer_end_line, libisl), Ptr{isl_printer}, (Ptr{isl_printer},), p)
end

function isl_printer_print_double(p, d)
    ccall((:isl_printer_print_double, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Cdouble), p, d)
end

function isl_printer_print_int(p, i)
    ccall((:isl_printer_print_int, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Cint), p, i)
end

function isl_printer_print_str(p, s)
    ccall((:isl_printer_print_str, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{Cchar}), p, s)
end

function isl_printer_yaml_start_mapping(p)
    ccall((:isl_printer_yaml_start_mapping, libisl), Ptr{isl_printer}, (Ptr{isl_printer},), p)
end

function isl_printer_yaml_end_mapping(p)
    ccall((:isl_printer_yaml_end_mapping, libisl), Ptr{isl_printer}, (Ptr{isl_printer},), p)
end

function isl_printer_yaml_start_sequence(p)
    ccall((:isl_printer_yaml_start_sequence, libisl), Ptr{isl_printer}, (Ptr{isl_printer},), p)
end

function isl_printer_yaml_end_sequence(p)
    ccall((:isl_printer_yaml_end_sequence, libisl), Ptr{isl_printer}, (Ptr{isl_printer},), p)
end

function isl_printer_yaml_next(p)
    ccall((:isl_printer_yaml_next, libisl), Ptr{isl_printer}, (Ptr{isl_printer},), p)
end

function isl_printer_flush(p)
    ccall((:isl_printer_flush, libisl), Ptr{isl_printer}, (Ptr{isl_printer},), p)
end

mutable struct isl_schedule_constraints end

function isl_options_set_schedule_max_coefficient(ctx, val)
    ccall((:isl_options_set_schedule_max_coefficient, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_schedule_max_coefficient(ctx)
    ccall((:isl_options_get_schedule_max_coefficient, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_schedule_max_constant_term(ctx, val)
    ccall((:isl_options_set_schedule_max_constant_term, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_schedule_max_constant_term(ctx)
    ccall((:isl_options_get_schedule_max_constant_term, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_schedule_maximize_band_depth(ctx, val)
    ccall((:isl_options_set_schedule_maximize_band_depth, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_schedule_maximize_band_depth(ctx)
    ccall((:isl_options_get_schedule_maximize_band_depth, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_schedule_maximize_coincidence(ctx, val)
    ccall((:isl_options_set_schedule_maximize_coincidence, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_schedule_maximize_coincidence(ctx)
    ccall((:isl_options_get_schedule_maximize_coincidence, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_schedule_outer_coincidence(ctx, val)
    ccall((:isl_options_set_schedule_outer_coincidence, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_schedule_outer_coincidence(ctx)
    ccall((:isl_options_get_schedule_outer_coincidence, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_schedule_split_scaled(ctx, val)
    ccall((:isl_options_set_schedule_split_scaled, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_schedule_split_scaled(ctx)
    ccall((:isl_options_get_schedule_split_scaled, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_schedule_treat_coalescing(ctx, val)
    ccall((:isl_options_set_schedule_treat_coalescing, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_schedule_treat_coalescing(ctx)
    ccall((:isl_options_get_schedule_treat_coalescing, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_schedule_separate_components(ctx, val)
    ccall((:isl_options_set_schedule_separate_components, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_schedule_separate_components(ctx)
    ccall((:isl_options_get_schedule_separate_components, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_schedule_serialize_sccs(ctx, val)
    ccall((:isl_options_set_schedule_serialize_sccs, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_schedule_serialize_sccs(ctx)
    ccall((:isl_options_get_schedule_serialize_sccs, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_schedule_whole_component(ctx, val)
    ccall((:isl_options_set_schedule_whole_component, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_schedule_whole_component(ctx)
    ccall((:isl_options_get_schedule_whole_component, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_schedule_carry_self_first(ctx, val)
    ccall((:isl_options_set_schedule_carry_self_first, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_schedule_carry_self_first(ctx)
    ccall((:isl_options_get_schedule_carry_self_first, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_schedule_constraints_copy(sc)
    ccall((:isl_schedule_constraints_copy, libisl), Ptr{isl_schedule_constraints}, (Ptr{isl_schedule_constraints},), sc)
end

function isl_schedule_constraints_on_domain(domain)
    ccall((:isl_schedule_constraints_on_domain, libisl), Ptr{isl_schedule_constraints}, (Ptr{isl_union_set},), domain)
end

function isl_schedule_constraints_set_context(sc, context)
    ccall((:isl_schedule_constraints_set_context, libisl), Ptr{isl_schedule_constraints}, (Ptr{isl_schedule_constraints}, Ptr{isl_set}), sc, context)
end

function isl_schedule_constraints_set_validity(sc, validity)
    ccall((:isl_schedule_constraints_set_validity, libisl), Ptr{isl_schedule_constraints}, (Ptr{isl_schedule_constraints}, Ptr{isl_union_map}), sc, validity)
end

function isl_schedule_constraints_set_coincidence(sc, coincidence)
    ccall((:isl_schedule_constraints_set_coincidence, libisl), Ptr{isl_schedule_constraints}, (Ptr{isl_schedule_constraints}, Ptr{isl_union_map}), sc, coincidence)
end

function isl_schedule_constraints_set_proximity(sc, proximity)
    ccall((:isl_schedule_constraints_set_proximity, libisl), Ptr{isl_schedule_constraints}, (Ptr{isl_schedule_constraints}, Ptr{isl_union_map}), sc, proximity)
end

function isl_schedule_constraints_set_conditional_validity(sc, condition, validity)
    ccall((:isl_schedule_constraints_set_conditional_validity, libisl), Ptr{isl_schedule_constraints}, (Ptr{isl_schedule_constraints}, Ptr{isl_union_map}, Ptr{isl_union_map}), sc, condition, validity)
end

function isl_schedule_constraints_free(sc)
    ccall((:isl_schedule_constraints_free, libisl), Ptr{isl_schedule_constraints}, (Ptr{isl_schedule_constraints},), sc)
end

function isl_schedule_constraints_get_ctx(sc)
    ccall((:isl_schedule_constraints_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_schedule_constraints},), sc)
end

function isl_schedule_constraints_get_domain(sc)
    ccall((:isl_schedule_constraints_get_domain, libisl), Ptr{isl_union_set}, (Ptr{isl_schedule_constraints},), sc)
end

function isl_schedule_constraints_get_context(sc)
    ccall((:isl_schedule_constraints_get_context, libisl), Ptr{isl_set}, (Ptr{isl_schedule_constraints},), sc)
end

function isl_schedule_constraints_get_validity(sc)
    ccall((:isl_schedule_constraints_get_validity, libisl), Ptr{isl_union_map}, (Ptr{isl_schedule_constraints},), sc)
end

function isl_schedule_constraints_get_coincidence(sc)
    ccall((:isl_schedule_constraints_get_coincidence, libisl), Ptr{isl_union_map}, (Ptr{isl_schedule_constraints},), sc)
end

function isl_schedule_constraints_get_proximity(sc)
    ccall((:isl_schedule_constraints_get_proximity, libisl), Ptr{isl_union_map}, (Ptr{isl_schedule_constraints},), sc)
end

function isl_schedule_constraints_get_conditional_validity(sc)
    ccall((:isl_schedule_constraints_get_conditional_validity, libisl), Ptr{isl_union_map}, (Ptr{isl_schedule_constraints},), sc)
end

function isl_schedule_constraints_get_conditional_validity_condition(sc)
    ccall((:isl_schedule_constraints_get_conditional_validity_condition, libisl), Ptr{isl_union_map}, (Ptr{isl_schedule_constraints},), sc)
end

function isl_schedule_constraints_apply(sc, umap)
    ccall((:isl_schedule_constraints_apply, libisl), Ptr{isl_schedule_constraints}, (Ptr{isl_schedule_constraints}, Ptr{isl_union_map}), sc, umap)
end

function isl_schedule_constraints_read_from_str(ctx, str)
    ccall((:isl_schedule_constraints_read_from_str, libisl), Ptr{isl_schedule_constraints}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_schedule_constraints_read_from_file(ctx, input)
    ccall((:isl_schedule_constraints_read_from_file, libisl), Ptr{isl_schedule_constraints}, (Ptr{isl_ctx}, Ptr{Libc.FILE}), ctx, input)
end

function isl_printer_print_schedule_constraints(p, sc)
    ccall((:isl_printer_print_schedule_constraints, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_schedule_constraints}), p, sc)
end

function isl_schedule_constraints_dump(sc)
    ccall((:isl_schedule_constraints_dump, libisl), Cvoid, (Ptr{isl_schedule_constraints},), sc)
end

function isl_schedule_constraints_to_str(sc)
    ccall((:isl_schedule_constraints_to_str, libisl), Ptr{Cchar}, (Ptr{isl_schedule_constraints},), sc)
end

function isl_schedule_constraints_compute_schedule(sc)
    ccall((:isl_schedule_constraints_compute_schedule, libisl), Ptr{isl_schedule}, (Ptr{isl_schedule_constraints},), sc)
end

function isl_union_set_compute_schedule(domain, validity, proximity)
    ccall((:isl_union_set_compute_schedule, libisl), Ptr{isl_schedule}, (Ptr{isl_union_set}, Ptr{isl_union_map}, Ptr{isl_union_map}), domain, validity, proximity)
end

function isl_schedule_empty(space)
    ccall((:isl_schedule_empty, libisl), Ptr{isl_schedule}, (Ptr{isl_space},), space)
end

function isl_schedule_from_domain(domain)
    ccall((:isl_schedule_from_domain, libisl), Ptr{isl_schedule}, (Ptr{isl_union_set},), domain)
end

function isl_schedule_copy(sched)
    ccall((:isl_schedule_copy, libisl), Ptr{isl_schedule}, (Ptr{isl_schedule},), sched)
end

function isl_schedule_free(sched)
    ccall((:isl_schedule_free, libisl), Ptr{isl_schedule}, (Ptr{isl_schedule},), sched)
end

function isl_schedule_get_map(sched)
    ccall((:isl_schedule_get_map, libisl), Ptr{isl_union_map}, (Ptr{isl_schedule},), sched)
end

function isl_schedule_get_ctx(sched)
    ccall((:isl_schedule_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_schedule},), sched)
end

function isl_schedule_plain_is_equal(schedule1, schedule2)
    ccall((:isl_schedule_plain_is_equal, libisl), isl_bool, (Ptr{isl_schedule}, Ptr{isl_schedule}), schedule1, schedule2)
end

mutable struct isl_schedule_node end

function isl_schedule_get_root(schedule)
    ccall((:isl_schedule_get_root, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule},), schedule)
end

function isl_schedule_get_domain(schedule)
    ccall((:isl_schedule_get_domain, libisl), Ptr{isl_union_set}, (Ptr{isl_schedule},), schedule)
end

function isl_schedule_foreach_schedule_node_top_down(sched, fn, user)
    ccall((:isl_schedule_foreach_schedule_node_top_down, libisl), isl_stat, (Ptr{isl_schedule}, Ptr{Cvoid}, Ptr{Cvoid}), sched, fn, user)
end

function isl_schedule_map_schedule_node_bottom_up(schedule, fn, user)
    ccall((:isl_schedule_map_schedule_node_bottom_up, libisl), Ptr{isl_schedule}, (Ptr{isl_schedule}, Ptr{Cvoid}, Ptr{Cvoid}), schedule, fn, user)
end

function isl_schedule_insert_context(schedule, context)
    ccall((:isl_schedule_insert_context, libisl), Ptr{isl_schedule}, (Ptr{isl_schedule}, Ptr{isl_set}), schedule, context)
end

function isl_schedule_insert_partial_schedule(schedule, partial)
    ccall((:isl_schedule_insert_partial_schedule, libisl), Ptr{isl_schedule}, (Ptr{isl_schedule}, Ptr{isl_multi_union_pw_aff}), schedule, partial)
end

function isl_schedule_insert_guard(schedule, guard)
    ccall((:isl_schedule_insert_guard, libisl), Ptr{isl_schedule}, (Ptr{isl_schedule}, Ptr{isl_set}), schedule, guard)
end

function isl_schedule_sequence(schedule1, schedule2)
    ccall((:isl_schedule_sequence, libisl), Ptr{isl_schedule}, (Ptr{isl_schedule}, Ptr{isl_schedule}), schedule1, schedule2)
end

function isl_schedule_set(schedule1, schedule2)
    ccall((:isl_schedule_set, libisl), Ptr{isl_schedule}, (Ptr{isl_schedule}, Ptr{isl_schedule}), schedule1, schedule2)
end

function isl_schedule_intersect_domain(schedule, domain)
    ccall((:isl_schedule_intersect_domain, libisl), Ptr{isl_schedule}, (Ptr{isl_schedule}, Ptr{isl_union_set}), schedule, domain)
end

function isl_schedule_gist_domain_params(schedule, context)
    ccall((:isl_schedule_gist_domain_params, libisl), Ptr{isl_schedule}, (Ptr{isl_schedule}, Ptr{isl_set}), schedule, context)
end

function isl_schedule_reset_user(schedule)
    ccall((:isl_schedule_reset_user, libisl), Ptr{isl_schedule}, (Ptr{isl_schedule},), schedule)
end

function isl_schedule_align_params(schedule, space)
    ccall((:isl_schedule_align_params, libisl), Ptr{isl_schedule}, (Ptr{isl_schedule}, Ptr{isl_space}), schedule, space)
end

function isl_schedule_pullback_union_pw_multi_aff(schedule, upma)
    ccall((:isl_schedule_pullback_union_pw_multi_aff, libisl), Ptr{isl_schedule}, (Ptr{isl_schedule}, Ptr{isl_union_pw_multi_aff}), schedule, upma)
end

function isl_schedule_expand(schedule, contraction, expansion)
    ccall((:isl_schedule_expand, libisl), Ptr{isl_schedule}, (Ptr{isl_schedule}, Ptr{isl_union_pw_multi_aff}, Ptr{isl_schedule}), schedule, contraction, expansion)
end

function isl_schedule_read_from_file(ctx, input)
    ccall((:isl_schedule_read_from_file, libisl), Ptr{isl_schedule}, (Ptr{isl_ctx}, Ptr{Libc.FILE}), ctx, input)
end

function isl_schedule_read_from_str(ctx, str)
    ccall((:isl_schedule_read_from_str, libisl), Ptr{isl_schedule}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_printer_print_schedule(p, schedule)
    ccall((:isl_printer_print_schedule, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_schedule}), p, schedule)
end

function isl_schedule_dump(schedule)
    ccall((:isl_schedule_dump, libisl), Cvoid, (Ptr{isl_schedule},), schedule)
end

function isl_schedule_to_str(schedule)
    ccall((:isl_schedule_to_str, libisl), Ptr{Cchar}, (Ptr{isl_schedule},), schedule)
end

function isl_schedule_node_from_domain(domain)
    ccall((:isl_schedule_node_from_domain, libisl), Ptr{isl_schedule_node}, (Ptr{isl_union_set},), domain)
end

function isl_schedule_node_from_extension(extension)
    ccall((:isl_schedule_node_from_extension, libisl), Ptr{isl_schedule_node}, (Ptr{isl_union_map},), extension)
end

function isl_schedule_node_copy(node)
    ccall((:isl_schedule_node_copy, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_free(node)
    ccall((:isl_schedule_node_free, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_is_equal(node1, node2)
    ccall((:isl_schedule_node_is_equal, libisl), isl_bool, (Ptr{isl_schedule_node}, Ptr{isl_schedule_node}), node1, node2)
end

function isl_schedule_node_get_ctx(node)
    ccall((:isl_schedule_node_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_schedule_node},), node)
end

@cenum isl_schedule_node_type::Int32 begin
    isl_schedule_node_error = -1
    isl_schedule_node_band = 0
    isl_schedule_node_context = 1
    isl_schedule_node_domain = 2
    isl_schedule_node_expansion = 3
    isl_schedule_node_extension = 4
    isl_schedule_node_filter = 5
    isl_schedule_node_leaf = 6
    isl_schedule_node_guard = 7
    isl_schedule_node_mark = 8
    isl_schedule_node_sequence = 9
    isl_schedule_node_set = 10
end

function isl_schedule_node_get_type(node)
    ccall((:isl_schedule_node_get_type, libisl), isl_schedule_node_type, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_get_parent_type(node)
    ccall((:isl_schedule_node_get_parent_type, libisl), isl_schedule_node_type, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_get_schedule(node)
    ccall((:isl_schedule_node_get_schedule, libisl), Ptr{isl_schedule}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_foreach_descendant_top_down(node, fn, user)
    ccall((:isl_schedule_node_foreach_descendant_top_down, libisl), isl_stat, (Ptr{isl_schedule_node}, Ptr{Cvoid}, Ptr{Cvoid}), node, fn, user)
end

function isl_schedule_node_every_descendant(node, test, user)
    ccall((:isl_schedule_node_every_descendant, libisl), isl_bool, (Ptr{isl_schedule_node}, Ptr{Cvoid}, Ptr{Cvoid}), node, test, user)
end

function isl_schedule_node_foreach_ancestor_top_down(node, fn, user)
    ccall((:isl_schedule_node_foreach_ancestor_top_down, libisl), isl_stat, (Ptr{isl_schedule_node}, Ptr{Cvoid}, Ptr{Cvoid}), node, fn, user)
end

function isl_schedule_node_map_descendant_bottom_up(node, fn, user)
    ccall((:isl_schedule_node_map_descendant_bottom_up, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{Cvoid}, Ptr{Cvoid}), node, fn, user)
end

function isl_schedule_node_get_tree_depth(node)
    ccall((:isl_schedule_node_get_tree_depth, libisl), isl_size, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_has_parent(node)
    ccall((:isl_schedule_node_has_parent, libisl), isl_bool, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_has_children(node)
    ccall((:isl_schedule_node_has_children, libisl), isl_bool, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_has_previous_sibling(node)
    ccall((:isl_schedule_node_has_previous_sibling, libisl), isl_bool, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_has_next_sibling(node)
    ccall((:isl_schedule_node_has_next_sibling, libisl), isl_bool, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_n_children(node)
    ccall((:isl_schedule_node_n_children, libisl), isl_size, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_get_child_position(node)
    ccall((:isl_schedule_node_get_child_position, libisl), isl_size, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_get_ancestor_child_position(node, ancestor)
    ccall((:isl_schedule_node_get_ancestor_child_position, libisl), isl_size, (Ptr{isl_schedule_node}, Ptr{isl_schedule_node}), node, ancestor)
end

function isl_schedule_node_get_child(node, pos)
    ccall((:isl_schedule_node_get_child, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Cint), node, pos)
end

function isl_schedule_node_get_shared_ancestor(node1, node2)
    ccall((:isl_schedule_node_get_shared_ancestor, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{isl_schedule_node}), node1, node2)
end

function isl_schedule_node_root(node)
    ccall((:isl_schedule_node_root, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_parent(node)
    ccall((:isl_schedule_node_parent, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_ancestor(node, generation)
    ccall((:isl_schedule_node_ancestor, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Cint), node, generation)
end

function isl_schedule_node_child(node, pos)
    ccall((:isl_schedule_node_child, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Cint), node, pos)
end

function isl_schedule_node_first_child(node)
    ccall((:isl_schedule_node_first_child, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_previous_sibling(node)
    ccall((:isl_schedule_node_previous_sibling, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_next_sibling(node)
    ccall((:isl_schedule_node_next_sibling, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_is_subtree_anchored(node)
    ccall((:isl_schedule_node_is_subtree_anchored, libisl), isl_bool, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_group(node, group_id)
    ccall((:isl_schedule_node_group, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{isl_id}), node, group_id)
end

function isl_schedule_node_sequence_splice_child(node, pos)
    ccall((:isl_schedule_node_sequence_splice_child, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Cint), node, pos)
end

function isl_schedule_node_band_get_space(node)
    ccall((:isl_schedule_node_band_get_space, libisl), Ptr{isl_space}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_band_get_partial_schedule(node)
    ccall((:isl_schedule_node_band_get_partial_schedule, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_band_get_partial_schedule_union_map(node)
    ccall((:isl_schedule_node_band_get_partial_schedule_union_map, libisl), Ptr{isl_union_map}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_band_member_get_ast_loop_type(node, pos)
    ccall((:isl_schedule_node_band_member_get_ast_loop_type, libisl), isl_ast_loop_type, (Ptr{isl_schedule_node}, Cint), node, pos)
end

function isl_schedule_node_band_member_set_ast_loop_type(node, pos, type)
    ccall((:isl_schedule_node_band_member_set_ast_loop_type, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Cint, isl_ast_loop_type), node, pos, type)
end

function isl_schedule_node_band_member_get_isolate_ast_loop_type(node, pos)
    ccall((:isl_schedule_node_band_member_get_isolate_ast_loop_type, libisl), isl_ast_loop_type, (Ptr{isl_schedule_node}, Cint), node, pos)
end

function isl_schedule_node_band_member_set_isolate_ast_loop_type(node, pos, type)
    ccall((:isl_schedule_node_band_member_set_isolate_ast_loop_type, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Cint, isl_ast_loop_type), node, pos, type)
end

function isl_schedule_node_band_get_ast_build_options(node)
    ccall((:isl_schedule_node_band_get_ast_build_options, libisl), Ptr{isl_union_set}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_band_set_ast_build_options(node, options)
    ccall((:isl_schedule_node_band_set_ast_build_options, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{isl_union_set}), node, options)
end

function isl_schedule_node_band_get_ast_isolate_option()
    ccall((:isl_schedule_node_band_get_ast_isolate_option, libisl), Ptr{Cint}, ())
end

function isl_schedule_node_band_n_member(node)
    ccall((:isl_schedule_node_band_n_member, libisl), isl_size, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_band_member_get_coincident(node, pos)
    ccall((:isl_schedule_node_band_member_get_coincident, libisl), isl_bool, (Ptr{isl_schedule_node}, Cint), node, pos)
end

function isl_schedule_node_band_member_set_coincident(node, pos, coincident)
    ccall((:isl_schedule_node_band_member_set_coincident, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Cint, Cint), node, pos, coincident)
end

function isl_schedule_node_band_get_permutable(node)
    ccall((:isl_schedule_node_band_get_permutable, libisl), isl_bool, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_band_set_permutable(node, permutable)
    ccall((:isl_schedule_node_band_set_permutable, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Cint), node, permutable)
end

function isl_options_set_tile_scale_tile_loops(ctx, val)
    ccall((:isl_options_set_tile_scale_tile_loops, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_tile_scale_tile_loops(ctx)
    ccall((:isl_options_get_tile_scale_tile_loops, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_options_set_tile_shift_point_loops(ctx, val)
    ccall((:isl_options_set_tile_shift_point_loops, libisl), isl_stat, (Ptr{isl_ctx}, Cint), ctx, val)
end

function isl_options_get_tile_shift_point_loops(ctx)
    ccall((:isl_options_get_tile_shift_point_loops, libisl), Cint, (Ptr{isl_ctx},), ctx)
end

function isl_schedule_node_band_scale(node, mv)
    ccall((:isl_schedule_node_band_scale, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{isl_multi_val}), node, mv)
end

function isl_schedule_node_band_scale_down(node, mv)
    ccall((:isl_schedule_node_band_scale_down, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{isl_multi_val}), node, mv)
end

function isl_schedule_node_band_mod(node, mv)
    ccall((:isl_schedule_node_band_mod, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{isl_multi_val}), node, mv)
end

function isl_schedule_node_band_shift(node, shift)
    ccall((:isl_schedule_node_band_shift, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{isl_multi_union_pw_aff}), node, shift)
end

function isl_schedule_node_band_tile(node, sizes)
    ccall((:isl_schedule_node_band_tile, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{isl_multi_val}), node, sizes)
end

function isl_schedule_node_band_sink(node)
    ccall((:isl_schedule_node_band_sink, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_band_split(node, pos)
    ccall((:isl_schedule_node_band_split, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Cint), node, pos)
end

function isl_schedule_node_context_get_context()
    ccall((:isl_schedule_node_context_get_context, libisl), Ptr{Cint}, ())
end

function isl_schedule_node_domain_get_domain(node)
    ccall((:isl_schedule_node_domain_get_domain, libisl), Ptr{isl_union_set}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_expansion_get_expansion(node)
    ccall((:isl_schedule_node_expansion_get_expansion, libisl), Ptr{isl_union_map}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_expansion_get_contraction(node)
    ccall((:isl_schedule_node_expansion_get_contraction, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_extension_get_extension(node)
    ccall((:isl_schedule_node_extension_get_extension, libisl), Ptr{isl_union_map}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_filter_get_filter(node)
    ccall((:isl_schedule_node_filter_get_filter, libisl), Ptr{isl_union_set}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_guard_get_guard()
    ccall((:isl_schedule_node_guard_get_guard, libisl), Ptr{Cint}, ())
end

function isl_schedule_node_mark_get_id(node)
    ccall((:isl_schedule_node_mark_get_id, libisl), Ptr{isl_id}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_get_schedule_depth(node)
    ccall((:isl_schedule_node_get_schedule_depth, libisl), isl_size, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_get_domain(node)
    ccall((:isl_schedule_node_get_domain, libisl), Ptr{isl_union_set}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_get_universe_domain(node)
    ccall((:isl_schedule_node_get_universe_domain, libisl), Ptr{isl_union_set}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_get_prefix_schedule_multi_union_pw_aff(node)
    ccall((:isl_schedule_node_get_prefix_schedule_multi_union_pw_aff, libisl), Ptr{isl_multi_union_pw_aff}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_get_prefix_schedule_union_pw_multi_aff(node)
    ccall((:isl_schedule_node_get_prefix_schedule_union_pw_multi_aff, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_get_prefix_schedule_union_map(node)
    ccall((:isl_schedule_node_get_prefix_schedule_union_map, libisl), Ptr{isl_union_map}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_get_prefix_schedule_relation(node)
    ccall((:isl_schedule_node_get_prefix_schedule_relation, libisl), Ptr{isl_union_map}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_get_subtree_schedule_union_map(node)
    ccall((:isl_schedule_node_get_subtree_schedule_union_map, libisl), Ptr{isl_union_map}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_get_subtree_expansion(node)
    ccall((:isl_schedule_node_get_subtree_expansion, libisl), Ptr{isl_union_map}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_get_subtree_contraction(node)
    ccall((:isl_schedule_node_get_subtree_contraction, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_insert_context(node, context)
    ccall((:isl_schedule_node_insert_context, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{Cint}), node, context)
end

function isl_schedule_node_insert_partial_schedule(node, schedule)
    ccall((:isl_schedule_node_insert_partial_schedule, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{isl_multi_union_pw_aff}), node, schedule)
end

function isl_schedule_node_insert_filter(node, filter)
    ccall((:isl_schedule_node_insert_filter, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{isl_union_set}), node, filter)
end

function isl_schedule_node_insert_guard(node, context)
    ccall((:isl_schedule_node_insert_guard, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{Cint}), node, context)
end

function isl_schedule_node_insert_mark(node, mark)
    ccall((:isl_schedule_node_insert_mark, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{isl_id}), node, mark)
end

mutable struct isl_union_set_list end

function isl_schedule_node_insert_sequence(node, filters)
    ccall((:isl_schedule_node_insert_sequence, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{isl_union_set_list}), node, filters)
end

function isl_schedule_node_insert_set(node, filters)
    ccall((:isl_schedule_node_insert_set, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{isl_union_set_list}), node, filters)
end

function isl_schedule_node_cut(node)
    ccall((:isl_schedule_node_cut, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_delete(node)
    ccall((:isl_schedule_node_delete, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_order_before(node, filter)
    ccall((:isl_schedule_node_order_before, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{isl_union_set}), node, filter)
end

function isl_schedule_node_order_after(node, filter)
    ccall((:isl_schedule_node_order_after, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{isl_union_set}), node, filter)
end

function isl_schedule_node_graft_before(node, graft)
    ccall((:isl_schedule_node_graft_before, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{isl_schedule_node}), node, graft)
end

function isl_schedule_node_graft_after(node, graft)
    ccall((:isl_schedule_node_graft_after, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{isl_schedule_node}), node, graft)
end

function isl_schedule_node_reset_user(node)
    ccall((:isl_schedule_node_reset_user, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_align_params(node, space)
    ccall((:isl_schedule_node_align_params, libisl), Ptr{isl_schedule_node}, (Ptr{isl_schedule_node}, Ptr{isl_space}), node, space)
end

function isl_printer_print_schedule_node(p, node)
    ccall((:isl_printer_print_schedule_node, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_schedule_node}), p, node)
end

function isl_schedule_node_dump(node)
    ccall((:isl_schedule_node_dump, libisl), Cvoid, (Ptr{isl_schedule_node},), node)
end

function isl_schedule_node_to_str(node)
    ccall((:isl_schedule_node_to_str, libisl), Ptr{Cchar}, (Ptr{isl_schedule_node},), node)
end

function isl_basic_set_n_dim(bset)
    ccall((:isl_basic_set_n_dim, libisl), isl_size, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_n_param(bset)
    ccall((:isl_basic_set_n_param, libisl), isl_size, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_total_dim(bset)
    ccall((:isl_basic_set_total_dim, libisl), isl_size, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_dim(bset, type)
    ccall((:isl_basic_set_dim, libisl), isl_size, (Ptr{isl_basic_set}, isl_dim_type), bset, type)
end

function isl_set_n_dim(set)
    ccall((:isl_set_n_dim, libisl), isl_size, (Ptr{isl_set},), set)
end

function isl_set_n_param(set)
    ccall((:isl_set_n_param, libisl), isl_size, (Ptr{isl_set},), set)
end

function isl_set_dim(set, type)
    ccall((:isl_set_dim, libisl), isl_size, (Ptr{isl_set}, isl_dim_type), set, type)
end

function isl_basic_set_get_ctx(bset)
    ccall((:isl_basic_set_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_basic_set},), bset)
end

function isl_set_get_ctx(set)
    ccall((:isl_set_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_set},), set)
end

function isl_basic_set_get_space(bset)
    ccall((:isl_basic_set_get_space, libisl), Ptr{isl_space}, (Ptr{isl_basic_set},), bset)
end

function isl_set_get_space(set)
    ccall((:isl_set_get_space, libisl), Ptr{isl_space}, (Ptr{isl_set},), set)
end

function isl_set_reset_space(set, dim)
    ccall((:isl_set_reset_space, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_space}), set, dim)
end

function isl_basic_set_get_div(bset, pos)
    ccall((:isl_basic_set_get_div, libisl), Ptr{isl_aff}, (Ptr{isl_basic_set}, Cint), bset, pos)
end

function isl_basic_set_get_local_space(bset)
    ccall((:isl_basic_set_get_local_space, libisl), Ptr{isl_local_space}, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_get_tuple_name(bset)
    ccall((:isl_basic_set_get_tuple_name, libisl), Ptr{Cchar}, (Ptr{isl_basic_set},), bset)
end

function isl_set_has_tuple_name(set)
    ccall((:isl_set_has_tuple_name, libisl), isl_bool, (Ptr{isl_set},), set)
end

function isl_set_get_tuple_name(set)
    ccall((:isl_set_get_tuple_name, libisl), Ptr{Cchar}, (Ptr{isl_set},), set)
end

function isl_basic_set_set_tuple_name(set, s)
    ccall((:isl_basic_set_set_tuple_name, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, Ptr{Cchar}), set, s)
end

function isl_set_set_tuple_name(set, s)
    ccall((:isl_set_set_tuple_name, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{Cchar}), set, s)
end

function isl_basic_set_get_dim_name(bset, type, pos)
    ccall((:isl_basic_set_get_dim_name, libisl), Ptr{Cchar}, (Ptr{isl_basic_set}, isl_dim_type, Cuint), bset, type, pos)
end

function isl_basic_set_set_dim_name(bset, type, pos, s)
    ccall((:isl_basic_set_set_dim_name, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, isl_dim_type, Cuint, Ptr{Cchar}), bset, type, pos, s)
end

function isl_set_has_dim_name(set, type, pos)
    ccall((:isl_set_has_dim_name, libisl), isl_bool, (Ptr{isl_set}, isl_dim_type, Cuint), set, type, pos)
end

function isl_set_get_dim_name(set, type, pos)
    ccall((:isl_set_get_dim_name, libisl), Ptr{Cchar}, (Ptr{isl_set}, isl_dim_type, Cuint), set, type, pos)
end

function isl_set_set_dim_name(set, type, pos, s)
    ccall((:isl_set_set_dim_name, libisl), Ptr{isl_set}, (Ptr{isl_set}, isl_dim_type, Cuint, Ptr{Cchar}), set, type, pos, s)
end

function isl_basic_set_get_dim_id(bset, type, pos)
    ccall((:isl_basic_set_get_dim_id, libisl), Ptr{isl_id}, (Ptr{isl_basic_set}, isl_dim_type, Cuint), bset, type, pos)
end

function isl_basic_set_set_tuple_id(bset, id)
    ccall((:isl_basic_set_set_tuple_id, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, Ptr{isl_id}), bset, id)
end

function isl_set_set_dim_id(set, type, pos, id)
    ccall((:isl_set_set_dim_id, libisl), Ptr{isl_set}, (Ptr{isl_set}, isl_dim_type, Cuint, Ptr{isl_id}), set, type, pos, id)
end

function isl_set_has_dim_id(set, type, pos)
    ccall((:isl_set_has_dim_id, libisl), isl_bool, (Ptr{isl_set}, isl_dim_type, Cuint), set, type, pos)
end

function isl_set_get_dim_id(set, type, pos)
    ccall((:isl_set_get_dim_id, libisl), Ptr{isl_id}, (Ptr{isl_set}, isl_dim_type, Cuint), set, type, pos)
end

function isl_set_set_tuple_id(set, id)
    ccall((:isl_set_set_tuple_id, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_id}), set, id)
end

function isl_set_reset_tuple_id(set)
    ccall((:isl_set_reset_tuple_id, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_set_has_tuple_id(set)
    ccall((:isl_set_has_tuple_id, libisl), isl_bool, (Ptr{isl_set},), set)
end

function isl_set_get_tuple_id(set)
    ccall((:isl_set_get_tuple_id, libisl), Ptr{isl_id}, (Ptr{isl_set},), set)
end

function isl_set_reset_user(set)
    ccall((:isl_set_reset_user, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_set_find_dim_by_id(set, type, id)
    ccall((:isl_set_find_dim_by_id, libisl), Cint, (Ptr{isl_set}, isl_dim_type, Ptr{isl_id}), set, type, id)
end

function isl_set_find_dim_by_name(set, type, name)
    ccall((:isl_set_find_dim_by_name, libisl), Cint, (Ptr{isl_set}, isl_dim_type, Ptr{Cchar}), set, type, name)
end

function isl_basic_set_is_rational(bset)
    ccall((:isl_basic_set_is_rational, libisl), Cint, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_free(bset)
    ccall((:isl_basic_set_free, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_copy(bset)
    ccall((:isl_basic_set_copy, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_empty(space)
    ccall((:isl_basic_set_empty, libisl), Ptr{isl_basic_set}, (Ptr{isl_space},), space)
end

function isl_basic_set_universe(space)
    ccall((:isl_basic_set_universe, libisl), Ptr{isl_basic_set}, (Ptr{isl_space},), space)
end

function isl_basic_set_nat_universe(space)
    ccall((:isl_basic_set_nat_universe, libisl), Ptr{isl_basic_set}, (Ptr{isl_space},), space)
end

function isl_basic_set_positive_orthant(space)
    ccall((:isl_basic_set_positive_orthant, libisl), Ptr{isl_basic_set}, (Ptr{isl_space},), space)
end

function isl_basic_set_print_internal(bset, out, indent)
    ccall((:isl_basic_set_print_internal, libisl), Cvoid, (Ptr{isl_basic_set}, Ptr{Libc.FILE}, Cint), bset, out, indent)
end

function isl_basic_set_intersect(bset1, bset2)
    ccall((:isl_basic_set_intersect, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, Ptr{isl_basic_set}), bset1, bset2)
end

function isl_basic_set_intersect_params(bset1, bset2)
    ccall((:isl_basic_set_intersect_params, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, Ptr{isl_basic_set}), bset1, bset2)
end

function isl_basic_set_apply(bset, bmap)
    ccall((:isl_basic_set_apply, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, Ptr{isl_basic_map}), bset, bmap)
end

function isl_basic_set_preimage_multi_aff(bset, ma)
    ccall((:isl_basic_set_preimage_multi_aff, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, Ptr{isl_multi_aff}), bset, ma)
end

function isl_basic_set_affine_hull(bset)
    ccall((:isl_basic_set_affine_hull, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_remove_dims(bset, type, first, n)
    ccall((:isl_basic_set_remove_dims, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, isl_dim_type, Cuint, Cuint), bset, type, first, n)
end

function isl_basic_set_sample(bset)
    ccall((:isl_basic_set_sample, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_detect_equalities(bset)
    ccall((:isl_basic_set_detect_equalities, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_remove_redundancies(bset)
    ccall((:isl_basic_set_remove_redundancies, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set},), bset)
end

function isl_set_remove_redundancies(set)
    ccall((:isl_set_remove_redundancies, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_basic_set_list_intersect(list)
    ccall((:isl_basic_set_list_intersect, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set_list},), list)
end

function isl_set_list_union(list)
    ccall((:isl_set_list_union, libisl), Ptr{isl_set}, (Ptr{isl_set_list},), list)
end

function isl_basic_set_read_from_file(ctx, input)
    ccall((:isl_basic_set_read_from_file, libisl), Ptr{isl_basic_set}, (Ptr{isl_ctx}, Ptr{Libc.FILE}), ctx, input)
end

function isl_basic_set_read_from_str(ctx, str)
    ccall((:isl_basic_set_read_from_str, libisl), Ptr{isl_basic_set}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_set_read_from_file(ctx, input)
    ccall((:isl_set_read_from_file, libisl), Ptr{isl_set}, (Ptr{isl_ctx}, Ptr{Libc.FILE}), ctx, input)
end

function isl_set_read_from_str(ctx, str)
    ccall((:isl_set_read_from_str, libisl), Ptr{isl_set}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_basic_set_dump(bset)
    ccall((:isl_basic_set_dump, libisl), Cvoid, (Ptr{isl_basic_set},), bset)
end

function isl_set_dump(set)
    ccall((:isl_set_dump, libisl), Cvoid, (Ptr{isl_set},), set)
end

function isl_printer_print_basic_set(printer, bset)
    ccall((:isl_printer_print_basic_set, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_basic_set}), printer, bset)
end

function isl_printer_print_set(printer, map)
    ccall((:isl_printer_print_set, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_set}), printer, map)
end

function isl_basic_set_fix_si(bset, type, pos, value)
    ccall((:isl_basic_set_fix_si, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, isl_dim_type, Cuint, Cint), bset, type, pos, value)
end

function isl_basic_set_fix_val(bset, type, pos, v)
    ccall((:isl_basic_set_fix_val, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, isl_dim_type, Cuint, Ptr{isl_val}), bset, type, pos, v)
end

function isl_set_fix_si(set, type, pos, value)
    ccall((:isl_set_fix_si, libisl), Ptr{isl_set}, (Ptr{isl_set}, isl_dim_type, Cuint, Cint), set, type, pos, value)
end

function isl_set_lower_bound_si(set, type, pos, value)
    ccall((:isl_set_lower_bound_si, libisl), Ptr{isl_set}, (Ptr{isl_set}, isl_dim_type, Cuint, Cint), set, type, pos, value)
end

function isl_basic_set_lower_bound_val(bset, type, pos, value)
    ccall((:isl_basic_set_lower_bound_val, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, isl_dim_type, Cuint, Ptr{isl_val}), bset, type, pos, value)
end

function isl_set_lower_bound_val(set, type, pos, value)
    ccall((:isl_set_lower_bound_val, libisl), Ptr{isl_set}, (Ptr{isl_set}, isl_dim_type, Cuint, Ptr{isl_val}), set, type, pos, value)
end

function isl_set_upper_bound_si(set, type, pos, value)
    ccall((:isl_set_upper_bound_si, libisl), Ptr{isl_set}, (Ptr{isl_set}, isl_dim_type, Cuint, Cint), set, type, pos, value)
end

function isl_basic_set_upper_bound_val(bset, type, pos, value)
    ccall((:isl_basic_set_upper_bound_val, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, isl_dim_type, Cuint, Ptr{isl_val}), bset, type, pos, value)
end

function isl_set_upper_bound_val(set, type, pos, value)
    ccall((:isl_set_upper_bound_val, libisl), Ptr{isl_set}, (Ptr{isl_set}, isl_dim_type, Cuint, Ptr{isl_val}), set, type, pos, value)
end

function isl_set_equate(set, type1, pos1, type2, pos2)
    ccall((:isl_set_equate, libisl), Ptr{isl_set}, (Ptr{isl_set}, isl_dim_type, Cint, isl_dim_type, Cint), set, type1, pos1, type2, pos2)
end

function isl_basic_set_is_equal(bset1, bset2)
    ccall((:isl_basic_set_is_equal, libisl), isl_bool, (Ptr{isl_basic_set}, Ptr{isl_basic_set}), bset1, bset2)
end

function isl_basic_set_is_disjoint(bset1, bset2)
    ccall((:isl_basic_set_is_disjoint, libisl), isl_bool, (Ptr{isl_basic_set}, Ptr{isl_basic_set}), bset1, bset2)
end

function isl_basic_set_partial_lexmin(bset, dom, empty)
    ccall((:isl_basic_set_partial_lexmin, libisl), Ptr{isl_set}, (Ptr{isl_basic_set}, Ptr{isl_basic_set}, Ptr{Ptr{isl_set}}), bset, dom, empty)
end

function isl_basic_set_partial_lexmax(bset, dom, empty)
    ccall((:isl_basic_set_partial_lexmax, libisl), Ptr{isl_set}, (Ptr{isl_basic_set}, Ptr{isl_basic_set}, Ptr{Ptr{isl_set}}), bset, dom, empty)
end

function isl_set_partial_lexmin(set, dom, empty)
    ccall((:isl_set_partial_lexmin, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_set}, Ptr{Ptr{isl_set}}), set, dom, empty)
end

function isl_set_partial_lexmax(set, dom, empty)
    ccall((:isl_set_partial_lexmax, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_set}, Ptr{Ptr{isl_set}}), set, dom, empty)
end

function isl_basic_set_lexmin(bset)
    ccall((:isl_basic_set_lexmin, libisl), Ptr{isl_set}, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_lexmax(bset)
    ccall((:isl_basic_set_lexmax, libisl), Ptr{isl_set}, (Ptr{isl_basic_set},), bset)
end

function isl_set_lexmin(set)
    ccall((:isl_set_lexmin, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_set_lexmax(set)
    ccall((:isl_set_lexmax, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_basic_set_partial_lexmin_pw_multi_aff(bset, dom, empty)
    ccall((:isl_basic_set_partial_lexmin_pw_multi_aff, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_basic_set}, Ptr{isl_basic_set}, Ptr{Ptr{isl_set}}), bset, dom, empty)
end

function isl_basic_set_partial_lexmax_pw_multi_aff(bset, dom, empty)
    ccall((:isl_basic_set_partial_lexmax_pw_multi_aff, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_basic_set}, Ptr{isl_basic_set}, Ptr{Ptr{isl_set}}), bset, dom, empty)
end

function isl_set_lexmin_pw_multi_aff(set)
    ccall((:isl_set_lexmin_pw_multi_aff, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_set},), set)
end

function isl_set_lexmax_pw_multi_aff(set)
    ccall((:isl_set_lexmax_pw_multi_aff, libisl), Ptr{isl_pw_multi_aff}, (Ptr{isl_set},), set)
end

function isl_basic_set_union(bset1, bset2)
    ccall((:isl_basic_set_union, libisl), Ptr{isl_set}, (Ptr{isl_basic_set}, Ptr{isl_basic_set}), bset1, bset2)
end

function isl_basic_set_compare_at(bset1, bset2, pos)
    ccall((:isl_basic_set_compare_at, libisl), Cint, (Ptr{isl_basic_set}, Ptr{isl_basic_set}, Cint), bset1, bset2, pos)
end

function isl_set_follows_at(set1, set2, pos)
    ccall((:isl_set_follows_at, libisl), Cint, (Ptr{isl_set}, Ptr{isl_set}, Cint), set1, set2, pos)
end

function isl_basic_set_params(bset)
    ccall((:isl_basic_set_params, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_from_params(bset)
    ccall((:isl_basic_set_from_params, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set},), bset)
end

function isl_set_params(set)
    ccall((:isl_set_params, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_set_from_params(set)
    ccall((:isl_set_from_params, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_set_bind(set, tuple)
    ccall((:isl_set_bind, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_multi_id}), set, tuple)
end

function isl_set_unbind_params(set, tuple)
    ccall((:isl_set_unbind_params, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_multi_id}), set, tuple)
end

function isl_set_unbind_params_insert_domain(set, domain)
    ccall((:isl_set_unbind_params_insert_domain, libisl), Ptr{isl_map}, (Ptr{isl_set}, Ptr{isl_multi_id}), set, domain)
end

function isl_basic_set_dims_get_sign(bset, type, pos, n, signs)
    ccall((:isl_basic_set_dims_get_sign, libisl), isl_stat, (Ptr{isl_basic_set}, isl_dim_type, Cuint, Cuint, Ptr{Cint}), bset, type, pos, n, signs)
end

function isl_basic_set_plain_is_universe(bset)
    ccall((:isl_basic_set_plain_is_universe, libisl), isl_bool, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_is_universe(bset)
    ccall((:isl_basic_set_is_universe, libisl), isl_bool, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_plain_is_empty(bset)
    ccall((:isl_basic_set_plain_is_empty, libisl), isl_bool, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_is_empty(bset)
    ccall((:isl_basic_set_is_empty, libisl), isl_bool, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_is_bounded(bset)
    ccall((:isl_basic_set_is_bounded, libisl), isl_bool, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_is_subset(bset1, bset2)
    ccall((:isl_basic_set_is_subset, libisl), isl_bool, (Ptr{isl_basic_set}, Ptr{isl_basic_set}), bset1, bset2)
end

function isl_basic_set_plain_is_equal(bset1, bset2)
    ccall((:isl_basic_set_plain_is_equal, libisl), isl_bool, (Ptr{isl_basic_set}, Ptr{isl_basic_set}), bset1, bset2)
end

function isl_set_empty(space)
    ccall((:isl_set_empty, libisl), Ptr{isl_set}, (Ptr{isl_space},), space)
end

function isl_set_universe(space)
    ccall((:isl_set_universe, libisl), Ptr{isl_set}, (Ptr{isl_space},), space)
end

function isl_set_nat_universe(dim)
    ccall((:isl_set_nat_universe, libisl), Ptr{isl_set}, (Ptr{isl_space},), dim)
end

function isl_set_copy(set)
    ccall((:isl_set_copy, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_set_free(set)
    ccall((:isl_set_free, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_set_from_basic_set(bset)
    ccall((:isl_set_from_basic_set, libisl), Ptr{isl_set}, (Ptr{isl_basic_set},), bset)
end

function isl_set_sample(set)
    ccall((:isl_set_sample, libisl), Ptr{isl_basic_set}, (Ptr{isl_set},), set)
end

function isl_basic_set_sample_point(bset)
    ccall((:isl_basic_set_sample_point, libisl), Ptr{isl_point}, (Ptr{isl_basic_set},), bset)
end

function isl_set_sample_point(set)
    ccall((:isl_set_sample_point, libisl), Ptr{isl_point}, (Ptr{isl_set},), set)
end

function isl_set_detect_equalities(set)
    ccall((:isl_set_detect_equalities, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_set_affine_hull(set)
    ccall((:isl_set_affine_hull, libisl), Ptr{isl_basic_set}, (Ptr{isl_set},), set)
end

function isl_set_convex_hull(set)
    ccall((:isl_set_convex_hull, libisl), Ptr{isl_basic_set}, (Ptr{isl_set},), set)
end

function isl_set_polyhedral_hull(set)
    ccall((:isl_set_polyhedral_hull, libisl), Ptr{isl_basic_set}, (Ptr{isl_set},), set)
end

function isl_set_simple_hull(set)
    ccall((:isl_set_simple_hull, libisl), Ptr{isl_basic_set}, (Ptr{isl_set},), set)
end

function isl_set_unshifted_simple_hull(set)
    ccall((:isl_set_unshifted_simple_hull, libisl), Ptr{isl_basic_set}, (Ptr{isl_set},), set)
end

function isl_set_plain_unshifted_simple_hull(set)
    ccall((:isl_set_plain_unshifted_simple_hull, libisl), Ptr{isl_basic_set}, (Ptr{isl_set},), set)
end

function isl_set_unshifted_simple_hull_from_set_list(set, list)
    ccall((:isl_set_unshifted_simple_hull_from_set_list, libisl), Ptr{isl_basic_set}, (Ptr{isl_set}, Ptr{isl_set_list}), set, list)
end

function isl_set_bounded_simple_hull(set)
    ccall((:isl_set_bounded_simple_hull, libisl), Ptr{isl_basic_set}, (Ptr{isl_set},), set)
end

function isl_set_union_disjoint(set1, set2)
    ccall((:isl_set_union_disjoint, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_set}), set1, set2)
end

function isl_set_union(set1, set2)
    ccall((:isl_set_union, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_set}), set1, set2)
end

function isl_set_product(set1, set2)
    ccall((:isl_set_product, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_set}), set1, set2)
end

function isl_basic_set_flat_product(bset1, bset2)
    ccall((:isl_basic_set_flat_product, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, Ptr{isl_basic_set}), bset1, bset2)
end

function isl_set_flat_product(set1, set2)
    ccall((:isl_set_flat_product, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_set}), set1, set2)
end

function isl_set_intersect(set1, set2)
    ccall((:isl_set_intersect, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_set}), set1, set2)
end

function isl_set_intersect_params(set, params)
    ccall((:isl_set_intersect_params, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_set}), set, params)
end

function isl_set_intersect_factor_domain(set, domain)
    ccall((:isl_set_intersect_factor_domain, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_set}), set, domain)
end

function isl_set_intersect_factor_range(set, range)
    ccall((:isl_set_intersect_factor_range, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_set}), set, range)
end

function isl_set_subtract(set1, set2)
    ccall((:isl_set_subtract, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_set}), set1, set2)
end

function isl_set_complement(set)
    ccall((:isl_set_complement, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_set_apply(set, map)
    ccall((:isl_set_apply, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_map}), set, map)
end

function isl_set_preimage_multi_aff(set, ma)
    ccall((:isl_set_preimage_multi_aff, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_multi_aff}), set, ma)
end

function isl_set_preimage_pw_multi_aff(set, pma)
    ccall((:isl_set_preimage_pw_multi_aff, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_pw_multi_aff}), set, pma)
end

function isl_set_preimage_multi_pw_aff(set, mpa)
    ccall((:isl_set_preimage_multi_pw_aff, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_multi_pw_aff}), set, mpa)
end

function isl_set_fix_val(set, type, pos, v)
    ccall((:isl_set_fix_val, libisl), Ptr{isl_set}, (Ptr{isl_set}, isl_dim_type, Cuint, Ptr{isl_val}), set, type, pos, v)
end

function isl_set_fix_dim_si(set, dim, value)
    ccall((:isl_set_fix_dim_si, libisl), Ptr{isl_set}, (Ptr{isl_set}, Cuint, Cint), set, dim, value)
end

function isl_basic_set_insert_dims(bset, type, pos, n)
    ccall((:isl_basic_set_insert_dims, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, isl_dim_type, Cuint, Cuint), bset, type, pos, n)
end

function isl_set_insert_dims(set, type, pos, n)
    ccall((:isl_set_insert_dims, libisl), Ptr{isl_set}, (Ptr{isl_set}, isl_dim_type, Cuint, Cuint), set, type, pos, n)
end

function isl_basic_set_add_dims(bset, type, n)
    ccall((:isl_basic_set_add_dims, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, isl_dim_type, Cuint), bset, type, n)
end

function isl_set_add_dims(set, type, n)
    ccall((:isl_set_add_dims, libisl), Ptr{isl_set}, (Ptr{isl_set}, isl_dim_type, Cuint), set, type, n)
end

function isl_basic_set_move_dims(bset, dst_type, dst_pos, src_type, src_pos, n)
    ccall((:isl_basic_set_move_dims, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, isl_dim_type, Cuint, isl_dim_type, Cuint, Cuint), bset, dst_type, dst_pos, src_type, src_pos, n)
end

function isl_set_move_dims(set, dst_type, dst_pos, src_type, src_pos, n)
    ccall((:isl_set_move_dims, libisl), Ptr{isl_set}, (Ptr{isl_set}, isl_dim_type, Cuint, isl_dim_type, Cuint, Cuint), set, dst_type, dst_pos, src_type, src_pos, n)
end

function isl_basic_set_project_out(bset, type, first, n)
    ccall((:isl_basic_set_project_out, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, isl_dim_type, Cuint, Cuint), bset, type, first, n)
end

function isl_set_project_out_param_id(set, id)
    ccall((:isl_set_project_out_param_id, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_id}), set, id)
end

function isl_set_project_out_param_id_list(set, list)
    ccall((:isl_set_project_out_param_id_list, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_id_list}), set, list)
end

function isl_set_project_out(set, type, first, n)
    ccall((:isl_set_project_out, libisl), Ptr{isl_set}, (Ptr{isl_set}, isl_dim_type, Cuint, Cuint), set, type, first, n)
end

function isl_set_project_out_all_params(set)
    ccall((:isl_set_project_out_all_params, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_set_project_onto_map(set, type, first, n)
    ccall((:isl_set_project_onto_map, libisl), Ptr{isl_map}, (Ptr{isl_set}, isl_dim_type, Cuint, Cuint), set, type, first, n)
end

function isl_basic_set_remove_divs(bset)
    ccall((:isl_basic_set_remove_divs, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_eliminate(bset, type, first, n)
    ccall((:isl_basic_set_eliminate, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, isl_dim_type, Cuint, Cuint), bset, type, first, n)
end

function isl_set_eliminate(set, type, first, n)
    ccall((:isl_set_eliminate, libisl), Ptr{isl_set}, (Ptr{isl_set}, isl_dim_type, Cuint, Cuint), set, type, first, n)
end

function isl_set_eliminate_dims(set, first, n)
    ccall((:isl_set_eliminate_dims, libisl), Ptr{isl_set}, (Ptr{isl_set}, Cuint, Cuint), set, first, n)
end

function isl_set_remove_dims(bset, type, first, n)
    ccall((:isl_set_remove_dims, libisl), Ptr{isl_set}, (Ptr{isl_set}, isl_dim_type, Cuint, Cuint), bset, type, first, n)
end

function isl_basic_set_remove_divs_involving_dims(bset, type, first, n)
    ccall((:isl_basic_set_remove_divs_involving_dims, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, isl_dim_type, Cuint, Cuint), bset, type, first, n)
end

function isl_set_remove_divs_involving_dims(set, type, first, n)
    ccall((:isl_set_remove_divs_involving_dims, libisl), Ptr{isl_set}, (Ptr{isl_set}, isl_dim_type, Cuint, Cuint), set, type, first, n)
end

function isl_basic_set_remove_unknown_divs(bset)
    ccall((:isl_basic_set_remove_unknown_divs, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set},), bset)
end

function isl_set_remove_unknown_divs(set)
    ccall((:isl_set_remove_unknown_divs, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_set_remove_divs(set)
    ccall((:isl_set_remove_divs, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_set_split_dims(set, type, first, n)
    ccall((:isl_set_split_dims, libisl), Ptr{isl_set}, (Ptr{isl_set}, isl_dim_type, Cuint, Cuint), set, type, first, n)
end

function isl_basic_set_drop_constraints_involving_dims(bset, type, first, n)
    ccall((:isl_basic_set_drop_constraints_involving_dims, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, isl_dim_type, Cuint, Cuint), bset, type, first, n)
end

function isl_basic_set_drop_constraints_not_involving_dims(bset, type, first, n)
    ccall((:isl_basic_set_drop_constraints_not_involving_dims, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, isl_dim_type, Cuint, Cuint), bset, type, first, n)
end

function isl_set_drop_constraints_involving_dims(set, type, first, n)
    ccall((:isl_set_drop_constraints_involving_dims, libisl), Ptr{isl_set}, (Ptr{isl_set}, isl_dim_type, Cuint, Cuint), set, type, first, n)
end

function isl_set_drop_constraints_not_involving_dims(set, type, first, n)
    ccall((:isl_set_drop_constraints_not_involving_dims, libisl), Ptr{isl_set}, (Ptr{isl_set}, isl_dim_type, Cuint, Cuint), set, type, first, n)
end

function isl_basic_set_involves_dims(bset, type, first, n)
    ccall((:isl_basic_set_involves_dims, libisl), isl_bool, (Ptr{isl_basic_set}, isl_dim_type, Cuint, Cuint), bset, type, first, n)
end

function isl_set_involves_dims(set, type, first, n)
    ccall((:isl_set_involves_dims, libisl), isl_bool, (Ptr{isl_set}, isl_dim_type, Cuint, Cuint), set, type, first, n)
end

function isl_set_print_internal(set, out, indent)
    ccall((:isl_set_print_internal, libisl), Cvoid, (Ptr{isl_set}, Ptr{Libc.FILE}, Cint), set, out, indent)
end

function isl_set_plain_is_empty(set)
    ccall((:isl_set_plain_is_empty, libisl), isl_bool, (Ptr{isl_set},), set)
end

function isl_set_plain_is_universe(set)
    ccall((:isl_set_plain_is_universe, libisl), isl_bool, (Ptr{isl_set},), set)
end

function isl_set_is_params(set)
    ccall((:isl_set_is_params, libisl), isl_bool, (Ptr{isl_set},), set)
end

function isl_set_is_empty(set)
    ccall((:isl_set_is_empty, libisl), isl_bool, (Ptr{isl_set},), set)
end

function isl_set_is_bounded(set)
    ccall((:isl_set_is_bounded, libisl), isl_bool, (Ptr{isl_set},), set)
end

function isl_set_is_subset(set1, set2)
    ccall((:isl_set_is_subset, libisl), isl_bool, (Ptr{isl_set}, Ptr{isl_set}), set1, set2)
end

function isl_set_is_strict_subset(set1, set2)
    ccall((:isl_set_is_strict_subset, libisl), isl_bool, (Ptr{isl_set}, Ptr{isl_set}), set1, set2)
end

function isl_set_is_equal(set1, set2)
    ccall((:isl_set_is_equal, libisl), isl_bool, (Ptr{isl_set}, Ptr{isl_set}), set1, set2)
end

function isl_set_is_disjoint(set1, set2)
    ccall((:isl_set_is_disjoint, libisl), isl_bool, (Ptr{isl_set}, Ptr{isl_set}), set1, set2)
end

function isl_set_is_singleton(set)
    ccall((:isl_set_is_singleton, libisl), isl_bool, (Ptr{isl_set},), set)
end

function isl_set_is_box(set)
    ccall((:isl_set_is_box, libisl), isl_bool, (Ptr{isl_set},), set)
end

function isl_set_has_equal_space(set1, set2)
    ccall((:isl_set_has_equal_space, libisl), isl_bool, (Ptr{isl_set}, Ptr{isl_set}), set1, set2)
end

function isl_set_sum(set1, set2)
    ccall((:isl_set_sum, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_set}), set1, set2)
end

function isl_basic_set_neg(bset)
    ccall((:isl_basic_set_neg, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set},), bset)
end

function isl_set_neg(set)
    ccall((:isl_set_neg, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_set_make_disjoint(set)
    ccall((:isl_set_make_disjoint, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_basic_set_compute_divs(bset)
    ccall((:isl_basic_set_compute_divs, libisl), Ptr{isl_set}, (Ptr{isl_basic_set},), bset)
end

function isl_set_compute_divs(set)
    ccall((:isl_set_compute_divs, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_set_align_divs(set)
    ccall((:isl_set_align_divs, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_set_plain_get_val_if_fixed(set, type, pos)
    ccall((:isl_set_plain_get_val_if_fixed, libisl), Ptr{isl_val}, (Ptr{isl_set}, isl_dim_type, Cuint), set, type, pos)
end

function isl_set_dim_is_bounded(set, type, pos)
    ccall((:isl_set_dim_is_bounded, libisl), isl_bool, (Ptr{isl_set}, isl_dim_type, Cuint), set, type, pos)
end

function isl_set_dim_has_lower_bound(set, type, pos)
    ccall((:isl_set_dim_has_lower_bound, libisl), isl_bool, (Ptr{isl_set}, isl_dim_type, Cuint), set, type, pos)
end

function isl_set_dim_has_upper_bound(set, type, pos)
    ccall((:isl_set_dim_has_upper_bound, libisl), isl_bool, (Ptr{isl_set}, isl_dim_type, Cuint), set, type, pos)
end

function isl_set_dim_has_any_lower_bound(set, type, pos)
    ccall((:isl_set_dim_has_any_lower_bound, libisl), isl_bool, (Ptr{isl_set}, isl_dim_type, Cuint), set, type, pos)
end

function isl_set_dim_has_any_upper_bound(set, type, pos)
    ccall((:isl_set_dim_has_any_upper_bound, libisl), isl_bool, (Ptr{isl_set}, isl_dim_type, Cuint), set, type, pos)
end

function isl_basic_set_gist(bset, context)
    ccall((:isl_basic_set_gist, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, Ptr{isl_basic_set}), bset, context)
end

function isl_set_gist_basic_set(set, context)
    ccall((:isl_set_gist_basic_set, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_basic_set}), set, context)
end

function isl_set_gist(set, context)
    ccall((:isl_set_gist, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_set}), set, context)
end

function isl_set_gist_params(set, context)
    ccall((:isl_set_gist_params, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_set}), set, context)
end

function isl_set_dim_residue_class_val(set, pos, modulo, residue)
    ccall((:isl_set_dim_residue_class_val, libisl), isl_stat, (Ptr{isl_set}, Cint, Ptr{Ptr{isl_val}}, Ptr{Ptr{isl_val}}), set, pos, modulo, residue)
end

function isl_set_get_stride_info(set, pos)
    ccall((:isl_set_get_stride_info, libisl), Ptr{isl_stride_info}, (Ptr{isl_set}, Cint), set, pos)
end

function isl_set_get_stride(set, pos)
    ccall((:isl_set_get_stride, libisl), Ptr{isl_val}, (Ptr{isl_set}, Cint), set, pos)
end

function isl_set_coalesce(set)
    ccall((:isl_set_coalesce, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_set_plain_cmp(set1, set2)
    ccall((:isl_set_plain_cmp, libisl), Cint, (Ptr{isl_set}, Ptr{isl_set}), set1, set2)
end

function isl_set_plain_is_equal(set1, set2)
    ccall((:isl_set_plain_is_equal, libisl), isl_bool, (Ptr{isl_set}, Ptr{isl_set}), set1, set2)
end

function isl_set_plain_is_disjoint(set1, set2)
    ccall((:isl_set_plain_is_disjoint, libisl), isl_bool, (Ptr{isl_set}, Ptr{isl_set}), set1, set2)
end

function isl_set_get_hash(set)
    ccall((:isl_set_get_hash, libisl), UInt32, (Ptr{isl_set},), set)
end

function isl_set_n_basic_set(set)
    ccall((:isl_set_n_basic_set, libisl), isl_size, (Ptr{isl_set},), set)
end

function isl_set_foreach_basic_set(set, fn, user)
    ccall((:isl_set_foreach_basic_set, libisl), isl_stat, (Ptr{isl_set}, Ptr{Cvoid}, Ptr{Cvoid}), set, fn, user)
end

function isl_set_get_basic_set_list(set)
    ccall((:isl_set_get_basic_set_list, libisl), Ptr{isl_basic_set_list}, (Ptr{isl_set},), set)
end

function isl_set_foreach_point(set, fn, user)
    ccall((:isl_set_foreach_point, libisl), isl_stat, (Ptr{isl_set}, Ptr{Cvoid}, Ptr{Cvoid}), set, fn, user)
end

function isl_set_count_val(set)
    ccall((:isl_set_count_val, libisl), Ptr{isl_val}, (Ptr{isl_set},), set)
end

function isl_basic_set_from_point(pnt)
    ccall((:isl_basic_set_from_point, libisl), Ptr{isl_basic_set}, (Ptr{isl_point},), pnt)
end

function isl_set_from_point(pnt)
    ccall((:isl_set_from_point, libisl), Ptr{isl_set}, (Ptr{isl_point},), pnt)
end

function isl_basic_set_box_from_points(pnt1, pnt2)
    ccall((:isl_basic_set_box_from_points, libisl), Ptr{isl_basic_set}, (Ptr{isl_point}, Ptr{isl_point}), pnt1, pnt2)
end

function isl_set_box_from_points(pnt1, pnt2)
    ccall((:isl_set_box_from_points, libisl), Ptr{isl_set}, (Ptr{isl_point}, Ptr{isl_point}), pnt1, pnt2)
end

function isl_basic_set_lift(bset)
    ccall((:isl_basic_set_lift, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set},), bset)
end

function isl_set_lift(set)
    ccall((:isl_set_lift, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_set_lex_le_set(set1, set2)
    ccall((:isl_set_lex_le_set, libisl), Ptr{isl_map}, (Ptr{isl_set}, Ptr{isl_set}), set1, set2)
end

function isl_set_lex_lt_set(set1, set2)
    ccall((:isl_set_lex_lt_set, libisl), Ptr{isl_map}, (Ptr{isl_set}, Ptr{isl_set}), set1, set2)
end

function isl_set_lex_ge_set(set1, set2)
    ccall((:isl_set_lex_ge_set, libisl), Ptr{isl_map}, (Ptr{isl_set}, Ptr{isl_set}), set1, set2)
end

function isl_set_lex_gt_set(set1, set2)
    ccall((:isl_set_lex_gt_set, libisl), Ptr{isl_map}, (Ptr{isl_set}, Ptr{isl_set}), set1, set2)
end

function isl_set_size(set)
    ccall((:isl_set_size, libisl), Cint, (Ptr{isl_set},), set)
end

function isl_basic_set_align_params(bset, model)
    ccall((:isl_basic_set_align_params, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set}, Ptr{isl_space}), bset, model)
end

function isl_set_align_params(set, model)
    ccall((:isl_set_align_params, libisl), Ptr{isl_set}, (Ptr{isl_set}, Ptr{isl_space}), set, model)
end

function isl_basic_set_drop_unused_params(bset)
    ccall((:isl_basic_set_drop_unused_params, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set},), bset)
end

function isl_set_drop_unused_params(set)
    ccall((:isl_set_drop_unused_params, libisl), Ptr{isl_set}, (Ptr{isl_set},), set)
end

function isl_basic_set_equalities_matrix(bset, c1, c2, c3, c4)
    ccall((:isl_basic_set_equalities_matrix, libisl), Ptr{isl_mat}, (Ptr{isl_basic_set}, isl_dim_type, isl_dim_type, isl_dim_type, isl_dim_type), bset, c1, c2, c3, c4)
end

function isl_basic_set_inequalities_matrix(bset, c1, c2, c3, c4)
    ccall((:isl_basic_set_inequalities_matrix, libisl), Ptr{isl_mat}, (Ptr{isl_basic_set}, isl_dim_type, isl_dim_type, isl_dim_type, isl_dim_type), bset, c1, c2, c3, c4)
end

function isl_basic_set_from_constraint_matrices(dim, eq, ineq, c1, c2, c3, c4)
    ccall((:isl_basic_set_from_constraint_matrices, libisl), Ptr{isl_basic_set}, (Ptr{isl_space}, Ptr{isl_mat}, Ptr{isl_mat}, isl_dim_type, isl_dim_type, isl_dim_type, isl_dim_type), dim, eq, ineq, c1, c2, c3, c4)
end

function isl_basic_set_from_multi_aff(ma)
    ccall((:isl_basic_set_from_multi_aff, libisl), Ptr{isl_basic_set}, (Ptr{isl_multi_aff},), ma)
end

function isl_set_from_multi_aff(ma)
    ccall((:isl_set_from_multi_aff, libisl), Ptr{isl_set}, (Ptr{isl_multi_aff},), ma)
end

function isl_basic_set_reduced_basis(bset)
    ccall((:isl_basic_set_reduced_basis, libisl), Ptr{isl_mat}, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_coefficients(bset)
    ccall((:isl_basic_set_coefficients, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set},), bset)
end

function isl_basic_set_list_coefficients(list)
    ccall((:isl_basic_set_list_coefficients, libisl), Ptr{isl_basic_set_list}, (Ptr{isl_basic_set_list},), list)
end

function isl_set_coefficients(set)
    ccall((:isl_set_coefficients, libisl), Ptr{isl_basic_set}, (Ptr{isl_set},), set)
end

function isl_basic_set_solutions(bset)
    ccall((:isl_basic_set_solutions, libisl), Ptr{isl_basic_set}, (Ptr{isl_basic_set},), bset)
end

function isl_set_solutions(set)
    ccall((:isl_set_solutions, libisl), Ptr{isl_basic_set}, (Ptr{isl_set},), set)
end

function isl_set_dim_max(set, pos)
    ccall((:isl_set_dim_max, libisl), Ptr{isl_pw_aff}, (Ptr{isl_set}, Cint), set, pos)
end

function isl_set_dim_min(set, pos)
    ccall((:isl_set_dim_min, libisl), Ptr{isl_pw_aff}, (Ptr{isl_set}, Cint), set, pos)
end

function isl_basic_set_to_str(bset)
    ccall((:isl_basic_set_to_str, libisl), Ptr{Cchar}, (Ptr{isl_basic_set},), bset)
end

function isl_set_to_str(set)
    ccall((:isl_set_to_str, libisl), Ptr{Cchar}, (Ptr{isl_set},), set)
end

function isl_space_get_ctx(space)
    ccall((:isl_space_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_space},), space)
end

function isl_space_unit(ctx)
    ccall((:isl_space_unit, libisl), Ptr{isl_space}, (Ptr{isl_ctx},), ctx)
end

function isl_space_alloc(ctx, nparam, n_in, n_out)
    ccall((:isl_space_alloc, libisl), Ptr{isl_space}, (Ptr{isl_ctx}, Cuint, Cuint, Cuint), ctx, nparam, n_in, n_out)
end

function isl_space_set_alloc(ctx, nparam, dim)
    ccall((:isl_space_set_alloc, libisl), Ptr{isl_space}, (Ptr{isl_ctx}, Cuint, Cuint), ctx, nparam, dim)
end

function isl_space_params_alloc(ctx, nparam)
    ccall((:isl_space_params_alloc, libisl), Ptr{isl_space}, (Ptr{isl_ctx}, Cuint), ctx, nparam)
end

function isl_space_copy(dim)
    ccall((:isl_space_copy, libisl), Ptr{isl_space}, (Ptr{isl_space},), dim)
end

function isl_space_free(space)
    ccall((:isl_space_free, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_is_params(space)
    ccall((:isl_space_is_params, libisl), isl_bool, (Ptr{isl_space},), space)
end

function isl_space_is_set(space)
    ccall((:isl_space_is_set, libisl), isl_bool, (Ptr{isl_space},), space)
end

function isl_space_is_map(space)
    ccall((:isl_space_is_map, libisl), isl_bool, (Ptr{isl_space},), space)
end

function isl_space_add_param_id(space, id)
    ccall((:isl_space_add_param_id, libisl), Ptr{isl_space}, (Ptr{isl_space}, Ptr{isl_id}), space, id)
end

function isl_space_set_tuple_name(space, type, s)
    ccall((:isl_space_set_tuple_name, libisl), Ptr{isl_space}, (Ptr{isl_space}, isl_dim_type, Ptr{Cchar}), space, type, s)
end

function isl_space_has_tuple_name(space, type)
    ccall((:isl_space_has_tuple_name, libisl), isl_bool, (Ptr{isl_space}, isl_dim_type), space, type)
end

function isl_space_get_tuple_name(space, type)
    ccall((:isl_space_get_tuple_name, libisl), Ptr{Cchar}, (Ptr{isl_space}, isl_dim_type), space, type)
end

function isl_space_set_tuple_id(space, type, id)
    ccall((:isl_space_set_tuple_id, libisl), Ptr{isl_space}, (Ptr{isl_space}, isl_dim_type, Ptr{isl_id}), space, type, id)
end

function isl_space_reset_tuple_id(space, type)
    ccall((:isl_space_reset_tuple_id, libisl), Ptr{isl_space}, (Ptr{isl_space}, isl_dim_type), space, type)
end

function isl_space_has_tuple_id(space, type)
    ccall((:isl_space_has_tuple_id, libisl), isl_bool, (Ptr{isl_space}, isl_dim_type), space, type)
end

function isl_space_get_tuple_id(space, type)
    ccall((:isl_space_get_tuple_id, libisl), Ptr{isl_id}, (Ptr{isl_space}, isl_dim_type), space, type)
end

function isl_space_reset_user(space)
    ccall((:isl_space_reset_user, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_set_dim_id(dim, type, pos, id)
    ccall((:isl_space_set_dim_id, libisl), Ptr{isl_space}, (Ptr{isl_space}, isl_dim_type, Cuint, Ptr{isl_id}), dim, type, pos, id)
end

function isl_space_has_dim_id(space, type, pos)
    ccall((:isl_space_has_dim_id, libisl), isl_bool, (Ptr{isl_space}, isl_dim_type, Cuint), space, type, pos)
end

function isl_space_get_dim_id(space, type, pos)
    ccall((:isl_space_get_dim_id, libisl), Ptr{isl_id}, (Ptr{isl_space}, isl_dim_type, Cuint), space, type, pos)
end

function isl_space_find_dim_by_id(space, type, id)
    ccall((:isl_space_find_dim_by_id, libisl), Cint, (Ptr{isl_space}, isl_dim_type, Ptr{isl_id}), space, type, id)
end

function isl_space_find_dim_by_name(space, type, name)
    ccall((:isl_space_find_dim_by_name, libisl), Cint, (Ptr{isl_space}, isl_dim_type, Ptr{Cchar}), space, type, name)
end

function isl_space_has_dim_name(space, type, pos)
    ccall((:isl_space_has_dim_name, libisl), isl_bool, (Ptr{isl_space}, isl_dim_type, Cuint), space, type, pos)
end

function isl_space_set_dim_name(space, type, pos, name)
    ccall((:isl_space_set_dim_name, libisl), Ptr{isl_space}, (Ptr{isl_space}, isl_dim_type, Cuint, Ptr{Cchar}), space, type, pos, name)
end

function isl_space_get_dim_name(space, type, pos)
    ccall((:isl_space_get_dim_name, libisl), Ptr{Cchar}, (Ptr{isl_space}, isl_dim_type, Cuint), space, type, pos)
end

function isl_space_extend(dim, nparam, n_in, n_out)
    ccall((:isl_space_extend, libisl), Ptr{isl_space}, (Ptr{isl_space}, Cuint, Cuint, Cuint), dim, nparam, n_in, n_out)
end

function isl_space_add_dims(space, type, n)
    ccall((:isl_space_add_dims, libisl), Ptr{isl_space}, (Ptr{isl_space}, isl_dim_type, Cuint), space, type, n)
end

function isl_space_move_dims(space, dst_type, dst_pos, src_type, src_pos, n)
    ccall((:isl_space_move_dims, libisl), Ptr{isl_space}, (Ptr{isl_space}, isl_dim_type, Cuint, isl_dim_type, Cuint, Cuint), space, dst_type, dst_pos, src_type, src_pos, n)
end

function isl_space_insert_dims(space, type, pos, n)
    ccall((:isl_space_insert_dims, libisl), Ptr{isl_space}, (Ptr{isl_space}, isl_dim_type, Cuint, Cuint), space, type, pos, n)
end

function isl_space_join(left, right)
    ccall((:isl_space_join, libisl), Ptr{isl_space}, (Ptr{isl_space}, Ptr{isl_space}), left, right)
end

function isl_space_product(left, right)
    ccall((:isl_space_product, libisl), Ptr{isl_space}, (Ptr{isl_space}, Ptr{isl_space}), left, right)
end

function isl_space_domain_product(left, right)
    ccall((:isl_space_domain_product, libisl), Ptr{isl_space}, (Ptr{isl_space}, Ptr{isl_space}), left, right)
end

function isl_space_range_product(left, right)
    ccall((:isl_space_range_product, libisl), Ptr{isl_space}, (Ptr{isl_space}, Ptr{isl_space}), left, right)
end

function isl_space_factor_domain(space)
    ccall((:isl_space_factor_domain, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_factor_range(space)
    ccall((:isl_space_factor_range, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_domain_factor_domain(space)
    ccall((:isl_space_domain_factor_domain, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_domain_factor_range(space)
    ccall((:isl_space_domain_factor_range, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_range_factor_domain(space)
    ccall((:isl_space_range_factor_domain, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_range_factor_range(space)
    ccall((:isl_space_range_factor_range, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_map_from_set(space)
    ccall((:isl_space_map_from_set, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_map_from_domain_and_range(domain, range)
    ccall((:isl_space_map_from_domain_and_range, libisl), Ptr{isl_space}, (Ptr{isl_space}, Ptr{isl_space}), domain, range)
end

function isl_space_reverse(space)
    ccall((:isl_space_reverse, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_range_reverse(space)
    ccall((:isl_space_range_reverse, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_drop_dims(space, type, first, num)
    ccall((:isl_space_drop_dims, libisl), Ptr{isl_space}, (Ptr{isl_space}, isl_dim_type, Cuint, Cuint), space, type, first, num)
end

function isl_space_drop_inputs(dim, first, n)
    ccall((:isl_space_drop_inputs, libisl), Ptr{isl_space}, (Ptr{isl_space}, Cuint, Cuint), dim, first, n)
end

function isl_space_drop_outputs(dim, first, n)
    ccall((:isl_space_drop_outputs, libisl), Ptr{isl_space}, (Ptr{isl_space}, Cuint, Cuint), dim, first, n)
end

function isl_space_drop_all_params(space)
    ccall((:isl_space_drop_all_params, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_domain(space)
    ccall((:isl_space_domain, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_from_domain(space)
    ccall((:isl_space_from_domain, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_range(space)
    ccall((:isl_space_range, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_from_range(space)
    ccall((:isl_space_from_range, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_domain_map(space)
    ccall((:isl_space_domain_map, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_range_map(space)
    ccall((:isl_space_range_map, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_params(space)
    ccall((:isl_space_params, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_add_unnamed_tuple_ui(space, dim)
    ccall((:isl_space_add_unnamed_tuple_ui, libisl), Ptr{isl_space}, (Ptr{isl_space}, Cuint), space, dim)
end

function isl_space_add_named_tuple_id_ui(space, tuple_id, dim)
    ccall((:isl_space_add_named_tuple_id_ui, libisl), Ptr{isl_space}, (Ptr{isl_space}, Ptr{isl_id}, Cuint), space, tuple_id, dim)
end

function isl_space_set_from_params(space)
    ccall((:isl_space_set_from_params, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_align_params(dim1, dim2)
    ccall((:isl_space_align_params, libisl), Ptr{isl_space}, (Ptr{isl_space}, Ptr{isl_space}), dim1, dim2)
end

function isl_space_is_wrapping(space)
    ccall((:isl_space_is_wrapping, libisl), isl_bool, (Ptr{isl_space},), space)
end

function isl_space_domain_is_wrapping(space)
    ccall((:isl_space_domain_is_wrapping, libisl), isl_bool, (Ptr{isl_space},), space)
end

function isl_space_range_is_wrapping(space)
    ccall((:isl_space_range_is_wrapping, libisl), isl_bool, (Ptr{isl_space},), space)
end

function isl_space_is_product(space)
    ccall((:isl_space_is_product, libisl), isl_bool, (Ptr{isl_space},), space)
end

function isl_space_wrap(space)
    ccall((:isl_space_wrap, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_unwrap(space)
    ccall((:isl_space_unwrap, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_can_zip(space)
    ccall((:isl_space_can_zip, libisl), isl_bool, (Ptr{isl_space},), space)
end

function isl_space_zip(space)
    ccall((:isl_space_zip, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_can_curry(space)
    ccall((:isl_space_can_curry, libisl), isl_bool, (Ptr{isl_space},), space)
end

function isl_space_curry(space)
    ccall((:isl_space_curry, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_can_range_curry(space)
    ccall((:isl_space_can_range_curry, libisl), isl_bool, (Ptr{isl_space},), space)
end

function isl_space_range_curry(space)
    ccall((:isl_space_range_curry, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_can_uncurry(space)
    ccall((:isl_space_can_uncurry, libisl), isl_bool, (Ptr{isl_space},), space)
end

function isl_space_uncurry(space)
    ccall((:isl_space_uncurry, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_is_domain(space1, space2)
    ccall((:isl_space_is_domain, libisl), isl_bool, (Ptr{isl_space}, Ptr{isl_space}), space1, space2)
end

function isl_space_is_range(space1, space2)
    ccall((:isl_space_is_range, libisl), isl_bool, (Ptr{isl_space}, Ptr{isl_space}), space1, space2)
end

function isl_space_is_equal(space1, space2)
    ccall((:isl_space_is_equal, libisl), isl_bool, (Ptr{isl_space}, Ptr{isl_space}), space1, space2)
end

function isl_space_has_equal_params(space1, space2)
    ccall((:isl_space_has_equal_params, libisl), isl_bool, (Ptr{isl_space}, Ptr{isl_space}), space1, space2)
end

function isl_space_has_equal_tuples(space1, space2)
    ccall((:isl_space_has_equal_tuples, libisl), isl_bool, (Ptr{isl_space}, Ptr{isl_space}), space1, space2)
end

function isl_space_tuple_is_equal(space1, type1, space2, type2)
    ccall((:isl_space_tuple_is_equal, libisl), isl_bool, (Ptr{isl_space}, isl_dim_type, Ptr{isl_space}, isl_dim_type), space1, type1, space2, type2)
end

function isl_space_match(space1, type1, space2, type2)
    ccall((:isl_space_match, libisl), isl_bool, (Ptr{isl_space}, isl_dim_type, Ptr{isl_space}, isl_dim_type), space1, type1, space2, type2)
end

function isl_space_dim(space, type)
    ccall((:isl_space_dim, libisl), isl_size, (Ptr{isl_space}, isl_dim_type), space, type)
end

function isl_space_flatten_domain(space)
    ccall((:isl_space_flatten_domain, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_flatten_range(space)
    ccall((:isl_space_flatten_range, libisl), Ptr{isl_space}, (Ptr{isl_space},), space)
end

function isl_space_to_str(space)
    ccall((:isl_space_to_str, libisl), Ptr{Cchar}, (Ptr{isl_space},), space)
end

function isl_printer_print_space(p, space)
    ccall((:isl_printer_print_space, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_space}), p, space)
end

function isl_space_dump(space)
    ccall((:isl_space_dump, libisl), Cvoid, (Ptr{isl_space},), space)
end

@cenum isl_token_type::Int32 begin
    ISL_TOKEN_ERROR = -1
    ISL_TOKEN_UNKNOWN = 256
    ISL_TOKEN_VALUE = 257
    ISL_TOKEN_IDENT = 258
    ISL_TOKEN_GE = 259
    ISL_TOKEN_LE = 260
    ISL_TOKEN_GT = 261
    ISL_TOKEN_LT = 262
    ISL_TOKEN_NE = 263
    ISL_TOKEN_EQ_EQ = 264
    ISL_TOKEN_LEX_GE = 265
    ISL_TOKEN_LEX_LE = 266
    ISL_TOKEN_LEX_GT = 267
    ISL_TOKEN_LEX_LT = 268
    ISL_TOKEN_TO = 269
    ISL_TOKEN_AND = 270
    ISL_TOKEN_OR = 271
    ISL_TOKEN_EXISTS = 272
    ISL_TOKEN_NOT = 273
    ISL_TOKEN_DEF = 274
    ISL_TOKEN_INFTY = 275
    ISL_TOKEN_NAN = 276
    ISL_TOKEN_MIN = 277
    ISL_TOKEN_MAX = 278
    ISL_TOKEN_RAT = 279
    ISL_TOKEN_TRUE = 280
    ISL_TOKEN_FALSE = 281
    ISL_TOKEN_CEILD = 282
    ISL_TOKEN_FLOORD = 283
    ISL_TOKEN_MOD = 284
    ISL_TOKEN_STRING = 285
    ISL_TOKEN_MAP = 286
    ISL_TOKEN_AFF = 287
    ISL_TOKEN_CEIL = 288
    ISL_TOKEN_FLOOR = 289
    ISL_TOKEN_IMPLIES = 290
    ISL_TOKEN_LAST = 291
end

mutable struct isl_token end

function isl_token_get_val(ctx, tok)
    ccall((:isl_token_get_val, libisl), Ptr{isl_val}, (Ptr{isl_ctx}, Ptr{isl_token}), ctx, tok)
end

function isl_token_get_str(ctx, tok)
    ccall((:isl_token_get_str, libisl), Ptr{Cchar}, (Ptr{isl_ctx}, Ptr{isl_token}), ctx, tok)
end

function isl_token_get_type(tok)
    ccall((:isl_token_get_type, libisl), Cint, (Ptr{isl_token},), tok)
end

function isl_token_free(tok)
    ccall((:isl_token_free, libisl), Cvoid, (Ptr{isl_token},), tok)
end

mutable struct isl_stream end

function isl_stream_new_file(ctx, file)
    ccall((:isl_stream_new_file, libisl), Ptr{isl_stream}, (Ptr{isl_ctx}, Ptr{Libc.FILE}), ctx, file)
end

function isl_stream_new_str(ctx, str)
    ccall((:isl_stream_new_str, libisl), Ptr{isl_stream}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_stream_free(s)
    ccall((:isl_stream_free, libisl), Cvoid, (Ptr{isl_stream},), s)
end

function isl_stream_get_ctx(s)
    ccall((:isl_stream_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_stream},), s)
end

function isl_stream_error(s, tok, msg)
    ccall((:isl_stream_error, libisl), Cvoid, (Ptr{isl_stream}, Ptr{isl_token}, Ptr{Cchar}), s, tok, msg)
end

function isl_stream_next_token(s)
    ccall((:isl_stream_next_token, libisl), Ptr{isl_token}, (Ptr{isl_stream},), s)
end

function isl_stream_next_token_on_same_line(s)
    ccall((:isl_stream_next_token_on_same_line, libisl), Ptr{isl_token}, (Ptr{isl_stream},), s)
end

function isl_stream_next_token_is(s, type)
    ccall((:isl_stream_next_token_is, libisl), Cint, (Ptr{isl_stream}, Cint), s, type)
end

function isl_stream_push_token(s, tok)
    ccall((:isl_stream_push_token, libisl), Cvoid, (Ptr{isl_stream}, Ptr{isl_token}), s, tok)
end

function isl_stream_flush_tokens(s)
    ccall((:isl_stream_flush_tokens, libisl), Cvoid, (Ptr{isl_stream},), s)
end

function isl_stream_eat_if_available(s, type)
    ccall((:isl_stream_eat_if_available, libisl), Cint, (Ptr{isl_stream}, Cint), s, type)
end

function isl_stream_read_ident_if_available(s)
    ccall((:isl_stream_read_ident_if_available, libisl), Ptr{Cchar}, (Ptr{isl_stream},), s)
end

function isl_stream_eat(s, type)
    ccall((:isl_stream_eat, libisl), Cint, (Ptr{isl_stream}, Cint), s, type)
end

function isl_stream_is_empty(s)
    ccall((:isl_stream_is_empty, libisl), Cint, (Ptr{isl_stream},), s)
end

function isl_stream_skip_line(s)
    ccall((:isl_stream_skip_line, libisl), Cint, (Ptr{isl_stream},), s)
end

function isl_stream_register_keyword(s, name)
    ccall((:isl_stream_register_keyword, libisl), isl_token_type, (Ptr{isl_stream}, Ptr{Cchar}), s, name)
end

function isl_stream_read_obj(s)
    ccall((:isl_stream_read_obj, libisl), isl_obj, (Ptr{isl_stream},), s)
end

function isl_stream_read_val(s)
    ccall((:isl_stream_read_val, libisl), Ptr{isl_val}, (Ptr{isl_stream},), s)
end

function isl_stream_read_multi_aff(s)
    ccall((:isl_stream_read_multi_aff, libisl), Ptr{isl_multi_aff}, (Ptr{isl_stream},), s)
end

function isl_stream_read_map(s)
    ccall((:isl_stream_read_map, libisl), Ptr{isl_map}, (Ptr{isl_stream},), s)
end

function isl_stream_read_set(s)
    ccall((:isl_stream_read_set, libisl), Ptr{isl_set}, (Ptr{isl_stream},), s)
end

function isl_stream_read_pw_qpolynomial(s)
    ccall((:isl_stream_read_pw_qpolynomial, libisl), Ptr{isl_pw_qpolynomial}, (Ptr{isl_stream},), s)
end

function isl_stream_read_union_set(s)
    ccall((:isl_stream_read_union_set, libisl), Ptr{isl_union_set}, (Ptr{isl_stream},), s)
end

function isl_stream_read_union_map(s)
    ccall((:isl_stream_read_union_map, libisl), Ptr{isl_union_map}, (Ptr{isl_stream},), s)
end

function isl_stream_read_schedule(s)
    ccall((:isl_stream_read_schedule, libisl), Ptr{isl_schedule}, (Ptr{isl_stream},), s)
end

function isl_stream_yaml_read_start_mapping(s)
    ccall((:isl_stream_yaml_read_start_mapping, libisl), Cint, (Ptr{isl_stream},), s)
end

function isl_stream_yaml_read_end_mapping(s)
    ccall((:isl_stream_yaml_read_end_mapping, libisl), Cint, (Ptr{isl_stream},), s)
end

function isl_stream_yaml_read_start_sequence(s)
    ccall((:isl_stream_yaml_read_start_sequence, libisl), Cint, (Ptr{isl_stream},), s)
end

function isl_stream_yaml_read_end_sequence(s)
    ccall((:isl_stream_yaml_read_end_sequence, libisl), Cint, (Ptr{isl_stream},), s)
end

function isl_stream_yaml_next(s)
    ccall((:isl_stream_yaml_next, libisl), Cint, (Ptr{isl_stream},), s)
end

function isl_stride_info_get_ctx(si)
    ccall((:isl_stride_info_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_stride_info},), si)
end

function isl_stride_info_get_stride(si)
    ccall((:isl_stride_info_get_stride, libisl), Ptr{isl_val}, (Ptr{isl_stride_info},), si)
end

function isl_stride_info_get_offset(si)
    ccall((:isl_stride_info_get_offset, libisl), Ptr{isl_aff}, (Ptr{isl_stride_info},), si)
end

function isl_stride_info_free(si)
    ccall((:isl_stride_info_free, libisl), Ptr{isl_stride_info}, (Ptr{isl_stride_info},), si)
end

function isl_stride_info_copy(si)
    ccall((:isl_stride_info_copy, libisl), Ptr{isl_stride_info}, (Ptr{isl_stride_info},), si)
end

function isl_union_map_dim(umap, type)
    ccall((:isl_union_map_dim, libisl), isl_size, (Ptr{isl_union_map}, isl_dim_type), umap, type)
end

function isl_union_map_involves_dims(umap, type, first, n)
    ccall((:isl_union_map_involves_dims, libisl), isl_bool, (Ptr{isl_union_map}, isl_dim_type, Cuint, Cuint), umap, type, first, n)
end

function isl_union_map_get_dim_id(umap, type, pos)
    ccall((:isl_union_map_get_dim_id, libisl), Ptr{isl_id}, (Ptr{isl_union_map}, isl_dim_type, Cuint), umap, type, pos)
end

function isl_union_map_from_basic_map(bmap)
    ccall((:isl_union_map_from_basic_map, libisl), Ptr{isl_union_map}, (Ptr{isl_basic_map},), bmap)
end

function isl_union_map_from_map(map)
    ccall((:isl_union_map_from_map, libisl), Ptr{isl_union_map}, (Ptr{isl_map},), map)
end

function isl_union_map_empty_ctx(ctx)
    ccall((:isl_union_map_empty_ctx, libisl), Ptr{isl_union_map}, (Ptr{isl_ctx},), ctx)
end

function isl_union_map_empty_space(space)
    ccall((:isl_union_map_empty_space, libisl), Ptr{isl_union_map}, (Ptr{isl_space},), space)
end

function isl_union_map_empty(space)
    ccall((:isl_union_map_empty, libisl), Ptr{isl_union_map}, (Ptr{isl_space},), space)
end

function isl_union_map_copy(umap)
    ccall((:isl_union_map_copy, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_free(umap)
    ccall((:isl_union_map_free, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_get_ctx(umap)
    ccall((:isl_union_map_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_get_space(umap)
    ccall((:isl_union_map_get_space, libisl), Ptr{isl_space}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_reset_user(umap)
    ccall((:isl_union_map_reset_user, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_find_dim_by_name(umap, type, name)
    ccall((:isl_union_map_find_dim_by_name, libisl), Cint, (Ptr{isl_union_map}, isl_dim_type, Ptr{Cchar}), umap, type, name)
end

function isl_union_map_universe(umap)
    ccall((:isl_union_map_universe, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_params(umap)
    ccall((:isl_union_map_params, libisl), Ptr{isl_set}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_domain(umap)
    ccall((:isl_union_map_domain, libisl), Ptr{isl_union_set}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_range(umap)
    ccall((:isl_union_map_range, libisl), Ptr{isl_union_set}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_domain_map(umap)
    ccall((:isl_union_map_domain_map, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_domain_map_union_pw_multi_aff(umap)
    ccall((:isl_union_map_domain_map_union_pw_multi_aff, libisl), Ptr{isl_union_pw_multi_aff}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_range_map(umap)
    ccall((:isl_union_map_range_map, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_set_wrapped_domain_map(uset)
    ccall((:isl_union_set_wrapped_domain_map, libisl), Ptr{isl_union_map}, (Ptr{isl_union_set},), uset)
end

function isl_union_map_from_domain(uset)
    ccall((:isl_union_map_from_domain, libisl), Ptr{isl_union_map}, (Ptr{isl_union_set},), uset)
end

function isl_union_map_from_range(uset)
    ccall((:isl_union_map_from_range, libisl), Ptr{isl_union_map}, (Ptr{isl_union_set},), uset)
end

function isl_union_map_affine_hull(umap)
    ccall((:isl_union_map_affine_hull, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_polyhedral_hull(umap)
    ccall((:isl_union_map_polyhedral_hull, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_remove_redundancies(umap)
    ccall((:isl_union_map_remove_redundancies, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_simple_hull(umap)
    ccall((:isl_union_map_simple_hull, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_coalesce(umap)
    ccall((:isl_union_map_coalesce, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_compute_divs(umap)
    ccall((:isl_union_map_compute_divs, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_lexmin(umap)
    ccall((:isl_union_map_lexmin, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_lexmax(umap)
    ccall((:isl_union_map_lexmax, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_add_map(umap, map)
    ccall((:isl_union_map_add_map, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_map}), umap, map)
end

function isl_union_map_union(umap1, umap2)
    ccall((:isl_union_map_union, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap1, umap2)
end

function isl_union_map_subtract(umap1, umap2)
    ccall((:isl_union_map_subtract, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap1, umap2)
end

function isl_union_map_intersect(umap1, umap2)
    ccall((:isl_union_map_intersect, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap1, umap2)
end

function isl_union_map_intersect_params(umap, set)
    ccall((:isl_union_map_intersect_params, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_set}), umap, set)
end

function isl_union_map_product(umap1, umap2)
    ccall((:isl_union_map_product, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap1, umap2)
end

function isl_union_map_domain_product(umap1, umap2)
    ccall((:isl_union_map_domain_product, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap1, umap2)
end

function isl_union_map_flat_domain_product(umap1, umap2)
    ccall((:isl_union_map_flat_domain_product, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap1, umap2)
end

function isl_union_map_range_product(umap1, umap2)
    ccall((:isl_union_map_range_product, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap1, umap2)
end

function isl_union_map_flat_range_product(umap1, umap2)
    ccall((:isl_union_map_flat_range_product, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap1, umap2)
end

function isl_union_map_domain_factor_domain(umap)
    ccall((:isl_union_map_domain_factor_domain, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_domain_factor_range(umap)
    ccall((:isl_union_map_domain_factor_range, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_range_factor_domain(umap)
    ccall((:isl_union_map_range_factor_domain, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_range_factor_range(umap)
    ccall((:isl_union_map_range_factor_range, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_factor_domain(umap)
    ccall((:isl_union_map_factor_domain, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_factor_range(umap)
    ccall((:isl_union_map_factor_range, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_gist(umap, context)
    ccall((:isl_union_map_gist, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap, context)
end

function isl_union_map_gist_params(umap, set)
    ccall((:isl_union_map_gist_params, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_set}), umap, set)
end

function isl_union_map_gist_domain(umap, uset)
    ccall((:isl_union_map_gist_domain, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_set}), umap, uset)
end

function isl_union_map_gist_range(umap, uset)
    ccall((:isl_union_map_gist_range, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_set}), umap, uset)
end

function isl_union_map_intersect_domain(umap, uset)
    ccall((:isl_union_map_intersect_domain, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_set}), umap, uset)
end

function isl_union_map_intersect_range(umap, uset)
    ccall((:isl_union_map_intersect_range, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_set}), umap, uset)
end

function isl_union_map_intersect_domain_factor_range(umap, factor)
    ccall((:isl_union_map_intersect_domain_factor_range, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap, factor)
end

function isl_union_map_intersect_range_factor_domain(umap, factor)
    ccall((:isl_union_map_intersect_range_factor_domain, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap, factor)
end

function isl_union_map_intersect_range_factor_range(umap, factor)
    ccall((:isl_union_map_intersect_range_factor_range, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap, factor)
end

function isl_union_map_subtract_domain(umap, dom)
    ccall((:isl_union_map_subtract_domain, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_set}), umap, dom)
end

function isl_union_map_subtract_range(umap, dom)
    ccall((:isl_union_map_subtract_range, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_set}), umap, dom)
end

function isl_union_map_apply_domain(umap1, umap2)
    ccall((:isl_union_map_apply_domain, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap1, umap2)
end

function isl_union_map_apply_range(umap1, umap2)
    ccall((:isl_union_map_apply_range, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap1, umap2)
end

function isl_union_map_preimage_domain_multi_aff(umap, ma)
    ccall((:isl_union_map_preimage_domain_multi_aff, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_multi_aff}), umap, ma)
end

function isl_union_map_preimage_range_multi_aff(umap, ma)
    ccall((:isl_union_map_preimage_range_multi_aff, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_multi_aff}), umap, ma)
end

function isl_union_map_preimage_domain_pw_multi_aff(umap, pma)
    ccall((:isl_union_map_preimage_domain_pw_multi_aff, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_pw_multi_aff}), umap, pma)
end

function isl_union_map_preimage_range_pw_multi_aff(umap, pma)
    ccall((:isl_union_map_preimage_range_pw_multi_aff, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_pw_multi_aff}), umap, pma)
end

function isl_union_map_preimage_domain_multi_pw_aff(umap, mpa)
    ccall((:isl_union_map_preimage_domain_multi_pw_aff, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_multi_pw_aff}), umap, mpa)
end

function isl_union_map_preimage_domain_union_pw_multi_aff(umap, upma)
    ccall((:isl_union_map_preimage_domain_union_pw_multi_aff, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_pw_multi_aff}), umap, upma)
end

function isl_union_map_preimage_range_union_pw_multi_aff(umap, upma)
    ccall((:isl_union_map_preimage_range_union_pw_multi_aff, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_pw_multi_aff}), umap, upma)
end

function isl_union_map_reverse(umap)
    ccall((:isl_union_map_reverse, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_range_reverse(umap)
    ccall((:isl_union_map_range_reverse, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_from_domain_and_range(domain, range)
    ccall((:isl_union_map_from_domain_and_range, libisl), Ptr{isl_union_map}, (Ptr{isl_union_set}, Ptr{isl_union_set}), domain, range)
end

function isl_union_map_detect_equalities(umap)
    ccall((:isl_union_map_detect_equalities, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_deltas(umap)
    ccall((:isl_union_map_deltas, libisl), Ptr{isl_union_set}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_deltas_map(umap)
    ccall((:isl_union_map_deltas_map, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_set_identity(uset)
    ccall((:isl_union_set_identity, libisl), Ptr{isl_union_map}, (Ptr{isl_union_set},), uset)
end

function isl_union_map_project_out(umap, type, first, n)
    ccall((:isl_union_map_project_out, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, isl_dim_type, Cuint, Cuint), umap, type, first, n)
end

function isl_union_map_project_out_all_params(umap)
    ccall((:isl_union_map_project_out_all_params, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_remove_divs(bmap)
    ccall((:isl_union_map_remove_divs, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), bmap)
end

function isl_union_map_bind_range(umap, tuple)
    ccall((:isl_union_map_bind_range, libisl), Ptr{isl_union_set}, (Ptr{isl_union_map}, Ptr{isl_multi_id}), umap, tuple)
end

function isl_union_map_plain_is_empty(umap)
    ccall((:isl_union_map_plain_is_empty, libisl), isl_bool, (Ptr{isl_union_map},), umap)
end

function isl_union_map_is_empty(umap)
    ccall((:isl_union_map_is_empty, libisl), isl_bool, (Ptr{isl_union_map},), umap)
end

function isl_union_map_is_single_valued(umap)
    ccall((:isl_union_map_is_single_valued, libisl), isl_bool, (Ptr{isl_union_map},), umap)
end

function isl_union_map_plain_is_injective(umap)
    ccall((:isl_union_map_plain_is_injective, libisl), isl_bool, (Ptr{isl_union_map},), umap)
end

function isl_union_map_is_injective(umap)
    ccall((:isl_union_map_is_injective, libisl), isl_bool, (Ptr{isl_union_map},), umap)
end

function isl_union_map_is_bijective(umap)
    ccall((:isl_union_map_is_bijective, libisl), isl_bool, (Ptr{isl_union_map},), umap)
end

function isl_union_map_is_identity(umap)
    ccall((:isl_union_map_is_identity, libisl), isl_bool, (Ptr{isl_union_map},), umap)
end

function isl_union_map_is_subset(umap1, umap2)
    ccall((:isl_union_map_is_subset, libisl), isl_bool, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap1, umap2)
end

function isl_union_map_is_equal(umap1, umap2)
    ccall((:isl_union_map_is_equal, libisl), isl_bool, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap1, umap2)
end

function isl_union_map_is_disjoint(umap1, umap2)
    ccall((:isl_union_map_is_disjoint, libisl), isl_bool, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap1, umap2)
end

function isl_union_map_is_strict_subset(umap1, umap2)
    ccall((:isl_union_map_is_strict_subset, libisl), isl_bool, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap1, umap2)
end

function isl_union_map_get_hash(umap)
    ccall((:isl_union_map_get_hash, libisl), UInt32, (Ptr{isl_union_map},), umap)
end

function isl_union_map_n_map(umap)
    ccall((:isl_union_map_n_map, libisl), isl_size, (Ptr{isl_union_map},), umap)
end

function isl_union_map_foreach_map(umap, fn, user)
    ccall((:isl_union_map_foreach_map, libisl), isl_stat, (Ptr{isl_union_map}, Ptr{Cvoid}, Ptr{Cvoid}), umap, fn, user)
end

function isl_union_map_get_map_list(umap)
    ccall((:isl_union_map_get_map_list, libisl), Ptr{isl_map_list}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_every_map(umap, test, user)
    ccall((:isl_union_map_every_map, libisl), isl_bool, (Ptr{isl_union_map}, Ptr{Cvoid}, Ptr{Cvoid}), umap, test, user)
end

function isl_union_map_remove_map_if(umap, fn, user)
    ccall((:isl_union_map_remove_map_if, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{Cvoid}, Ptr{Cvoid}), umap, fn, user)
end

function isl_union_map_contains(umap, space)
    ccall((:isl_union_map_contains, libisl), isl_bool, (Ptr{isl_union_map}, Ptr{isl_space}), umap, space)
end

function isl_union_map_extract_map(umap, dim)
    ccall((:isl_union_map_extract_map, libisl), Ptr{isl_map}, (Ptr{isl_union_map}, Ptr{isl_space}), umap, dim)
end

function isl_union_map_isa_map(umap)
    ccall((:isl_union_map_isa_map, libisl), isl_bool, (Ptr{isl_union_map},), umap)
end

function isl_map_from_union_map(umap)
    ccall((:isl_map_from_union_map, libisl), Ptr{isl_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_sample(umap)
    ccall((:isl_union_map_sample, libisl), Ptr{isl_basic_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_fixed_power_val(umap, exp)
    ccall((:isl_union_map_fixed_power_val, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_val}), umap, exp)
end

function isl_union_map_power(umap, exact)
    ccall((:isl_union_map_power, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_bool}), umap, exact)
end

function isl_union_map_transitive_closure(umap, exact)
    ccall((:isl_union_map_transitive_closure, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_bool}), umap, exact)
end

function isl_union_map_lex_lt_union_map(umap1, umap2)
    ccall((:isl_union_map_lex_lt_union_map, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap1, umap2)
end

function isl_union_map_lex_le_union_map(umap1, umap2)
    ccall((:isl_union_map_lex_le_union_map, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap1, umap2)
end

function isl_union_map_lex_gt_union_map(umap1, umap2)
    ccall((:isl_union_map_lex_gt_union_map, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap1, umap2)
end

function isl_union_map_lex_ge_union_map(umap1, umap2)
    ccall((:isl_union_map_lex_ge_union_map, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_union_map}), umap1, umap2)
end

function isl_union_map_eq_at_multi_union_pw_aff(umap, mupa)
    ccall((:isl_union_map_eq_at_multi_union_pw_aff, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_multi_union_pw_aff}), umap, mupa)
end

function isl_union_map_lex_lt_at_multi_union_pw_aff(umap, mupa)
    ccall((:isl_union_map_lex_lt_at_multi_union_pw_aff, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_multi_union_pw_aff}), umap, mupa)
end

function isl_union_map_lex_gt_at_multi_union_pw_aff(umap, mupa)
    ccall((:isl_union_map_lex_gt_at_multi_union_pw_aff, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_multi_union_pw_aff}), umap, mupa)
end

function isl_union_map_read_from_file(ctx, input)
    ccall((:isl_union_map_read_from_file, libisl), Ptr{isl_union_map}, (Ptr{isl_ctx}, Ptr{Libc.FILE}), ctx, input)
end

function isl_union_map_read_from_str(ctx, str)
    ccall((:isl_union_map_read_from_str, libisl), Ptr{isl_union_map}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_union_map_to_str(umap)
    ccall((:isl_union_map_to_str, libisl), Ptr{Cchar}, (Ptr{isl_union_map},), umap)
end

function isl_printer_print_union_map(p, umap)
    ccall((:isl_printer_print_union_map, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_union_map}), p, umap)
end

function isl_union_map_dump(umap)
    ccall((:isl_union_map_dump, libisl), Cvoid, (Ptr{isl_union_map},), umap)
end

function isl_union_map_wrap(umap)
    ccall((:isl_union_map_wrap, libisl), Ptr{isl_union_set}, (Ptr{isl_union_map},), umap)
end

function isl_union_set_unwrap(uset)
    ccall((:isl_union_set_unwrap, libisl), Ptr{isl_union_map}, (Ptr{isl_union_set},), uset)
end

function isl_union_map_zip(umap)
    ccall((:isl_union_map_zip, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_curry(umap)
    ccall((:isl_union_map_curry, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_range_curry(umap)
    ccall((:isl_union_map_range_curry, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_uncurry(umap)
    ccall((:isl_union_map_uncurry, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map},), umap)
end

function isl_union_map_align_params(umap, model)
    ccall((:isl_union_map_align_params, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map}, Ptr{isl_space}), umap, model)
end

function isl_union_set_align_params(uset, model)
    ccall((:isl_union_set_align_params, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set}, Ptr{isl_space}), uset, model)
end

mutable struct isl_union_map_list end

function isl_union_map_list_get_ctx(list)
    ccall((:isl_union_map_list_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_union_map_list},), list)
end

function isl_union_map_list_from_union_map(el)
    ccall((:isl_union_map_list_from_union_map, libisl), Ptr{isl_union_map_list}, (Ptr{isl_union_map},), el)
end

function isl_union_map_list_alloc(ctx, n)
    ccall((:isl_union_map_list_alloc, libisl), Ptr{isl_union_map_list}, (Ptr{isl_ctx}, Cint), ctx, n)
end

function isl_union_map_list_copy(list)
    ccall((:isl_union_map_list_copy, libisl), Ptr{isl_union_map_list}, (Ptr{isl_union_map_list},), list)
end

function isl_union_map_list_free(list)
    ccall((:isl_union_map_list_free, libisl), Ptr{isl_union_map_list}, (Ptr{isl_union_map_list},), list)
end

function isl_union_map_list_add(list, el)
    ccall((:isl_union_map_list_add, libisl), Ptr{isl_union_map_list}, (Ptr{isl_union_map_list}, Ptr{isl_union_map}), list, el)
end

function isl_union_map_list_insert(list, pos, el)
    ccall((:isl_union_map_list_insert, libisl), Ptr{isl_union_map_list}, (Ptr{isl_union_map_list}, Cuint, Ptr{isl_union_map}), list, pos, el)
end

function isl_union_map_list_drop(list, first, n)
    ccall((:isl_union_map_list_drop, libisl), Ptr{isl_union_map_list}, (Ptr{isl_union_map_list}, Cuint, Cuint), list, first, n)
end

function isl_union_map_list_clear(list)
    ccall((:isl_union_map_list_clear, libisl), Ptr{isl_union_map_list}, (Ptr{isl_union_map_list},), list)
end

function isl_union_map_list_swap(list, pos1, pos2)
    ccall((:isl_union_map_list_swap, libisl), Ptr{isl_union_map_list}, (Ptr{isl_union_map_list}, Cuint, Cuint), list, pos1, pos2)
end

function isl_union_map_list_reverse(list)
    ccall((:isl_union_map_list_reverse, libisl), Ptr{isl_union_map_list}, (Ptr{isl_union_map_list},), list)
end

function isl_union_map_list_concat(list1, list2)
    ccall((:isl_union_map_list_concat, libisl), Ptr{isl_union_map_list}, (Ptr{isl_union_map_list}, Ptr{isl_union_map_list}), list1, list2)
end

function isl_union_map_list_size(list)
    ccall((:isl_union_map_list_size, libisl), isl_size, (Ptr{isl_union_map_list},), list)
end

function isl_union_map_list_n_union_map(list)
    ccall((:isl_union_map_list_n_union_map, libisl), isl_size, (Ptr{isl_union_map_list},), list)
end

function isl_union_map_list_get_at(list, index)
    ccall((:isl_union_map_list_get_at, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map_list}, Cint), list, index)
end

function isl_union_map_list_get_union_map(list, index)
    ccall((:isl_union_map_list_get_union_map, libisl), Ptr{isl_union_map}, (Ptr{isl_union_map_list}, Cint), list, index)
end

function isl_union_map_list_set_union_map(list, index, el)
    ccall((:isl_union_map_list_set_union_map, libisl), Ptr{isl_union_map_list}, (Ptr{isl_union_map_list}, Cint, Ptr{isl_union_map}), list, index, el)
end

function isl_union_map_list_foreach(list, fn, user)
    ccall((:isl_union_map_list_foreach, libisl), isl_stat, (Ptr{isl_union_map_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_union_map_list_map(list, fn, user)
    ccall((:isl_union_map_list_map, libisl), Ptr{isl_union_map_list}, (Ptr{isl_union_map_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_union_map_list_sort(list, cmp, user)
    ccall((:isl_union_map_list_sort, libisl), Ptr{isl_union_map_list}, (Ptr{isl_union_map_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, cmp, user)
end

function isl_union_map_list_foreach_scc(list, follows, follows_user, fn, fn_user)
    ccall((:isl_union_map_list_foreach_scc, libisl), isl_stat, (Ptr{isl_union_map_list}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), list, follows, follows_user, fn, fn_user)
end

function isl_union_map_list_to_str(list)
    ccall((:isl_union_map_list_to_str, libisl), Ptr{Cchar}, (Ptr{isl_union_map_list},), list)
end

function isl_printer_print_union_map_list(p, list)
    ccall((:isl_printer_print_union_map_list, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_union_map_list}), p, list)
end

function isl_union_map_list_dump(list)
    ccall((:isl_union_map_list_dump, libisl), Cvoid, (Ptr{isl_union_map_list},), list)
end

function isl_union_set_dim(uset, type)
    ccall((:isl_union_set_dim, libisl), isl_size, (Ptr{isl_union_set}, isl_dim_type), uset, type)
end

function isl_union_set_from_basic_set(bset)
    ccall((:isl_union_set_from_basic_set, libisl), Ptr{isl_union_set}, (Ptr{isl_basic_set},), bset)
end

function isl_union_set_from_set(set)
    ccall((:isl_union_set_from_set, libisl), Ptr{isl_union_set}, (Ptr{isl_set},), set)
end

function isl_union_set_empty_ctx(ctx)
    ccall((:isl_union_set_empty_ctx, libisl), Ptr{isl_union_set}, (Ptr{isl_ctx},), ctx)
end

function isl_union_set_empty_space(space)
    ccall((:isl_union_set_empty_space, libisl), Ptr{isl_union_set}, (Ptr{isl_space},), space)
end

function isl_union_set_empty(space)
    ccall((:isl_union_set_empty, libisl), Ptr{isl_union_set}, (Ptr{isl_space},), space)
end

function isl_union_set_copy(uset)
    ccall((:isl_union_set_copy, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_free(uset)
    ccall((:isl_union_set_free, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_get_ctx(uset)
    ccall((:isl_union_set_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_get_space(uset)
    ccall((:isl_union_set_get_space, libisl), Ptr{isl_space}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_reset_user(uset)
    ccall((:isl_union_set_reset_user, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_universe(uset)
    ccall((:isl_union_set_universe, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_params(uset)
    ccall((:isl_union_set_params, libisl), Ptr{isl_set}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_detect_equalities(uset)
    ccall((:isl_union_set_detect_equalities, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_affine_hull(uset)
    ccall((:isl_union_set_affine_hull, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_polyhedral_hull(uset)
    ccall((:isl_union_set_polyhedral_hull, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_remove_redundancies(uset)
    ccall((:isl_union_set_remove_redundancies, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_simple_hull(uset)
    ccall((:isl_union_set_simple_hull, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_coalesce(uset)
    ccall((:isl_union_set_coalesce, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_compute_divs(uset)
    ccall((:isl_union_set_compute_divs, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_lexmin(uset)
    ccall((:isl_union_set_lexmin, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_lexmax(uset)
    ccall((:isl_union_set_lexmax, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_add_set(uset, set)
    ccall((:isl_union_set_add_set, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set}, Ptr{isl_set}), uset, set)
end

function isl_union_set_union(uset1, uset2)
    ccall((:isl_union_set_union, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set}, Ptr{isl_union_set}), uset1, uset2)
end

function isl_union_set_subtract(uset1, uset2)
    ccall((:isl_union_set_subtract, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set}, Ptr{isl_union_set}), uset1, uset2)
end

function isl_union_set_intersect(uset1, uset2)
    ccall((:isl_union_set_intersect, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set}, Ptr{isl_union_set}), uset1, uset2)
end

function isl_union_set_intersect_params(uset, set)
    ccall((:isl_union_set_intersect_params, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set}, Ptr{isl_set}), uset, set)
end

function isl_union_set_product(uset1, uset2)
    ccall((:isl_union_set_product, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set}, Ptr{isl_union_set}), uset1, uset2)
end

function isl_union_set_gist(uset, context)
    ccall((:isl_union_set_gist, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set}, Ptr{isl_union_set}), uset, context)
end

function isl_union_set_gist_params(uset, set)
    ccall((:isl_union_set_gist_params, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set}, Ptr{isl_set}), uset, set)
end

function isl_union_set_apply(uset, umap)
    ccall((:isl_union_set_apply, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set}, Ptr{isl_union_map}), uset, umap)
end

function isl_union_set_preimage_multi_aff(uset, ma)
    ccall((:isl_union_set_preimage_multi_aff, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set}, Ptr{isl_multi_aff}), uset, ma)
end

function isl_union_set_preimage_pw_multi_aff(uset, pma)
    ccall((:isl_union_set_preimage_pw_multi_aff, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set}, Ptr{isl_pw_multi_aff}), uset, pma)
end

function isl_union_set_preimage_union_pw_multi_aff(uset, upma)
    ccall((:isl_union_set_preimage_union_pw_multi_aff, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set}, Ptr{isl_union_pw_multi_aff}), uset, upma)
end

function isl_union_set_project_out(uset, type, first, n)
    ccall((:isl_union_set_project_out, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set}, isl_dim_type, Cuint, Cuint), uset, type, first, n)
end

function isl_union_set_project_out_all_params(uset)
    ccall((:isl_union_set_project_out_all_params, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_remove_divs(bset)
    ccall((:isl_union_set_remove_divs, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set},), bset)
end

function isl_union_set_is_params(uset)
    ccall((:isl_union_set_is_params, libisl), isl_bool, (Ptr{isl_union_set},), uset)
end

function isl_union_set_is_empty(uset)
    ccall((:isl_union_set_is_empty, libisl), isl_bool, (Ptr{isl_union_set},), uset)
end

function isl_union_set_is_subset(uset1, uset2)
    ccall((:isl_union_set_is_subset, libisl), isl_bool, (Ptr{isl_union_set}, Ptr{isl_union_set}), uset1, uset2)
end

function isl_union_set_is_equal(uset1, uset2)
    ccall((:isl_union_set_is_equal, libisl), isl_bool, (Ptr{isl_union_set}, Ptr{isl_union_set}), uset1, uset2)
end

function isl_union_set_is_disjoint(uset1, uset2)
    ccall((:isl_union_set_is_disjoint, libisl), isl_bool, (Ptr{isl_union_set}, Ptr{isl_union_set}), uset1, uset2)
end

function isl_union_set_is_strict_subset(uset1, uset2)
    ccall((:isl_union_set_is_strict_subset, libisl), isl_bool, (Ptr{isl_union_set}, Ptr{isl_union_set}), uset1, uset2)
end

function isl_union_set_get_hash(uset)
    ccall((:isl_union_set_get_hash, libisl), UInt32, (Ptr{isl_union_set},), uset)
end

function isl_union_set_n_set(uset)
    ccall((:isl_union_set_n_set, libisl), isl_size, (Ptr{isl_union_set},), uset)
end

function isl_union_set_foreach_set(uset, fn, user)
    ccall((:isl_union_set_foreach_set, libisl), isl_stat, (Ptr{isl_union_set}, Ptr{Cvoid}, Ptr{Cvoid}), uset, fn, user)
end

function isl_union_set_every_set(uset, test, user)
    ccall((:isl_union_set_every_set, libisl), isl_bool, (Ptr{isl_union_set}, Ptr{Cvoid}, Ptr{Cvoid}), uset, test, user)
end

function isl_union_set_get_basic_set_list(uset)
    ccall((:isl_union_set_get_basic_set_list, libisl), Ptr{isl_basic_set_list}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_get_set_list(uset)
    ccall((:isl_union_set_get_set_list, libisl), Ptr{isl_set_list}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_contains(uset, space)
    ccall((:isl_union_set_contains, libisl), isl_bool, (Ptr{isl_union_set}, Ptr{isl_space}), uset, space)
end

function isl_union_set_extract_set(uset, dim)
    ccall((:isl_union_set_extract_set, libisl), Ptr{isl_set}, (Ptr{isl_union_set}, Ptr{isl_space}), uset, dim)
end

function isl_union_set_isa_set(uset)
    ccall((:isl_union_set_isa_set, libisl), isl_bool, (Ptr{isl_union_set},), uset)
end

function isl_set_from_union_set(uset)
    ccall((:isl_set_from_union_set, libisl), Ptr{isl_set}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_foreach_point(uset, fn, user)
    ccall((:isl_union_set_foreach_point, libisl), isl_stat, (Ptr{isl_union_set}, Ptr{Cvoid}, Ptr{Cvoid}), uset, fn, user)
end

function isl_union_set_sample(uset)
    ccall((:isl_union_set_sample, libisl), Ptr{isl_basic_set}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_sample_point(uset)
    ccall((:isl_union_set_sample_point, libisl), Ptr{isl_point}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_from_point(pnt)
    ccall((:isl_union_set_from_point, libisl), Ptr{isl_union_set}, (Ptr{isl_point},), pnt)
end

function isl_union_set_lift(uset)
    ccall((:isl_union_set_lift, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set},), uset)
end

function isl_union_set_lex_lt_union_set(uset1, uset2)
    ccall((:isl_union_set_lex_lt_union_set, libisl), Ptr{isl_union_map}, (Ptr{isl_union_set}, Ptr{isl_union_set}), uset1, uset2)
end

function isl_union_set_lex_le_union_set(uset1, uset2)
    ccall((:isl_union_set_lex_le_union_set, libisl), Ptr{isl_union_map}, (Ptr{isl_union_set}, Ptr{isl_union_set}), uset1, uset2)
end

function isl_union_set_lex_gt_union_set(uset1, uset2)
    ccall((:isl_union_set_lex_gt_union_set, libisl), Ptr{isl_union_map}, (Ptr{isl_union_set}, Ptr{isl_union_set}), uset1, uset2)
end

function isl_union_set_lex_ge_union_set(uset1, uset2)
    ccall((:isl_union_set_lex_ge_union_set, libisl), Ptr{isl_union_map}, (Ptr{isl_union_set}, Ptr{isl_union_set}), uset1, uset2)
end

function isl_union_set_coefficients(bset)
    ccall((:isl_union_set_coefficients, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set},), bset)
end

function isl_union_set_solutions(bset)
    ccall((:isl_union_set_solutions, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set},), bset)
end

function isl_union_set_read_from_file(ctx, input)
    ccall((:isl_union_set_read_from_file, libisl), Ptr{isl_union_set}, (Ptr{isl_ctx}, Ptr{Libc.FILE}), ctx, input)
end

function isl_union_set_read_from_str(ctx, str)
    ccall((:isl_union_set_read_from_str, libisl), Ptr{isl_union_set}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_union_set_to_str(uset)
    ccall((:isl_union_set_to_str, libisl), Ptr{Cchar}, (Ptr{isl_union_set},), uset)
end

function isl_printer_print_union_set(p, uset)
    ccall((:isl_printer_print_union_set, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_union_set}), p, uset)
end

function isl_union_set_dump(uset)
    ccall((:isl_union_set_dump, libisl), Cvoid, (Ptr{isl_union_set},), uset)
end

function isl_union_set_list_get_ctx(list)
    ccall((:isl_union_set_list_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_union_set_list},), list)
end

function isl_union_set_list_from_union_set(el)
    ccall((:isl_union_set_list_from_union_set, libisl), Ptr{isl_union_set_list}, (Ptr{isl_union_set},), el)
end

function isl_union_set_list_alloc(ctx, n)
    ccall((:isl_union_set_list_alloc, libisl), Ptr{isl_union_set_list}, (Ptr{isl_ctx}, Cint), ctx, n)
end

function isl_union_set_list_copy(list)
    ccall((:isl_union_set_list_copy, libisl), Ptr{isl_union_set_list}, (Ptr{isl_union_set_list},), list)
end

function isl_union_set_list_free(list)
    ccall((:isl_union_set_list_free, libisl), Ptr{isl_union_set_list}, (Ptr{isl_union_set_list},), list)
end

function isl_union_set_list_add(list, el)
    ccall((:isl_union_set_list_add, libisl), Ptr{isl_union_set_list}, (Ptr{isl_union_set_list}, Ptr{isl_union_set}), list, el)
end

function isl_union_set_list_insert(list, pos, el)
    ccall((:isl_union_set_list_insert, libisl), Ptr{isl_union_set_list}, (Ptr{isl_union_set_list}, Cuint, Ptr{isl_union_set}), list, pos, el)
end

function isl_union_set_list_drop(list, first, n)
    ccall((:isl_union_set_list_drop, libisl), Ptr{isl_union_set_list}, (Ptr{isl_union_set_list}, Cuint, Cuint), list, first, n)
end

function isl_union_set_list_clear(list)
    ccall((:isl_union_set_list_clear, libisl), Ptr{isl_union_set_list}, (Ptr{isl_union_set_list},), list)
end

function isl_union_set_list_swap(list, pos1, pos2)
    ccall((:isl_union_set_list_swap, libisl), Ptr{isl_union_set_list}, (Ptr{isl_union_set_list}, Cuint, Cuint), list, pos1, pos2)
end

function isl_union_set_list_reverse(list)
    ccall((:isl_union_set_list_reverse, libisl), Ptr{isl_union_set_list}, (Ptr{isl_union_set_list},), list)
end

function isl_union_set_list_concat(list1, list2)
    ccall((:isl_union_set_list_concat, libisl), Ptr{isl_union_set_list}, (Ptr{isl_union_set_list}, Ptr{isl_union_set_list}), list1, list2)
end

function isl_union_set_list_size(list)
    ccall((:isl_union_set_list_size, libisl), isl_size, (Ptr{isl_union_set_list},), list)
end

function isl_union_set_list_n_union_set(list)
    ccall((:isl_union_set_list_n_union_set, libisl), isl_size, (Ptr{isl_union_set_list},), list)
end

function isl_union_set_list_get_at(list, index)
    ccall((:isl_union_set_list_get_at, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set_list}, Cint), list, index)
end

function isl_union_set_list_get_union_set(list, index)
    ccall((:isl_union_set_list_get_union_set, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set_list}, Cint), list, index)
end

function isl_union_set_list_set_union_set(list, index, el)
    ccall((:isl_union_set_list_set_union_set, libisl), Ptr{isl_union_set_list}, (Ptr{isl_union_set_list}, Cint, Ptr{isl_union_set}), list, index, el)
end

function isl_union_set_list_foreach(list, fn, user)
    ccall((:isl_union_set_list_foreach, libisl), isl_stat, (Ptr{isl_union_set_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_union_set_list_map(list, fn, user)
    ccall((:isl_union_set_list_map, libisl), Ptr{isl_union_set_list}, (Ptr{isl_union_set_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_union_set_list_sort(list, cmp, user)
    ccall((:isl_union_set_list_sort, libisl), Ptr{isl_union_set_list}, (Ptr{isl_union_set_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, cmp, user)
end

function isl_union_set_list_foreach_scc(list, follows, follows_user, fn, fn_user)
    ccall((:isl_union_set_list_foreach_scc, libisl), isl_stat, (Ptr{isl_union_set_list}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), list, follows, follows_user, fn, fn_user)
end

function isl_union_set_list_to_str(list)
    ccall((:isl_union_set_list_to_str, libisl), Ptr{Cchar}, (Ptr{isl_union_set_list},), list)
end

function isl_printer_print_union_set_list(p, list)
    ccall((:isl_printer_print_union_set_list, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_union_set_list}), p, list)
end

function isl_union_set_list_dump(list)
    ccall((:isl_union_set_list_dump, libisl), Cvoid, (Ptr{isl_union_set_list},), list)
end

function isl_union_set_list_union(list)
    ccall((:isl_union_set_list_union, libisl), Ptr{isl_union_set}, (Ptr{isl_union_set_list},), list)
end

function isl_multi_val_get_ctx(multi)
    ccall((:isl_multi_val_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_multi_val},), multi)
end

function isl_multi_val_get_space(multi)
    ccall((:isl_multi_val_get_space, libisl), Ptr{isl_space}, (Ptr{isl_multi_val},), multi)
end

function isl_multi_val_get_domain_space(multi)
    ccall((:isl_multi_val_get_domain_space, libisl), Ptr{isl_space}, (Ptr{isl_multi_val},), multi)
end

mutable struct isl_val_list end

function isl_multi_val_from_val_list(space, list)
    ccall((:isl_multi_val_from_val_list, libisl), Ptr{isl_multi_val}, (Ptr{isl_space}, Ptr{isl_val_list}), space, list)
end

function isl_multi_val_copy(multi)
    ccall((:isl_multi_val_copy, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val},), multi)
end

function isl_multi_val_free(multi)
    ccall((:isl_multi_val_free, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val},), multi)
end

function isl_multi_val_plain_is_equal(multi1, multi2)
    ccall((:isl_multi_val_plain_is_equal, libisl), isl_bool, (Ptr{isl_multi_val}, Ptr{isl_multi_val}), multi1, multi2)
end

function isl_multi_val_reset_user(multi)
    ccall((:isl_multi_val_reset_user, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val},), multi)
end

function isl_multi_val_size(multi)
    ccall((:isl_multi_val_size, libisl), isl_size, (Ptr{isl_multi_val},), multi)
end

function isl_multi_val_get_at(multi, pos)
    ccall((:isl_multi_val_get_at, libisl), Ptr{isl_val}, (Ptr{isl_multi_val}, Cint), multi, pos)
end

function isl_multi_val_get_val(multi, pos)
    ccall((:isl_multi_val_get_val, libisl), Ptr{isl_val}, (Ptr{isl_multi_val}, Cint), multi, pos)
end

function isl_multi_val_set_at(multi, pos, el)
    ccall((:isl_multi_val_set_at, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, Cint, Ptr{isl_val}), multi, pos, el)
end

function isl_multi_val_set_val(multi, pos, el)
    ccall((:isl_multi_val_set_val, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, Cint, Ptr{isl_val}), multi, pos, el)
end

function isl_multi_val_range_splice(multi1, pos, multi2)
    ccall((:isl_multi_val_range_splice, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, Cuint, Ptr{isl_multi_val}), multi1, pos, multi2)
end

function isl_multi_val_flatten_range(multi)
    ccall((:isl_multi_val_flatten_range, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val},), multi)
end

function isl_multi_val_flat_range_product(multi1, multi2)
    ccall((:isl_multi_val_flat_range_product, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, Ptr{isl_multi_val}), multi1, multi2)
end

function isl_multi_val_range_product(multi1, multi2)
    ccall((:isl_multi_val_range_product, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, Ptr{isl_multi_val}), multi1, multi2)
end

function isl_multi_val_factor_range(multi)
    ccall((:isl_multi_val_factor_range, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val},), multi)
end

function isl_multi_val_range_is_wrapping(multi)
    ccall((:isl_multi_val_range_is_wrapping, libisl), isl_bool, (Ptr{isl_multi_val},), multi)
end

function isl_multi_val_range_factor_domain(multi)
    ccall((:isl_multi_val_range_factor_domain, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val},), multi)
end

function isl_multi_val_range_factor_range(multi)
    ccall((:isl_multi_val_range_factor_range, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val},), multi)
end

function isl_multi_val_align_params(multi, model)
    ccall((:isl_multi_val_align_params, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, Ptr{isl_space}), multi, model)
end

function isl_multi_val_from_range(multi)
    ccall((:isl_multi_val_from_range, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val},), multi)
end

function isl_multi_val_scale_val(multi, v)
    ccall((:isl_multi_val_scale_val, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, Ptr{isl_val}), multi, v)
end

function isl_multi_val_scale_down_val(multi, v)
    ccall((:isl_multi_val_scale_down_val, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, Ptr{isl_val}), multi, v)
end

function isl_multi_val_scale_multi_val(multi, mv)
    ccall((:isl_multi_val_scale_multi_val, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, Ptr{isl_multi_val}), multi, mv)
end

function isl_multi_val_scale_down_multi_val(multi, mv)
    ccall((:isl_multi_val_scale_down_multi_val, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, Ptr{isl_multi_val}), multi, mv)
end

function isl_multi_val_mod_multi_val(multi, mv)
    ccall((:isl_multi_val_mod_multi_val, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, Ptr{isl_multi_val}), multi, mv)
end

function isl_multi_val_add(multi1, multi2)
    ccall((:isl_multi_val_add, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, Ptr{isl_multi_val}), multi1, multi2)
end

function isl_multi_val_sub(multi1, multi2)
    ccall((:isl_multi_val_sub, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, Ptr{isl_multi_val}), multi1, multi2)
end

function isl_multi_val_neg(multi)
    ccall((:isl_multi_val_neg, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val},), multi)
end

function isl_multi_val_zero(space)
    ccall((:isl_multi_val_zero, libisl), Ptr{isl_multi_val}, (Ptr{isl_space},), space)
end

function isl_multi_val_involves_nan(multi)
    ccall((:isl_multi_val_involves_nan, libisl), isl_bool, (Ptr{isl_multi_val},), multi)
end

function isl_multi_val_dim(multi, type)
    ccall((:isl_multi_val_dim, libisl), isl_size, (Ptr{isl_multi_val}, isl_dim_type), multi, type)
end

function isl_multi_val_drop_dims(multi, type, first, n)
    ccall((:isl_multi_val_drop_dims, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, isl_dim_type, Cuint, Cuint), multi, type, first, n)
end

function isl_multi_val_involves_dims(multi, type, first, n)
    ccall((:isl_multi_val_involves_dims, libisl), isl_bool, (Ptr{isl_multi_val}, isl_dim_type, Cuint, Cuint), multi, type, first, n)
end

function isl_multi_val_insert_dims(multi, type, first, n)
    ccall((:isl_multi_val_insert_dims, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, isl_dim_type, Cuint, Cuint), multi, type, first, n)
end

function isl_multi_val_add_dims(multi, type, n)
    ccall((:isl_multi_val_add_dims, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, isl_dim_type, Cuint), multi, type, n)
end

function isl_multi_val_project_domain_on_params(multi)
    ccall((:isl_multi_val_project_domain_on_params, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val},), multi)
end

function isl_multi_val_find_dim_by_name(multi, type, name)
    ccall((:isl_multi_val_find_dim_by_name, libisl), Cint, (Ptr{isl_multi_val}, isl_dim_type, Ptr{Cchar}), multi, type, name)
end

function isl_multi_val_find_dim_by_id(multi, type, id)
    ccall((:isl_multi_val_find_dim_by_id, libisl), Cint, (Ptr{isl_multi_val}, isl_dim_type, Ptr{isl_id}), multi, type, id)
end

function isl_multi_val_get_dim_id(multi, type, pos)
    ccall((:isl_multi_val_get_dim_id, libisl), Ptr{isl_id}, (Ptr{isl_multi_val}, isl_dim_type, Cuint), multi, type, pos)
end

function isl_multi_val_set_dim_name(multi, type, pos, s)
    ccall((:isl_multi_val_set_dim_name, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, isl_dim_type, Cuint, Ptr{Cchar}), multi, type, pos, s)
end

function isl_multi_val_set_dim_id(multi, type, pos, id)
    ccall((:isl_multi_val_set_dim_id, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, isl_dim_type, Cuint, Ptr{isl_id}), multi, type, pos, id)
end

function isl_multi_val_get_tuple_name(multi, type)
    ccall((:isl_multi_val_get_tuple_name, libisl), Ptr{Cchar}, (Ptr{isl_multi_val}, isl_dim_type), multi, type)
end

function isl_multi_val_has_tuple_id(multi, type)
    ccall((:isl_multi_val_has_tuple_id, libisl), isl_bool, (Ptr{isl_multi_val}, isl_dim_type), multi, type)
end

function isl_multi_val_get_tuple_id(multi, type)
    ccall((:isl_multi_val_get_tuple_id, libisl), Ptr{isl_id}, (Ptr{isl_multi_val}, isl_dim_type), multi, type)
end

function isl_multi_val_set_tuple_name(multi, type, s)
    ccall((:isl_multi_val_set_tuple_name, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, isl_dim_type, Ptr{Cchar}), multi, type, s)
end

function isl_multi_val_set_tuple_id(multi, type, id)
    ccall((:isl_multi_val_set_tuple_id, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, isl_dim_type, Ptr{isl_id}), multi, type, id)
end

function isl_multi_val_reset_tuple_id(multi, type)
    ccall((:isl_multi_val_reset_tuple_id, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, isl_dim_type), multi, type)
end

function isl_multi_val_product(multi1, multi2)
    ccall((:isl_multi_val_product, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, Ptr{isl_multi_val}), multi1, multi2)
end

function isl_multi_val_splice(multi1, in_pos, out_pos, multi2)
    ccall((:isl_multi_val_splice, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, Cuint, Cuint, Ptr{isl_multi_val}), multi1, in_pos, out_pos, multi2)
end

function isl_val_zero(ctx)
    ccall((:isl_val_zero, libisl), Ptr{isl_val}, (Ptr{isl_ctx},), ctx)
end

function isl_val_one(ctx)
    ccall((:isl_val_one, libisl), Ptr{isl_val}, (Ptr{isl_ctx},), ctx)
end

function isl_val_negone(ctx)
    ccall((:isl_val_negone, libisl), Ptr{isl_val}, (Ptr{isl_ctx},), ctx)
end

function isl_val_nan(ctx)
    ccall((:isl_val_nan, libisl), Ptr{isl_val}, (Ptr{isl_ctx},), ctx)
end

function isl_val_infty(ctx)
    ccall((:isl_val_infty, libisl), Ptr{isl_val}, (Ptr{isl_ctx},), ctx)
end

function isl_val_neginfty(ctx)
    ccall((:isl_val_neginfty, libisl), Ptr{isl_val}, (Ptr{isl_ctx},), ctx)
end

function isl_val_int_from_si(ctx, i)
    ccall((:isl_val_int_from_si, libisl), Ptr{isl_val}, (Ptr{isl_ctx}, Clong), ctx, i)
end

function isl_val_int_from_ui(ctx, u)
    ccall((:isl_val_int_from_ui, libisl), Ptr{isl_val}, (Ptr{isl_ctx}, Culong), ctx, u)
end

function isl_val_int_from_chunks(ctx, n, size, chunks)
    ccall((:isl_val_int_from_chunks, libisl), Ptr{isl_val}, (Ptr{isl_ctx}, Csize_t, Csize_t, Ptr{Cvoid}), ctx, n, size, chunks)
end

function isl_val_copy(v)
    ccall((:isl_val_copy, libisl), Ptr{isl_val}, (Ptr{isl_val},), v)
end

function isl_val_free(v)
    ccall((:isl_val_free, libisl), Ptr{isl_val}, (Ptr{isl_val},), v)
end

function isl_val_get_ctx(val)
    ccall((:isl_val_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_val},), val)
end

function isl_val_get_hash(val)
    ccall((:isl_val_get_hash, libisl), UInt32, (Ptr{isl_val},), val)
end

function isl_val_get_num_si(v)
    ccall((:isl_val_get_num_si, libisl), Clong, (Ptr{isl_val},), v)
end

function isl_val_get_den_si(v)
    ccall((:isl_val_get_den_si, libisl), Clong, (Ptr{isl_val},), v)
end

function isl_val_get_den_val(v)
    ccall((:isl_val_get_den_val, libisl), Ptr{isl_val}, (Ptr{isl_val},), v)
end

function isl_val_get_d(v)
    ccall((:isl_val_get_d, libisl), Cdouble, (Ptr{isl_val},), v)
end

function isl_val_n_abs_num_chunks(v, size)
    ccall((:isl_val_n_abs_num_chunks, libisl), isl_size, (Ptr{isl_val}, Csize_t), v, size)
end

function isl_val_get_abs_num_chunks(v, size, chunks)
    ccall((:isl_val_get_abs_num_chunks, libisl), isl_stat, (Ptr{isl_val}, Csize_t, Ptr{Cvoid}), v, size, chunks)
end

function isl_val_set_si(v, i)
    ccall((:isl_val_set_si, libisl), Ptr{isl_val}, (Ptr{isl_val}, Clong), v, i)
end

function isl_val_abs(v)
    ccall((:isl_val_abs, libisl), Ptr{isl_val}, (Ptr{isl_val},), v)
end

function isl_val_neg(v)
    ccall((:isl_val_neg, libisl), Ptr{isl_val}, (Ptr{isl_val},), v)
end

function isl_val_inv(v)
    ccall((:isl_val_inv, libisl), Ptr{isl_val}, (Ptr{isl_val},), v)
end

function isl_val_floor(v)
    ccall((:isl_val_floor, libisl), Ptr{isl_val}, (Ptr{isl_val},), v)
end

function isl_val_ceil(v)
    ccall((:isl_val_ceil, libisl), Ptr{isl_val}, (Ptr{isl_val},), v)
end

function isl_val_trunc(v)
    ccall((:isl_val_trunc, libisl), Ptr{isl_val}, (Ptr{isl_val},), v)
end

function isl_val_2exp(v)
    ccall((:isl_val_2exp, libisl), Ptr{isl_val}, (Ptr{isl_val},), v)
end

function isl_val_pow2(v)
    ccall((:isl_val_pow2, libisl), Ptr{isl_val}, (Ptr{isl_val},), v)
end

function isl_val_min(v1, v2)
    ccall((:isl_val_min, libisl), Ptr{isl_val}, (Ptr{isl_val}, Ptr{isl_val}), v1, v2)
end

function isl_val_max(v1, v2)
    ccall((:isl_val_max, libisl), Ptr{isl_val}, (Ptr{isl_val}, Ptr{isl_val}), v1, v2)
end

function isl_val_add(v1, v2)
    ccall((:isl_val_add, libisl), Ptr{isl_val}, (Ptr{isl_val}, Ptr{isl_val}), v1, v2)
end

function isl_val_add_ui(v1, v2)
    ccall((:isl_val_add_ui, libisl), Ptr{isl_val}, (Ptr{isl_val}, Culong), v1, v2)
end

function isl_val_sub(v1, v2)
    ccall((:isl_val_sub, libisl), Ptr{isl_val}, (Ptr{isl_val}, Ptr{isl_val}), v1, v2)
end

function isl_val_sub_ui(v1, v2)
    ccall((:isl_val_sub_ui, libisl), Ptr{isl_val}, (Ptr{isl_val}, Culong), v1, v2)
end

function isl_val_mul(v1, v2)
    ccall((:isl_val_mul, libisl), Ptr{isl_val}, (Ptr{isl_val}, Ptr{isl_val}), v1, v2)
end

function isl_val_mul_ui(v1, v2)
    ccall((:isl_val_mul_ui, libisl), Ptr{isl_val}, (Ptr{isl_val}, Culong), v1, v2)
end

function isl_val_div(v1, v2)
    ccall((:isl_val_div, libisl), Ptr{isl_val}, (Ptr{isl_val}, Ptr{isl_val}), v1, v2)
end

function isl_val_div_ui(v1, v2)
    ccall((:isl_val_div_ui, libisl), Ptr{isl_val}, (Ptr{isl_val}, Culong), v1, v2)
end

function isl_val_mod(v1, v2)
    ccall((:isl_val_mod, libisl), Ptr{isl_val}, (Ptr{isl_val}, Ptr{isl_val}), v1, v2)
end

function isl_val_gcd(v1, v2)
    ccall((:isl_val_gcd, libisl), Ptr{isl_val}, (Ptr{isl_val}, Ptr{isl_val}), v1, v2)
end

function isl_val_gcdext(v1, v2, x, y)
    ccall((:isl_val_gcdext, libisl), Ptr{isl_val}, (Ptr{isl_val}, Ptr{isl_val}, Ptr{Ptr{isl_val}}, Ptr{Ptr{isl_val}}), v1, v2, x, y)
end

function isl_val_sgn(v)
    ccall((:isl_val_sgn, libisl), Cint, (Ptr{isl_val},), v)
end

function isl_val_is_zero(v)
    ccall((:isl_val_is_zero, libisl), isl_bool, (Ptr{isl_val},), v)
end

function isl_val_is_one(v)
    ccall((:isl_val_is_one, libisl), isl_bool, (Ptr{isl_val},), v)
end

function isl_val_is_negone(v)
    ccall((:isl_val_is_negone, libisl), isl_bool, (Ptr{isl_val},), v)
end

function isl_val_is_nonneg(v)
    ccall((:isl_val_is_nonneg, libisl), isl_bool, (Ptr{isl_val},), v)
end

function isl_val_is_nonpos(v)
    ccall((:isl_val_is_nonpos, libisl), isl_bool, (Ptr{isl_val},), v)
end

function isl_val_is_pos(v)
    ccall((:isl_val_is_pos, libisl), isl_bool, (Ptr{isl_val},), v)
end

function isl_val_is_neg(v)
    ccall((:isl_val_is_neg, libisl), isl_bool, (Ptr{isl_val},), v)
end

function isl_val_is_int(v)
    ccall((:isl_val_is_int, libisl), isl_bool, (Ptr{isl_val},), v)
end

function isl_val_is_rat(v)
    ccall((:isl_val_is_rat, libisl), isl_bool, (Ptr{isl_val},), v)
end

function isl_val_is_nan(v)
    ccall((:isl_val_is_nan, libisl), isl_bool, (Ptr{isl_val},), v)
end

function isl_val_is_infty(v)
    ccall((:isl_val_is_infty, libisl), isl_bool, (Ptr{isl_val},), v)
end

function isl_val_is_neginfty(v)
    ccall((:isl_val_is_neginfty, libisl), isl_bool, (Ptr{isl_val},), v)
end

function isl_val_cmp_si(v, i)
    ccall((:isl_val_cmp_si, libisl), Cint, (Ptr{isl_val}, Clong), v, i)
end

function isl_val_lt(v1, v2)
    ccall((:isl_val_lt, libisl), isl_bool, (Ptr{isl_val}, Ptr{isl_val}), v1, v2)
end

function isl_val_le(v1, v2)
    ccall((:isl_val_le, libisl), isl_bool, (Ptr{isl_val}, Ptr{isl_val}), v1, v2)
end

function isl_val_gt(v1, v2)
    ccall((:isl_val_gt, libisl), isl_bool, (Ptr{isl_val}, Ptr{isl_val}), v1, v2)
end

function isl_val_gt_si(v, i)
    ccall((:isl_val_gt_si, libisl), isl_bool, (Ptr{isl_val}, Clong), v, i)
end

function isl_val_ge(v1, v2)
    ccall((:isl_val_ge, libisl), isl_bool, (Ptr{isl_val}, Ptr{isl_val}), v1, v2)
end

function isl_val_eq(v1, v2)
    ccall((:isl_val_eq, libisl), isl_bool, (Ptr{isl_val}, Ptr{isl_val}), v1, v2)
end

function isl_val_ne(v1, v2)
    ccall((:isl_val_ne, libisl), isl_bool, (Ptr{isl_val}, Ptr{isl_val}), v1, v2)
end

function isl_val_abs_eq(v1, v2)
    ccall((:isl_val_abs_eq, libisl), isl_bool, (Ptr{isl_val}, Ptr{isl_val}), v1, v2)
end

function isl_val_is_divisible_by(v1, v2)
    ccall((:isl_val_is_divisible_by, libisl), isl_bool, (Ptr{isl_val}, Ptr{isl_val}), v1, v2)
end

function isl_val_read_from_str(ctx, str)
    ccall((:isl_val_read_from_str, libisl), Ptr{isl_val}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_printer_print_val(p, v)
    ccall((:isl_printer_print_val, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_val}), p, v)
end

function isl_val_dump(v)
    ccall((:isl_val_dump, libisl), Cvoid, (Ptr{isl_val},), v)
end

function isl_val_to_str(v)
    ccall((:isl_val_to_str, libisl), Ptr{Cchar}, (Ptr{isl_val},), v)
end

function isl_multi_val_add_val(mv, v)
    ccall((:isl_multi_val_add_val, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, Ptr{isl_val}), mv, v)
end

function isl_multi_val_mod_val(mv, v)
    ccall((:isl_multi_val_mod_val, libisl), Ptr{isl_multi_val}, (Ptr{isl_multi_val}, Ptr{isl_val}), mv, v)
end

function isl_multi_val_read_from_str(ctx, str)
    ccall((:isl_multi_val_read_from_str, libisl), Ptr{isl_multi_val}, (Ptr{isl_ctx}, Ptr{Cchar}), ctx, str)
end

function isl_printer_print_multi_val(p, mv)
    ccall((:isl_printer_print_multi_val, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_multi_val}), p, mv)
end

function isl_multi_val_dump(mv)
    ccall((:isl_multi_val_dump, libisl), Cvoid, (Ptr{isl_multi_val},), mv)
end

function isl_multi_val_to_str(mv)
    ccall((:isl_multi_val_to_str, libisl), Ptr{Cchar}, (Ptr{isl_multi_val},), mv)
end

function isl_val_list_get_ctx(list)
    ccall((:isl_val_list_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_val_list},), list)
end

function isl_val_list_from_val(el)
    ccall((:isl_val_list_from_val, libisl), Ptr{isl_val_list}, (Ptr{isl_val},), el)
end

function isl_val_list_alloc(ctx, n)
    ccall((:isl_val_list_alloc, libisl), Ptr{isl_val_list}, (Ptr{isl_ctx}, Cint), ctx, n)
end

function isl_val_list_copy(list)
    ccall((:isl_val_list_copy, libisl), Ptr{isl_val_list}, (Ptr{isl_val_list},), list)
end

function isl_val_list_free(list)
    ccall((:isl_val_list_free, libisl), Ptr{isl_val_list}, (Ptr{isl_val_list},), list)
end

function isl_val_list_add(list, el)
    ccall((:isl_val_list_add, libisl), Ptr{isl_val_list}, (Ptr{isl_val_list}, Ptr{isl_val}), list, el)
end

function isl_val_list_insert(list, pos, el)
    ccall((:isl_val_list_insert, libisl), Ptr{isl_val_list}, (Ptr{isl_val_list}, Cuint, Ptr{isl_val}), list, pos, el)
end

function isl_val_list_drop(list, first, n)
    ccall((:isl_val_list_drop, libisl), Ptr{isl_val_list}, (Ptr{isl_val_list}, Cuint, Cuint), list, first, n)
end

function isl_val_list_clear(list)
    ccall((:isl_val_list_clear, libisl), Ptr{isl_val_list}, (Ptr{isl_val_list},), list)
end

function isl_val_list_swap(list, pos1, pos2)
    ccall((:isl_val_list_swap, libisl), Ptr{isl_val_list}, (Ptr{isl_val_list}, Cuint, Cuint), list, pos1, pos2)
end

function isl_val_list_reverse(list)
    ccall((:isl_val_list_reverse, libisl), Ptr{isl_val_list}, (Ptr{isl_val_list},), list)
end

function isl_val_list_concat(list1, list2)
    ccall((:isl_val_list_concat, libisl), Ptr{isl_val_list}, (Ptr{isl_val_list}, Ptr{isl_val_list}), list1, list2)
end

function isl_val_list_size(list)
    ccall((:isl_val_list_size, libisl), isl_size, (Ptr{isl_val_list},), list)
end

function isl_val_list_n_val(list)
    ccall((:isl_val_list_n_val, libisl), isl_size, (Ptr{isl_val_list},), list)
end

function isl_val_list_get_at(list, index)
    ccall((:isl_val_list_get_at, libisl), Ptr{isl_val}, (Ptr{isl_val_list}, Cint), list, index)
end

function isl_val_list_get_val(list, index)
    ccall((:isl_val_list_get_val, libisl), Ptr{isl_val}, (Ptr{isl_val_list}, Cint), list, index)
end

function isl_val_list_set_val(list, index, el)
    ccall((:isl_val_list_set_val, libisl), Ptr{isl_val_list}, (Ptr{isl_val_list}, Cint, Ptr{isl_val}), list, index, el)
end

function isl_val_list_foreach(list, fn, user)
    ccall((:isl_val_list_foreach, libisl), isl_stat, (Ptr{isl_val_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_val_list_map(list, fn, user)
    ccall((:isl_val_list_map, libisl), Ptr{isl_val_list}, (Ptr{isl_val_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, fn, user)
end

function isl_val_list_sort(list, cmp, user)
    ccall((:isl_val_list_sort, libisl), Ptr{isl_val_list}, (Ptr{isl_val_list}, Ptr{Cvoid}, Ptr{Cvoid}), list, cmp, user)
end

function isl_val_list_foreach_scc(list, follows, follows_user, fn, fn_user)
    ccall((:isl_val_list_foreach_scc, libisl), isl_stat, (Ptr{isl_val_list}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}), list, follows, follows_user, fn, fn_user)
end

function isl_val_list_to_str(list)
    ccall((:isl_val_list_to_str, libisl), Ptr{Cchar}, (Ptr{isl_val_list},), list)
end

function isl_printer_print_val_list(p, list)
    ccall((:isl_printer_print_val_list, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_val_list}), p, list)
end

function isl_val_list_dump(list)
    ccall((:isl_val_list_dump, libisl), Cvoid, (Ptr{isl_val_list},), list)
end

function isl_vec_alloc(ctx, size)
    ccall((:isl_vec_alloc, libisl), Ptr{isl_vec}, (Ptr{isl_ctx}, Cuint), ctx, size)
end

function isl_vec_zero(ctx, size)
    ccall((:isl_vec_zero, libisl), Ptr{isl_vec}, (Ptr{isl_ctx}, Cuint), ctx, size)
end

function isl_vec_copy(vec)
    ccall((:isl_vec_copy, libisl), Ptr{isl_vec}, (Ptr{isl_vec},), vec)
end

function isl_vec_free(vec)
    ccall((:isl_vec_free, libisl), Ptr{isl_vec}, (Ptr{isl_vec},), vec)
end

function isl_vec_get_ctx(vec)
    ccall((:isl_vec_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_vec},), vec)
end

function isl_vec_size(vec)
    ccall((:isl_vec_size, libisl), isl_size, (Ptr{isl_vec},), vec)
end

function isl_vec_get_element_val(vec, pos)
    ccall((:isl_vec_get_element_val, libisl), Ptr{isl_val}, (Ptr{isl_vec}, Cint), vec, pos)
end

function isl_vec_set_element_si(vec, pos, v)
    ccall((:isl_vec_set_element_si, libisl), Ptr{isl_vec}, (Ptr{isl_vec}, Cint, Cint), vec, pos, v)
end

function isl_vec_set_element_val(vec, pos, v)
    ccall((:isl_vec_set_element_val, libisl), Ptr{isl_vec}, (Ptr{isl_vec}, Cint, Ptr{isl_val}), vec, pos, v)
end

function isl_vec_is_equal(vec1, vec2)
    ccall((:isl_vec_is_equal, libisl), isl_bool, (Ptr{isl_vec}, Ptr{isl_vec}), vec1, vec2)
end

function isl_vec_cmp_element(vec1, vec2, pos)
    ccall((:isl_vec_cmp_element, libisl), Cint, (Ptr{isl_vec}, Ptr{isl_vec}, Cint), vec1, vec2, pos)
end

function isl_vec_dump(vec)
    ccall((:isl_vec_dump, libisl), Cvoid, (Ptr{isl_vec},), vec)
end

function isl_printer_print_vec(printer, vec)
    ccall((:isl_printer_print_vec, libisl), Ptr{isl_printer}, (Ptr{isl_printer}, Ptr{isl_vec}), printer, vec)
end

function isl_vec_ceil(vec)
    ccall((:isl_vec_ceil, libisl), Ptr{isl_vec}, (Ptr{isl_vec},), vec)
end

function isl_vec_normalize(vec)
    ccall((:isl_vec_normalize, libisl), Ptr{isl_vec}, (Ptr{isl_vec},), vec)
end

function isl_vec_set_si(vec, v)
    ccall((:isl_vec_set_si, libisl), Ptr{isl_vec}, (Ptr{isl_vec}, Cint), vec, v)
end

function isl_vec_set_val(vec, v)
    ccall((:isl_vec_set_val, libisl), Ptr{isl_vec}, (Ptr{isl_vec}, Ptr{isl_val}), vec, v)
end

function isl_vec_clr(vec)
    ccall((:isl_vec_clr, libisl), Ptr{isl_vec}, (Ptr{isl_vec},), vec)
end

function isl_vec_neg(vec)
    ccall((:isl_vec_neg, libisl), Ptr{isl_vec}, (Ptr{isl_vec},), vec)
end

function isl_vec_add(vec1, vec2)
    ccall((:isl_vec_add, libisl), Ptr{isl_vec}, (Ptr{isl_vec}, Ptr{isl_vec}), vec1, vec2)
end

function isl_vec_extend(vec, size)
    ccall((:isl_vec_extend, libisl), Ptr{isl_vec}, (Ptr{isl_vec}, Cuint), vec, size)
end

function isl_vec_zero_extend(vec, size)
    ccall((:isl_vec_zero_extend, libisl), Ptr{isl_vec}, (Ptr{isl_vec}, Cuint), vec, size)
end

function isl_vec_concat(vec1, vec2)
    ccall((:isl_vec_concat, libisl), Ptr{isl_vec}, (Ptr{isl_vec}, Ptr{isl_vec}), vec1, vec2)
end

function isl_vec_sort(vec)
    ccall((:isl_vec_sort, libisl), Ptr{isl_vec}, (Ptr{isl_vec},), vec)
end

function isl_vec_read_from_file(ctx, input)
    ccall((:isl_vec_read_from_file, libisl), Ptr{isl_vec}, (Ptr{isl_ctx}, Ptr{Libc.FILE}), ctx, input)
end

function isl_vec_drop_els(vec, pos, n)
    ccall((:isl_vec_drop_els, libisl), Ptr{isl_vec}, (Ptr{isl_vec}, Cuint, Cuint), vec, pos, n)
end

function isl_vec_add_els(vec, n)
    ccall((:isl_vec_add_els, libisl), Ptr{isl_vec}, (Ptr{isl_vec}, Cuint), vec, n)
end

function isl_vec_insert_els(vec, pos, n)
    ccall((:isl_vec_insert_els, libisl), Ptr{isl_vec}, (Ptr{isl_vec}, Cuint, Cuint), vec, pos, n)
end

function isl_vec_insert_zero_els(vec, pos, n)
    ccall((:isl_vec_insert_zero_els, libisl), Ptr{isl_vec}, (Ptr{isl_vec}, Cuint, Cuint), vec, pos, n)
end

function isl_vec_move_els(vec, dst_col, src_col, n)
    ccall((:isl_vec_move_els, libisl), Ptr{isl_vec}, (Ptr{isl_vec}, Cuint, Cuint, Cuint), vec, dst_col, src_col, n)
end

function isl_version()
    ccall((:isl_version, libisl), Ptr{Cchar}, ())
end

mutable struct isl_external_vertex end

const isl_vertex = isl_external_vertex

mutable struct isl_cell end

mutable struct isl_vertices end

function isl_vertex_get_ctx(vertex)
    ccall((:isl_vertex_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_vertex},), vertex)
end

function isl_vertex_get_id(vertex)
    ccall((:isl_vertex_get_id, libisl), isl_size, (Ptr{isl_vertex},), vertex)
end

function isl_vertex_get_domain(vertex)
    ccall((:isl_vertex_get_domain, libisl), Ptr{isl_basic_set}, (Ptr{isl_vertex},), vertex)
end

function isl_vertex_get_expr(vertex)
    ccall((:isl_vertex_get_expr, libisl), Ptr{isl_multi_aff}, (Ptr{isl_vertex},), vertex)
end

function isl_vertex_free(vertex)
    ccall((:isl_vertex_free, libisl), Ptr{isl_vertex}, (Ptr{isl_vertex},), vertex)
end

function isl_basic_set_compute_vertices(bset)
    ccall((:isl_basic_set_compute_vertices, libisl), Ptr{isl_vertices}, (Ptr{isl_basic_set},), bset)
end

function isl_vertices_get_ctx(vertices)
    ccall((:isl_vertices_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_vertices},), vertices)
end

function isl_vertices_get_n_vertices(vertices)
    ccall((:isl_vertices_get_n_vertices, libisl), isl_size, (Ptr{isl_vertices},), vertices)
end

function isl_vertices_foreach_vertex(vertices, fn, user)
    ccall((:isl_vertices_foreach_vertex, libisl), isl_stat, (Ptr{isl_vertices}, Ptr{Cvoid}, Ptr{Cvoid}), vertices, fn, user)
end

function isl_vertices_free(vertices)
    ccall((:isl_vertices_free, libisl), Ptr{isl_vertices}, (Ptr{isl_vertices},), vertices)
end

function isl_cell_get_ctx(cell)
    ccall((:isl_cell_get_ctx, libisl), Ptr{isl_ctx}, (Ptr{isl_cell},), cell)
end

function isl_cell_get_domain(cell)
    ccall((:isl_cell_get_domain, libisl), Ptr{isl_basic_set}, (Ptr{isl_cell},), cell)
end

function isl_cell_foreach_vertex(cell, fn, user)
    ccall((:isl_cell_foreach_vertex, libisl), isl_stat, (Ptr{isl_cell}, Ptr{Cvoid}, Ptr{Cvoid}), cell, fn, user)
end

function isl_cell_free(cell)
    ccall((:isl_cell_free, libisl), Ptr{isl_cell}, (Ptr{isl_cell},), cell)
end

function isl_vertices_foreach_cell(vertices, fn, user)
    ccall((:isl_vertices_foreach_cell, libisl), isl_stat, (Ptr{isl_vertices}, Ptr{Cvoid}, Ptr{Cvoid}), vertices, fn, user)
end

struct var"##Ctag#255"
    data::NTuple{24, UInt8}
end

function Base.getproperty(x::Ptr{var"##Ctag#255"}, f::Symbol)
    f === :choice && return Ptr{var"##Ctag#256"}(x + 0)
    f === :flags && return Ptr{var"##Ctag#257"}(x + 0)
    f === :b && return Ptr{var"##Ctag#258"}(x + 0)
    f === :i && return Ptr{var"##Ctag#259"}(x + 0)
    f === :l && return Ptr{var"##Ctag#260"}(x + 0)
    f === :ul && return Ptr{var"##Ctag#261"}(x + 0)
    f === :str && return Ptr{var"##Ctag#262"}(x + 0)
    f === :str_list && return Ptr{var"##Ctag#263"}(x + 0)
    f === :child && return Ptr{var"##Ctag#264"}(x + 0)
    f === :version && return Ptr{var"##Ctag#265"}(x + 0)
    f === :user && return Ptr{var"##Ctag#266"}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#255", f::Symbol)
    r = Ref{var"##Ctag#255"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#255"}, r)
    GC.@preserve r unsafe_load(getproperty(ptr, f))
end

function Base.setproperty!(x::Ptr{var"##Ctag#255"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct var"##Ctag#256"
    choice::Ptr{isl_arg_choice}
    default_value::Cuint
    default_selected::Cuint
    set::Ptr{Cvoid}
end

function Base.getproperty(x::Ptr{var"##Ctag#256"}, f::Symbol)
    f === :choice && return Ptr{Ptr{isl_arg_choice}}(x + 0)
    f === :default_value && return Ptr{Cuint}(x + 64)
    f === :default_selected && return Ptr{Cuint}(x + 96)
    f === :set && return Ptr{Ptr{Cvoid}}(x + 128)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#256", f::Symbol)
    r = Ref{var"##Ctag#256"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#256"}, r)
    GC.@preserve r unsafe_load(getproperty(ptr, f))
end

function Base.setproperty!(x::Ptr{var"##Ctag#256"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct var"##Ctag#257"
    flags::Ptr{isl_arg_flags}
    default_value::Cuint
end

function Base.getproperty(x::Ptr{var"##Ctag#257"}, f::Symbol)
    f === :flags && return Ptr{Ptr{isl_arg_flags}}(x + 0)
    f === :default_value && return Ptr{Cuint}(x + 64)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#257", f::Symbol)
    r = Ref{var"##Ctag#257"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#257"}, r)
    GC.@preserve r unsafe_load(getproperty(ptr, f))
end

function Base.setproperty!(x::Ptr{var"##Ctag#257"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct var"##Ctag#258"
    default_value::Cuint
    set::Ptr{Cvoid}
end

function Base.getproperty(x::Ptr{var"##Ctag#258"}, f::Symbol)
    f === :default_value && return Ptr{Cuint}(x + 0)
    f === :set && return Ptr{Ptr{Cvoid}}(x + 64)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#258", f::Symbol)
    r = Ref{var"##Ctag#258"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#258"}, r)
    GC.@preserve r unsafe_load(getproperty(ptr, f))
end

function Base.setproperty!(x::Ptr{var"##Ctag#258"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct var"##Ctag#259"
    default_value::Cint
end

function Base.getproperty(x::Ptr{var"##Ctag#259"}, f::Symbol)
    f === :default_value && return Ptr{Cint}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#259", f::Symbol)
    r = Ref{var"##Ctag#259"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#259"}, r)
    GC.@preserve r unsafe_load(getproperty(ptr, f))
end

function Base.setproperty!(x::Ptr{var"##Ctag#259"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct var"##Ctag#260"
    default_value::Clong
    default_selected::Clong
    set::Ptr{Cvoid}
end

function Base.getproperty(x::Ptr{var"##Ctag#260"}, f::Symbol)
    f === :default_value && return Ptr{Clong}(x + 0)
    f === :default_selected && return Ptr{Clong}(x + 64)
    f === :set && return Ptr{Ptr{Cvoid}}(x + 128)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#260", f::Symbol)
    r = Ref{var"##Ctag#260"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#260"}, r)
    GC.@preserve r unsafe_load(getproperty(ptr, f))
end

function Base.setproperty!(x::Ptr{var"##Ctag#260"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct var"##Ctag#261"
    default_value::Culong
end

function Base.getproperty(x::Ptr{var"##Ctag#261"}, f::Symbol)
    f === :default_value && return Ptr{Culong}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#261", f::Symbol)
    r = Ref{var"##Ctag#261"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#261"}, r)
    GC.@preserve r unsafe_load(getproperty(ptr, f))
end

function Base.setproperty!(x::Ptr{var"##Ctag#261"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct var"##Ctag#262"
    default_value::Ptr{Cchar}
end

function Base.getproperty(x::Ptr{var"##Ctag#262"}, f::Symbol)
    f === :default_value && return Ptr{Ptr{Cchar}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#262", f::Symbol)
    r = Ref{var"##Ctag#262"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#262"}, r)
    GC.@preserve r unsafe_load(getproperty(ptr, f))
end

function Base.setproperty!(x::Ptr{var"##Ctag#262"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct var"##Ctag#263"
    offset_n::Csize_t
end

function Base.getproperty(x::Ptr{var"##Ctag#263"}, f::Symbol)
    f === :offset_n && return Ptr{Csize_t}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#263", f::Symbol)
    r = Ref{var"##Ctag#263"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#263"}, r)
    GC.@preserve r unsafe_load(getproperty(ptr, f))
end

function Base.setproperty!(x::Ptr{var"##Ctag#263"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct var"##Ctag#264"
    child::Ptr{isl_args}
end

function Base.getproperty(x::Ptr{var"##Ctag#264"}, f::Symbol)
    f === :child && return Ptr{Ptr{isl_args}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#264", f::Symbol)
    r = Ref{var"##Ctag#264"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#264"}, r)
    GC.@preserve r unsafe_load(getproperty(ptr, f))
end

function Base.setproperty!(x::Ptr{var"##Ctag#264"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct var"##Ctag#265"
    print_version::Ptr{Cvoid}
end

function Base.getproperty(x::Ptr{var"##Ctag#265"}, f::Symbol)
    f === :print_version && return Ptr{Ptr{Cvoid}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#265", f::Symbol)
    r = Ref{var"##Ctag#265"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#265"}, r)
    GC.@preserve r unsafe_load(getproperty(ptr, f))
end

function Base.setproperty!(x::Ptr{var"##Ctag#265"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct var"##Ctag#266"
    init::Ptr{Cvoid}
    clear::Ptr{Cvoid}
end

function Base.getproperty(x::Ptr{var"##Ctag#266"}, f::Symbol)
    f === :init && return Ptr{Ptr{Cvoid}}(x + 0)
    f === :clear && return Ptr{Ptr{Cvoid}}(x + 64)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#266", f::Symbol)
    r = Ref{var"##Ctag#266"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#266"}, r)
    GC.@preserve r unsafe_load(getproperty(ptr, f))
end

function Base.setproperty!(x::Ptr{var"##Ctag#266"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

# Skipping MacroDefinition: ISL_ARG_OFFSET_NONE ( ( size_t ) - 1 )

# Skipping MacroDefinition: ISL_ARG_SINGLE_DASH ( 1 << 0 )

# Skipping MacroDefinition: ISL_ARG_BOOL_ARG ( 1 << 1 )

# Skipping MacroDefinition: ISL_ARG_HIDDEN ( 1 << 2 )

# Skipping MacroDefinition: ISL_ARGS_END { isl_arg_end } } ;

# Skipping MacroDefinition: ISL_ARG_ALL ( 1 << 0 )

# Skipping MacroDefinition: ISL_ARG_SKIP_HELP ( 1 << 1 )

# Skipping MacroDefinition: ISL_xCAT ( A , B ) A ## B

# Skipping MacroDefinition: ISL_CAT ( A , B ) ISL_xCAT ( A , B )

# Skipping MacroDefinition: ISL_xFN ( TYPE , NAME ) TYPE ## _ ## NAME

# Skipping MacroDefinition: ISL_FN ( TYPE , NAME ) ISL_xFN ( TYPE , NAME )

const ISL_AST_BUILD_SEPARATION_BOUNDS_EXPLICIT = 0

const ISL_AST_BUILD_SEPARATION_BOUNDS_IMPLICIT = 1

const isl_ast_op_type = isl_ast_expr_op_type

const isl_ast_op_error = isl_ast_expr_op_error

const isl_ast_op_and = isl_ast_expr_op_and

const isl_ast_op_and_then = isl_ast_expr_op_and_then

const isl_ast_op_or = isl_ast_expr_op_or

const isl_ast_op_or_else = isl_ast_expr_op_or_else

const isl_ast_op_max = isl_ast_expr_op_max

const isl_ast_op_min = isl_ast_expr_op_min

const isl_ast_op_minus = isl_ast_expr_op_minus

const isl_ast_op_add = isl_ast_expr_op_add

const isl_ast_op_sub = isl_ast_expr_op_sub

const isl_ast_op_mul = isl_ast_expr_op_mul

const isl_ast_op_div = isl_ast_expr_op_div

const isl_ast_op_fdiv_q = isl_ast_expr_op_fdiv_q

const isl_ast_op_pdiv_q = isl_ast_expr_op_pdiv_q

const isl_ast_op_pdiv_r = isl_ast_expr_op_pdiv_r

const isl_ast_op_zdiv_r = isl_ast_expr_op_zdiv_r

const isl_ast_op_cond = isl_ast_expr_op_cond

const isl_ast_op_select = isl_ast_expr_op_select

const isl_ast_op_eq = isl_ast_expr_op_eq

const isl_ast_op_le = isl_ast_expr_op_le

const isl_ast_op_lt = isl_ast_expr_op_lt

const isl_ast_op_ge = isl_ast_expr_op_ge

const isl_ast_op_gt = isl_ast_expr_op_gt

const isl_ast_op_call = isl_ast_expr_op_call

const isl_ast_op_access = isl_ast_expr_op_access

const isl_ast_op_member = isl_ast_expr_op_member

const isl_ast_op_address_of = isl_ast_expr_op_address_of

# Skipping MacroDefinition: isl_size_error ( ( int ) - 1 )

# Skipping MacroDefinition: ISL_DEPRECATED __attribute__ ( ( __deprecated__ ) )

# const ISL_KEY = isl_id

# const ISL_VAL = isl_ast_expr

# const ISL_HMAP_SUFFIX = id_to_ast_expr

# const ISL_HMAP = isl_id_to_ast_expr

# const ISL_TYPE = isl_ast_expr

# Skipping MacroDefinition: isl_obj_none ( & isl_obj_none_vtable )

# Skipping MacroDefinition: isl_obj_int ( & isl_obj_int_vtable )

# Skipping MacroDefinition: isl_obj_val ( & isl_obj_val_vtable )

# Skipping MacroDefinition: isl_obj_set ( & isl_obj_set_vtable )

# Skipping MacroDefinition: isl_obj_union_set ( & isl_obj_union_set_vtable )

# Skipping MacroDefinition: isl_obj_map ( & isl_obj_map_vtable )

# Skipping MacroDefinition: isl_obj_union_map ( & isl_obj_union_map_vtable )

# Skipping MacroDefinition: isl_obj_pw_multi_aff ( & isl_obj_pw_multi_aff_vtable )

# Skipping MacroDefinition: isl_obj_pw_qpolynomial ( & isl_obj_pw_qpolynomial_vtable )

# Skipping MacroDefinition: isl_obj_union_pw_qpolynomial ( & isl_obj_union_pw_qpolynomial_vtable )

# Skipping MacroDefinition: isl_obj_pw_qpolynomial_fold ( & isl_obj_pw_qpolynomial_fold_vtable )

# Skipping MacroDefinition: isl_obj_union_pw_qpolynomial_fold ( & isl_obj_union_pw_qpolynomial_fold_vtable )

# Skipping MacroDefinition: isl_obj_schedule ( & isl_obj_schedule_vtable )

const ISL_BOUND_BERNSTEIN = 0

const ISL_BOUND_RANGE = 1

const ISL_ON_ERROR_WARN = 0

const ISL_ON_ERROR_CONTINUE = 1

const ISL_ON_ERROR_ABORT = 2

const ISL_SCHEDULE_ALGORITHM_ISL = 0

const ISL_SCHEDULE_ALGORITHM_FEAUTRIER = 1

const ISL_FORMAT_ISL = 0

const ISL_FORMAT_POLYLIB = 1

const ISL_FORMAT_POLYLIB_CONSTRAINTS = 2

const ISL_FORMAT_OMEGA = 3

const ISL_FORMAT_C = 4

const ISL_FORMAT_LATEX = 5

const ISL_FORMAT_EXT_POLYLIB = 6

const ISL_YAML_STYLE_BLOCK = 0

const ISL_YAML_STYLE_FLOW = 1

end # module
