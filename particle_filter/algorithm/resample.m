function [X_new,W_new] = resample(X,W)
    M = size(X,1);
    n = size(X,2);
    W = W / sum(W); %normalize. however due to round errors, do not assume the sum to be exactly 1
    W_new = ones(M,1) / M;
    X_new = zeros(M,n);
    
    c = zeros(M,1);
    c(1) = 0;
    for i=2:M
        c(i) = c(i-1) + W(i);
    end
    
    i = 1;
    u = zeros(M,1);
    u(1) = rand() / M;
    for j=1:M
        u(j) = u(1) + (j-1)/M;
        while i < M && u(j) > c(i)
            i = i+1;
        end
        X_new(j,:) = X(i,:);
    end