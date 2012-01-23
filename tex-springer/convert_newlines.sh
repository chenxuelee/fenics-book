#!/bin/sh

for f in *.tex; do
    echo "Converting $f..."
    tr -d '\r' < $f > ${f}_tmp
    mv ${f}_tmp $f
done
