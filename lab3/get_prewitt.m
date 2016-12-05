function prewitt = get_prewitt(file)
% input a file and return the edge of the picture

[grey, map] = imread(file);
if isempty(map)
    grey = rgb2gray(grey);
end
[m, n] = size(grey);
set (gcf,'Position',[300,200,800,300])

%% Original picture
subplot(131), imshow(grey);
title('Original picture');

%% Templet && caculate grads
hx = [-1 0; 0 1];
hy = [0 -1; 1 0];
Gx = conv2(im2double(grey), hx);
Gy = conv2(im2double(grey), hy);
Gx = Gx(2:1+m, 2:1+n);
Gy = Gy(2:1+m, 2:1+n);

%% Edge detection
prewitt = abs(Gx) + abs(Gy);
subplot(132), imshow(prewitt);
title('Edge detection');

%% Threshold processing
threshold = max(max(prewitt)) * 0.18;
for i = 1:m
    for j = 1:n
        if prewitt(i, j) >= threshold
            prewitt(i, j) = 1;
        else
            prewitt(i, j) = 0;
        end
    end
end
subplot(133), imshow(prewitt);
title('Threshold processing');

