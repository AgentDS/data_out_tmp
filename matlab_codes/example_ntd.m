% An example of nonnegative Tucker decomposition
%% Generate synthetic 3-order tensor
N1 = 40;
N2 = 40;
N3 = 40;
R = 5;

Nway = [N1,N2,N3]; % dimension of tensor
coreNway = [R,R,R]; % dimension of core tensor

% randomly generate core tensor
G = tensor(max(0,randn(coreNway)));
A = cell(1,ndims(G));
% randomly generate factor matrices
for i = 1:ndims(G)
    A{i} = max(0,randn(Nway(i),coreNway(i)));
end
% generate tensor
Mtrue = full(ttensor(G,A)); N = ndims(Mtrue);

%% Solve problem
opts.maxit = 1000; opts.tol = 1e-4;
t0 = tic;
[A,C,Out] = ntd(Mtrue,coreNway,opts);
time = toc(t0);

%% Reporting
relerr = norm(full(ttensor(C,A))-Mtrue)/norm(Mtrue);
fprintf('time = %4.2e, ',time);
fprintf('solution relative error = %4.2e\n\n',relerr);


% figure;
% semilogy(1:Out.iter-1, Out.hist_rmse,'k-','linewidth',2);
% xlabel('iteration','fontsize',12);
% ylabel('RMSE','fontsize',12)

file = ['/root/tensorD_f/data_out_tmp/matlab_out/ntucker_N1_N2_N3_R_',int2str(N1),'_',int2str(N2),'_',int2str(N3), '_', int2str(R), '_1.txt'];
fid = fopen(file,'w');
iter = length(Out.hist_rmse);
for ii = 1:iter
    fprintf(fid,'%.6f\n',Out.hist_rmse(ii));
end
%% <http://www.caam.rice.edu/~optimization/bcu/ntd/example_ntd.m Download this m-file>