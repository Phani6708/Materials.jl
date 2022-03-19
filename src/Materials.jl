module Materials
    __precompile__()
    #
    using LinearAlgebra
    #
    using StaticArrays
    using Parameters
    
    include("material_data_types.jl")
    include("material_lib.jl")
    include("eval_engineering_constants.jl")

    # const Material = Union{IsotropicMaterial, OrthotropicMaterial, TransverselyIsotropicMaterial} 

    export AbstractMaterial, Material
    export IsotropicMaterial, OrthotropicMaterial, TransverselyIsotropicMaterial

end
