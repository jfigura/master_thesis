function [] = print_likelihood(X_apr,X_post,X_smooth,Z,P_smooth,A,H,Q,R,L)
normLL = log_likelihood(X_apr,X_post,X_smooth,Z,P_smooth,A,H,Q,R,L);

fprintf('Normalized log-likelihood: %5.4f\n', normLL);