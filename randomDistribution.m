function distrib = randomDistribution(n)

m = 1000000000;
temp = unifrnd(1,m,1,n-1);
temp = [temp, 0, m];
n = length(temp) - 1;
temp = sort(temp);
distrib = [];
for i = 1:n
  distrib(i) = temp(i+1) - temp(i);
end
distrib = distrib ./ m;

distrib = distrib';
end