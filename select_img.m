function pic_array = select_img(file_name)
% �����ļ�·�������ļ�������ͨ�����ѡȡͼƬ������
% 8 λ��ͼƬ�õ���������Ҳ���ǻҶ�ֵ

img = imread(file_name);
imshow(img);
waitforbuttonpress;
point1 = get(gca, 'CurrentPoint');	% ���
rbbox;
point2 = get(gca, 'CurrentPoint');	% �յ�

point1 = point1(1, 1:2);
point2 = point2(1, 1:2);

p1 = floor(min(point1, point2));	% ���Ͻ�
p2 = floor(max(point1, point2));	% ���½�

% ������ɷ�վ���
x = [p1(1) p2(1) p2(1) p1(1) p1(1)];
y = [p1(2) p1(2) p2(2) p2(2) p1(2)];
hold on;
plot(x, y, 'g');

pic_array = img(p1(2):p2(2), p1(1):p2(1));
figure, imshow(pic_array);