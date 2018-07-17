function phi = create_phi(X,P)

%% Creates the matrix of Phi containing set of particles X and values
% of Gaussian kernels. Recommended to use with P=0, i.e., without
% Gaussian kernels.

%P is the number of gaussians used
n = size(X,2); %state vector size
M = size(X,1); %particles count

if P>0 
    s = P ^ (1/(n)); %number of points in one dimension, assuming last dimension is fixed for offset
    grid = make_grid(linspace(-1,1,s),n); %centers of gaussians
    Sp = eye(n); %fixed cov. matrix of gaussians (same for each gaussian)
end

phi = zeros(P+n,M); %phi for each particle
for p=1:P %for each gaussian kernel
    phi(p,:) = mvnpdf(X,grid(p,:),Sp)'; %for each paricle (row of X)
end
phi(P+1:P+n,:) = X';