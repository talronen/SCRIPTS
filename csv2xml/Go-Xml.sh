#!/bin/bash

# ---===--- Use This Script to Convert a CSV File to XLM ---===---

# --       Generate XML File from a Csv Source file      --
# awk -F ',' -v node=Bad-Proxy -f csv2xml.awk Bad-Proxy.csv
# ---------------------------------------------------------



#   The Real Program Starts Heare 

# Find Metrics File Name Without Extention 
# Metric file name example Bad-Proxy.csv


# ---===--- Tool Script to Replace all White Spcaes With Single Coma ---===---
# sed -e 's/\s\+/,/g' orig.txt > modified.txt

fullfile=$1
fname=$(basename $fullfile)
fbname=${fname%.*}


#---------   Grab Metric Name Before "-"   ---------
Item1="$(echo ${fname} | awk -F '[-]' '{print $1}')"


#echo "awk -F ',' -v node="$fbname" -f csv2xml.awk2" $1

<<<<<<< HEAD
#-----------         Generate The XMl Output          ----------
awk -F ',' -v MasterXML=$fbname -v Item=$Item1 -f csv2xml.awk2 $1

=======
#---===--- Create The XMl File ---===---
awk -F ',' -v MasterXML=$fbname -v Item=$Item1 -f csv2xml.awk2 $1
>>>>>>> 4896a5a10599bb0b558114027453579d9d32fecc
