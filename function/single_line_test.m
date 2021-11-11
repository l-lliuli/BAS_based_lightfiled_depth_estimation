function [theta_line ,C_line]= single_line_test(EPI)
%% 显示出每一行最佳分布时候的相位值，并且把最佳分布的相位plot出来
L = size(EPI,2);
theta_line = zeros(1,L);
C_line = zeros(1,L);
% 首先第一步，确定16个边界点的值
threthd =0.3;
s = 15;

% 测试起始像素像素起始点
i_star = 50;
% 测试最后一个像素
i_end = L-15; 
% theta的角度范围以及遍历的步长
theta_star =7;
theta_step = 0.1;
theta_end = 20;
% theta_star = 5;
% theta_step = 1;
% theta_end = 15;
% 对于每一个theta值我们都要保存其对应的代价
index_list = zeros(1,length(i_star:i_end));
% axis([1,15,-pi,pi])
for i = i_star:i_end
show = zeros(1,length(theta_star:theta_step:theta_end));
x0 = i-1+1/2;          % 
y0 = (s-1)/2 + 1/2;  
for theta = theta_star:theta_step:theta_end

k = tan(theta/360*2*pi);   
% Xs = linspace(x0-y0/k,x0+y0/k,n);         %小数部分的X坐标     

%Xs = (y0-Ys)/k+x0;  

Y = (1:s) - 0.5;

X = (y0-Y)/k+x0;
x_center_down = floor(X-0.5)+0.5;
x_center_up = x_center_down +1;
index_down = ceil(x_center_down);
index_down = (index_down-1)*s +(1:s);
index_up = ceil(x_center_up);
index_up = (index_up-1)*s +(1:s);
%a = [X;x_center_down;x_center_up;index_down;index_up;EPI(index_down);EPI(index_up)];
list = (X-x_center_down).*EPI(index_up) +(x_center_up-X).*EPI(index_down);

% ind = 1:length(list);
% data = [ind;list];
% [inner,k,b]=ransac(data,2,150,0.1,0.1);
% list(abs(list-list(8))>threthd) = [];
cost = cov_weight(list);
show(int32((theta-theta_star)/theta_step+1)) = cost;
end

[C, index ] = min(show);
index_list(int32(i-i_star+1)) = (index-1)*theta_step+theta_star;
C_line(int32(i-i_star+1)) = C;
% theta_line(i_star:i_end) = index_list;


% index
end
theta_line(i_star:i_end) = index_list;

plot(theta_line);
% axis([0,600,50,60]);





