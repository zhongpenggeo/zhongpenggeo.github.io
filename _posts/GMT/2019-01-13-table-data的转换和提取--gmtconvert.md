---
layout: post
title: table-data的转换和提取--gmtconvert
categories: GMT
tags: GMT
---
#### 用法：
**gmtconvert** [ *table* ] [ [**-A**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmtconvert.html#a) ] [ [**-C**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmtconvert.html#c)[**+l***min*][**+u***max*][**+i**]] [ [**-D**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmtconvert.html#d)[*template*[**+o***orig*]] ] [ [**-E**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmtconvert.html#e)[**f**|**l**|**m***stride*] ] [ [**-L**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmtconvert.html#l) ] [ [**-F**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmtconvert.html#f)[**c**|**n**|**r**|**v**][*refpoint*] ] [ [**-I**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmtconvert.html#i)[**tsr**] ] [ [**-Q**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmtconvert.html#q)[**~**]*selection*] [ [**-S**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmtconvert.html#s)[**~**]*”search string”* | [**-S**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmtconvert.html#s)[**~**]/*regexp*/[**i**] ] [ [**-T**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmtconvert.html#t) ] [ [**-V**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmtconvert.html#v)[*level*] ] [ **-a**[flags](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt.html#aspatial-full) ] [ **-b**[binary](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt.html#bi-full) ] [ **-d**[nodata](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt.html#d-full) ] [ **-e**[regexp](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt.html#e-full) ] [ **-f**[flags](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt.html#f-full) ] [ **-g**[gaps](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt.html#g-full) ] [ **-h**[headers](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt.html#h-full) ] [ **-i**[flags](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt.html#icols-full) ] [ **-o**[flags](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt.html#ocols-full) ] [ **-s**[flags](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt.html#s-full) ] [ **-:**[**i**|**o**] ]
#### 描述：
转换、粘贴和提取列数据。  
作用的读入数据并按照要求写出新数据。有九个方面的作用：  
1. 在二进制和ascii之间转换；
2. 从多个文件中把相关记录粘贴到一个新的文件里；
3. 从数据列中提取子集；
4. 只提取头段记录中符合模式的相对应的区块；
5. 列出区块头段和没有数据的记录；
6. 提取每个区块中第一或/和最后的数据记录；
7. 转换输出条目的顺序；
8. 输出区块数目的范围；
9. 输出记录的数目符合要求的区块
