function PR = get_probability(grey)
% input the gery matrix and return the probability of each grey level

PR = zeros(1, 256);  % 1 * 256 matrix to save probability
for i = 0:255        % caculate the probability of a grey level in grey
    PR(i + 1) = length(find(grey == i));
end