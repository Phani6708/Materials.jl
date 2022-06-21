

abstract type AbstractMaterial end
abstract type Material <: AbstractMaterial end


@with_kw struct OrthotropicMaterial <: Material
    tag::Union{String, Int64}
    c_ij::Dict{Symbol, Float64}  # C11, C12, C13, C22, C23, C33, C44, C55, C66
    thermal_expansion_vector::Vector{Float64} = Float64[]
    e_ij::Dict{Symbol, Float64} = Dict{Symbol, Float64}()  # e11, e21, e15
    eps_ij::Dict{Symbol, Float64} =  Dict{Symbol, Float64}()  # eps_11, eps_22, eps_33
    q_ij::Dict{Symbol, Float64} = Dict{Symbol, Float64}()  # q11, q21, q15
    μ_ij::Dict{Symbol, Float64} = Dict{Symbol, Float64}()  # μ11, μ22, μ33
end

@with_kw struct TransverselyIsotropicMaterial <: Material
    tag::Union{String, Int64}
    c_ij::Dict{Symbol, Float64}  # C11, C12, C22, C23, C66
    alpha_ij::Dict{Symbol, Float64} = Dict()  # alpha_11, alpha_22
end


@with_kw struct IsotropicMaterial <: Material
    tag::Union{String, Int64} = "ISOTROPIC_MATERIAL"
    E::Float64 = 0.0          # Youngs Modulus
    nu::Float64 = 0.0         # Poisson's Ratio
    alpha::Float64 = 0.0      # coefficient of thermal expansion
    cv::Float64 = 0.0         # Specific heat
    K::Float64 = 0.0          # Thermal conductivity
end



function makeMaterialStiffnessTensor(mat::Material)::Matrix{Float64}
    if isa(mat, IsotropicMaterial)
        E::Float64, nu::Float64 = mat.E, mat.nu
        λ0::Float64 = E / ((1.0+nu)*(1.0 - (2.0*nu)))
        return λ0 * [
            1-nu;nu;nu;0.0;0.0;0.0;;
            nu;1-nu;nu;0.0;0.0;0.0;;
            nu;nu;1-nu;0.0;0.0;0.0;;
            0.0;0.0;0.0;0.5-nu;0.0;0.0;;
            0.0;0.0;0.0;0.0;0.5-nu;0.0;;
            0.0;0.0;0.0;0.0;0.0;0.5-nu;;
        ]
    end
end
