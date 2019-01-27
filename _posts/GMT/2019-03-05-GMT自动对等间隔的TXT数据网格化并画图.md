---
title: GMT自动对等间隔的TXT数据网格化并画图
tags: 自动网格化

---
关键：排序，然后找到数据的间隔。

```sh
#/*************************************************************************
#	> File Name: plot_prediction.sh
#	> Author:PengZhong 
#	> Mail: 
#	> Created Time: Wed Nov 14 14:01:33 2018
# ************************************************************************/

#!/bin/bash
FI=$1
f1=`echo ${FI%.*}`
NA=`echo ${f1##*/}`
PS=$NA.ps
GRD=$NA.grd
JJ=-JX10c/0
CPT=depth.cpt

RR=`gmt gmtinfo $FI -I1/1 `
# get two lines of x(or y), and their difference is dx
# which is useful when grdding
a=`gawk '{print $1}' $FI  |sort -g  |uniq| sed -n '2p' `
b=`gawk '{print $1}' $FI  |sort -g  |uniq| sed -n '3p' `
Dx=`echo | gawk "{print $b-$a}"`
#MAXX=`gawk '{print $1}' $FI | tail -n1`
## get number of nodes
#Bx=`echo | gawk "{print 2*$MAXX/$Dx}"`

a=`gawk '{print $2}' $FI  |sort -g  |uniq| sed -n '2p' `
b=`gawk '{print $2}' $FI  |sort -g  |uniq| sed -n '3p' `
Dy=`echo | gawk "{print $b-$a}"`
#MAXY=`gawk '{print $2}' $FI | tail -n1`
#By=`echo | gawk "{print 2*$MAXY/$Dy}"`

#echo $Bx 
#echo $By
gmt gmtset MAP_FRAME_TYPE plain
gmt xyz2grd  $FI ${RR} -I$Dx/$Dy  -G$GRD 
#gmt makecpt $TT -Cjet -Z > $CPT
#TT=`gmt grdinfo $GRD -Tdz`
gmt psxy $JJ $RR -T -K -P >$PS
gmt psbasemap $JJ $RR -B0 -K -O >>$PS
gmt grdimage $JJ $RR $GRD -C$CPT  -BSW -Ba -K -O >>$PS
gmt psscale $JJ $RR -DjRB+jLB+o0.5c/0c+w9c/0.3c -C$CPT -Bxa \
    -By+l"g/cc" -K -O >>$PS 
gmt psxy $JJ $RR -T -O >>$PS 
gmt psconvert $PS -A0.5c -Tj
rm gmt.* $PS $GRD 
##cd translate
```

