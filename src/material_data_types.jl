

abstract type AbstractMaterial end
abstract type Material <: AbstractMaterial end


@with_kw struct OrthotropicMaterial{T} <: Material
    tag::Union{String, Int64}
    c_ij::Dict{Symbol, T}  # C11, C12, C13, C22, C23, C33, C44, C55, C66
    thermal_expansion_vector::Vector{T} = T[]
    e_ij::Dict{Symbol, T} = Dict{Symbol, T}()  # e11, e21, e15
    eps_ij::Dict{Symbol, T} =  Dict{Symbol, T}()  # eps_11, eps_22, eps_33
    q_ij::Dict{Symbol, T} = Dict{Symbol, T}()  # q11, q21, q15
    μ_ij::Dict{Symbol, T} = Dict{Symbol, T}()  # μ11, μ22, μ33
end

@with_kw struct TransverselyIsotropicMaterial{T} <: Material
    tag::Union{String, Int64}
    c_ij::Dict{Symbol, T}  # C11, C12, C22, C23, C66
    alpha_ij::Dict{Symbol, T} = Dict()  # alpha_11, alpha_22
end


@with_kw struct IsotropicMaterial{T} <: Material
    tag::Union{String, Int64} = "ISOTROPIC_MATERIAL"
    E::T = 0.0          # Youngs Modulus
    nu::T = 0.0         # Poisson's Ratio
    alpha::T = 0.0      # coefficient of thermal expansion
    cv::T = 0.0         # Specific heat
    K::T = 0.0          # Thermal conductivity
end


