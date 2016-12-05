function get_histogram(file)
% input the file name then show the histogram of the picture

[pic, map] = read_img(file);

if ~isempty(map)
%% With color map
    set (gcf,'Position',[300,200,800,300]);
    figure(1);
    subplot(1, 3, 1);   % the first picture of the 1*3 pictures in a figure
    imshow(pic, map);
    title('Original picture');
    
    figure(1);
    subplot(1, 3, 2);
    imshow(pic);
    title('Grey-scale picture');

    figure(1);
    subplot(1, 3, 3);
    PR = get_probability(pic);  % caculate each grey level probability
    plot(0:255, PR, 'black');   % draw as hitogram
    xlim([0 255]);              % limit the x of the hitogram
    title('Histogram');
    xlabel('Grey level');
    ylabel('Times');
else
%% Without color map
    set (gcf,'Position',[300, 100, 800, 500]);
    figure(1);
    subplot(2, 3, 1);
    imshow(pic, map);
    title('Original picture');
    
    figure(1);
    subplot(2, 3, 2);
    grey = rgb2grey(pic);
    imshow(grey);
    title('Grey-scale picture');

    figure(1);
    subplot(2, 3, 3);
    PR = get_probability(grey); % caculate each grey level probability
    plot(0:255, PR, 'k')
    xlim([0 255]);
    title('Histogram');
    xlabel('Grey level');
    ylabel('Times');
    
    figure(1);
    subplot(2, 3, 4);
    PR = get_probability(pic(:,:,1));   % caculate each red probability
    plot(0:255, PR, 'r');
    xlim([0 255]);
    title('Histogram');
    xlabel('Red level');
    ylabel('Times');
    
    figure(1);
    subplot(2, 3, 5);
    PR = get_probability(pic(:,:,2));   % caculate each green level probability
    plot(0:255, PR, 'g');
    xlim([0 255]);
    title('Histogram');
    xlabel('Green level');
    ylabel('Times');
    
    figure(1);
    subplot(2, 3, 6);
    PR = get_probability(pic(:,:,3));   % caculate each blue level probability
    plot(0:255, PR, 'b');
    xlim([0 255]);
    title('Histogram');
    xlabel('Blue level');
    ylabel('Times');
end

