#!/bin/sh

for f in `ls chapters`; do
    echo "Spell checking $f"
    echo "------------------------------------"
    ./spellcheckchapter.sh $f
    echo ""
done
