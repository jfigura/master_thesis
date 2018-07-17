function [params, filter, evaluator] = learner_kalmanB5(train_data)
    [params, filter, evaluator] = learner_kalman_em(train_data, @varB5, 'Learner B5');