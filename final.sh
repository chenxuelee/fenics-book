#!/bin/bash
# A script to produce the final .pdf document
FILE=$1
latex -interaction=nonstopmode $FILE.tex
bibtex $FILE
latex -interaction=nonstopmode $FILE
makeindex $FILE
latex -interaction=nonstopmode $FILE
dvips $FILE.dvi
ps2pdf $FILE.ps $FILE.pdf
