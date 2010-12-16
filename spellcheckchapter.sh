#!/bin/sh

cat chapters/$1/chapter.tex | utils/stripfile | grep -v includegraphics | ispell -l -t -d american -p`pwd`/dictionary.txt
