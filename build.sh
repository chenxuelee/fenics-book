#!/bin/sh

export TEXINPUTS=".:"`pwd`"/packages:"

pdflatex book.tex
