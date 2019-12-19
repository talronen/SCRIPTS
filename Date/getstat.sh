#!/bin/bash
#
# Calculate how many Days a User was Running
# Get VAS Creation Date and Update Date & Sort By Site
#

out=$(mongoexport -d Harvester -c Personas -q '{IsPublic:true,IsActive:false,WasBlocked:true}' -f "CreationDate,UpdateDate,Site,DisplayName,UserName" --sort '{Site:1}' -csv | sed 's/O_.//g' | awk 'NR>1{OFS="," ;print}' | sed 's/ /\n/g')

#
# We will get somthing like this:
# 
# CreationDate,UpdateDate,Site,DisplayName,UserName
# 2019-06-16T07:05:18.171Z,2019-08-16T05:08:36.215Z,OM.Facebook,User1@Hotmail.com,User1@Hotmail.com
#

echo $out
echo "======================"
# Read Columns of Each Row
while read f1 f2 f3 f4 f5; do

#f2="2019-06-24T17:48:14.076Z"
#f1="2019-06-22T17:48:14.076Z"
#f3="Facebook"a

#ddays=$((($(date -d f2 +%s) - $(date -d f1 +%s)) / 86400))
#echo $f2 $f1

#echo $f2 $f1

# Do the Calculation
ddays=$((($(date -d "$f2" +%s) - $(date -d "$f1" +%s)) /86400))

# Print the Resaults
echo  "User" $f5 for site $f3 "Ran for "$ddays" Days"

done < $1

#echo $out
