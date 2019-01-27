#/*************************************************************************
# ****** md_formated.sh
# ************   Introduction     *************	
#	add head information in md file 
# ************      Copyright     *****************
# Writeen by PengZhong, ZJU, Sat Jan 26 15:38:29 2019
# Last modified:	 
# ***********************************************************************
 
#!/bin/bash
 
ALL=`ls *.md`
TM=0
TM_BEGIN=2018-12-10
# get folder name
DIR=`echo "$PWD"|gawk -F'/' '{print $NF}'`
for NA in $ALL
do
	TM=`echo "$TM+86400"|bc`
    TM_FM=`date -d "$TM_BEGIN $TM seconds" +"%Y-%m-%d %H:%M:%S"`
	F_LINE=`sed  '/^$/d' $NA|gawk 'NR==1 {print $1}'`
	if [ $F_LINE != '---' ]; then
    	TMP=`echo ${NA%.*}`
    	FI=`echo ${TMP##*/}`
    	sed -i '1i\---' $NA
		sed -i "1i\- $DIR" $NA
		sed -i '1i\categories:' $NA
    	sed -i "1i\date: $TM_FM" $NA
    	sed -i "1i\title: $FI" $NA
    	sed -i '1i\---' $NA
	fi
done

