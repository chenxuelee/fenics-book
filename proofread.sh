#!/bin/sh

#for f in chapters/*; do
#    utils/proofread $f/chapter.tex $1
#done

for f in tex/*.tex; do
    utils/proofread $f $1
done
