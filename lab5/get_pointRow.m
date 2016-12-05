function [m, n, j] = get_pointRow(pointbak, m, n, j)
% input the matrix and start position, return that row's black point

while pointbak(m, n) == 0
    n = n - 1;                      % Scan from right to left
    while pointbak(m-j, n) == 0     % Find the point around the pixel
        j = j + 1;
        if(j == 12)                 % Scan 12 pixels
            j = 0;
            break;
        end
    end
    if pointbak(m-j, n) == 1       % Find the point and break the loop
        break;
    end
end