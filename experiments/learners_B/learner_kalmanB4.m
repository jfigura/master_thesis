function [params, filter, evaluator] = learner_kalmanB4(train_data)
    [params, filter, evaluator] = learner_kalman_em(train_data, @varB4, 'Learner B4');