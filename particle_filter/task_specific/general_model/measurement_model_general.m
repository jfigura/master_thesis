function W = measurement_model_general(z,X,params)
    %% Parameters of sensor errors
    sigmas = params{3};
    precisions = params{4};
    
    N = size(X,1);
    n = size(sigmas,1);
    
    W = ones(N,1);
    for i=1:n
        if ~isnan(z(1,i))
            W = W .* gaussian_probability(z(1,i), X(:,i), sigmas(i), precisions(i));
        end
    end