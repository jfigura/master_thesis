function [params, filter, evaluator] = learner_kalmanC1(train_data)
    [params, filter, evaluator] = learner_kalman_em_C(train_data, @varC1, 'Learner C1');