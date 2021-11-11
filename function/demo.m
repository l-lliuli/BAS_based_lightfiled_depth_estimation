% 首先第一步，确定16个边界点的值
addpath(genpath('./EPIfilter'));
%% 现在考虑对EPI进行一个滤波之后，然后我们来进行计算
%EPI = EPI_guass(EPI,3,1);
threthd = 0.2;
i = 460;
% 第一个中心像素起始点
i_star = 361;
% 中心像素结束的地方
i_end = 754; 
% theta的角度范围以及遍历的步长
theta_star = 8.2;
theta_step = 0.01;
theta_end = 13;
deta   = 3;
theta = 45;
% 对于每一个theta值我们都要保存其对应的代价
index_list = zeros(1,length(i_star:i_end));
cov_list = zeros(1,length(i_star:i_end));

show = zeros(1,length(theta_star:theta_step:theta_end));
         % 
y0 = 7 + 1/2;  
for i = i_star:i_end
x0 = i-1+1/2; 
for theta = theta_star:theta_step:theta_end
k = tan(theta/360*2*pi);   
% Xs = linspace(x0-y0/k,x0+y0/k,n);         %小数部分的X坐标     
list = zeros(1,15);
%Xs = (y0-Ys)/k+x0;  
for Y =  (1:15) - 0.5
% Y = (1:15) - 0.5;
% 

X = (y0-Y)/k+x0;
X_left = X-deta;
X_right = X+deta;
fi = get_fi1_fi2( X_left,X_right,EPI ,Y+0.5);
list(Y+0.5) = fi;
end
% x_center_down = floor(X-0.5)+0.5;
% x_center_up = x_center_down +1;
% index_down = ceil(x_center_down);
% index_down = (index_down-1)*15 +(1:15);
% index_up = ceil(x_center_up);
% index_up = (index_up-1)*15 +(1:15);
%  a = [X;x_center_down;x_center_up;index_down;index_up;EPI(index_down);EPI(index_up)];
% list = (X-x_center_down).*EPI(index_up) +(x_center_up-X).*EPI(index_down);
list(abs(list-list(8))>threthd) = [];
cost = cov(list);
show(int32((theta-theta_star)/theta_step+1)) = cost;


end
[a , index ] = min(show);
index
index_list(int32(i-i_star+1)) = (index-1)*theta_step+theta_star;
cov_list(int32(i-i_star+1)) = a;

end
result = medfilt2(index_list,[1,3]);
% result = 1./tand(result);
plot(result);






