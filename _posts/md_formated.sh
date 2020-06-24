#/*************************************************************************
# ****** md_formated.sh
# ************   Introduction     *************	
#	add head information in md file and add time info to filename 
# ************      Copyright     *****************
# Writeen by PengZhong, ZJU, Sat Jan 26 15:38:29 2019
# Last modified: 2020-6-8 
# ***********************************************************************
 
#!/bin/bash
 
ALL=`ls *.md`

# 默认以空格/tab为分割符，导致如果文件名中有空格就无法处理，
# 这里设置为\n，就可以让带空格的文件名视为一个变量。
IFS=$'\n'


# get folder name
DIR=`echo "$PWD"|gawk -F'/' '{print $NF}'`
for NA in $ALL
do
	# %w 表示生成文件的时间，%y表示修改文件的时间
	TM=`stat $NA -c %y|gawk '{print $1}'`
	FM=`stat $NA -c %y|gawk '{print $2}'|cut -c 1-8`
    TM_FM="$TM $FM"

	# 把文件名中的_和-都换成空格，因为文件名字（文章题目）实际上不带这些字符
	F_LINE=`sed  '/^$/d' $NA|gawk 'NR==1 {print $1}'`

	# 加入头文件信息，符合jekelly的规则
	# 确保之前没有加入过头文件信息
	if [ $F_LINE != '---' ]; then
    	TMP=`echo ${NA%.*}`
    	FI=`echo ${TMP##*/}`
    	sed -i '1i\---' $NA
		sed -i "1i\- $DIR" $NA
		sed -i '1i\categories:' $NA
    	sed -i "1i\date: $TM_FM" $NA
    	#sed -i "1i\title: `echo "$FI"|sed -e 's/_/ /g'|sed -e 's/-/ /g' ` " $NA
		sed -i "1i\title: `echo "$FI"|sed -e 's/_/ /g'` " $NA
    	sed -i '1i\---' $NA
	fi

	# 去除后缀
	f1=`echo ${NA%.*}`
    f=`echo ${f1##*/}`
	# 取出后缀
    Yr=`echo "$f"|cut -c 1-2`

	# 确保这些文件没有被命名过,2020
    if [[ "$Yr" =~ "20" ]]; then
		# a=3 is nothing, jsut do a action.
        a=3
    else
    	# match original filename and cut number in filename;
    	ff=`echo "$f"|sed -e "s/-/_/g"|sed -e "s/ /_/g"`
    	# rename
    	NEWNA=$TM-$ff.md
    	mv $NA $NEWNA
    fi
done
