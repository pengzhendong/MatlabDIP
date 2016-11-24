function [pic, map, transparency] = read_file(file_name)
% 输入 bmp 图片路径， 读取图片并且返回图片数据

[fid, message] = fopen(file_name);
if fid < 0
    error(['Can not open ' file_name '.' message])
else
    data = fread(fid);
    
    offset = 0;
    height = 0;
    width = 0;
    % 获取图片数据偏移量、图片大小
    for i = 1:4
        offset = offset + bitshift(data(10 + i), (i - 1) * 8);
        width = width + bitshift(data(18 + i), (i - 1) * 8);
        height = height + bitshift(data(22 + i), (i - 1) * 8);
    end
    
    depth = data(29) + bitshift(data(30), 8);   %获取图像深度
    if depth > 8    %无调色板
        pic_data = uint8(data(offset + 1:end));
        b_array = pic_data(1:3:end);
        g_array = pic_data(2:3:end);
        r_array = pic_data(3:3:end);
        
        % 由于 reshape 函数是从上往下，从左往右，所以要转置
        b = reshape(b_array, width, height)';
        g = reshape(g_array, width, height)';
        r = reshape(r_array, width, height)';
        % 合并成三维矩阵
        pic = cat(3, r, g, b);

        % 由于 bmp 图像文件是从下往上，从左往右存储数据，所以上下翻转矩阵
        pic = flipud(pic);
        
        map = [];
        transparency = [];
    else            %有调色板
        pic = reshape(uint8(data(offset + 1:end)), width, height)'; %构造索引矩阵
        pic = flipud(pic);                                          %上下翻转矩阵
        
        data = reshape(data(55:offset) / 255, 4, 2^depth)';         %构造GBR矩阵
        map = fliplr(data(1:2^depth, 1:3));                         %左右翻转矩阵
        transparency = data(1:2^depth, 4);
    end
    fclose(fid);
end