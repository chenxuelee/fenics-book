FILE="book"

all:
	latex -interaction=nonstopmode $(FILE).tex

final:
	./final.sh $(FILE)

clean:
	-rm -f *~
