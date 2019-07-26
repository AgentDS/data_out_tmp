function Uinit = rand_list(shapearg, rank)

% initial seed
seed = 11796;

order = length(shapearg);
Uinit = cell(order,1);
for mode = 1:order
    Uinit{mode} = zeros(shapearg(mode), rank);
    if (mode ~= 0)   
        for ii = 1:shapearg(mode)
            for jj = 1:rank
                seed = mod(8121*seed + 28411, 1334456);
                Uinit{mode}(ii,jj) = seed/1334456 * 2;
            end
        end
    end
end


    