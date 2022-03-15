


# function get_orthotropic_material_matrix(
#     cij::Dict{Symbol, T},
# )::SMatrix{6, 6, T} where {T} 
#     return SMatrix{6, 6, T}([
#         cij[:C11] cij[:C12] cij[:C13] 0.0 0.0 0.0
#         cij[:C12] cij[:C22] cij[:C23] 0.0 0.0 0.0
#         cij[:C13] cij[:C23] cij[:C33] 0.0 0.0 0.0
#         0.0 0.0 0.0 cij[:C44] 0.0 0.0
#         0.0 0.0 0.0 0.0 cij[:C55] 0.0
#         0.0 0.0 0.0 0.0 0.0 cij[:C66]
#     ])
# end

# C11, C22, C33, C44, C55, C66, C12, C13, C23

get_dielectric_tensor(mat::OrthotropicMaterial)::Matrix{Float64} = [
        mat.eps_ij[:eps_11] 0.0 0.0
        0.0 mat.eps_ij[:eps_22] 0.0
        0.0 0.0 mat.eps_ij[:eps_33]
    ]

get_magnetic_permeability_tensor(mat::OrthotropicMaterial)::Matrix{Float64} = [
    mat.μ_ij[:μ11] 0.0 0.0
    0.0 mat.μ_ij[:μ22] 0.0
    0.0 0.0 mat.μ_ij[:μ33]
]

get_piezoelectric_coupling_tensor(mat::OrthotropicMaterial)::Matrix{Float64} = [
        mat.e_ij[:e11] 0.0 0.0
        mat.e_ij[:e21] 0.0 0.0
        mat.e_ij[:e21] 0.0 0.0
        0.0 0.0 0.0
        0.0 0.0 mat.e_ij[:e15]
        0.0 mat.e_ij[:e15] 0.0
    ]

get_piezomagnetic_coupling_tensor(mat::OrthotropicMaterial)::Matrix{Float64} = [
    mat.q_ij[:q11] 0.0 0.0
    mat.q_ij[:q21] 0.0 0.0
    mat.q_ij[:q21] 0.0 0.0
    0.0 0.0 0.0
    0.0 0.0 mat.q_ij[:q15]
    0.0 mat.q_ij[:q15] 0.0
]


# ==============================================
#           METHODS ON IsotropicMaterial
# ===============================================

function get_elastic_tensor(
    analysis_type::DataType,
    mat::IsotropicMaterial,
)::Matrix{Float64}
    E = mat.E
    nu = mat.nu
    @assert E>0 "Youngs moduli must be > 0."
    kk1::Float64 = E/((1.0+nu)*(1.0-(2.0*nu)))
    kk2::Float64 = 0.5*(1.0 - (2.0 * nu))
    if analysis_type in (Elastic_3DFEA, Thermo_Elastic_3DFEA)
        return kk1*[
            1-nu nu nu 0.0 0.0 0.0
            nu 1-nu nu 0.0 0.0 0.0
            nu nu 1-nu 0.0 0.0 0.0
            0.0 0.0 0.0 kk2 0.0 0.0 
            0.0 0.0 0.0 0.0 kk2 0.0 
            0.0 0.0 0.0 0.0 0.0 kk2
        ]
    elseif analysis_type===PlaneStrain_2DFEA
        return kk1 * [
            1-nu nu 0.0
            nu 1-nu 0.0
            0.0 0.0 kk2
        ]
    elseif analysis_type===PlaneStress_2DFEA
        return (E/(1-(nu*nu))) * [
            1 nu 0.0
            nu 1 0.0
            0.0 0.0 0.5*(1-nu)
        ]
    else
        @error "Encountered an unknown analysis type for returning elastic tensor"
    end
end


function get_elastic_tensor(
    analysis_type::DataType,
    mat::OrthotropicMaterial,
)::Matrix{Float64}
    C11, C22, C33 = mat.c_ij[:C11], mat.c_ij[:C22], mat.c_ij[:C33]
    C44, C55, C66 = mat.c_ij[:C44], mat.c_ij[:C55], mat.c_ij[:C66]
    C12, C13, C23 = mat.c_ij[:C12], mat.c_ij[:C13], mat.c_ij[:C23]
    @assert (C11>0 && C22>0 && C33>0 && C44>0 && C55>0 && C66>0) "Diagonal elements of C matrix must be positive but C11: $C11, C22: $C22, C33: $C33, C44: $C44, C55: $C55 and C66: $C66 are found."
    if analysis_type in (Elastic_3DFEA, Thermo_Elastic_3DFEA, Piezo_Electric_3DFEA, Magneto_Electro_Elastic_3DFEA)  #FIXME 
        return [
            C11 C12 C13 0.0 0.0 0.0
            C12 C22 C23 0.0 0.0 0.0
            C13 C23 C33 0.0 0.0 0.0
            0.0 0.0 0.0 C44 0.0 0.0 
            0.0 0.0 0.0 0.0 C55 0.0 
            0.0 0.0 0.0 0.0 0.0 C66
        ]
    elseif analysis_type===PlaneStrain_2DFEA
        return kk1 * [
            1-nu nu 0.0
            nu 1-nu 0.0
            0.0 0.0 kk2
        ]
    elseif analysis_type===PlaneStress_2DFEA
        return (E/(1-(nu*nu))) * [
            1 nu 0.0
            nu 1 0.0
            0.0 0.0 0.5*(1-nu)
        ]
    else
        @error "Encountered an unknown analysis type for returning elastic tensor"
    end
