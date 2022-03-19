
"""
Expected order of compliance matrix rows is
11, 22, 33, 23, 31, 12

E11, E22, E33, nu_12, nu_21, nu_23,
nu_32, nu_13, nu_31, G23, G13, G12.

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
E11, E22, E33, nu_12, nu_21, nu_23,
nu_32, nu_13, nu_31, G23, G13, G12.
"""
function get_engineering_constants_from_stiffness_matrix(
    stiff_matrix::Matrix{Float64}
)::Dict{Symbol, Float64} 
    return get_engineering_constants_from_compliance_matrix(inv(stiff_matrix))
end

