
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
    tag="sample_A_fibre", K=150.0,
)


const sample_B_fibre = IsotropicMaterial(
    tag="sample_B_fibre", K=300.0,
)


const silenka_e_glass_1200tex = IsotropicMaterial(
    tag="silenka_e_glass", E=74.0e09, nu=0.2, alpha=4.9e-06,
)


const Dglass = IsotropicMaterial(
    tag="Dglass", E=51.7e09, nu=0.22, alpha=2.5e-06,
)


const epoxy_sample_1 = OrthotropicMaterial(
    tag="epoxy_sample_1",
    c_ij=Dict(
        :C11 =>3.86,   :C12 => 2.57,   :C13 => 2.57,
        :C22 =>3.86,   :C23 => 2.57,   :C33 => 3.86,
        :C44 => 0.64,  :C55 => 0.64,   :C66 => 0.64,
    ),
    e_ij = Dict(:e11=>0.0, :e21=>0.0, :e15=>0.0,),
    eps_ij = Dict(:eps_11=>0.0797, :eps_22=>0.0797, :eps_33=>0.0797,),
)

const epoxy_sample_2 = OrthotropicMaterial(
    tag="epoxy_sample_2",
    c_ij=Dict(
        :C11 =>8e09,   :C12 => 4.4e09,   :C13 => 4.4e09,
        :C22 =>8e09,   :C23 => 4.4e09,   :C33 => 8e09,
        :C44 => 1.8e09,  :C55 => 1.8e09,   :C66 => 1.8e09,
    ),
    e_ij = Dict(:e11=>0.0, :e21=>0.0, :e15=>0.0,),
    eps_ij = Dict(:eps_11=>0.0372, :eps_22=>0.0372, :eps_33=>0.0372,),
)

const PZT_5A = OrthotropicMaterial(
    tag="PZA-5A", c_ij=Dict(
        :C11 =>111.0,   :C12 => 75.2,   :C13 => 75.2,
        :C22 =>121.0,   :C23 => 75.4,   :C33 => 121.0,
        :C44 => 22.8,   :C55 => 21.1,   :C66 => 21.1,
    ),
    e_ij = Dict(:e11=>15.8, :e21=>-5.4, :e15=>12.3,),
    eps_ij = Dict(:eps_11=>7.35, :eps_22=>8.11, :eps_33=>8.11,),
)

const PZT_7A = OrthotropicMaterial(
    tag="PZA-7A", c_ij=Dict(
        :C11 =>131.39e09,   :C12 => 82.712e09,   :C13 => 82.712e09,
        :C22 =>154.837e09,   :C23 => 83.237e09,   :C33 => 154.837e09,
        :C44 => 35.8e09,   :C55 => 25.696e09,   :C66 => 25.696e09,
    ),
    e_ij = Dict(:e11=>9.52183, :e21=>-2.120582, :e15=>9.349593,),
    eps_ij = Dict(:eps_11=>2.079, :eps_22=>4.065, :eps_33=>4.065,),
)

# SOURCE: https://doi.org/10.1142/S2010135X20500071
const PZT_4 = OrthotropicMaterial(
    tag="PZA-4A", c_ij=Dict(
        :C11 =>115.0e09,   :C12 => 74.3e09,   :C13 => 74.3e09,
        :C22 =>139.0e09,   :C23 => 77.8e09,   :C33 => 139.0e09,
        :C44 => 30.6e09,   :C55 => 25.60e09,   :C66 => 25.60e09,
    ),
    e_ij = Dict(:e11=>15.1, :e21=>-5.20, :e15=>12.7,),
    eps_ij = Dict(:eps_11=>5.61975, :eps_22=>6.4605, :eps_33=>6.4605,),
)

# SOURCE: http://dx.doi.org/10.3390/met5020863
const PZT_6B = OrthotropicMaterial(
    tag="PZA-6B", c_ij=Dict(
        :C11 =>163.0e09,   :C12 => 60.0e09,   :C13 => 60.0e09,
        :C22 =>168.0e09,   :C23 => 60.0e09,   :C33 => 168.0e09,
        :C44 => 54.0e09,   :C55 => 27.1e09,   :C66 => 27.1e09,
    ),
    e_ij = Dict(:e11=>7.1, :e21=>-0.9, :e15=>4.6,),
    eps_ij = Dict(:eps_11=>3.4, :eps_22=>3.6, :eps_33=>3.6,),
)


# SOURCE: https://doi.org/10.1590/S1678-58782009000400005 
const PZT_8 = OrthotropicMaterial(
    tag="PZA-8", c_ij=Dict(
        :C11 =>124.0e09,   :C12 => 71.6e09,   :C13 => 71.6e09,
        :C22 =>137.0e09,   :C23 => 69.7e09,   :C33 => 137.0e09,
        :C44 =>124.0e09,   :C55 => 31.4e09,   :C66 => 31.4e09,
    ),
    e_ij = Dict(:e11=>13.8, :e21=>-4.0, :e15=>10.4,),
    eps_ij = Dict(:eps_11=>5.1507, :eps_22=>7.9473, :eps_33=>7.9473,),
)

const BaTiO3 = OrthotropicMaterial(
    tag="Barium Titanate Oxide", c_ij=Dict(
        :C11 =>162.0e09,   :C12 => 78.0e09,   :C13 => 78.0e09,
        :C22 =>166.0e09,   :C23 => 77.0e09,   :C33 => 166.0e09,
        :C44 => 44.5e09,   :C55 => 43.0e09,   :C66 => 43.0e09,
    ),
    e_ij = Dict(:e11=>18.6, :e21=>-4.4, :e15=>11.6,),
    eps_ij = Dict(:eps_11=>12.6e-09, :eps_22=>11.2e-09, :eps_33=>11.2e-09,),
    q_ij =  Dict(:q11=>0.0, :q21=>0.0, :q15=>0.0,),
    μ_ij = Dict(:μ11=>0.1e-04, :μ22=>0.05e-04, :μ33=>0.05e-04,),
)


const CoFe2O4 = OrthotropicMaterial(
    tag="Coblat Ferrite", c_ij=Dict(
        :C11 =>269.5e09,   :C12 => 170.0e09,   :C13 => 170.0e09,
        :C22 =>286.0e09,   :C23 => 173.0e09,   :C33 => 286.0e09,
        :C44 => 56.5e09,   :C55 => 45.3e09,   :C66 => 45.3e09,
    ),
    e_ij = Dict(:e11=>0.0, :e21=>0.0, :e15=>0.0,),
    eps_ij = Dict(:eps_11=>0.093e-09, :eps_22=>0.08e-09, :eps_33=>0.08e-09,),
    q_ij = Dict(:q11=>700, :q21=>580, :q15=>560.0,),
    μ_ij = Dict(:μ11=>1.57e-04, :μ22=>-5.9e-04, :μ33=>-5.9e-04,),
)
