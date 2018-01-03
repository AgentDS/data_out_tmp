
digits(64);

          
%%          
%X = tensor(A);
%P = my_parafac_als(X, 2,struct('maxiters',10,'tol',1e-16,'printitn',1));
%T = my_cp_als(X, 2,'init','random','maxiters',200);

A = zeros(3,4,5);
A(:,:,1) = [ 0, 5, 10, 15;20, 25, 30, 35;40, 45, 50, 55];
A(:,:,2) = [ 1, 6, 11, 16;21, 26, 31, 36;41, 46, 51, 56];
A(:,:,3) = [ 2, 7, 12, 17;22, 27, 32, 37;42, 47, 52, 57];
A(:,:,4) = [ 3, 8, 13, 18;23, 28, 33, 38;43, 48, 53, 58];
A(:,:,5) = [ 4, 9, 14, 19;24, 29, 34, 39;44, 49, 54, 59];
X = tensor(A);
coreNway = [3,3,3];
opts.maxit = 1000; opts.tol = 1e-4;
[A,C, fullA, Out] = my_ntd(X,coreNway,opts)
%[facts,fullX, Out] = ncp(X, 2,{});
%% Y = reshape(X.data,szn,szr);  % n = 1
%% Y = reshape(X.data,[],szr);   % n = N
%% Y = reshape(X.data,szl,szn);
%Y'




