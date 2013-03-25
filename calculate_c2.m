function c2 = calculate_c2(w,j,M)
num_hyp = size(M,1);
c2 = zeros(1,num_hyp-1);
h = M(j,:);

for i = 1:num_hyp
    h_i = M(i,:);
    same = (h == 0) & (h_i == 1);
    c2(i) = w' * same';
end

c2 = c2(union(1:(j-1),(j+1):num_hyp));
end