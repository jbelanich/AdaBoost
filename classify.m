function Y = classify(X, stump_idx, H)

    dim = H(stump_idx,1);
    thresh = H(stump_idx,2);
    direction = H(stump_idx,3);
    
    Y = (X(:,dim) >= thresh);
    Y = Y - ~Y;
    Y = Y .* direction;

end

