function [pic, map, transparency] = read_img(file_name)
% input the file name and return the picture data

[fid, message] = fopen(file_name);
if fid < 0
    error(['Can not open ' file_name '.' message])
else
    data = fread(fid);
    
    offset = 0;
    height = 0;
    width = 0;
    % get offset and size
    for i = 1:4
        offset = offset + bitshift(data(10 + i), (i - 1) * 8);
        width = width + bitshift(data(18 + i), (i - 1) * 8);
        height = height + bitshift(data(22 + i), (i - 1) * 8);
    end
    
    depth = data(29) + bitshift(data(30), 8);   % get depth
    if depth > 8    % without color map
        pic_data = uint8(data(offset + 1:end));
        b_array = pic_data(1:3:end);
        g_array = pic_data(2:3:end);
        r_array = pic_data(3:3:end);
        
        % reshape from up to down, left to right
        b = reshape(b_array, width, height)';
        g = reshape(g_array, width, height)';
        r = reshape(r_array, width, height)';
        pic = cat(3, r, g, b);

        % because bmp is from down to up, left to right
        pic = flipud(pic);  % upside down
        
        map = [];
        transparency = [];
        imshow(pic);
    else            % with color map
        pic = reshape(uint8(data(offset + 1:end)), width, height)'; % index matrix
        pic = flipud(pic);                                          % upside down
        
        data = reshape(data(55:offset) / 255, 4, 2^depth)';         % rgb matrix
        map = fliplr(data(1:2^depth, 1:3));                         % bgr to rgb
        transparency = data(1:2^depth, 4);
        imshow(pic, map);
    end
    fclose(fid);
end