---
layout: post
title: GMT绘制kml文件--gmt2kml
categories: GMT
tags: GMT
---
#### 使用：
**gmt2kml** [ *table* ] [ [**-A**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt2kml.html#a)**a**|**g**|**s**[*alt*|**x***scale*] ] [ [**-C**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt2kml.html#c)*cpt* ] [ [**-D**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt2kml.html#d)*descriptfile* ] [ [**-E**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt2kml.html#e)[*altitude*] ] [ [**-F**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt2kml.html#f)**e**|**s**|**t**|**l**|**p**|**w** ] [ [**-G**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt2kml.html#g)**f|n****-**|*fill* ] [ [**-I**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt2kml.html#i)*icon* ] [ **-K**] [ [**-L**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt2kml.html#l)*col1:name1*,*col2:name2*,… ] [ [**-N**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt2kml.html#n)[+|*name_template*|*name*] ] [ **-O**] [ [**-Q**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt2kml.html#q)**a**|**i***az* ] [ [**-Q**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt2kml.html#q)**s***scale*[*unit*] ] [ [**-R**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt2kml.html#r)**a**|*w/e/s/n* ] [ [**-S**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt2kml.html#s)**c**|**n***scale*] ] [ [**-T**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt2kml.html#t)*title*[/*foldername*] ] [ [**-V**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt2kml.html#v)[*level*] ] [ [**-W**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt2kml.html#w)[*pen*][*attr*] ] [ [**-Z**](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt2kml.html#z)*args* ] [ **-bi**[binary](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt.html#bi-full) ] [ **-di**[nodata](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt.html#di-full) ] [ **-e**[regexp](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt.html#e-full) ] [ **-f**[flags](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt.html#f-full) ] [ **-h**[headers](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt.html#h-full) ] [ **-i**[flags](http://gmt.soest.hawaii.edu/doc/5.4.4/gmt.html#icols-full) ] [ **-:**[**i**|**o**] ] [ > *output.kml* ]

#### 描述：
读取table data，并绘制为开门了文件，data包括点、线、多边形、wiggles以及其他属性，如题目、altitude mode、颜色、透明度、区域、和数据描述等。你也可以把特征放到地表并用自定义的图标来表示它。
#### 输入数据格式
> lon lat [ alt ] [ timestart [ timestop ] ]  

> lon和lat表示经纬度，是必须的，alt是可选的。  



#### 必选参数
无
#### 可选参数
> - -Aa|g|s[alt|`x`scale]  
> a表示绝对altitude；g表示相对sea surface或地面；s表示相对sealfloor。为了绘制一个在固定altitude的标识，加入一个*alt*(单位是m)，加入*`x`scale*为了缩放altitude。如果没有追加任何值，则从输入文件的第三列读取。

> - -Fe|s|l|p|w  
> 选择标识类型，point(**e**vent,**s**ymbol, or **t**imespan),**l**ine, **p**olygon, **w**iggle; 使用F时，前两列经纬度是必须的，第三列altitude也需要（当使用了-A或-C是不用第三列），

> - -Gf|n*fill*  
> -Gf表示填充颜色，-Gn填充字体；*fill*: 设置fill表示填充颜色到符号、多边形和wiggles（默认是75%的亮橘色）。此外，-Gf-表示关闭多边形填充。

> - -Ra|w/e/s/n  
> Issue a single Region tag
