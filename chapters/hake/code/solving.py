# Python code for solving the system in Eq. 30.13
# Model parameters
dt_min = 1.0e-10; dt = dt_min; t = 0; c0 = 0.1; tstop = 1.0
events = [0.2,tstop/2,tstop,tstop]; dt_expand = 2.0;
sigma = 1e5; ds = 50; area = pi; Faraday = 0.0965; amp = -0.1
t_channels = {1:[0.2,tstop/2], 2:[tstop/2,tstop]}

# Initialize the solution Function and the left and right hand side
u = Function(Vs); x = u.vector()
x[:] = c0*np.exp(-a.valence*a.phi_0*np.exp(-a.kappa*mesh.coordinates()[:,-1]))
b = Vector(len(x)); A = K.copy();

solver = KrylovSolver("bicgstab","amg_hypre")
solver.parameters["relative_tolerance"] = 1e-10
solver.parameters["absolute_tolerance"] = 1e-7

plot(u, vmin=0, vmax=4000, interactive=True)
while t < tstop:
    # Initalize the left and right hand side
    A.assign(K); A *= sigma; A += E; b[:] = 0
    
    # Adding channel fluxes
    for c in [1,2]:
        if t >= t_channels[c][0] and t < t_channels[c][1]:
            b.axpy(-amp*1e9/(2*Faraday*area),f[c])
    
    # Adding cytosole flux at Omega 3
    A.axpy(sigma/ds,F[3],True); b.axpy(c0*sigma/ds,f[3])

    # Applying the Backward Euler time discretization
    A *= dt; b *= dt; b += M*x; A += M
    
    solver.solve(A,x,b)
    t += dt; print "Ca Concentration solved for t:",t
    
    # Handle the next time step
    if t == events[0]:
        dt = dt_min; events.pop(0)
    elif t + dt*dt_expand > events[0]:
        dt = events[0] - t
    else:
        dt *= dt_expand
    
    plot(u, vmin=0, vmax=4000)

plot(u, vmin=0, vmax=4000, interactive=True)
