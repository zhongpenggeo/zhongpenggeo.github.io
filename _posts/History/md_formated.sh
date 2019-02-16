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
TM_B=2019-02-12
# get folder name
DIR=`echo "$PWD"|gawk -F'/' '{print $NF}'`
for NA in $ALL
do
	TM=`echo "$TM+86400"|bc`
    TM_FM=`date -d "$TM_B $TM seconds" +"%Y-%m-%d %H:%M:%S"`
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
	f1=`echo ${NA%.*}`
    f=`echo ${f1##*/}`
    Yr=`echo "$f"|cut -c 1-3`
    if [[ "$Yr" =~ "201" ]]; then
		# a=3 is onthing, jsut do a action.
        a=3
    else
    	# time format as 2008-1-2
    	TM_NA=`date -d "$TM_B $TM seconds" +"%Y-%m-%d"`
    	# match original filename and cut number in filename;
    	ff=`echo "$f"|sed -e "s/-/_/g"`
    	# rename
    	NEWNA=$TM_NA-$ff.md
    	mv $NA $NEWNA
    fi
done
