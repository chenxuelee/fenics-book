from dolfin import *

mesh = UnitCube(1, 1, 1)

p = Point()

for i in range(64):

    markers = CellFunction("bool", mesh)
    markers.set_all(False)


    hmin = mesh.hmin()
    for cell in cells(mesh):
        if cell.midpoint().distance(p) < hmin:
            markers[cell] = True

    mesh = refine(mesh, markers)

h = CellSize(mesh)
V = FunctionSpace(mesh, "CG", 1)
h = project(h, V)

file = File("mesh.pvd")
file << h

plot(mesh, interactive=True)
