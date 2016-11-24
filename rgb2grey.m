function grey = rgb2grey(rgb)
% 输入图片的 RGB 三维矩阵，返回灰度值的二维矩阵

% 获取 RGB 分量
r=rgb(:,:,1);
g=rgb(:,:,2);
b=rgb(:,:,3);
% 计算灰度值
grey = 0.29900 * r +  0.58700 * g + 0.11400 * b;