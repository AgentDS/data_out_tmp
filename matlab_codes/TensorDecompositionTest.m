%%          
%X = tensor(A);
%P = my_parafac_als(X, 2,struct('maxiters',10,'tol',1e-16,'printitn',1));
%T = my_cp_als(X, 2,'init','random','maxiters',200);

%X = gen_test_tensor([80,80,80], 20);
%X = tensor(A);
% X = zeros(3,4,5);
% X(:,:,1) = [0  5  10 15
%             20 25 30 35
%             40 45 50 55];
% X(:,:,2) = X(:,:,1) + 1;    X(:,:,3) = X(:,:,2) + 1;
% X(:,:,4) = X(:,:,3) + 1;    X(:,:,5) = X(:,:,4) + 1;
% X = tensor(X);
% coreNway = [3,3,3];
%opts.maxit = 500; opts.tol = 1e-4;

%%
N1 = 80;
N2 = 80;
N3 = 80;
R = 20;
Nway = [N1,N2,N3]; % dimension of tensor
coreNway = [15,15,15]; % dimension of core tensor

% randomly generate core tensor
G = tensor(max(0,randn(coreNway)));
A = cell(1,ndims(G));
% randomly generate factor matrices
for i = 1:ndims(G)
    A{i} = max(0,rand(Nway(i),coreNway(i)));
end
% generate tensor
Xtrue = full(ttensor(G,A)); N = ndims(Xtrue);
N = tensor(max(0,0.04*randn(N1,N2,N3)));
X = Xtrue + N;
%% Solve problem
opts.maxit = 10000; opts.tol = 1e-4;


%%
disp('original ntd1: ')
[A,C, Out] = ntd(X,coreNway,opts,500);
% disp('original ntd2: ')
% [A,C, Out] = ntd(X,coreNway,opts,500);
disp('initialization-fixed ntd: ')
[A,C, Out] = my_ntd(X,coreNway,opts,500,'');
disp('fix-rand ntd1: ')
[A,C, Out] = my_ntd(X,coreNway,opts,500,'rand');
disp('fix-randn ntd: ')
[A,C, Out] = my_ntd(X,coreNway,opts,500,'randn');
% disp('fix-rand ntd3: ')
% [A,C, Out] = my_ntd(X,coreNway,opts,20,'rand');
% 

%[facts,fullX, Out] = ncp(X, 2,{});
%% Y = reshape(X.data,szn,szr);  % n = 1
%% Y = reshape(X.data,[],szr);   % n = N
%% Y = reshape(X.data,szl,szn);
%Y'




