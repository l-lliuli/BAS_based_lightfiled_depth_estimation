function [theta_list,k_list] = gradient_opt(EPI_new)
%%  此部分用于优化采用梯度下降法来进行角度迭代

  % 首先我们还是对于单点进行测试
%   figure;
%   hold on;
i_end = size(EPI_new,2);
i_star = 1;
% i_end = 625;
  theta_list = zeros(1,length(i_star:i_end));
  k_list= zeros(1,length(i_star:i_end));
  i_line = i_star:i_end;
%   valid_point = i_line(EPI_valid);
for point = 1:i_end 
k = 1;
theta = 80;  % 随机初始化一个theta;
alpha = 20;
counter = 0;
% cov_ =1;
while abs(k)>0.00005  
   theta = theta - alpha*k;
[value_list] = get_list(theta,point,EPI_new);
% plot(value_list)
% pause(2)
% index = RunSac(value_list);
% value_list = value_list(index);
% value_list = find_valid(value_list);
 L = length(value_list(1:15));
% [k] = user_define(find(index),value_list);
[k] = user_define(1:L,value_list(1:15));




counter = counter+1;
if counter >80||   L==1
    break;
end
end

theta_list(point-(i_star-1)) = theta;
k_list(point-(i_star-1)) = cov(value_list);
% pause(0.5)
end
end



% plot(theta_list);
% axis([i_star,i_end,0,15])
