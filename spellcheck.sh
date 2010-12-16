#!/bin/sh

for f in `ls chapters`; do
    echo "Spell checking chapters/$f/chapter.tex"
    echo "--------------------------------------------"
    ./spellcheckchapter.sh $f
    echo ""
done
