function [params, filter, evaluator] = learner_kalmanB1(train_data)
    [params, filter, evaluator] = learner_kalman_em(train_data, @varB1, 'Learner B1');