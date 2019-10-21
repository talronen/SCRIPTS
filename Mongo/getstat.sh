#!/bin/bash

out=$(mongoexport -d Harvester -c Personas -q '{IsPublic:true,IsActive:false,WasBlocked:true}' -f "CreationDate,UpdateDate,Site,DisplayName,UserName" --sort '{Site:1}' -csv | sed 's/O_.//g' | awk 'NR>1{OFS="," ;print}' | sed 's/ /\n/g')

echo $out
echo "======================"
while read f1 f2 f3 f4 f5; do

#f2="2019-06-24T17:48:14.076Z"
#f1="2019-06-22T17:48:14.076Z"
#f3="Facebook"

#ddays=$((($(date -d f2 +%s) - $(date -d f1 +%s)) / 86400))
#echo $f2 $f1

#echo $f2 $f1
ddays=$((($(date -d "$f2" +%s) - $(date -d "$f1" +%s)) /86400))
echo  "User" $f5 for site $f3 "Ran for "$ddays" Days"

done < $1

#echo $out
