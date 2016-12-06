## 实验准备

熟悉Matlab软件、编程以及图像处理工具箱

1. 用其自带函数读入并显示bmp格式的程序，用鼠标选择区域，将其象素数据写入数组
2. 查阅Microsoft的有关资料，了解BMP文件的格式，写出读出BMP文件中各象素灰度值并显示该BMP文件的程序流程图，实现之
3. 使用Matlab软件Image工具箱，阅读其中关于颜色空间的帮助
4. 编制程序实现RGB到HSI和HSI到RGB彩色图像转换程序，并用R，G，B最大值来测试程序

## 实验一

* 给定一幅图像，输出其直方图
* 通过对话框给定一个线性变换函数，实现图像的灰度拉伸
* 实现对图像的均衡化

### 实验检查

读入任一幅图像，输出显示灰度拉伸的图像和均衡化后图像

## 实验二

* 实现一个通用的高通、低通滤波器（理想、巴特沃思和指数滤波）
* 实验伪彩色处理

### 实验检查

* 读入一幅带噪声图像，实现低通去噪，输出处理后图像
* 读入一幅模糊图像，实现高通去模糊，输出处理后图像
* 读入一副灰度图像，实现伪彩色（参数可调）

## 实验三

编制一个通用的边缘提取函数（Sobel算子、Prewitt算子、Roberts算子和Marr算子）

### 实验检查

读入任意图象（如果是彩色图象，先转变为灰度图象），输出不同算子实现的边缘二值图象

## 实验四
	
在 $N = M = 2$ <sup>$i$</sup> 情况下，编制二维快速傅立叶变换变换以及反变换

### 实验检查

给定任意二维矩阵，根据编制的傅立叶变换函数和反变换函数，分别输出结果

## 实验五

给定栅格图象及其变形后的栅格图像，首先确定各栅格交叉点的位移，然后采用控制栅格的方法编写实现图像几何校正的程序

### 实验检查

读入变形后的图像，输出显示校正后的图像

