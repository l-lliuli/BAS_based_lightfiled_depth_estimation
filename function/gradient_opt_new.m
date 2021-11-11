 function  [theta_list,cost_list ] =  gradient_opt_new(EPI)

L = size(EPI,2);
theta_list = zeros(1,L);
cost_list = zeros(1,L);
for i = 1:L
%   对于已知的凸函数，先确定一个初始的点
theta = 89;

theta_next = 90;
% i = 110;
k = 0;
while( abs(cost(EPI,i,theta) - cost(EPI,i,theta_next)) >0.001  && k< 50 )
   if (theta >100  || theta< 30)
       break
   end
   alpha = 10*(cost(EPI,i,theta_next) - cost(EPI,i,theta))/(theta_next-theta);
   theta = theta_next;
   theta_next = theta - 0.1*alpha;
   k = k+1;
  
end

theta_list(i) = theta_next;
cost_list(i) = cost(EPI,i,theta_next);
end

end