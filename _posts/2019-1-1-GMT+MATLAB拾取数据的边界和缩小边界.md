
## 问题
1. 有一个不规则形体的散点图，需要提取它的边界（比如我有一个航磁数据，不完全是方块状的矩阵，而是一个不规则的形状，希望得到它的边界。因为一般的数据处理都要先把它网格化为矩阵，处理完后再用边界把结果切出来）；如：  
![enter description here](https://www.github.com/zhongpenggeo/Blogs/raw/master/imags/1545016295828.png)

实际有的数据比这要更加不规则；
2. 可能因为某些处理，导致需要从边界向内部缩小一定的范围，比如50km；
3. 扩大边界；

## 解决的方法
对于问题一，MATLAB有一个非常好用的函数，boundary(x,y,n); x和y表示散点图的点位；n表示shrink factor，在0-1之间，n越大，提取的边界越精细；n越小，则边界的越规则；返回值是点位的索引；  
对于问题二，需要一些技巧性的操作，我自己的办法是：
1. 用matlab得到polygon的数据后（下图黑色边界），整体对x和y都加上你要缩小的范围，比如50km（下图红色边界），然后x和y全部减去50km（蓝色边界），这样获得两个polygen；再用gmtspatial提取交集，  
 ![enter description here](https://www.github.com/zhongpenggeo/Blogs/raw/master/imags/1545016922045.png)
2. gmtspatial提取边界（求polygon的交集）：  
```shell
gmt gmtspatial poly_a.txt poly_b.txt -Si > a.txt
gmt gmtspatial poly_b.txt poly_a.txt -Si > b.txt
cat a.txt b.txt > poly.txt
```
注意：由于求交集时时求poly_b.txt在poly_a.txt 里面的那一部分，所以要求两次，再拼接起来，就是它们的交集了（图中绿色部分）。

对于问题三，用grdmask中的-S选项可以扩大边界。或者用问题二的方法去并集。

