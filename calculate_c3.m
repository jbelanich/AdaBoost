function c3 = calculate_c3(w,j,M)
num_hyp = size(M,1);
c3 = zeros(1,num_hyp-1);
h = M(j,:);

for i = 1:num_hyp
    h_i = M(i,:);
    same = ((h == 1) & (h_i == 0)) | ((h == 0) & (h_i == 1));
    c3(i) = w' * same';
end

c3 = c3(union(1:(j-1),(j+1):num_hyp));
end