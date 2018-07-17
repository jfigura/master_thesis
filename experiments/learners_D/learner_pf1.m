function [params, filter, evaluator] = learner_pf1(train_data)
    %% Particle filter using model learnt by B5
    A = [0.979574	-0.025133	0.028671;...	
        0.029254	0.994377	-0.008402;...
        0.209937	-0.869643	0.091070];
    G = [];

    transition_sigmas = [0.03; 0.03; 0.41];
    measurement_sigmas = [0.1; 0.1; 0.1];
    precisions = [0.01; 0.00001; 0.0001];

    params = {A, G, measurement_sigmas, precisions, transition_sigmas};
    
    filter = @filter_pf_all;
    evaluator = @pf_evaluator;
    
    