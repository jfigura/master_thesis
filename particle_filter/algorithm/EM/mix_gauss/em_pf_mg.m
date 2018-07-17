function [params, convergence] = em_pf_mg(Z,u,f_init,f_tp,f_tm,f_mm,M,n,params,maxit)
    %% EM algorithm for particle filter for learning transition matrix and
    % mixture of Gaussians coefficients. Extremely slow for reasonable number
    % of Gaussians.
    for i=1:maxit
        [params, convergence] = step_em_pf_mg(Z,u,f_init,f_tp,f_tm,f_mm,M,n,params);
        if convergence
            break;
        end
    end