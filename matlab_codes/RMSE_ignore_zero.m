function RMSE = RMSE_ignore_zero(A, B)
%% Root Mean Square Error, ignore zero element in tensor A.
% A : origin tensor
% B : hypothesis tensor with error
A_tag = A ~= 0;
B = B.*A_tag;
RMSE = norm(A-B) / sqrt(nnz(A_tag));

