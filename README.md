---
title: 2019-1-28-创建自己的jekyll theme
date：2019-1-28 16:01:00
categories:
- Jekyll-theme
- cayman
tags: design

mathjax: true
grammar_cjkRuby: true
---

这个theme（主题）主要是根据cayman修改的，cayman是jekyll在github page上默认的theme之一，颜值非常高，蓝绿渐变非常的清新。但是根据一般规律，颜值高的功能差，功能全的颜值低。所以cayman虽然非常好看，但是功能非常之少，于是手动增加了一些简单功能，满足一般的需要。  
**主要增加了以下功能**：  
- 三个button：
	- HomePage：回到主页，主页是类似archives的一个界面
	- Categories：目录页
	- Photo：目录下的Photo分类（只是因为个人比较喜欢这个类）
- 搜索框
- 回到顶部按钮
- 前后翻页
- 小工具：md_formarted.sh用来给以前写的不规范的md文件加入头信息和修改名称。
### jekyll的文件结构
```
root/
├── _includes/
├── _layouts/
├── _posts/
├── css
├── js
├── categories
├── images
├── imags
├── index.html
├── _config.yml
├── 404.html
├── search.html
├── Gemfile
```
#### 文件功能 
- \_includs:一般是保存各种网页的模板，然后导入其他的网页框架中
	- head.html主要是页面边框的一些部件，如顶部的logo和title，以及导入cayman的css部件，奠定整个主题的色调和框架
	- page-head.html：三个button和搜索框的定义；
	- page-footer.html：底部的copywrite
	- categories.html：categories所在的button需要用这个模板建立网页
	- contents.html：之前的主页，主要实现了把所有post分类呈现，但后来改用archives，所以这里没用上。
- \_layouts: contain a default.html, post.html and page.html template to get started with
	- 对应于_includes，主要用来导入includes中的部件；
- \_posts：你所有用markdown写的博文，可以分为多个子文件夹存放，便于管理；
- css：主题风格定义文件，主要定义了主题的颜色和分布，以及字体等宏观信息；
- js：搜索脚本等各种脚本存放位置
- categories：建立各个目录页
- images：网页框架需要的图片
- imags：\_posts中部分文章的本地图片存放于此；
- index.html：主页（首页）
- \_config.yml：配置文件
- 404.html：若找不到相关网页，则自动跳到404网页（github风格的）
- search.html：搜索页面的入口
- Gemfile：gem插件相关。

#### 其他文件
- yourtheme-gemspec：保存关于theme的各种信息，包括软件版本和copywrite等；如设置变量：spec.homepage. 

### 创建button
1. 先在page-head.html定义button的标题以及跳转的链接；
2. 对categories的button，要在/categories下面建立index，这个index主要把post中出现的categories做无序排列，并给出相应categories所有文章集合的页面链接  
![enter description here](https://www.github.com/zhongpenggeo/Blogs/raw/master/imags/1548748032633.png)

**注意这里需要在//categories文件夹下建立一系列相应categories的字文件夹。比如你有Photo、Life、Food三个categories，那么需要建立/categories/Photo, /categories/Life, /categories/Food三个子文件夹，然后每个文件夹下面一个index.html，这个index.html定义了每一个对应的categories网页。**    
	![enter description here](https://www.github.com/zhongpenggeo/Blogs/raw/master/imags/1548748079788.png)
	
3. 对Photo 的button（或者其他具体的categories），同上
### 创建搜索
需要借助lunr.js脚本的函数来实现，注意该脚本已经从1.x升级到2.x，所以有些博文已经失效了。    
参考：[Jekyll search using lunr.js](https://learn.cloudcannon.com/jekyll/jekyll-search-using-lunr-js/)     
![enter description here](https://www.github.com/zhongpenggeo/Blogs/raw/master/imags/1548748539276.png)

风格比较原始，不太会渲染搜索结果（逃~）

### 回到顶部按钮
参见：[博客添加回到顶部按钮——团子的博客](http://kodango.com/customize-back-to-top-button)  
但脚本有些问题，未能实现隐身效果。

### 上一页下一页
参见：[Jekyll – how to link to next/previous post on your blog——David Elbe](https://david.elbe.me/jekyll/2015/06/20/how-to-link-to-next-and-previous-post-with-jekyll.html)  
![enter description here](https://www.github.com/zhongpenggeo/Blogs/raw/master/imags/1548748582990.png)

### 最终结果
参考cayman的theme，改进得到的博客界面：  
![enter description here](https://www.github.com/zhongpenggeo/Blogs/raw/master/imags/1548748517762.png)

### 待增加功能
1. 翻页，即每页只呈现数个结果，可以翻页，而不是要一直拖到底部才能看到所有的文章列表
2. 每篇博客的文章标题居中。目前还是左对齐，还没搞清楚markdown是如何解析为html的，哪些参数控制着效果。


