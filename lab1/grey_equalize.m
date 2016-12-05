function grey = grey_equalize(grey)
% input the grey, return the grey

[m, n] = size(grey);
CDF = zeros(1, 256);
for i = 0:255
    CDF(i + 1) = length(find(grey <= i)) / (m*n);
end

%% Caculate the near value
for i = 1:m*n
    grey(i) = round(CDF(grey(i) + 1) * 255);
end