#!/usr/bin/env sh
export PYTHONIOENCODING=utf8
# cloc $(git rev-parse HEAD) | perl -lne 'print "$2\n" if m/SUM:\s+(\d+)\s+\d+\s+\d+\s+(\d+)/;' | tee -a cloc.txt
cloc $(git rev-parse HEAD) | tee -a cloc.txt
cat cloc.txt | perl -lne 'print "$2\n" if m/SUM:\s+(\d+)\s+\d+\s+\d+\s+(\d+)/;' | tee -a cloc.txt

#get the code lines SUM
num='undefined'
if grep -oP "SUM:\s+" cloc.txt; then num='Assigned'; fi

echo "::set-output name=lines::${num}"
