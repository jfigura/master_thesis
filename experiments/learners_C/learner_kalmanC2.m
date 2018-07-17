function [params, filter, evaluator] = learner_kalmanC2(train_data)
    [params, filter, evaluator] = learner_kalman_em_C(train_data, @varC2, 'Learner C2',[0;0;0]);