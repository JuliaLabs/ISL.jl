using Clang.Generators
using ISL_jll

const ISL_INCLUDE = normpath(joinpath(ISL_jll.artifact_dir, "include"))
const ISL_HEADER_DIR = joinpath(ISL_INCLUDE, "isl")

const BLACKLIST = ["cpp.h", "hmap.h", "hmap_templ.c", "maybe_templ.h", "polynomial_type.h", "val_gmp.h"]
const ISL_HEADERS = [joinpath(ISL_HEADER_DIR, header) for header in readdir(ISL_HEADER_DIR) if header ∉ BLACKLIST]

options = load_options(joinpath(@__DIR__, "wrap.toml"))
args = String["-I$ISL_INCLUDE"]
ctx = create_context(ISL_HEADERS, args, options)

build!(ctx)

