from numpy import *
from dolfin import *

mesh = Mesh('cleft_mesh.xml.gz')

Vs = FunctionSpace(mesh, "CG", 1)
Vv = VectorFunctionSpace(mesh, "CG", 1)

v = TestFunction(Vs)
u = TrialFunction(Vs)

# Defining the electric field-function
a = Function(Vv,["0.0","0.0","phi_0*valence*kappa*sigma*exp(-kappa*x[2])"],
             {"phi_0":-2.2,"valence":2,"kappa":1,"sigma":1.e5})

# Assembly of the K, M and A matrices
K = assemble(dot(grad(u),grad(v))*dx)
M = assemble(u*v*dx)
E = assemble(-u*dot(a,grad(v))*dx)

# Collecting face markers from a file, and skip the 0 one
sub_domains = MeshFunction("uint",mesh,"cleft_mesh_face_markers.xml.gz")
unique_sub_domains = list(set(sub_domains.values()))
unique_sub_domains.remove(0)

# Assemble matrices and source vectors from exterior facets domains
domain = MeshFunction("uint",mesh,2)
F = {};f = {};tmp = K.copy(); tmp.zero()
for k in unique_sub_domains:
    domain.values()[:] = (sub_domains.values() != k)
    F[k] = assemble(u*v*ds, exterior_facet_domains = domain, \
                    tensor = tmp.copy(), reset_tensor = False)
    f[k] = assemble(v*ds, exterior_facet_domains = domain)
