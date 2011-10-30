# Call a shell script to build the book. Doesn't seem to work to set
# TEXINPUTS in the Makefile.

all: book manual

final: book_final manual_final

book:
	./build.sh book

manual:
	./build.sh manual

book_final:
	./build.sh book --final

manual_final:
	./build.sh manual --final
