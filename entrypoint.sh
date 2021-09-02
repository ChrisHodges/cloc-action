#!/usr/bin/env sh
cloc $(git rev-parse HEAD) | tee -a cloc.txt
lines=$(cat cloc.txt | perl -lne 'print "$1\n" if m/SUM:\s+\d+\s+\d+\s+\d+\s+(\d+)/;')
files=$(cat cloc.txt | perl -lne 'print "$1\n" if m/SUM:\s+(\d)+\s+\d+\s+\d+\s+\d+/;')
echo "::set-output name=lines::${lines}"
echo "::set-output name=files::${files}"
