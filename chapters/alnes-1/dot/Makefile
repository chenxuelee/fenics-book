
all: expr.pdf expr.ps stiffness.pdf stiffness.ps

expr.pdf: expr.dot
	dot -Tpdf -o expr.pdf expr.dot

expr.ps: expr.dot
	dot -Tps -o expr.ps expr.dot

stiffness.pdf: stiffness.dot
	dot -Tpdf -o stiffness.pdf stiffness.dot

stiffness.ps: stiffness.dot
	dot -Tps -o stiffness.ps stiffness.dot

