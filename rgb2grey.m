function grey = rgb2grey(rgb)
% ����ͼƬ�� RGB ��ά���󣬷��ػҶ�ֵ�Ķ�ά����

% ��ȡ RGB ����
r=rgb(:,:,1);
g=rgb(:,:,2);
b=rgb(:,:,3);
% ����Ҷ�ֵ
grey = 0.29900 * r +  0.58700 * g + 0.11400 * b;