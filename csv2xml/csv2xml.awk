# nawk -v node=whatever -f pj.awk pj.txt
BEGIN {OFS = "\n"}
NR == 1 {for (i = 1; i <=NF; i++)
		tag[i]=$i
	print "<" node "XML>"}
NR != 1 {print "   <" node ">"
	for (i = 1; i <= NF; i++)
		print "      <" tag[i] ">" $i "</" tag[i] ">"
	print "   </" node ">"}
END {print "</" node "XML>"}
