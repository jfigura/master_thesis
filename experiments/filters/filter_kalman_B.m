function [pitch_pred, xdot_pred, task_I] = filter_kalman_B(params, test_data)
    [pitch_pred, xdot_pred, task_I] = filter_kalman_common(params, test_data, @get_prior_B);