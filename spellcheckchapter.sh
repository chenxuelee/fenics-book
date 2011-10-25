#!/bin/sh

#cat chapters/$1/chapter.tex | utils/stripfile | ispell -l -t -d american -p`pwd`/dictionary.txt

cat tex/$1.tex | utils/stripfile | ispell -l -t -d american -p`pwd`/dictionary.txt
