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
    cat $f | utils/stripfile | ispell -l -t -d american -p`pwd`/dictionary.txt
    echo ""
done
