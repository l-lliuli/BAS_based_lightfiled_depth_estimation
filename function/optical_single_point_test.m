function theta = optical_single_point_test(EPI,index)
k = 1;
theta = 20;  % 随机初试话一个theta;
alpha = 100;
counter = 0 ;
cov_ =1;
point = index;
while abs(k)>0.0005  
[value_list] = get_list(theta,point,EPI);
stem(value_list)
axis([0,15,-pi,pi])
title(theta)
pause(0.01)
index = RunSac(value_list);
value_list = value_list(index);
L = length(value_list);
if L ==1
    break
end

[k,~] = user_define(find(index),value_list);
% [k,~] = user_define(1:L,value_list);
theta = theta - alpha*sign(k)*abs(k);
counter = counter+1;
if counter >1500 || theta<1  || theta>90  || L==1
    break;
end
end
end

% theta_list(point-(i_star-1)) = theta;