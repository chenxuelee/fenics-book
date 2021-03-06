# Python code for the assembly of the matrices and vectors from Eq. (30.14)-(30.15)
import numpy as np
from dolfin import *

mesh = Mesh("cleft_mesh.xml.gz")
mesh.order()

Vs = FunctionSpace(mesh, "CG", 1)
Vv = VectorFunctionSpace(mesh, "CG", 1)

v = TestFunction(Vs)
u = TrialFunction(Vs)

# Defining the electric field-function
a = Expression(["0.0","0.0","phi_0*valence*kappa*sigma*exp(-kappa*x[2])"],
               phi_0=-2.2, valence=2, kappa=1, sigma=1.e5,
               element=Vv.ufl_element())

# Assembly of the K, M and A matrices
K = assemble(inner(grad(u), grad(v))*dx)
M = assemble(u*v*dx)
E = assemble(-u*inner(a, grad(v))*dx)

# Collecting face markers from a file, and skip the 0 one
sub_domains = MeshFunction("uint", mesh, "cleft_mesh_face_markers.xml.gz")
unique_sub_domains = list(set(sub_domains.array()))
unique_sub_domains.remove(0)

# Assemble matrices and source vectors from exterior facets domains
domain = MeshFunction("uint", mesh, 2)
F = {}; f = {}; tmp = K.copy(); tmp.zero()
for k in unique_sub_domains:
    domain.array()[:] = (sub_domains.array() != k)
    F[k] = assemble(u*v*ds, exterior_facet_domains = domain, \
                    tensor = tmp.copy(), reset_sparsity = False)
    f[k] = assemble(v*ds, exterior_facet_domains = domain)
