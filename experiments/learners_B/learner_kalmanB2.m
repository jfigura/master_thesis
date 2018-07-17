function [params, filter, evaluator] = learner_kalmanB2(train_data)
    [params, filter, evaluator] = learner_kalman_em(train_data, @varB2, 'Learner B2');