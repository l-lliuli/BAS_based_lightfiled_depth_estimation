% debug a invalid point of an EPI;
raw = 383 ; 
i = 361;
EPI  = funtion_to_generate_EPIMAP(phase_3D,raw);
 theta = single_point_test(EPI,i)
 theta_list = [];
tic
theta = 48;

theta_next = theta-2;
% i = 110;
k = 0;
cost_line = [];
while( abs(cost(EPI,i,theta) - cost(EPI,i,theta_next)) >0.00001  && k<200 )
   if (theta >130  || theta< 30)
       break
   end
   a = cost(EPI,i,theta_next);
   b = cost(EPI,i,theta);
   alpha = 100*(a - b)/(theta_next-theta);
   theta = theta_next;
   theta_next = theta - 0.01*alpha;
   k = k+1;
   cost_line = [cost_line,a];
end
theta_next;
theta_list = [theta_list,theta_next];
% end
toc
% figure;plot(theta_list)