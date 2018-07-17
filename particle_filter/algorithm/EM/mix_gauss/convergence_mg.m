function conv = convergence_mg(A,A_new,G,G_new)
    if sum(sum(abs(A - A_new))) + sum(sum(abs(G - G_new))) < 0.005
        conv = true;
    else
        conv = false;
    end
    