
all: expr.pdf expr.ps stiffness.pdf stiffness.ps

expr.pdf: expr.dot
	dot -Tpdf -o expr.pdf expr.dot
	pdfcrop expr.pdf
	mv expr-crop.pdf expr.pdf

expr.ps: expr.dot
	dot -Tps -o expr.ps expr.dot

stiffness.pdf: stiffness.dot
	dot -Tpdf -o stiffness.pdf stiffness.dot
	pdfcrop stiffness.pdf
	mv stiffness-crop.pdf stiffness.pdf

stiffness.ps: stiffness.dot
	dot -Tps -o stiffness.ps stiffness.dot

