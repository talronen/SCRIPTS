#!/bin/bash

# ---====--- Sending XML Alert File ---===----
# awk -F ',' -v node=Bad-Proxy -f csv2xml.awk Bad-Proxy.csv

fullfile=$1
fname=$(basename $fullfile)
fbname=${fname%.*}
node=$fbname

echo "awk -F ',' -v node="$fbname" -f csv2xml.awk2" $1
awk -F ',' -v node=$fbname -f csv2xml.awk2 $1