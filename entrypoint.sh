#!/usr/bin/env sh
export PYTHONIOENCODING=utf8
cloc $(git rev-parse HEAD) | perl -lne 'print "$4\n" if m/SUM:\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)/;' | tee -a cloc.txt

#get the second last line in the cloc.txt 
line=$( tail -n 2 cloc.txt | head -1 )

#get the code lines SUM
num='undefined'
if grep -oP "SUM:\s+" cloc.txt; then num='Assigned'; fi

echo "::set-output name=lines::${num}"
