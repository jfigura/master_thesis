%% Runs experiment A

clc;
learners = {@learner_kalmanA1, @learner_kalmanA2, @learner_kalmanA3, @learner_kalmanA4};
k = 5;
test_size = 1200;
train_size = 1000;
data = load_and_prepare_data();

[Q_train, Q_test, pitch_pred_test, xdot_pred_test, ...
    pitch_err, xdot_err, taskI_test, test_data] = evaluate(data, train_size,test_size, k, learners,false,1000);
       
format long
print_experiment_results(Q_train, Q_test, pitch_err, xdot_err);

xplot = 1:800;
plot_experiments(pitch_pred_test(xplot,1:3,1),xdot_pred_test(xplot,1:3,1),taskI_test(:,xplot,1:3,1), ...
    test_data(xplot,:,1),{'A1','A2','A3'},{'A1','A2','A3'});