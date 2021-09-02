#!/usr/bin/env sh
export PYTHONIOENCODING=utf8
cloc --json $(git rev-parse HEAD) | python2 -c "import sys, json; print json.load(sys.stdin)['name']" | tee -a cloc.txt

#get the second last line in the cloc.txt 
line=$( tail -n 2 cloc.txt | head -1 )

#get the code lines SUM
num='undefined'
if grep -oP "SUM:\s+" cloc.txt; then num='Assigned'; fi

echo "::set-output name=lines::${num}"
