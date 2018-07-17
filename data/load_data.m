function data = load_data(file,do_scale)
    data = load(file);
    N = size(data,1);
    n = size(data,2);
    data_out = zeros(N,n);
    for i=1:n
        data_out(:,i) = filtr_extremnich_hodnot(data(:,i));
    end
    if do_scale
        data = mmscale(data_out(:,:), -1, 1);
    end