function new_pseudo_color(file, N)
% input a grey file and return a rgb file

[img, map] = imread(file);
if isempty(map)
    grey = rgb2gray(img);
else
    grey = img;
end
[m, n] = size(grey);
set (gcf,'Position',[200,100,1000,500])

% Original picture
subplot(221), imshow(img);
title('Original picture');

% Grey picture
subplot(222), imshow(grey);
title('Grey picture');

% Pseudo color picture
maxg = max(max(grey));
ming = min(min(grey));
range = maxg - ming;

block = ceil(double(range) / N);
k = 1:N;
for i = 1:N
    k(i) = block * i + ming;
end

r = 1:range;
g = r;
b = r;

for i = 1:m
    for j = 1:n
        for index = 1:N
            if grey(i, j) >= k(index) - block && grey(i, j) <=  k(index)
                img(i,j,1) = uint8(k(index));
                img(i,j,2) = uint8(255 * k(index) / maxg - ming); 
                img(i,j,3) = uint8(255 - k(index));
                
                r(grey(i, j) + 1) = uint8(k(index));
                g(grey(i, j) + 1) = uint8(255 * k(index) / maxg - ming);
                b(grey(i, j) + 1) = uint8(255 - k(index));
            end
        end
    end
end

subplot(223), plot(1:234, r, 'r', 1:234, g, 'g', 1:234, b, 'b');
axis([ming+1 maxg-1 0 255]);
title('Transformed curve');

subplot(224), imshow(img);
title('Pseudo color picture');