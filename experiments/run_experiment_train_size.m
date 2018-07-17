%% Experiment for train size influence on prediction error. May take several minutes.

learners = {@learner_kalmanA2, @learner_kalmanB4, @learner_kalmanB5, @learner_kalmanC2, @learner_kalmanC3};
L = size(learners,2);
k = 3;
test_size = 1200;
data = load_and_prepare_data();

sizes = [80; 150; 300; 500; 800; 1000; 1200; 1500; 2000; 2500; 3000;4000];
N = size(sizes,1);
err_xdot_all = zeros(N,L);
err_pitch_all = zeros(N,L);

for i=1:N
    train_size = sizes(i);
    [Q_train, Q_test, pitch_pred_test, xdot_pred_test, ...
           pitch_err, xdot_err, X_tskI_test] = evaluate(data, train_size, test_size, k, learners,false,1000);
    err_xdot_all(i,:) = mean(xdot_err,2)';
    err_pitch_all(i,:) = mean(pitch_err,2)';
end

figure;
plot(sizes,err_xdot_all);
legend('A2', 'B4', 'B5', 'C2', 'C3');
title('Train size influence on pitch prediction error.')

figure;
plot(sizes,err_pitch_all);
legend('A2', 'B4', 'B5', 'C2', 'C3');
title('Train size influence on xdot prediction error.')