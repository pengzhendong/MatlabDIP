function result = modify_img(file_name, vector, percent)
% input the file name, return the rgb after operation and open the rgb picture
% arguments: file, vector, value     example: 'xxx.jpg', 'i', -0.1

[rgb, map] = read_img(file_name);

%% Index picture to RGB
if ~isempty(map)
    rgb = ind2rgb(rgb, map);
end

hsi = rgb2hsi(rgb);

%% Get the h, s, i vector
h = hsi(:, :, 1);
s = hsi(:, :, 2);
i = hsi(:, :, 3);

%% Caculate
if vector == 'h'
    h = h + percent;
    if h > 1
        h = 1;
    elseif h < 0
        h = 0;
    end
elseif vector == 's'
    s = s + percent;
    if s > 1
        s = 1;
    elseif s < 0
        s = 0;
    end
else
    i = i + percent;
    if i > 1
        i = 1;
    elseif i < 0
        i = 0;
    end
end
set (gcf,'Position',[350,200,700,300])

result = cat(3, h, s, i);
figure(1);
subplot(1, 2, 1);
imshow(rgb);
title('Before');

rgb = hsi2rgb(result);
figure(1);
subplot(1, 2, 2);
imshow(rgb);
title('After');