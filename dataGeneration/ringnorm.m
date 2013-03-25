function [X,Y] = ringnorm(datasetSize)

dim = 20;
a = 2/sqrt(20);
X = zeros(datasetSize,dim);
Y = zeros(datasetSize,1);

for i = 1:datasetSize
    Y(i) = discrete_rnd([-1,1],[.5,.5],[1,1]);
    if (Y(i) == 1)
        X(i,:) = unifrnd(0,4,[1,dim]);
    else
        X(i,:) = unifrnd(a,1,[1,dim]);
    end
end

end