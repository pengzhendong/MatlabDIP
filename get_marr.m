function marr = get_marr(file)
% input a file and return the edge of the picture

[grey, map] = imread(file);
if isempty(map)
    grey = rgb2gray(grey);
end
[m, n] = size(grey);

% Caculate gauss arguments
sigma = min(m, n) * 0.005;
len = ceil(6 * sigma);
if mod(len, 2) == 0
    len = len + 1;
end

% Caculate the value of LoG
xa = -5*sigma:0.1:5*sigma;
ya = xa;
[x, y] = meshgrid(xa, ya);
del = (x.^2 + y.^2 - 2*sigma^2) / sigma^4;
gauss = exp(-1 * (x.^2 + y.^2) / (2*sigma^2));
log = del .* gauss;
figure, plot3(x, y, -log);
title('LoG');

set (gcf,'Position',[300,200,800,300])
% Original picture
subplot(121), imshow(grey);
title('Original picture');

% Caculate the  templet
templet = zeros(len, len);
for i = 1:len
    for j = 1:len
        a = i - (len - 1) / 2 - 1;
        b = j - (len - 1) / 2 - 1;
        del = (a^2 + b^2 - 2*sigma^2) / sigma^4;
        gauss = exp(-1 * (a^2 + b^2) / (2*sigma^2));
        templet(i, j) = del * gauss;
    end
end

% Edge detection
marr = conv2(im2double(grey), templet);
subplot(122), imshow(marr);
title('Original picture');


