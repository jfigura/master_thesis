function [Q,Wij] = pf_likelihood(X,W,Ws,Z,mp,tp,u,params)
%% Computes Q, i.e. log-likelihood estimation, normalized by the number of time steps
% X(M,n,T) particles for each time step
% W(M,T) weights for each time step (from Particle filter)
% Ws(M,T) smoothed weights for each time step (from Particle smoother)
% mp..function for measurement probability
% tp..function for transition probability
% Z(T,m_z)..measurements
% u(T,m_u)..control signals

M=size(X,1);
T=size(Z,1);

I3 = 0;
for t=1:T
    p = mp(Z(t,:),X(:,:,t),params);
    if p > 0
        I3 = I3 + sum(Ws(:,t) .* log(p));
    end
end

I2 = 0;
Wij = zeros(M,M,T);
for t=1:T-1
    v = sum(W(:,t) .* tp(u(t),X(:,:,t),X(:,:,t+1),params));
    if v > 0
        for i=1:M
            for j=1:M
                p = tp(u(t),X(i,:,t),X(j,:,t+1),params);
                if p > 0
                    w = W(i,t) * Ws(j,t+1) * p / v;
                    Wij(i,j,t) = w;
                    I2 = I2 + w * log(p);
                end
            end
        end
    end
end

% No assumptions about prior, therefore not considering I1.

Q = (I2 + I3) / T;