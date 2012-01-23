#!/bin/sh

filterdiff() {
    cat $1 \
        | grep -v noindent \
        | grep -v enlargethispage \
        | grep -v pagebreak \
        | grep -v begingroup \
        | grep -v endgroup \
        | grep -v clearpage \
        | grep -v setcounter \
        | grep -v thispagestyle \
        | grep -v figure \
        | grep -v bwfig \
        | grep -v centering \
        | grep -v includegraphics \
        | grep -v label \
        | grep -v vspace \
        | grep -v caption \
        | grep -v looseness \
        | grep -v linenumbersep
}

for f in *.tex; do

    echo "Checking diff for $f"
    echo "------------------------"

    rm -f tmp_old tmp_new
    diff -w -B $f ../tex/$f | grep -e '^<' | grep -v '^< $' > tmp_old
    diff -w -B $f ../tex/$f | grep -e '^>' | grep -v '^< $' > tmp_new
    filterdiff tmp_old
    filterdiff tmp_new

done
