function LL = log_likelihood(X_apr,X_post,X_smooth,Z,P_smooth,A,H,Q,R,L)
%% Computes expected log likelihood, normalized by the number of time steps
    n = size(A,1);
    m = size(Z,1);
    T = size(X_post,2);
  
    LL = (T-1)/2 * log(det(inv(Q)));
    
    sum = zeros(n);
    
    for i=1:T-1
        xx = X_post(:,i) * X_smooth(:,i+1)' + ...
            L(:,:,i) * (P_smooth(:,:,i+1) + (X_smooth(:,i+1) - X_apr(:,i+1)) * X_smooth(:,i+1)');
        
        sum = sum + ...
            P_smooth(:,:,i+1) + X_smooth(:,i+1) * X_smooth(:,i+1)' ...
            - xx' * A' ...
            - A * xx ...
            + A * (P_smooth(:,:,i) + X_smooth(:,i) * X_smooth(:,i)') * A';
    end
    
    %LL = LL - 1/2 * trace(inv(Q) * sum);
    LL = LL - 1/2 * trace(sum \ Q);
    LL = LL + T/2 * log(det(inv(R)));
    
    sum2 = zeros(m);
    for i=1:T
        sum2 = sum2 + ...
            Z(:,i) * Z(:,i)' ...
            - Z(:,i) * X_smooth(:,i)' * H' ...
            - H * X_smooth(:,i) * Z(:,i)' ...
            + H * (P_smooth(:,:,i) + X_smooth(:,i) * X_smooth(:,i)') * H';
    end
    
    %LL = LL - 1/2 * trace(inv(R) * sum2);
    LL = LL - 1/2 * trace(sum2 \ R);
    LL = LL / T;
