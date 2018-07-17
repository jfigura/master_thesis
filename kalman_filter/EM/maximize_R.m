function R = maximize_R(R,X_smooth,Z,P,H,kappa3,R_def,R_ind)
    m = size(Z,1);
    T = size(X_smooth,2);
    sum = zeros(m);
    
    for i=1:T
        sum = sum ...
            + Z(:,i) * Z(:,i)' ...
            - Z(:,i) * X_smooth(:,i)' * H' ...
            - H * X_smooth(:,i) * Z(:,i)' ...
            + H * (X_smooth(:,i) * X_smooth(:,i)' + P(:,:,i)) * H';
    end
    
    res = 1/T * sum + 1 / T * kappa3 * (-R + 2 * R_def);
    R(R_ind) = res(R_ind);