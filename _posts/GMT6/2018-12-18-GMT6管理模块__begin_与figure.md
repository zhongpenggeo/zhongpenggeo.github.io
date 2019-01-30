---
title: GMT6管理模块--begin-与figure
date: 2018-10-14 00:00:00
categories:
- GMT6
---
GMT6.0全新改版后，开头都要说一声：我要开始画图了。  
所用的模块就是begin和figure。  
#### 1. begin
如果只画一张图，那么开头就用begin：    
- 必选参数：无  
- 可选参数：  
    - filename：文件名
    - format：格式，文件格式中间用逗号分开  
格式有：  
- bmp
- eps
- jpg
- pdf（若不带格式，默认生成pdf）
- png
 - PNG（背景为透明）
- ppm
- ps
- tif
举例：  

> gmt begin Figure1 pdf,png  

那么，绘图完成后，会在当前目录生成Figure1.pdf和Figure1.png两个图片。  
如果begin后面什么也不加：  
> gmt begin

会自动生成gmtsession.pdf文件。

#### 2. figure
如果要生成多幅图，则用figure。  
**同时和begin相比，figure有一部分psconvert的功能，可以设置图片的属性**。  
- 必选参数：  filename（文件名）  
- 可选参数：  
    - format（格式），
    - A、C、D、E（与psconvert的参数一样）  
举例：  
> gmt figure map jpg A1c  
最后会生成留白1cm的jpg图片
当要生成第二幅图时，再添加一句：  
> gmt figure mapw jpg

脚本：
```sh
#!/bin/bash

gmt begin gmt-map pdf,jpg
gmt set FONT_TITLE=10p,Helvetica-Bold
gmt figure Tibet jpg
gmt grdimage Tibet_topo.grd -R70/110/15/45 -JM5c -Ba10 -Cetopo1
gmt figure Nanhai jpg
gmt grdimage Nanhai_topo.grd -R105/120/5/25 -JM5c -Ba5 -Cetopo1


gmt end
```
最终生成Nanhai.jpg和Tibet.jpg  
(为什么感觉很鸡肋，直接写两个脚本不就得了？）

---
#### 更多资料
**[GMT6.0的学习笔记](https://www.jianshu.com/p/ac52b407efa1)**
