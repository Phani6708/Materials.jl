module Materials
    using StaticArrays
    using Parameters
    using LinearAlgebra
    
    include("material_data_types.jl")
    include("get_material_tensor.jl")
    include("material_lib.jl")

    export AbstractMaterial, Material
    export IsotropicMaterial, OrthotropicMaterial, TransverselyIsotropicMaterial

end
