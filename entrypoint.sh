#!/usr/bin/env sh
cloc $(git rev-parse HEAD) | tee -a cloc.txt
num=$(cat cloc.txt | perl -lne 'print "$2\n" if m/SUM:\s+(\d+)\s+\d+\s+\d+\s+(\d+)/;')
echo "::set-output name=lines::${num}"
