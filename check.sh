#!/bin/sh

echo "Checking..."
WARNINGS=`make | grep Warning | grep -v "Token not allowed in a PDF string" | grep -v "Float too large for page" | grep -v "Package caption" | grep -v "Size substitutions with differences" | grep -v "LaTeX Font"`

GOOD="\033[1;32m"
BAD="\033[1;31m"
NORMAL="\033[0m"

if [ "x$WARNINGS" = "x" ]; then
    echo $GOOD"Looking good"$NORMAL
else
    echo $BAD"Not so good"$NORMAL
    echo $WARNINGS | python -c "import sys; print '\n'.join(sys.stdin.read().split('Warning:'))"
fi
