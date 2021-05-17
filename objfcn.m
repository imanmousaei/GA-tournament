function F=objfcn(people,p)   
   fitness = 1;
   cost = 1;
      
   n = size(people,1);
   for i = 1:n
       point = people(i);
       dis = dist(point,p);
       
       fitness = fitness + 1/dis^2;
       
       if dis < 100 % meters
           cost = cost + 1/dis^4;
           
       end
   end
   
   F = fitness / cost ;
end