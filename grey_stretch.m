function grey = grey_stretch(file)
% input the file and the eqution, return the histogram after gery stretch

[grey, map] = read_img(file);   % get grey
if isempty(map)
    grey = rgb2grey(grey);
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
    set (gcf,'Position',[250, 200, 900, 400]);
    
    figure(1);
    subplot(2, 3, 1);
    imshow(grey);
    title('Original picture');

    figure(1);
    subplot(2, 3, 4);
    PR = get_probability(grey);  % caculate each grey level probability
    plot(0:255, PR, 'black');    % draw as hitogram
    xlim([0 255]);               % limit the x of the hitogram
    title('Histogram');
    xlabel('Grey level');
    ylabel('Times');
    
    grey = grey .* a + b;        % gery stretching
    figure(1);
    subplot(2, 3, 2);
    imshow(grey);
    title('Grey stretch');
    
    figure(1);
    subplot(2, 3, 5);
    NPR = get_probability(grey);  % caculate each grey level probability
    plot(0:255, NPR, 'black');    % draw as hitogram
    xlim([0 255]);               % limit the x of the hitogram
    title('Grey stretch');
    xlabel('Grey level');
    ylabel('Times');
    
    size(grey)
    size(PR)
    figure(1);
    subplot(2, 3, 3);
    imshow(grey);
    title('Grey stretch');
else
    error('Input error!');
end