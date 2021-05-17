function F=objfcn(people,p)   
   fitness = 0;
   cost = 0;
      
   [n,~] = size(people);
   for i = 1:n
       point = people(i);
       dist = norm(point-p);
       
       fitness = fitness + 1/dist^2;
       
       if dist < 100 % meters
           cost = cost + 1/dist^4;
       end
   end
   
   F = fitness / cost ;
end