---
title: 3-7-gmtmath与grdmath区别
date: 2018-07-26 00:00:00
categories:
- GMT
---
gmtmath对表格数据（table data）做各种运算，包括排序，加减乘除等  
grdmath对grd数据运算，各种运算  
范例：grdmath tibet_profile1.grd 90 25 SDIST 111.13 MUL =temp.grd  
SDIST：大圆距离就算‘  
所以上式为：计算grd到90/25的距离，再乘以111.13得到temp.grd  


