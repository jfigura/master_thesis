function data = load_and_prepare_data(file, do_scale)
    if nargin == 0 %use let3 by default (if file not specified)
        data = load_data('let3.txt',true);
    else
        data = load_data(file, do_scale);
    end