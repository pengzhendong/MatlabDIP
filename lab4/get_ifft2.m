function matrix = get_ifft2(matrix)
% input a matrix, M = N = 2^i

[m, ~] = size(matrix);
matrix = double(matrix);
i = log2(m);

% Change the order of the row and column of the matrix
% 01234567 -> 0246 1357 -> 04 26 15 37
p = 0:2^i-1;
order = zeros(1, 2^i);
for t = 1:i
    np = floor(p / 2);
    order = order * 2 + (p - 2*np);
    p = np;
end
matrix(:,:) = matrix(order+1, order+1);

% Caculate the WN twiddle factor
t = 0:2^(i - 1) - 1;
WN(t+1) = exp(1j * 2*pi * t / m);

% Transform the matrix by fft
for L = 1:i
    B = 2^(L - 1);
    for J = 0:B - 1
        p = J * 2^(i - L);
        for k = J+1:2^L:2^i
            T = WN(p + 1) * (matrix(k+B,:));
            matrix(k+B,:) = matrix(k,:) - T;
            matrix(k,:) = matrix(k,:) + T;

            T = WN(p + 1) * (matrix(:,k+B));
            matrix(:,k+B) = matrix(:,k) - T;
            matrix(:,k) = matrix(:,k) + T;
        end
    end       
end

matrix = matrix ./ (m*m);
