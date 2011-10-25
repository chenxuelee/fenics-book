#!/bin/sh

#for f in `ls chapters`; do
#    echo "Spell checking chapters/$f/chapter.tex"
#    echo "--------------------------------------------"
#    ./spellcheckchapter.sh $f
#    echo ""
#done

for f in `ls tex/*.tex`; do
    echo "Spell checking $f"
    echo "---------------------"
    ./spellcheckchapter.sh $f
    echo ""
done
