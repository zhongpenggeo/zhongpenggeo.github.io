---
title: surfer6text与gmt网格文件互转
date: 2018-08-11 00:00:00
categories:
- GMT
---

### 问题
在surfer中，常用的一种格式是surfer6 text ascii格式，该格式以DSAA打头；是一种文本格式；   
在GMT中常用的是netcdf格式，是一种二进制格式；  
在matlab脚本库中，有一个open_grd脚本，可以用来打开DSAA打头的grd文件，因此经常遇到要把DSAA格式的转换为netcdf格式。

### 剖析两种格式
DSAA的格式全称是：Golden Software ASCII Grid File Format
This is the ASCII-based (human-readable) version of one of the raster formats used by Golden Software products (such as the Surfer series). This format is supported for both reading and writing (including create, delete, and copy). Currently the associated formats for color, metadata, and shapes are not supported.

GMT本身并不支持这种格式，但是可以配合gdal使用，来转换这种格式, 因此必须安装gdal  
安装方式：[GDAL安装——GMT中文社区](https://gmt-china.org/blog/gdal-ogr/)

### 转换
- 转成DSAA
```shell
  gmt grdconvert input.nc -Gout.grd=gd:GSAG
```


- 转成netcdf
```shell
gmt grdconvert input.grd -Gout.nc
```
