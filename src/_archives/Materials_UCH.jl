module Materials

    using ..FEPrep
    using StaticArrays, Parameters, LinearAlgebra


    include("material_data_types.jl")
    include("get_material_tensor.jl")
    include("material_lib.jl")


    export AbstractMaterial, Material
    export IsotropicMaterial, OrthotropicMaterial, TransverselyIsotropicMaterial
    

end