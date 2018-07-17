function A = maximize_A(A, X_aprior, X_post,X_smooth,L,P,kappa,Q,A_ind,main_A_ind)
    n = size(X_post,1);
    T = size(X_post,2);
    sum = zeros(n);
    
    for i=1:T-1
        sum = sum + (X_post(:,i) * X_smooth(:,i+1)' ...
        	 + L(:,:,i) * (P(:,:,i+1) + (X_smooth(:,i+1) - X_aprior(:,i+1)) * X_smooth(:,i+1)'))';
    end
    
    sum2 = zeros(n);
    for i=1:T
        sum2 = sum2 + X_smooth(:,i) * X_smooth(:,i)' + P(:,:,i);
    end
    
    A_ext = A;
    A_ext(main_A_ind) = 0; %A on indexes where penalization should be done
    res = sum / sum2 - kappa*A_ext * Q / sum2; %penalization
    A(A_ind) = res(A_ind);%update only indexes that are free