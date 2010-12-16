#!/bin/sh

for f in chapters/*; do
    echo "Spell checking $f"
    echo "------------------------------------"
    cat $f/chapter.tex | ispell -l -t -d american -p`pwd`/dictionary.txt
    echo ""
done
