function Ws = smooth_weights(W,Wn,X,Xn,p,u,params)
%% One step of Particle smoother. Returns updated (smoothed) weights for a set of particles X. 
% X..set of particles in time t, W..corresponding weights
% Xn..set of particles in time t+1, Wn..corresponding weights (already smoothed)
% p..function computing transition probability p(xn|x)
% u..control signals in time t

M = size(W,1);

v = zeros(M,1);
for k=1:M
    v(k) = sum(W .* p(u,X,Xn(k,:),params));
end

Ws = zeros(M,1);
for i=1:M
    Ws(i) = W(i) * sum(Wn .* p(u,X(i,:),Xn,params) ./ v);
end

