function Q = maximize_Q(Q,X_aprior,X_post,X_smooth,P,L,A,kappa2,Q_def,Q_ind)
    n = size(X_smooth,1);
    T = size(X_smooth,2);
    sum = zeros(n);
    
    for i=1:T-1
        xx = X_post(:,i) * X_smooth(:,i+1)' + ...
            L(:,:,i) * (P(:,:,i+1) + (X_smooth(:,i+1) - X_aprior(:,i+1)) * X_smooth(:,i+1)');
        
        sum = sum ...
            + X_smooth(:,i+1) * X_smooth(:,i+1)' + P(:,:,i+1) ...
            -  xx' * A' ...
            - A * xx ...
            + A * (X_smooth(:,i) * X_smooth(:,i)' + P(:,:,i)) * A';
    end
    
    res = 1/T * sum + 1 / T * kappa2 * (-Q + 2 * Q_def);
    Q(Q_ind) = res(Q_ind);