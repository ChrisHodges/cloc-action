#!/usr/bin/env sh
cloc $(git rev-parse HEAD) | tee -a cloc.txt

#get the second last line in the cloc.txt 
line=$( tail -n 2 cloc.txt | head -1 )

#get the code lines SUM
pat='SUM:\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)'
num='Unassigned'
while [[ $line =~ $pat ]]; do
  num=${BASH_REMATCH[4]}
  num='Assigned'
done

echo "::set-output name=lines::${num}x"
