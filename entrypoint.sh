#!/usr/bin/env sh
cloc $(git rev-parse HEAD) | tee -a --json cloc.txt

#get the second last line in the cloc.txt 
line=$( tail -n 2 cloc.txt | head -1 )

#get the code lines SUM
num='undefined'
if grep -oP "SUM:\s+" cloc.txt; then num='Assigned'; fi

echo "::set-output name=lines::${num}"
