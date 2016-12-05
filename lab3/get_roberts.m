function roberts = get_roberts(file)
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
hx = [-1 -1 -1; 0 0 0; 1 1 1];
hy = hx';
Gx = conv2(im2double(grey), hx);
Gy = conv2(im2double(grey), hy);
Gx = Gx(3:2+m, 3:2+n);
Gy = Gy(3:2+m, 3:2+n);

%% Edge detection
roberts = abs(Gx) + abs(Gy);
subplot(132), imshow(roberts);
title('Edge detection');

%% Threshold processing
threshold = max(max(roberts)) * 0.18;
for i = 1:m
    for j = 1:n
        if roberts(i, j) >= threshold
            roberts(i, j) = 1;
        else
            roberts(i, j) = 0;
        end
    end
end
subplot(133), imshow(roberts);
title('Threshold processing');

