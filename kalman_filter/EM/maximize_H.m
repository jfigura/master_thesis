function H = maximize_H(H,X_smooth,Z,P,H_ind)
    n = size(X_smooth,1);
    m = size(Z,1);
    T = size(X_smooth,2);
    sum = zeros(m,n);
    
    for i=1:T
        sum = sum + Z(:,i) * X_smooth(:,i)';
    end
    
    sum2 = zeros(n);
    for i=1:T
        sum2 = sum2 + X_smooth(:,i) * X_smooth(:,i)' + P(:,:,i);
    end
    
    res = sum / sum2;
    H(H_ind) = res(H_ind);