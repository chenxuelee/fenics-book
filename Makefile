FILE="book"

all:
	latex $(FILE).tex

final:
	latex $(FILE).tex
	bibtex $(FILE)
	latex $(FILE)
	makeindex $(FILE)
	latex $(FILE)
	dvips $(FILE).dvi
	ps2pdf $(FILE).ps $(FILE).pdf

clean:
	-rm -f *~
