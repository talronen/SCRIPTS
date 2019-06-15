# awk -F ',' -v node=Bad-Proxy -f test.awk sample.csv
#
# \n => LF
# \r => CR
# NF => Number Of Fields/Colums
# NR => Get Line Number Each Time
# OFS => Stores the output field separator
BEGIN {OFS = "\n"}
NR == 1 {for (i = 1; i <= NF; i++)
            tag[i]=$i
            
         print "<Masters>"}
NR != 1 {print "   <" node ">"
		 for (i = 1; i <= NF; i++)

		 	#print s " " tagt[s] $s
		 	#tagt[s] "->"
		 	#print "AA" $s "AA"
          	print "     <"tag[i]">"$i"</"tag[i]">"
        }

END {print "</Masters>"}