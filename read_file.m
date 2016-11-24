function [pic, map, transparency] = read_file(file_name)
% ���� bmp ͼƬ·���� ��ȡͼƬ���ҷ���ͼƬ����

[fid, message] = fopen(file_name);
if fid < 0
    error(['Can not open ' file_name '.' message])
else
    data = fread(fid);
    
    offset = 0;
    height = 0;
    width = 0;
    % ��ȡͼƬ����ƫ������ͼƬ��С
    for i = 1:4
        offset = offset + bitshift(data(10 + i), (i - 1) * 8);
        width = width + bitshift(data(18 + i), (i - 1) * 8);
        height = height + bitshift(data(22 + i), (i - 1) * 8);
    end
    
    depth = data(29) + bitshift(data(30), 8);   %��ȡͼ�����
    if depth > 8    %�޵�ɫ��
        pic_data = uint8(data(offset + 1:end));
        b_array = pic_data(1:3:end);
        g_array = pic_data(2:3:end);
        r_array = pic_data(3:3:end);
        
        % ���� reshape �����Ǵ������£��������ң�����Ҫת��
        b = reshape(b_array, width, height)';
        g = reshape(g_array, width, height)';
        r = reshape(r_array, width, height)';
        % �ϲ�����ά����
        pic = cat(3, r, g, b);

        % ���� bmp ͼ���ļ��Ǵ������ϣ��������Ҵ洢���ݣ��������·�ת����
        pic = flipud(pic);
        
        map = [];
        transparency = [];
    else            %�е�ɫ��
        pic = reshape(uint8(data(offset + 1:end)), width, height)'; %������������
        pic = flipud(pic);                                          %���·�ת����
        
        data = reshape(data(55:offset) / 255, 4, 2^depth)';         %����GBR����
        map = fliplr(data(1:2^depth, 1:3));                         %���ҷ�ת����
        transparency = data(1:2^depth, 4);
    end
    fclose(fid);
end