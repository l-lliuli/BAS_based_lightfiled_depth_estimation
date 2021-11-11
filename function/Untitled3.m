keng1 = 0;
% keng2 = 1;
% 
% temp = 0;
% list = [0,1];
% for i = 1:10
%     
%     temp = keng1+keng2;
%     keng1 = keng2;
%     keng2 = temp;
%     list = [list,temp];
%   
%     
%     
%     
% end

digui(10);


 function b = digui(n)
 if n>2
b = digui(n-1) +digui(n-2)
 else
     b= n;
 end
 end


