function pic_array = select_img(file_name)
% 输入文件路径，打开文件，返回通过鼠标选取图片的区域
% 8 位的图片得到的是索引也就是灰度值

img = imread(file_name);
imshow(img);
waitforbuttonpress;
point1 = get(gca, 'CurrentPoint');	% 起点
rbbox;
point2 = get(gca, 'CurrentPoint');	% 终点

point1 = point1(1, 1:2);
point2 = point2(1, 1:2);

p1 = floor(min(point1, point2));	% 左上角
p2 = floor(max(point1, point2));	% 右下角

% 五点连成封闭矩形
x = [p1(1) p2(1) p2(1) p1(1) p1(1)];
y = [p1(2) p1(2) p2(2) p2(2) p1(2)];
hold on;
plot(x, y, 'g');

pic_array = img(p1(2):p2(2), p1(1):p2(1));
figure, imshow(pic_array);