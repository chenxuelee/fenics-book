FILE="book"

all:
	latex -interaction=nonstopmode $(FILE).tex

final:
	latex -interaction=nonstopmode $(FILE).tex
	bibtex $(FILE)
	latex -interaction=nonstopmode $(FILE)
	makeindex $(FILE)
	latex -interaction=nonstopmode $(FILE)
	dvips $(FILE).dvi
	ps2pdf $(FILE).ps $(FILE).pdf

clean:
	-rm -f *~
