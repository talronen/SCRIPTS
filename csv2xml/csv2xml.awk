# awk -F ',' -v node=Bad-Proxy -f csv2xml.awk Bad-Proxy.csv
#
# \n => LF
# \r => CR
# NF => Number Of Fields/Colums
# NR => Get Line Number Each Time
# OFS => Stores the output field separator

BEGIN {OFS = "\n"}
NR == 1 {for (i = 1; i <= NF; i++)
            tag[i]=$i

         print "<Master>"}
NR != 1 {print "    <" node ">"
		 for (i = 1; i <= NF; i++)
	       print "      <"tag[i]">"$i"</"tag[i]">"
	     print "    </" node ">"
        }

END {print "</Master>"}