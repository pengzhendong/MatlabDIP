function butterworth_low_filter(file, d, order)
% input the file name, a distance and the order, show the picture after low filter

[img, map] = imread(file);
if isempty(map)
    img = rgb2gray(img);
end
% Original picture
subplot(231), imshow(img);
title('Original picture');

% Flourier transformation && Frequency shift
s = fftshift(fft2(img));
subplot(232), imshow(abs(s), []);
title('Flourier & Shift');

% Get log
subplot(233), imshow(log(abs(s)), []);
title('Getlog');


% Get file info
[m, n] = size(s);
h = zeros(m, n);
x = round(m/2);
y = round(n/2);

for u = 1:m
    for v = 1:n
        distance = sqrt((u - x)^2 + (v - y)^2);
        if distance == 0
            h(u, v) = 0;
        else
            h(u, v) = 1 / (1 + (distance/d)^(2*order));
        end
    end
end
s = s .* h;  % Filtering

% After filtering
img = uint8(real(ifft2(ifftshift(s))));           % Change back to a picture
subplot(234), imshow(img);
title('After filtering');

% Flourier transformation && Frequency shift
s = fftshift(fft2(img));
subplot(235), imshow(abs(s), []);
title('Flourier & Shift');

% Get log
subplot(236), imshow(log(abs(s)), []);
title('Getlog');

figure, surf(1:m, 1:n, h);
axis([1 m 1 n 0 1]);