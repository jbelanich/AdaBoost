function err = Error(F, H, X, Y)

m = size(X,1);
d = size(X,2);

H_idx = find(F ~= 0);
H_opt = H(H_idx,:);
F_opt = F(H_idx);
F_opt = F_opt';
Y_H = [];
for i = 1:m
    Y_trans = X(i,H_opt(:,1)) >= H_opt(:,2)';
    Y_trans = Y_trans - ~Y_trans;
    Y_trans = Y_trans .* H_opt(:,3)';
    Y_H(i) = sign(Y_trans * F_opt);
end

incorrect_vector = Y_H' .* Y;
err = sum(incorrect_vector == -1)/ length(incorrect_vector);

end

