function [params, filter, evaluator] = learner_kalmanB3(train_data)
    [params, filter, evaluator] = learner_kalman_em(train_data, @varB3, 'Learner B3');