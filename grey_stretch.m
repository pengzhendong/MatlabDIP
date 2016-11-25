function grey = grey_stretch(file)
% input the file and the eqution, return the histogram after gery stretch

[pic, map] = read_img(file);   % get grey
if isempty(map)
    grey = rgb2grey(pic);
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
    set (gcf,'Position',[100, 100, 1200, 500]);
    
    figure(1);
    subplot(2, 5, 1);
    imshow(pic, map);
    title('Original picture');
    
    hsi = rgb2hsi(pic);
    i  = floor(hsi(:,:,3) .* 255 + 0.5);
    figure(1);
    subplot(2, 5, 6);
    PR = get_probability(i);  % caculate each grey level probability
    plot(0:255, PR, 'Color',[0.9 0.8 0]);    % draw as hitogram
    xlim([0 255]);               % limit the x of the hitogram
    title('Original intensity');
    xlabel('Intensity level * 255');
    ylabel('Times');
    
    figure(1);
    subplot(2, 5, 2);
    imshow(grey);
    title('Original grey');

    figure(1);
    subplot(2, 5, 7);
    PR = get_probability(grey);  % caculate each grey level probability
    plot(0:255, PR, 'black');    % draw as hitogram
    xlim([0 255]);               % limit the x of the hitogram
    title('Original grey');
    xlabel('Grey level');
    ylabel('Times');
    
    stre_grey = grey .* a + b;        % gery stretching
    figure(1);
    subplot(2, 5, 3);
    imshow(stre_grey);
    title('Grey stretch');
    
    figure(1);
    subplot(2, 5, 8);
    PR = get_probability(stre_grey);  % caculate each grey level probability
    plot(0:255, PR, 'black');    % draw as hitogram
    xlim([0 255]);               % limit the x of the hitogram
    title('Grey stretch');
    xlabel('Grey level');
    ylabel('Times');
    
    equa_grey = grey_equalize(grey);
    figure(1);
    subplot(2, 5, 4);
    imshow(equa_grey);
    title('Grey equalize');
    
    figure(1);
    subplot(2, 5, 9);
    PR = get_probability(equa_grey);  % caculate each grey level probability
    plot(0:255, PR, 'black');    % draw as hitogram
    xlim([0 255]);               % limit the x of the hitogram
    title('Grey equalize');
    xlabel('Grey level');
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
else
    error('Input error!');
end