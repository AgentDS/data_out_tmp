function fulltensor = gen_test_tensor(I_list, rank, max_prime)
if nargin==2
    max_prime = 10000;
end

number_list = primes(max_prime);

core = gencore(rank);
U = genU(I_list, rank, number_list);
X = ttensor(core, U);
fulltensor = full(X)/1000;

