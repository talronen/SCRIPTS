#!/bin/bash

# ---====--- Sending XML Alert File using csv2xml.awk ---===----
# awk -F ',' -v node=Bad-Proxy -f csv2xml.awk Bad-Proxy.csv

#---===--- Find Metrics File Name Without Extention ---===---
# Metric file name example Bad-Proxy.csv
# -----------------------------------------------------------

# ---===--- Tool Script to Replace all White Spcaes With Single Coma ---===---
# # ---===--- Command to Replace all Spaces in a file with Coma ---===---
# sed -e 's/\s\+/,/g' orig.txt > modified.txt

fullfile=$1
fname=$(basename $fullfile)
fbname=${fname%.*}

#---===--- Get Metric Filename Before "-" ---===---
Item1="$(echo ${fname} | awk -F '[-]' '{print $1}')"
#echo "awk -F ',' -v node="$fbname" -f csv2xml.awk2" $1

#---===--- Create The XMl File ---===---
awk -F ',' -v MasterXML=$fbname -v Item=$Item1 -f csv2xml.awk2 $1
