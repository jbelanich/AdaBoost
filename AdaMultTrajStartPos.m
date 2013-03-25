for i = Tstart:Tend
    disp(i);
    
    for j = 1:numPoints
       [AllWs(:,j), AllError(i,j), AllHyp(i,j),AllDistanceFromBound(i,j),AllDifferences(i,j)] = AdaUpdate(AllWs(:,j), M);
    end
    
end