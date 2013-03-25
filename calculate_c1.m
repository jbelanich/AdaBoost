function c1 = calculate_c1(w,j,M)
num_hyp = size(M,1);
c1 = zeros(1,num_hyp-1);
h = M(j,:);

for i = 1:num_hyp
    h_i = M(i,:);
    same = (h == 1) & (h_i == 1);
    c1(i) = w' * same;
end

c1 = c1(union(1:(j-1),(j+1):num_hyp));
end