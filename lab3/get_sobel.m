function sobel = get_sobel(file)
% input a file and return the edge of the picture

[grey, map] = imread(file);
if isempty(map)
    grey = rgb2gray(grey);
end
[m, n] = size(grey);
set (gcf,'Position',[300,200,800,300])

% Original picture
subplot(131), imshow(grey);
title('Original picture');

% Templet && caculate grads
hx = [-1 -2 -1; 0 0 0; 1 2 1];
hy = hx';
Gx = conv2(im2double(grey), hx);
Gy = conv2(im2double(grey), hy);
Gx = Gx(3:2+m, 3:2+n);
Gy = Gy(3:2+m, 3:2+n);

% Edge detection
sobel = abs(Gx) + abs(Gy);
subplot(132), imshow(sobel);
title('Edge detection');

% Threshold processing
threshold = max(max(sobel)) * 0.18;
for i = 1:m
    for j = 1:n
        if sobel(i, j) >= threshold
            sobel(i, j) = 1;
        else
            sobel(i, j) = 0;
        end
    end
end
subplot(133), imshow(sobel);
title('Threshold processing');

