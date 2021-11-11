%%  此部分用于优化采用梯度下降法来进行角度迭代
% function theta = gradient_single_point(EPI,point,theta)
  % 首先我们还是对于单点进行测试
 figure;
%   hold on;
  axis([1,15,-pi,pi]);
%   theta_list = zeros(1,length(200:800));
tic
k = 1;
point = 300;
theta =80;  % 随机初试话一个theta;
alpha = -10;
counter = 0 ;
List = [];
k_list = [];
while abs(k)>0.0000001 
[value_list] = get_list(theta,point,EPI);
% index = RunSac(value_list);
%  value_list = find_valid(value_list);
% plot(value_list(3:13));axis([0,15,-pi,pi])
% 
% title(k)
% pause(0.11)
L = length(value_list(3:13));
% [k,~] = user_define(find(index),value_list);
 k_list = [k_list,k];
% [k1] = user_define(1:8,value_list(1:8));
% [k2] = user_define(8:15,value_list(8:15));
% k = min(k1,k2);


k = user_define(1:15,value_list(1:15));
theta = theta + alpha*k;
List = [List,theta];
counter = counter+1;
if counter >50||  L==1
    break;
end

end
toc
% stem(List)

k_all = [];
for theta = 8:0.1:20
    [value_list] = get_list(theta,point,EPI);
    [k] = user_define(1:L,value_list(3:13));
    k_all = [k_all,k];
end


% end

% pause(0.5)


