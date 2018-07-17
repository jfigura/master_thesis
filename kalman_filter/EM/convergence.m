function conv = convergence(A,H,Q,R,A_new,H_new,Q_new,R_new)
    if sum(sum((abs(A - A_new)))) + sum(sum((abs(H - H_new)))) ...
            + sum(sum((abs(Q - Q_new)))) + sum(sum((abs(R - R_new)))) < 0.005
        conv = true;
    else
        conv = false;
    end
    