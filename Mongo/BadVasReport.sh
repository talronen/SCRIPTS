#!/bin/bash

#out=$(mongoexport -d Harvester -c Personas -q '{IsPublic:true,IsActive:false,WasBlocked:true}' -f "CreationDate,UpdateDate,Site,DisplayName,UserName" --sort '{Site:1}' -csv | awk -F"," -vOFS="," 'NR>1 {print}')

mongoexport -d Harvester -c Personas -q '{IsPublic:true,IsActive:false,WasBlocked:true}' -f "CreationDate,UpdateDate,Site,DisplayName,UserName" --sort '{Site:1}' -csv | sed 's/O_.//g' > vas.csv

#---===--- Get all Blocked VAS from DB ---===---

mongoexport -d Harvester -c Personas -q '{IsPublic:true,IsActive:false,WasBlocked:true}' -f "CreationDate,UpdateDate,Site,DisplayName,UserName" --sort '{Site:1}' --csv | awk -F"," -vOFS="," '{print}' | sed 's/Z//g' | tr -d \" | sed 's/OM.//g'> vas.csv

#---==--- Read Data File ---===---
n=0
IFS=","

echo > BlockedVas-Stats.log
#echo "           BlockedVas-Stats.log           " >> BlockedVas-Stats.log
#echo >> BlockedVas-Stats.log
#echo >> BlockedVas-Stats.log

#echo "        ---===--- Blocked Vas Statistics ---===---" >> BlockedVas-Stats.log
#echo >> BlockedVas-Stats.log

echo "UserName Site Days" >> BlockedVas-Stats.log

while read f1 f2 f3 f4 f5; do

#f2="2019-06-24T17:48:14.076Z"
#f1="2019-06-22T17:48:14.076Z"
#f3="Facebook"

#ddays=$((($(date -d f2 +%s) - $(date -d f1 +%s)) / 86400))

#---===--- Start calculating from Line 2 ---===---
if [ "$n" -gt 0 ]
then
#---===--- Converting to Epoc Time & doing the Calculation ---===---
     ddays=$((($(date -d "$f2" +%s) - $(date -d "$f1" +%s)) /86400))
     echo  $f5 $f3 "$ddays" | column -t >> BlockedVas-Stats.log
else
((n ++))
echo $n
fi

#---===--- Printing Resaults to File ---===---
done < ./vas.csv

clear

cat BlockedVas-Stats.log | column -t