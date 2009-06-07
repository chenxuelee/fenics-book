from diffsim import *
from diffsim.dyadiccleft import *
from numpy import exp, fromfile

# Model parameters
c0_bulk = 0.1; D_Ca = 1.e5; Ds_cyt = 50; phi0 = -2.2; tau = 0.28
AP_offset = 0.1; dV = 0.5, ryr_scale = 100; end_sim_when_opend = True

# Setting boundary markers
LCC_markers = range(10,14); RyR_markers = range(100,104); Cyt_marker = 3

# Add a diffusion domain
domain = DiffusionDomain("Dyadic_cleft","cleft_mesh_with_RyR.xml.gz")
c0_vec = c0_bulk*exp(-VALENCE[Ca]*phi0*exp(-domain.mesh().coordinates()[:,-1]))

# Add the ligand with fluxes
ligand = DiffusiveLigand(domain.name(),Ca,c0_vec,D_Ca)
field  = StaticField("Bi_lipid_field",domain.name())
Ca_cyt = CytosolicStaticFieldFlux(field,Ca,Cyt_marker,c0_bulk,Ds_cyt)

# Adding channels with Markov models
for m in LCC_markers:
    LCCVoltageDepFlux(domain.name(), m, activator=LCCMarkovModel_Greenstein)
for m in RyR_markers:
    RyRMarkovModel_Stern("RyR_%d"%m, m, end_sim_when_opend)

# Adding a dynamic voltage clamp that drives the LCC Markov model
AP_time = fromfile('AP_time_steps.txt',sep='\n')
dvc = DynamicVoltageClamp(AP_time,fromfile('AP.txt',sep='\n'),AP_offset,dV)

# Get and set parameters
params = get_params()

params.io.save_data = True
params.Bi_lipid_field.tau = tau
params.time.tstop = AP_time[-1] + AP_offset
params.RyRMarkovChain_Stern.scale = ryr_scale

info(str(params))

# Run 10  simulations
data = run_sim(10,"Dyadic_cleft_with_4_RyR_scale")
mean_release_latency = mean([ run["tstop"] for run in data["time"]])
