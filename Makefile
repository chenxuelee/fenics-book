FILE="book"

all:
	latex $(FILE).tex
#	latex -interaction=nonstopmode $(FILE).tex

final:
	./final.sh $(FILE)

clean:
	-rm -f *~
