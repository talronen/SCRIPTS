#!/bin/bash

# This script will calculated Differance between tow Dates in Days
#
# Syntx: ./datediff.sh '2019/1/10' '2019/1/1'
#
#

#datediff() {
#    d1=$(date -d "$1" +%s)
#    d2=$(date -d "$2" +%s)
#    echo $(( (d1 - d2) / 86400 )) days
#}

echo  $((($(date -d $1 +%s) - $(date -d $2 +%s)) / 86400))



