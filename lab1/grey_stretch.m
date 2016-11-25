function grey = grey_stretch(file)
% input the file and the eqution, return the histogram after gery stretch

[pic, map] = read_img(file);   % get grey
if isempty(map)
    grey = rgb2grey(pic);
    column = 5;
    set (gcf,'Position',[100, 100, 1200, 500]);
else
    grey = pic;
    column = 3;
    set (gcf,'Position',[300, 100, 800, 500]);
end
% caculate the best arguments
maxi = max(max(grey));
mini = min(min(grey));
a = 255 / (maxi - mini);
b = 255 * mini / (maxi - mini);

prompt = {'a', 'b'};
dlg_title = 'y = ax + b';
answer = inputdlg(prompt, dlg_title, [1 50; 1 50], {num2str(a), num2str(b)});
% get the input value
a = str2double(answer(1));
b = str2double(answer(2));

if ~isnan(a) && ~isnan(b)
    figure(1);
    subplot(2, column, 1);
    imshow(grey);
    title('Original grey');

    figure(1);
    subplot(2, column, column + 1);
    PR = get_probability(grey);  % caculate each grey level probability
    plot(0:255, PR, 'black');    % draw as hitogram
    xlim([0 255]);               % limit the x of the hitogram
    title('Original grey');
    xlabel('Grey level');
    ylabel('Times');
    
    stre_grey = grey .* a + b;        % gery stretching
    figure(1);
    subplot(2, column, 2);
    imshow(stre_grey);
    title('Grey stretch');
    
    figure(1);
    subplot(2, column, column + 2);
    PR = get_probability(stre_grey);  % caculate each grey level probability
    plot(0:255, PR, 'black');    % draw as hitogram
    xlim([0 255]);               % limit the x of the hitogram
    title('Grey stretch');
    xlabel('Grey level');
    ylabel('Times');
    
    equa_grey = grey_equalize(grey);
    figure(1);
    subplot(2, column, 3);
    imshow(equa_grey);
    title('Grey equalize');
    
    figure(1);
    subplot(2, column, column + 3);
    PR = get_probability(equa_grey);  % caculate each grey level probability
    plot(0:255, PR, 'black');    % draw as hitogram
    xlim([0 255]);               % limit the x of the hitogram
    title('Grey equalize');
    xlabel('Grey level');
    ylabel('Times');
    
    if isempty(map)
        figure(1);
        subplot(2, column, 4);
        imshow(pic, map);
        title('Original picture');

        hsi = rgb2hsi(pic);
        i  = floor(hsi(:,:,3) .* 255 + 0.5);
        figure(1);
        subplot(2, column, column + 4);
        PR = get_probability(i);  % caculate each grey level probability
        plot(0:255, PR, 'Color',[0.9 0.8 0]);    % draw as hitogram
        xlim([0 255]);               % limit the x of the hitogram
        title('Original intensity');
        xlabel('Intensity level * 255');
        ylabel('Times');
    
        h = hsi(:,:,1);
        s = hsi(:,:,2);
        i = grey_equalize(i);
        hsi = cat(3, h, s, i / 255);
        pic = hsi2rgb(hsi);
        figure(1);
        subplot(2, 5, 5);
        imshow(pic, map);
        title('Picture equalize');

        figure(1);
        subplot(2, 5, 10);
        PR = get_probability(i);  % caculate each grey level probability
        plot(0:255, PR, 'Color',[0.9 0.8 0]);    % draw as hitogram
        xlim([0 255]);               % limit the x of the hitogram
        title('Intensity equalize');
        xlabel('Intensity level * 255');
        ylabel('Times');
    end
else
    error('Input error!');
end