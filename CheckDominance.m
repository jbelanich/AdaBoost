function dom = CheckDominance(M, toTest, indexTable)

dom = 0;
m = size(M,1);
for i = 0:m-1
   if((M(m-i,:) | toTest) == M(m-i,:))
       dom = 1;
       break;
   end
end


end

