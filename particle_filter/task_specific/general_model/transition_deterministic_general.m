function X_new = transition_deterministic_general(X,params)
    A = params{1};
    G = params{2};
    P = size(G,2);
    
    phi = create_phi(X,P);
    
    theta = [G, A];
    
    X_new = theta * phi; %for P=0 (recommended) equal to A*X
    X_new = X_new';