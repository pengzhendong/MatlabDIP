function [pic, map] = select_img(file_name)
% input the file and select a part

[pic, map] = read_img(file_name);
imshow(pic, map);

waitforbuttonpress;
point1 = get(gca, 'CurrentPoint');	% start
rbbox;
point2 = get(gca, 'CurrentPoint');	% end

point1 = point1(1, 1:2);            % first row and second column is position
point2 = point2(1, 1:2);

p1 = floor(min(point1, point2));	% left up
p2 = floor(max(point1, point2));	% right down

% five points as a rectangle
x = [p1(1) p2(1) p2(1) p1(1) p1(1)];
y = [p1(2) p1(2) p2(2) p2(2) p1(2)];
hold on;
plot(x, y, 'g');                    % draw the rectangle

if ~isempty(map)
    pic = pic(p1(2):p2(2), p1(1):p2(1));    % row num, column num
else    % get rgb
    r = pic(:, :, 1);
    g = pic(:, :, 2);
    b = pic(:, :, 3);
    r = r(p1(2):p2(2), p1(1):p2(1));
    g = g(p1(2):p2(2), p1(1):p2(1));
    b = b(p1(2):p2(2), p1(1):p2(1));
    pic = cat(3, r, g, b);
end

figure, imshow(pic, map);