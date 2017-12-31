% An example of nonnegative Tucker decomposition
%% Generate synthetic 3-order tensor
N1 = 160;
N2 = 160;
N3 = 160;
R = 20;

Nway = [N1,N2,N3]; % dimension of tensor
coreNway = [R,R,R]; % dimension of core tensor

% randomly generate core tensor
G = tensor(max(0,randn(coreNway)));
A = cell(1,ndims(G));
% randomly generate factor matrices
for i = 1:ndims(G)
    A{i} = max(0,rand(Nway(i),coreNway(i)));
end
% generate tensor
Mtrue = full(ttensor(G,A)); N = ndims(Mtrue);
N = tensor(max(0,0.04*rand(N1,N2,N3)));
M = Mtrue + N;
%% Solve problem
opts.maxit = 6000; opts.tol = 1e-4;
t0 = tic;
[A,C,Out] = ntd(M,[25,25,25],opts);
time = toc(t0);

% 
% figure;
% iter = length(Out.hist_rmse);
% semilogy(1:iter, Out.hist_rmse,'k-','linewidth',2);
% xlabel('iteration','fontsize',12);
% ylabel('RMSE','fontsize',12)
% 
% 
% file = ['/root/tensorD_f/data_out_tmp/matlab_out/ntucker_N1_N2_N3_R_',int2str(N1),'_',int2str(N2),'_',int2str(N3), '_', int2str(R), '_1.txt'];
% %file = [pwd '/MyData/ncp_N1_N2_N3_R_',int2str(N1),'_',int2str(N2),'_',int2str(N3), '_', int2str(R), '_1.txt'];
% 
% fid = fopen(file,'w');
% iter = length(Out.hist_rmse);
% for ii = 1:iter
%     fprintf(fid,'%.6f\n',Out.hist_rmse(ii));
% end
% % 
% %%
%% <http://www.caam.rice.edu/~optimization/bcu/ntd/example_ntd.m Download this m-file>