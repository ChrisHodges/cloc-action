#!/usr/bin/env sh
cloc $(git rev-parse HEAD) | tee -a cloc.txt
#get the second last line in the cloc.txt 
line=$( tail -n 2 cloc.txt | head -1 )
#get the code lines SUM
num=( echo {line} | awk -F" " ‘{ print $5}’)
#set the sum number as output variable value
#echo “::set-output name=lines::$num”
#num="STEEEVE"
echo "::set-output name=lines::${num}x"
