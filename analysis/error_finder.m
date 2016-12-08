n    = 10;
dim  = 84;
E = zeros(n,dim);

for i = 1:n
    for k = 1:dim
        [r , Rsq, E(i,k)] = pcr_fit(map, prop, n, dim);
    end
    i
end
sum(E(:,40)/n)