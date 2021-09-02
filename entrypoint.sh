#!/usr/bin/env sh
cloc $(git rev-parse HEAD) | tee -a cloc.txt

#get the second last line in the cloc.txt 
line=$( tail -n 2 cloc.txt | head -1 )

#get the code lines SUM
pat='SUM:\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)'
[[ $line =~ $pat ]] # $pat must be unquoted
echo "4: ${BASH_REMATCH[4]}"
num=${BASH_REMATCH[4]}
echo "::set-output name=lines::${num}x"
