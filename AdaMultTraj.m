m = size(M,2);
AllWs = zeros(m,numPoints);
AllDistanceFromBound = zeros(T,numPoints);
AllError = zeros(T,numPoints);
AllHyp = zeros(T,numPoints);
AllDifferences = zeros(T,numPoints);

for i = 1:numPoints
    AllWs(:,i) = randomDistribution(m);
end

AllWsStart = AllWs;

for i = 1:T
    disp(i);
    fflush(1)
    for j = 1:numPoints
        [AllWs(:,j), AllError(i,j), AllHyp(i,j),AllDistanceFromBound(i,j),AllDifferences(i,j)] = AdaUpdate(AllWs(:,j), M);
    end
    
end