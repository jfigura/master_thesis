function [M, c1, c2] = mmscale(X, A, B)
    c1 = (B-A) ./ (max(X) - min(X));
    c2 = A - min(X) .* c1;
    M = zeros(size(X,1), size(X,2));
    for i=1:size(M,1)
        M(i,:) = X(i,:) .* c1 + c2;
    end
    