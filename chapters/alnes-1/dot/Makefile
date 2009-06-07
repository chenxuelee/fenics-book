
all: Expr.pdf Expr.ps Stiffness.pdf Stiffness.ps

Expr.pdf: Expr.dot
	dot -Tpdf -o Expr.pdf Expr.dot

Expr.ps: Expr.dot
	dot -Tps -o Expr.ps Expr.dot

Stiffness.pdf: Stiffness.dot
	dot -Tpdf -o Stiffness.pdf Stiffness.dot

Stiffness.ps: Stiffness.dot
	dot -Tps -o Stiffness.ps Stiffness.dot

