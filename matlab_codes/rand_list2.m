function Uinit = rand_list2(shapearg, ranks)

% initial seed
seed = 11796;

order = length(shapearg);
Uinit = cell(order,1);
for mode = 1:order
    I_i = shapearg(mode);
    J_i = ranks(mode);
    Uinit{mode} = zeros(I_i, J_i);
    if (mode ~= 0)
        for ii = 1:I_i
            for jj = 1:J_i
                seed = mod(8121*seed + 28411, 1334456);
                Uinit{mode}(ii,jj) = seed/1334456 * 2;
            end
        end
    end
end
