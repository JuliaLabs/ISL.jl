module ISL
using ISL_jll
include("api.jl")

function version()
    strip(Base.unsafe_string(ISL.API.isl_version()))
end

end # module
