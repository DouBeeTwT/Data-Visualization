# 三维曲面能量展示与移动最小二乘法光滑化的Python实现
在计算化学中我们不可避免的会遇到能量在反应坐标系中的展示。在一维反应坐标系中我们的能量变化是一条弯曲的曲线，而二维反应坐标系中，能量的变化将是一个起伏波动的曲面。在`Python`中我们可以通过`Matplotlib`这一程序包来实现数据的可视化。不简单的是，我的实验数据存在随机误差，所以做出的曲面也许不够光滑，因此我们需要使用移动最小二乘法来光滑化我们的实验数据曲面。

-----

## 1 三维曲面能量展示
### 1.1 加载必要的软件包
为了实现我们想要的作图功能,`Numpy`和`Matploylib`是两个必须要加载的程序包。如果你的本地没有这两个程序包，我们可以通过pip来安装他们：

> python -m pip install -U numpy  
python -m pip install -U matplotlib

#### 1.1.1 `Numpy`简介
`Numpy`(Numerical Python) 是 Python 语言的一个扩展程序库，支持大量的维度数组与矩阵运算，此外也针对数组运算提供大量的数学函数库。

NumPy 的前身 Numeric 最早是由 Jim Hugunin 与其它协作者共同开发，2005 年，Travis Oliphant 在 Numeric 中结合了另一个同性质的程序库 Numarray 的特色，并加入了其它扩展而开发了 NumPy。NumPy 为开放源代码并且由许多协作者共同维护开发。

NumPy 是一个运行速度非常快的数学库，主要用于数组计算，包含：
+ 一个强大的N维数组对象 ndarray
+ 广播功能函数
+ 整合 C/C++/Fortran 代码的工具
+ 线性代数、傅里叶变换、随机数生成等功能

<div align=center><img src="https://www.numpy.org/_static/numpy_logo.png" width = 100% height = 100% />

#### 1.1.2 `Matplotlib`简介
Matplotlib是一个Python 2D绘图库，它可以在各种平台上以各种硬拷贝格式和交互式环境生成出具有出版品质的图形。只需几行代码即可生成绘图，直方图，功率谱，条形图，错误图，散点图等。

为了简单绘图，pyplot模块提供了类似于MATLAB的界面，特别是与IPython结合使用时。 对于高级用户，您可以通过面向对象的界面或MATLAB用户熟悉的一组函数完全控制线条样式，字体属性，轴属性等

<div align=center>![](https://matplotlib.org/_static/logo2.png)

#### 1.1.3 加载程序包

```Python
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.colors as col
from matplotlib import cm
from mpl_toolkits.mplot3d import Axes3D
```

### 1.2 数据写入与数据结构修改

### 1.3 数据可视化与参数调整

### 1.4 后修饰

-----
## 2 移动最小二乘法
