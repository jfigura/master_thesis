%% Experiment to show prediction errors on longer validation sets

learners = {@learner_kalman_test};

k = 1;
test_size = 1200;
train_size = 1000;
data = load_and_prepare_data();

[Q_train, Q_test, pitch_pred_test, xdot_pred_test, ...
    pitch_err, xdot_err, taskI_test, test_data] = evaluate(data,train_size,test_size,k,learners,false,1000);
                        
print_experiment_results(Q_train, Q_test, pitch_err, xdot_err);

xplot = 1:800;
plot_experiments(pitch_pred_test(xplot,:,1),xdot_pred_test(xplot,:,1),taskI_test(:,xplot,:,1), ...
    test_data(xplot,:,1),{'Test model'},{'Test'});