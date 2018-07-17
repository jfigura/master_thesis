function [params, filter, evaluator] = learner_kalman_test(train_data)
    [params, filter, evaluator] = learner_kalman_em(train_data, @varB1, 'Learner test');
    A = params{1};
    A(2,2) = 1.005;
    params{1} = A;