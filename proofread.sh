#!/bin/sh

for f in chapters/*; do
    echo ""
    utils/proofread $f/chapter.tex
done
