function U = genU(I_list, rank, number_list)
N = length(I_list);
U = cell(1, N);
for mode = 1:N
    U{mode} = zeros(I_list(mode), rank);
    count = 2;
    for row = 1:I_list(mode)
        if mod(row,2) == 1
            line = number_list(count:count+rank-1);
            U{mode}(row,:) = line;
            count = count + 1;
        else
            U{mode}(row,:) = line([end:-1:1]);
        end
    end
end



                
            

