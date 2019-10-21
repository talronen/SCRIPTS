#!/bin/bash
n=0
IFS=","
while read f1 f2 f3 f4 f5; do

#f2="2019-06-24T17:48:14.076Z"
#f1="2019-06-22T17:48:14.076Z"
#f3="Facebook"

#ddays=$((($(date -d f2 +%s) - $(date -d f1 +%s)) / 86400))
#echo $f2 $f1

if [ "$n" -gt 0 ]
then 
     #echo $f2 $f1
     ddays=$((($(date -d "$f2" +%s) - $(date -d "$f1" +%s)) /86400))
     echo  "User" $f5 for site $f3 "Ran for "$ddays" Days"
else
((n ++))
fi
done < "$1"

