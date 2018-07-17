function [X_apr,X_post,X_smooth,P_post,P_smooth,L_smooth] = kalman_filter(Z,A,H,Q,R,P,x,include_backward)
    %% The main function for Kalman filter or smoother.

    % P is initial covariance, x initial mean
    T = size(Z,2); %total time steps
    n = size(A,1); %state vector size
    
    X_post = zeros(n,T);
    X_apr = zeros(n,T);
    X_smooth = zeros(n,T);
    P_post = zeros(n,n,T);
    P_apr = zeros(n,n,T);
    P_smooth = zeros(n,n,T);
    L_smooth = zeros(n,n,T);
    I = diag(ones(1,n),0);
    
    for t=1:T
        x = A * x;
        P = A * P * A' + Q;
        P_apr(:,:,t) = P;
        X_apr(:,t) = x;
        
        K = P * H' / (H * P * H' + R);
        x = x + K * (Z(:,t) - H * x);
        P = (I - K * H) * P;
        X_post(:,t) = x;
        P_post(:,:,t) = P;
    end
    
    if include_backward
        X_smooth(:,T) = X_post(:,T);
        P_smooth(:,:,T) = P_post(:,:,T);
        
        for t=T-1:-1:1
            L = P_post(:,:,t) * A' / P_apr(:,:,t+1);
            L_smooth(:,:,t) = L;
            X_smooth(:,t) = X_post(:,t) + L * (X_smooth(:,t+1) - X_apr(:,t+1));
            P_smooth(:,:,t) = P_post(:,:,t) + L * (P_smooth(:,:,t+1) - P_apr(:,:,t+1)) * L';
        end
    end