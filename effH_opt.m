function idx = effH_opt (M)

% M is (k x n) mistakes matrix, where k is the number of classifiers
% (i.e., size of hypothesis space) and n is number of examples

[k,n] = size(M);

set_sizes = sum(M,2);
[sorted_val,sorted_idx] = sort(set_sizes,'ascend');
clear set_sizes

idx = logical(ones(k,1));

for i = k:-1:2
    disp(i);
  if ((i == k) || (sorted_val(i) < sorted_val(i+1)))
    tmp_idx_list = find(sorted_val(i) > sorted_val(1:(i-1)));
    m = length(tmp_idx_list);
    M_not_i = M(sorted_idx(tmp_idx_list),:);
  end
  idx(sorted_idx(i)) = ~any(all((repmat(M(sorted_idx(i),:),m,1) & M_not_i) == M_not_i, ...
                    2));
end


