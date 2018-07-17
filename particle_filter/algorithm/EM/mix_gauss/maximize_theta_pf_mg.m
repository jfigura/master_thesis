function theta = maximize_theta_pf_mg(Wij,Phis,n)

%% Maximizing step of EM PF algorithm.

%Phis is matrix of dimensions (P+n,M,T)
P = size(Phis,1) - n;
M = size(Phis,2);
T = size(Phis,3);

nom = zeros(n,P+n);
denom = zeros(P+n);
for t=1:T-1
    for i=1:M
        for j=1:M
            nom = nom + Wij(i,j,t) * Phis(P+1:P+n,j,t+1) * Phis(:,i,t)';
            denom = denom + Wij(i,j,t) * Phis(:,i,t) * Phis(:,i,t)';
        end
    end
end

theta = nom / denom;
