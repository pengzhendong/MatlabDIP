function pseudo_color(file)
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
subplot(241), imshow(img);
title('Original picture');

% Grey picture
subplot(242), imshow(grey);
title('Grey picture');

% Pseudo color picture
level = 0:255;
subplot(243), plot(level, level, 'black');
title('Transformed curve');
axis([0 255 0 255]);
subplot(244), imshow(grey, 'Colormap', jet(255));
title('Pseudo color picture');

% Pseudo color picture
level = 1:256;
rindex = 1:256;
gindex = 1:256;
bindex = 1:256;
% Caculate rgb transformation
for i = 1:256
    if i < 128
        rindex(i) = 0;
    elseif i < 192
        rindex(i) = 255 / 64 * (i - 128);  
    else
        rindex(i) = 255;
    end
        
    if i < 64
        gindex(i) = 255 / 64 * i;
    elseif i < 192
        gindex(i) = 255;  
    else
        gindex(i) = 255 - 255 / 63 * (i - 192);
    end
    
    if i < 64
        bindex(i) = 255;
    elseif i < 128
        bindex(i) = 255 - 255 / 63 * (i - 63);
    else
        bindex(i) = 0;
    end
end
subplot(245);plot(level, rindex, 'r', level, gindex, 'g', level, bindex, 'b');
title('Transformed curve');
axis([0 255 0 255]);
% Change grey to rgb
for j=1:n
    for i=1:m
        img(i,j,1) = uint8(rindex(grey(i,j) + 1)); 
        img(i,j,2) = uint8(gindex(grey(i,j) + 1));
        img(i,j,3) = uint8(bindex(grey(i,j) + 1)); 
    end
end
subplot(246), imshow(img);
title('Pseudo color picture');

% Pseudo color picture
k0 = 30;
k1 = 800;
level = 1:256;
% Caculate rgb transformation
rindex = 255*(1-(1/(255-k0)^2)*(level-255).^2);
gindex = 255*(1-(1/((k1-k0)/2)^2)*(level-k0-(k1-k0)/2).^2);
bindex = 255*(1-(1/(k1-k0)^2)*(level-k0).^2)/2;
rindex(1:k0)=0;
gindex(1:k0)=0;
bindex(1:k0)=0;
subplot(247), plot(level, rindex, 'r', level, gindex, 'g', level, bindex, 'b');
title('Transformed curve');
axis([0 255 0 255]);
% Change grey to rgb
for j=1:n
    for i=1:m
        img(i,j,1) = uint8(rindex(grey(i,j) + 1)); 
        img(i,j,2) = uint8(gindex(grey(i,j) + 1));
        img(i,j,3) = uint8(bindex(grey(i,j) + 1)); 
    end
end
subplot(248), imshow(img);
title('Pseudo color picture');
