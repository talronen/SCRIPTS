#!/bin/bash

# Get Last word in line -> grep -oE '[^ ]+$' file
# Get Last Item of Collectd Metrics Output -> cat active-va | awk -F '.' {'print $NF'}


echo "curl -i -XPOST 'http://localhost:8086/write?db=mydb' --data-binary 'cpu_load_short,host=server01,region=us-west value=0.64 1434055562000000000'"

metric=`cat $1 | awk -F '.' {'print $NF'}`
item=`echo $metric | awk {'print $1'}`
value1=`echo $metric | awk {'print $2'}`
time1=`echo $metric | awk {'print $3'}`
r1="Va-Status"
tag1="System-Checks"
host="Monitor"
v1="curl -i -XPOST 'http://localhost:8086/write?db=mydb' --data-binary '$r1,host=$host value=$value1 $time1'"


echo "metric="$metric
echo "Item="$item
echo "value="$value1
echo "time="$time1
echo "tag1="$tag1
echo "r1="$r1
echo "Host="$host
echo $v1
#send=`$v1VA-Status,$tag1=Data,valv1metric,$tag1 value=$value1 $time1`
#echo  $v1"VA-Status,"$tag1,"value="$value1 $time1"'"

`curl -i -XPOST 'http://localhost:8086/write?db=mydb' --data-binary '$r1,host=$host value=$value1 $time1'`