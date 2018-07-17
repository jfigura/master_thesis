function prediction = predict_from_particles(X,W)
    %% From a set of particles, return the expectation, i.e. weighted mean.
    % Assumes normalized weights

    prediction = W'*X;