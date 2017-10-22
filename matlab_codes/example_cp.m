%% Generate synthetic 4-order tensor
N1 = 160; 
N2 = 160; 
N3 = 160;% tensor dimension
R = 30; % tensor rank

% randomly generate factor matrices
A_org = max(0,randn(N1,R));
B_org = max(0,randn(N2,R));
C_org = max(0,randn(N3,R));


% get tensor M using the above factor matrices
M = ktensor({A_org,B_org,C_org});
Mtrue = full(ktensor(M));
[fullP,U,lambda,rmse_hist] = cp_als(Mtrue,R);


figure;
iter = length(rmse_hist);
semilogy(1:iter,rmse_hist,'k-','linewidth',2);
xlabel('iteration','fontsize',12);
ylabel('RMSE','fontsize',12)

file = ['/root/tensorD_f/data_out_tmp/matlab_out/cp_N1_N2_N3_R_',int2str(N1),'_',int2str(N2),'_',int2str(N3), '_', int2str(R), '_1.txt'];
%file = [pwd '/MyData/cp_N1_N2_N3_R_',int2str(N1),'_',int2str(N2),'_',int2str(N3), '_', int2str(R), '_1.txt'];

fid = fopen(file,'w');
for ii = 1:iter
    fprintf(fid,'%.6f\n',rmse_hist(ii));
end




%%

% randomly generate factor matrices
A_org = max(0,randn(N1,R));
B_org = max(0,randn(N2,R));
C_org = max(0,randn(N3,R));


% get tensor M using the above factor matrices
M = ktensor({A_org,B_org,C_org});
Mtrue = full(ktensor(M));
[fullP,U,lambda,rmse_hist] = cp_als(Mtrue,R);


figure;
iter = length(rmse_hist);
semilogy(1:iter,rmse_hist,'k-','linewidth',2);
xlabel('iteration','fontsize',12);
ylabel('RMSE','fontsize',12)

file = ['/root/tensorD_f/data_out_tmp/matlab_out/cp_N1_N2_N3_R_',int2str(N1),'_',int2str(N2),'_',int2str(N3), '_', int2str(R), '_2.txt'];
%file = [pwd '/MyData/cp_N1_N2_N3_R_',int2str(N1),'_',int2str(N2),'_',int2str(N3), '_', int2str(R), '_1.txt'];

fid = fopen(file,'w');
for ii = 1:iter
    fprintf(fid,'%.6f\n',rmse_hist(ii));
end

