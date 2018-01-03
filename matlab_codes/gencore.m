function core = gencore(rank, max_prime)
if nargin==1
    max_prime = 10000;
end
number_list = primes(max_prime);
core = zeros(rank, rank, rank);
count = 2;
for dim1 = 1:rank
    for dim2 = 1:rank
        if mod(dim1,2) == 1
            row = number_list(count:count + rank - 1);
            if mod(dim2,2) == 1
                core(:, dim2, dim1) = row;
                count = count + 2;
            else
                core(:, dim2, dim1) = row([end:-1:1]);
            end
        else
            core(:,:,dim1) = core(:,:,dim1 - 1)';
        end
    end
end
core = tensor(core);