function H = buildStumps(X)
%builds a matrix M that contains all decision stumps on the provided data.
%Each row in H is a stump, with the following columns giving important
%data:
%   1: dimension split on
%   2: threshold split
%   3: direction of positive classification (+1, -1)
d = size(X, 2);
m = size(X, 1);
stumpsUpperBound = (2 * d * (m-1));

H = repmat(0, stumpsUpperBound, 3);
slotInH = 1;

for i = 1:d
    projection = projectIntoDimension(X, i);
    projection_sorted = unique(projection);
    
    for j = 1:length(projection_sorted)-1
        threshold = (projection_sorted(j) + projection_sorted(j+1)) / 2;
        H(slotInH,:) = [i threshold 1];
        H(slotInH+1,:) = [i threshold -1];
        slotInH = slotInH + 2;
    end
end

%add degenerate cases, doesn't matter the dimension picked here
projection = projectIntoDimension(X,1);
[projection_sorted, idx] = sort(projection);
H(slotInH,:) = [1 projection_sorted(1) 1];
H(slotInH+1,:) = [1 projection_sorted(1) -1];

H = H(1:slotInH+1,:);

end

