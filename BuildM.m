function M = BuildM(X, Y, H)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
m = size(X, 1);
Y_trans = Y';

disp('calculating M');
M = zeros(size(H,1), m);
for i = 1:size(H,1)
    if(mod(i,1000) == 0)
        disp(i);
    end
    classification = classify(X, i, H)';
    temp = (classification .* Y_trans) == -1;
    if(temp == zeros(1, length(Y_trans)))
        disp('bad');
    end
    M(i,:) = temp;
end

end

