function [params, convergence] = step_em_pf_mg(Z,u,f_init,f_tp,f_tm,f_mm,M,n,params)
    %Z..measurements
    %u..control signals
    %f_init..function for initialization of particles
    %f_tp..function for transition probability
    %f_tm..function for transition model
    %f_mm..function for measurement model
    %n..number of state variables
    %params..initial params
    
    
[~,~,Xs,Ws,Wss] = particle_filter(Z,u,n,M,f_tm,f_mm,f_tp,f_init,params,true);
[~,Wij] = pf_likelihood(Xs,Ws,Wss,Z,f_mm,f_tp,u,params);

G = params{2};
P = size(G,2);
T = size(Xs,3);

Phis = zeros(P+n,M,T);
for t=1:T
    Phis(:,:,t) = create_phi(Xs(:,:,t),P);
end
theta_new = maximize_theta_pf_mg(Wij,Phis,n);
A_new = theta_new(:,P+1:P+n);
G_new = theta_new(:,1:P);
if P == 0 %MATLAB creates G_new as empty nx0 array instead of 0x0
    G_new = [];
end
convergence = convergence_mg(params{1}, A_new, params{2}, G_new);
params{1} = A_new;
params{2} = G_new;
