function [params, filter, evaluator] = learner_kalmanC3(train_data)
    [params, filter, evaluator] = learner_kalman_em_C(train_data, @varC2, 'Learner C3');