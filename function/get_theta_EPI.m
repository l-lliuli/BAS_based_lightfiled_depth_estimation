function theta_line = get_theta_EPI(EPI,raw,mask)
threthd = 0.3;
L = size(EPI,2);
theta_line = zeros(1,L);
% 首先第一步，确定16个边界点的值

% 第一个中心像素起始点
i_star = 1;
% 中心像素结束的地方
i_end = 600; 
% theta的角度范围以及遍历的步长
theta_star = 14;
theta_step = 0.01;
theta_end = 25;
% theta_star = 5;
% theta_step = 1;
% theta_end = 15;
% 对于每一个theta值我们都要保存其对应的代价
index_list = zeros(1,length(i_star:i_end));
for i = i_star:i_end
 if mask(raw,i) == 1
show = zeros(1,length(theta_star:theta_step:theta_end));
x0 = i-1+1/2;          % 
y0 = 7 + 1/2;  
for theta = theta_star:theta_step:theta_end

k = tan(theta/360*2*pi);   
% Xs = linspace(x0-y0/k,x0+y0/k,n);         %小数部分的X坐标     

%Xs = (y0-Ys)/k+x0;  

Y = (1:15) - 0.5;

X = (y0-Y)/k+x0;
x_center_down = floor(X-0.5)+0.5;
x_center_up = x_center_down +1;
index_down = ceil(x_center_down);
index_down = (index_down-1)*15 +(1:15);
index_up = ceil(x_center_up);
index_up = (index_up-1)*15 +(1:15);
%a = [X;x_center_down;x_center_up;index_down;index_up;EPI(index_down);EPI(index_up)];
list = (X-x_center_down).*EPI(index_up) +(x_center_up-X).*EPI(index_down);
list(abs(list-list(8))>threthd) = [];
cost = cov(list);
show(int32((theta-theta_star)/theta_step+1)) = cost;
end

[~, index ] = min(show);
index_list(int32(i-i_star+1)) = (index-1)*theta_step+theta_star;
 end
end
theta_line(i_star:i_end) = index_list;

%plot(index_list);
end





