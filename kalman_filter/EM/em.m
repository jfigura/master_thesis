function [A,H,Q,R] = em(Z,A,H,Q,R,P,x,max_iter,variable_params,main_ind,kappa,kappa2,kappa3)
    
    [A_ind,H_ind,Q_ind,R_ind] = variable_params();
    A_main_ind = main_ind();
    Q_def = Q;
    R_def = R;

    for i=1:max_iter
        [X_apr,X_post,X_smooth,~,P_smooth,L] = kalman_filter(Z,A,H,Q,R,P,x,true);
        
        A_new = maximize_A(A,X_apr,X_post,X_smooth,L,P_smooth,kappa,Q,A_ind,A_main_ind);
        H_new = maximize_H(H,X_smooth,Z,P_smooth, H_ind);
        Q_new = maximize_Q(Q,X_apr,X_post,X_smooth,P_smooth,L,A,kappa2,Q_def,Q_ind);
        R_new = maximize_R(R,X_smooth,Z,P_smooth,H,kappa3,R_def, R_ind);
        
        if convergence(A,H,Q,R,A_new,H_new,Q_new,R_new)
            break;
        end
        Q = Q_new;
        R = R_new;
        A = A_new;
        H = H_new;
    end