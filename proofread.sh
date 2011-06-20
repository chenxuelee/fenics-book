#!/bin/sh

for f in chapters/*; do
    utils/proofread $f/chapter.tex $1
done