end

function get_elastic_tensor(
    analysis_type::DataType,
    mat::TransverselyIsotropicMaterial,
)::Matrix{Float64}
    C11, C22, C66 = mat.c_ij[:C11], mat.c_ij[:C22], mat.c_ij[:C66]
    C12, C23 = mat.c_ij[:C12], mat.c_ij[:C23]
    @assert (C11>0 && C22>0 && C66>0) "Diagonal elements of C matrix must be positive but C11: $C11, C22: $C22 and C66: $C66 are found."
    @assert C22 > C23 "C22: $C22 > C23: $C23 leads to negative diagonal elements of C matrix."
    if analysis_type===Elastic_3DFEA
        return [
            C11 C12 C12 0.0 0.0 0.0
            C12 C22 C23 0.0 0.0 0.0
            C12 C23 C22 0.0 0.0 0.0
            0.0 0.0 0.0 0.5*(C22-C23) 0.0 0.0 
            0.0 0.0 0.0 0.0 C66 0.0 
            0.0 0.0 0.0 0.0 0.0 C66
        ]
    elseif analysis_type===PlaneStrain_2DFEA
        return [
            C11 C12 0.0
            C12 C22 0.0
            0.0 0.0 C66
        ]  # FIXME
    elseif analysis_type===PlaneStress_2DFEA
        return [
            C11 C12 0.0
            C12 C22 0.0
            0.0 0.0 C66
        ]
    end
end


get_thermal_expansion_vector(mat::IsotropicMaterial) = reshape([mat.alpha mat.alpha mat.alpha 0.0 0.0 0.0], 6, 1)

get_thermal_conductivity_tensor(mat::IsotropicMaterial) = [mat.K 0.0 0.0;0.0 mat.K 0.0; 0.0 0.0 mat.K]

# =====================================================
#           METHODS ON TransverselyIsotropicMaterial
# =====================================================

get_thermal_expansion_vector(mat::TransverselyIsotropicMaterial) = reshape([mat.alpha_ij[:alpha_11] mat.alpha_ij[:alpha_22] mat.alpha_ij[:alpha_22] 0.0 0.0 0.0], 6, 1)



# =====================================================
#           GENERAL methods
# =====================================================

function get_material_tensors(
    analysis_type::DataType,
    mat::AbstractMaterial,
)
    if analysis_type in (Elastic_2DFEA, Elastic_3DFEA)
        return get_elastic_tensor(analysis_type, mat)
    elseif analysis_type==Thermo_Elastic_3DFEA
        return (
            get_elastic_tensor(analysis_type, mat),
            get_thermal_expansion_vector(mat), 
        )
    elseif analysis_type==Thermal_Conductivity_3DFEA
        return get_thermal_conductivity_tensor(mat)
    elseif analysis_type==Piezo_Electric_3DFEA
        Cmat = get_elastic_tensor(analysis_type, mat)
        e_mat = get_piezoelectric_coupling_tensor(mat)
        eps_mat = get_dielectric_tensor(mat)
        return [
            Cmat -e_mat;
            -transpose(e_mat) -eps_mat;
        ]
    elseif analysis_type==Magneto_Electro_Elastic_3DFEA
        Cmat = get_elastic_tensor(analysis_type, mat)
        e_mat = get_piezoelectric_coupling_tensor(mat)
        q_mat = get_piezomagnetic_coupling_tensor(mat)
        eps_mat = get_dielectric_tensor(mat)
        μ_mat = get_magnetic_permeability_tensor(mat)
        return [
            Cmat -e_mat -q_mat;
            -transpose(e_mat) -eps_mat -zeros(Float64, 3, 3);
            -transpose(q_mat) -zeros(Float64, 3, 3) -μ_mat;
        ]
    else
        @error "Encountered an unknown analysis type while writing material tensors..!" 
    end
end



# ======================================================================

"""
Expected order of compliance matrix rows is
11, 22, 33, 23, 31, 12

E11
E22
E33
nu_12
nu_21
nu_23
nu_32
nu_13
nu_31
G23
G13
G12

"""
function get_engineering_constants_from_compliance_matrix(
    comp_matrix::Matrix{Float64}
)::Dict{Symbol, Float64} 
    @assert size(comp_matrix)==(6,6)
    s11, s22, s33 = comp_matrix[1, 1], comp_matrix[2, 2], comp_matrix[3, 3]
    s44, s55, s66 = comp_matrix[4, 4], comp_matrix[5, 5], comp_matrix[6, 6]
    s12 = comp_matrix[1, 2]
    s13 = comp_matrix[1, 3]
    s23 = comp_matrix[2, 3]
    return Dict(
        :E11    => 1.0/s11,
        :E22    => 1.0/s22,
        :E33    => 1.0/s33,
        :nu_12  => -s12/s11,
        :nu_21  => -s12/s22,
        :nu_23  => -s23/s22,
        :nu_32  => -s23/s33,
        :nu_13  => -s13/s11,
        :nu_31  => -s13/s33,
        :G23    => 1.0/s44,
        :G13    => 1.0/s55,
        :G12    => 1.0/s66,
    )
end

"""
- E11
- E22
- E33
- nu_12
- nu_21
- nu_23
- nu_32
- nu_13
- nu_31
- G23
- G13
- G12
"""
function get_engineering_constants_from_stiffness_matrix(
    stiff_matrix::Matrix{Float64}
)::Dict{Symbol, Float64} 
    return get_engineering_constants_from_compliance_matrix(inv(stiff_matrix))
end

