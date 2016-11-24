function get_histogram(file)

[pic, map] = read_img(file);

if ~isempty(map)
    set (gcf,'Position',[350,200,700,300])
    figure(1);
    subplot(1, 2, 1);
    imshow(pic, map);
    
    PR = get_probability(pic);
    figure(1);subplot(1,2,2);bar(0:255, PR,'g') %绘制直方图
    xlim([0 255]);
    title('原图像直方图')
    xlabel('Grey level')
    ylabel('Probability of occurrence')
else
    figure(1);
    subplot(2, 3, 1);
    imshow(pic);
    
    figure(1);
    subplot(2, 3, 2);
    imhist(pic(:,:,1));
    
    figure(1);
    subplot(2, 3, 3);
    imhist(pic(:,:,2));
    
    figure(1);
    subplot(2, 3, 4);
    imhist(pic(:,:,3));
    
    figure(1);
    subplot(2, 3, 5);
    grey = rgb2grey(pic);
    imhist(grey);
end

