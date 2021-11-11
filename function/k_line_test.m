function [theta_line,C_line ]= k_line_test(EPI)
%% 显示出每一行最佳分布时候的相位值，并且把最佳分布的相位plot出来
L = size(EPI,2);
theta_line = zeros(1,L);
C_line = zeros(1,L);
% 首先第一步，确定16个边界点的值
% threthd =0.3;
% s = 15;

% 测试起始像素像素起始点
i_star = 15;
% 测试最后一个像素
i_end = L-15; 
% theta的角度范围以及遍历的步长
theta_star = 40;
theta_step = 0.1;
theta_end = 80;
% theta_star = 5;
% theta_step = 1;
% theta_end = 15;
% 对于每一个theta值我们都要保存其对应的代价
index_list = zeros(1,length(i_star:i_end));
axis([1,15,-pi,pi])
for i = i_star:i_end
show = zeros(1,length(theta_star:theta_step:theta_end));
% x0 = i-1+1/2;          % 
% y0 = (s-1)/2 + 1/2;  
for theta = theta_star:theta_step:theta_end
 [list] = get_list( theta,i,EPI );
c1 = user_define(1:8,list(1:8));
c2 = user_define(8:15,list(8:15));
c = min(c1,c2);

% 
% c = user_define(1:15,list);
show(int32((theta-theta_star)/theta_step+1)) = abs(c);
end

[C, index ] = min(show);
index_list(int32(i-i_star+1)) = (index-1)*theta_step+theta_star;
 C_line(int32(i-i_star+1)) = C;
% theta_line(i_star:i_end) = index_list;

% index
end
theta_line(i_star:i_end) = index_list;
end
% plot(theta_line);
% axis([0,600,50,60]);





