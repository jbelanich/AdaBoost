function [F,train_err,test_err, err, hyp] = Adaboost(X_train, Y_train, X_test, Y_test, H, M, T)

m = size(M,2);
w = repmat(1/m, m, 1);
error_vect = repmat(0, 1, size(M,1));
err = repmat(0, 1, T);
hyp = repmat(0, 1, T);
F = repmat(0, 1, size(M,1));
train_err = repmat(0,T,1);
test_err = repmat(0,T,1);

for t = 1:T
    disp(t);
    
    error_vect = M * w;
    
    [err(t), hyp(t)] = min(error_vect);
    w_next(logical(M(hyp(t), :))) = w(logical(M(hyp(t), :))) .* (1/err(t)) .* (1/2);
    w_next(~logical(M(hyp(t), :))) = w(~logical(M(hyp(t), :))) .* (1/(1-err(t))) .* (1/2);
    w = w_next ./ sum(w_next);
    w = w';
    disp(err(t));
    
    alpha = (1/2) * log((1-err(t))/err(t));
    
    F(hyp(t)) = F(hyp(t)) + alpha;
    train_err(t) = Error(F, H, X_train, Y_train);
    test_err(t) = Error(F, H, X_test, Y_test);
end

end

