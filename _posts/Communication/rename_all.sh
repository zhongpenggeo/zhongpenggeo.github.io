#/*************************************************************************
# ****** rename_all.sh
# ************   Introduction     *************	
#	rename file with sufixx .md matched with jekyll format 
#   format in jekyll:Year-Month-day-filenem.md
#   befor formated: e.g.3-10-filename.md
# ************      Copyright     *****************
# Writeen by PengZhong, ZJU, Fri Jan 25 19:10:19 2019
# Last modified:	 
# ***********************************************************************
 
#!/bin/bash
 
ALL=`ls *.md`
# assume the rename time begin in a month ago;
TM=0
TM_B=2017-06-05
for NA in $ALL
do
	# time past one day each loop, 86400 seconds eual 1 day
	TM=`echo "$TM+86400"|bc`
	# time format as 2008-1-2
	TM_NA=`date -d "$TN_B $TM seconds" +"%Y-%m-%d"`
    f1=`echo ${NA%.*}`
    f=`echo ${f1##*/}`
	# match original filename and cut number in filename;
	ff=`echo "$f"|sed -e "s/-/_/g"`
	# rename
    NEWNA=$TM_NA-$ff.md
    mv $NA $NEWNA
done
