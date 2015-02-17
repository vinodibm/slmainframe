route add -net 192.168.0.0 netmask 255.255.255.0 gw 10.108.1.83
echo "//RAMALINA JOB ACCT, " > /root/tmpfile
echo "// RAMALIN, " >> /root/tmpfile
echo "// CLASS=A, " >> /root/tmpfile
echo "// MSGCLASS=Q, " >> /root/tmpfile
echo "// NOTIFY=&SYSUID," >> /root/tmpfile
echo "// REGION=0M " >> /root/tmpfile
echo "//STEP1 EXEC PGM=IKJEFT01 " >> /root/tmpfile
echo "//SYSTSPRT DD SYSOUT=A " >> /root/tmpfile
echo "//SYSTSIN DD * " >> /root/tmpfile
echo " LISTUSER " >> /root/tmpfile
echo "/* " >> /root/tmpfile
curl -k -i -X PUT https://ramalin:thinking@192.168.0.227:32208/zosmf/restjobs/jobs -H "Content-Type: text/plain" -H "X-IBM-Intrdr-Class: A" --data-binary @/root/tmpfile >> /root/startup
date >> /root/startup
