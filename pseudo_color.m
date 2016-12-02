function pseudo_color(file)
% input a

[img, map] = imread(file);
if isempty(map)
    grey = rgb2gray(img);
else
    grey = img;
end
set (gcf,'Position',[350,200,700,300])

% Original picture
subplot(131), imshow(img);
title('Original picture');

% Grey picture
subplot(132), imshow(grey);
title('Grey picture');

% Pseudo color picture
subplot(133), imshow(grey, 'Colormap', jet(3));
title('Pseudo color picture');