function [params, filter, evaluator] = learner_kalmanC3_unscaled(train_data)
    [params, filter, evaluator] = learner_kalman_em_C_unscaled(train_data, @varC2, 'Learner C3 unscaled');