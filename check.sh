#!/bin/sh

echo "Checking..."
WARNINGS=`make | grep Warning | grep -v chap: | grep -v sec: | grep -v "You have requested" | grep -v "Package hyperref" | grep -v "There were undefined"`

GOOD="\033[1;32m"
BAD="\033[1;31m"
NORMAL="\033[0m"

if [ "x$WARNINGS" = "x" ]; then
    echo $GOOD"Looking good"$NORMAL
else
    echo $BAD"Not so good"$NORMAL
    echo $WARNINGS | python -c "import sys; print '\n'.join(sys.stdin.read().split('LaTeX Warning: '))"
fi

for f in chapters/*; do
    echo ""
    utils/proofread $f/chapter.tex
done
