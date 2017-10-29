u1_base = csvread('/root/tensorD_f/data_out_tmp/u1.base.csv');
u1_base_idx = u1_base(:,[1,2,3]) + 1;
u1_base_value = u1_base(:,4);
full_shape = [943 1682 31];
base1_sparse = sptensor(u1_base_idx,u1_base_value,full_shape);
base1_full = full(base1_sparse);
opts.maxit = 2000; opts.tol = 1e-4;
[A,C, Out] = ntd(base1_full,[20 20 20],opts);
file = ['/root/tensorD_f/data_out_tmp/matlab_out/ntucker_ml_20.txt'];

% [A,Out] = ncp(base1_full,20,opts);
% file = ['/root/tensorD_f/data_out_tmp/matlab_out/ncp_ml_20.txt'];

% [fullP,U,lambda,rmse_hist] = cp_als(base1_full,20);
% file = ['/root/tensorD_f/data_out_tmp/matlab_out/cp_ml_20.txt'];

fid = fopen(file,'w');
% iter = length(rmse_hist);
% for ii = 1:iter
%     fprintf(fid,'%.6f\n',rmse_hist(ii));
% end

iter = length(Out.hist_rmse);
for ii = 1:iter
    fprintf(fid,'%.6f\n',Out.hist_rmse(ii));
end