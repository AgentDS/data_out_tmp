%% Generate synthetic 3-order tensor
N1 = 20;
N2 = 20;
N3 = 20;
R = 20;

Nway = [N1,N2,N3]; % dimension of tensor
coreNway = [R,R,R]; % dimension of core tensor

% randomly generate core tensor
G = tensor(max(0,rand(coreNway)));
A = cell(1,ndims(G));
% randomly generate factor matrices
for i = 1:ndims(G)
    A{i} = max(0,rand(Nway(i),20));
end
% generate tensor
Mtrue = full(ttensor(G,A));
N = tensor(max(0,0.1*rand(N1,N2,N3)));
M = Mtrue + N;
%% Solve problem
[A,C,rmse_hist] = tucker_als(Mtrue,[20,20,20]);


% figure;
% iter = length(rmse_hist);
% semilogy(1:iter,rmse_hist,'k-','linewidth',2);
% xlabel('iteration','fontsize',12);
% ylabel('RMSE','fontsize',12)
% 
% file = ['/root/tensorD_f/data_out_tmp/matlab_out/tucker_N1_N2_N3_R_',int2str(N1),'_',int2str(N2),'_',int2str(N3), '_', int2str(R), '_1.txt'];
% %file = [pwd '/MyData/tucker_N1_N2_N3_R_',int2str(N1),'_',int2str(N2),'_',int2str(N3), '_', int2str(R), '_1.txt'];
% 
% fid = fopen(file,'w');
% for ii = 1:iter
%     fprintf(fid,'%.6f\n',rmse_hist(ii));
% end
% 
% %%
% % randomly generate core tensor
% G = tensor(max(0,randn(coreNway)));
% A = cell(1,ndims(G));
% % randomly generate factor matrices
% for i = 1:ndims(G)
%     A{i} = max(0,randn(Nway(i),coreNway(i)));
% end
% % generate tensor
% Mtrue = full(ttensor(G,A)); N = ndims(Mtrue);
% 
% %% Solve problem
% [A,C,rmse_hist] = tucker_als(Mtrue,coreNway);
% 
% 
% figure;
% iter = length(rmse_hist);
% semilogy(1:iter,rmse_hist,'k-','linewidth',2);
% xlabel('iteration','fontsize',12);
% ylabel('RMSE','fontsize',12)
% 
% file = ['/root/tensorD_f/data_out_tmp/matlab_out/tucker_N1_N2_N3_R_',int2str(N1),'_',int2str(N2),'_',int2str(N3), '_', int2str(R), '_2.txt'];
% %file = [pwd '/MyData/tucker_N1_N2_N3_R_',int2str(N1),'_',int2str(N2),'_',int2str(N3), '_', int2str(R), '_1.txt'];
% 
% fid = fopen(file,'w');
% for ii = 1:iter
%     fprintf(fid,'%.6f\n',rmse_hist(ii));
% end