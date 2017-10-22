% An example of nonnegative CP decomposition
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

%% Solve problem
opts.maxit = 1000; % max number of iterations
opts.tol = 1e-4; % stopping tolerance
t0 = tic;
[A,Out] = ncp(Mtrue,R,opts);
time = toc(t0);

%% Reporting
figure;
semilogy(1:Out.iter-1, Out.hist_rmse,'k-','linewidth',2);
xlabel('iteration','fontsize',12);
ylabel('RMSE','fontsize',12)



file = ['/root/tensorD_f/data_out_tmp/matlab_out/ncp_N1_N2_N3_R_',int2str(N1),'_',int2str(N2),'_',int2str(N3), '_', int2str(R), '_1.txt'];
%file = [pwd '/MyData/ncp_N1_N2_N3_R_',int2str(N1),'_',int2str(N2),'_',int2str(N3), '_', int2str(R), '_1.txt'];

fid = fopen(file,'w');
iter = length(Out.hist_rmse);
for ii = 1:iter
    fprintf(fid,'%.6f\n',Out.hist_rmse(ii));
end

%%
% randomly generate factor matrices
A_org = max(0,randn(N1,R));
B_org = max(0,randn(N2,R));
C_org = max(0,randn(N3,R));


% get tensor M using the above factor matrices
M = ktensor({A_org,B_org,C_org});
Mtrue = full(ktensor(M));

%% Solve problem
opts.maxit = 1000; % max number of iterations
opts.tol = 1e-4; % stopping tolerance
t0 = tic;
[A,Out] = ncp(Mtrue,R,opts);
time = toc(t0);

%% Reporting
figure;
semilogy(1:Out.iter-1, Out.hist_rmse,'k-','linewidth',2);
xlabel('iteration','fontsize',12);
ylabel('RMSE','fontsize',12)



file = ['/root/tensorD_f/data_out_tmp/matlab_out/ncp_N1_N2_N3_R_',int2str(N1),'_',int2str(N2),'_',int2str(N3), '_', int2str(R), '_2.txt'];
%file = [pwd '/MyData/ncp_N1_N2_N3_R_',int2str(N1),'_',int2str(N2),'_',int2str(N3), '_', int2str(R), '_1.txt'];

fid = fopen(file,'w');
iter = length(Out.hist_rmse);
for ii = 1:iter
    fprintf(fid,'%.6f\n',Out.hist_rmse(ii));
end

%% <http://www.caam.rice.edu/~optimization/bcu/ncp/example_ncp.m Download this m-file>