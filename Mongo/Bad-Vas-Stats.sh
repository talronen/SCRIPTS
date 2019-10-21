#!/bin/bash

#out=$(mongoexport -d Harvester -c Personas -q '{IsPublic:true,IsActive:false,WasBlocked:true}' -f "CreationDate,UpdateDate,Site,DisplayName,UserName" --sort '{Site:1}' -csv | awk -F"," -vOFS="," 'NR>1 {print}')


#---===--- Get all Blocked VAS from DB ---===---

mongoexport -d Harvester -c Personas -q '{IsPublic:true,IsActive:false,WasBlocked:true}' -f "CreationDate,UpdateDate,Site,DisplayName,UserName" --sort '{Site:1}' -csv | awk -F"," -vOFS="," '{print}' > vas.csv

#---==--- Read Data File ---===---
n=0
IFS=","

echo > BlockedVas-Stats.log
echo "           BlockedVas-Stats.log           " >> BlockedVas-Stats.log
echo >> BlockedVas-Stats.log
echo >> echo >> BlockedVas-Stats.log
echo "         ---===--- Blocked Vas Statistics ---===---" >> BlockedVas-Stats.log

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
     echo  "User" $f5 for site $f3 "Ran for "$ddays" Days" >> BlockedVas-Stats.log
else
((n ++))
fi

#---===--- Printing Resaults to File ---===---
done < ./vas.csv

clear

cat BlockedVas-Stats.log
