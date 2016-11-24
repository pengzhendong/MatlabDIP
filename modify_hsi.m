function result = modify_hsi(hsi, vector, percent)
% input the hsi, return the hsi after operation and open the rgb picture
% arguments: hsi, vector, value     example: hsi, 'i', -0.1

% get the h, s, i vector
h = hsi(:,:,1);
s = hsi(:,:,2);
i = hsi(:,:,3);
% caculate
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

result = cat(3, h, s, i);
rgb = hsi2rgb(result);
imshow(rgb);