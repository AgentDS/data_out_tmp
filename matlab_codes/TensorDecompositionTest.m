
digits(64);

          
%%          
%X = tensor(A);
%P = my_parafac_als(X, 2,struct('maxiters',10,'tol',1e-16,'printitn',1));
%T = my_cp_als(X, 2,'init','random','maxiters',200);

X = gen_test_tensor([80,80,80], 20);
%X = tensor(A);
coreNway = [20,20,20];
opts.maxit = 10; opts.tol = 1e-4;
[A,C, Out] = ntd(X,coreNway,opts);
[A,C, Out] = my_ntd(X,coreNway,opts);
%[facts,fullX, Out] = ncp(X, 2,{});
%% Y = reshape(X.data,szn,szr);  % n = 1
%% Y = reshape(X.data,[],szr);   % n = N
%% Y = reshape(X.data,szl,szn);
%Y'




