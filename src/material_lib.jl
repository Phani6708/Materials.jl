
const Air = IsotropicMaterial(
    tag="Air", K=0.025,
)


const copper_matrix = IsotropicMaterial(
    tag="Copper_Matrix", E=117e09, nu=0.34, alpha=22.0e-06, cv=3.48509e06,
)

const aluminium_matrix = IsotropicMaterial(
    tag="AluminiumMatrix", E=68.3e09, nu=0.3, alpha=23.0e-06, cv=2.6191e06, K=237.0,
)

const polypropylene_matrix = IsotropicMaterial(
    tag="polypropylene_matrix", K=0.2,
)

const sample_A_matrix = IsotropicMaterial(
    tag="sample_A_matrix", K=1.0,
)


const MY750_HY917_DY063_epoxy = IsotropicMaterial(
    tag="Epoxy", E=3.35e09, nu=0.35, alpha=58.0e-06,
)




const sic_fibre = IsotropicMaterial(
    tag="SiC_Fibre", E=410e09, nu=0.14, alpha=4.0e-06, cv=2.32773e06,
)


const boron_fibre = IsotropicMaterial(
    tag="Boron_Fibre", E=379.3e09, nu=0.1, alpha=8.1e-06, cv=2.5092e06, K=27.4
)


const carbon_fibre = IsotropicMaterial(
    tag="carbon_fibre", K=129.0,
)


const glass_fibre = IsotropicMaterial(
    tag="glass_fibre", K=1.05,
)


const sample_A_fibre = IsotropicMaterial(
    tag="sample_A_fibre", K=0.1,
)


const silenka_e_glass_1200tex = IsotropicMaterial(
    tag="silenka_e_glass", E=74.0e09, nu=0.2, alpha=4.9e-06,
)



const epoxy_sample_1 = OrthotropicMaterial{Float64}(
    tag="epoxy_sample_1",
    c_ij=Dict(
        :C11 =>3.86,   :C12 => 2.57,   :C13 => 2.57,
        :C22 =>3.86,   :C23 => 2.57,   :C33 => 3.86,
        :C44 => 0.64,  :C55 => 0.64,   :C66 => 0.64,
    ),
    e_ij = Dict(:e11=>0.0, :e21=>0.0, :e15=>0.0,),
    eps_ij = Dict(:eps_11=>0.0797, :eps_22=>0.0797, :eps_33=>0.0797,),
)


const PZT_5A = OrthotropicMaterial{Float64}(
    tag="PZA-5A", c_ij=Dict(
        :C11 =>111.0,   :C12 => 75.2,   :C13 => 75.2,
        :C22 =>121.0,   :C23 => 75.4,   :C33 => 121.0,
        :C44 => 22.8,   :C55 => 21.1,   :C66 => 21.1,
    ),
    e_ij = Dict(:e11=>15.8, :e21=>-5.4, :e15=>12.3,),
    eps_ij = Dict(:eps_11=>7.35, :eps_22=>8.11, :eps_33=>8.11,),
)


const BaTiO3 = OrthotropicMaterial{Float64}(
    tag="Barium Titanate Oxide", c_ij=Dict(
        :C11 =>162.0e09,   :C12 => 78.0e09,   :C13 => 78.0e09,
        :C22 =>166.0e09,   :C23 => 77.0e09,   :C33 => 166.0e09,
        :C44 => 43.0e09,   :C55 => 43.0e09,   :C66 => 43.0e09,
    ),
    e_ij = Dict(:e11=>18.6, :e21=>-4.4, :e15=>11.6,),
    eps_ij = Dict(:eps_11=>12.6e-09, :eps_22=>11.2e-09, :eps_33=>11.2e-09,),
    q_ij =  Dict(:q11=>0.0, :q21=>0.0, :q15=>0.0,),
    μ_ij = Dict(:μ11=>0.1e-04, :μ22=>0.05e-04, :μ33=>0.05e-04,),
)


const CoFe2O4 = OrthotropicMaterial{Float64}(
    tag="Coblat Ferrite", c_ij=Dict(
        :C11 =>269.5e09,   :C12 => 170.0e09,   :C13 => 170.0e09,
        :C22 =>286.0e09,   :C23 => 173.0e09,   :C33 => 286.0e09,
        :C44 => 45.3e09,   :C55 => 45.3e09,   :C66 => 45.3e09,
    ),
    e_ij = Dict(:e11=>0.0, :e21=>0.0, :e15=>0.0,),
    eps_ij = Dict(:eps_11=>0.093e-09, :eps_22=>0.08e-09, :eps_33=>0.08e-09,),
    q_ij = Dict(:q11=>699.7, :q21=>580.3, :q15=>550.0,),
    μ_ij = Dict(:μ11=>1.57e-04, :μ22=>-5.9e-04, :μ33=>-5.9e-04,),
)
