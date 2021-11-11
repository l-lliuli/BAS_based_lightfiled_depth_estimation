function [list] = get_list( theta,i,EPI )
%GET_LIST 此处显示有关此函数的摘要
%   此处显示详细说明
[h,L] = size(EPI);
center = (h+1)/2;
n = (L-1)*h;
x0 = i-1+1/2;          % 
y0 = center-1 + 1/2; 
cordinate0 = (i-1)*h+center;
k = tan(theta/360*2*pi);   
% Xs = linspace(x0-y0/k,x0+y0/k,n);         %小数部分的X坐标     
% threthd = 0.3;
%Xs = (y0-Ys)/k+x0;  

Y = (1:h) - 0.5;

X = (y0-Y)/k+x0;




x_center_down = floor(X-0.5)+0.5;
x_center_up = x_center_down +1;
index_down = ceil(x_center_down);
index_down = (index_down-1)*h +(1:h);
index_up = ceil(x_center_up);
index_up = (index_up-1)*h +(1:h);

% flag1 = index_up>1920;
% X(flag1) = []; x_center_down(flag1) = [];  x_center_up(flag1) = [];  index_up(flag1) = []; index_down(flag1) = [];
% flag2 = index_down < 0 ;
% X(flag2) = []; x_center_down(flag2) = [];  x_center_up(flag2) = [];  index_up(flag2) = []; index_down(flag2) = [];
%a = [X;x_center_down;x_center_up;index_down;index_up;EPI(index_down);EPI(index_up)];
% value_up = EPI(index_up);
% value_down = EPI(index_down);
labels = (index_up>n | index_up<0) | (index_down>n | index_down<0);
index_up(labels ) = 1;
index_down(labels | index_down ==0) = 1;
value_up = EPI(index_up);

value_up(value_up-EPI(cordinate0)>pi) = value_up(value_up-EPI(cordinate0)>pi)-2*pi;
value_up(value_up-EPI(cordinate0)<-pi) = value_up(value_up-EPI(cordinate0)<-pi)+2*pi;
value_down = EPI(index_down);
value_down(value_down-EPI(cordinate0)>pi) = value_down(value_down-EPI(cordinate0)>pi)-2*pi;
value_down(value_down-EPI(cordinate0)<-pi) = value_down(value_down-EPI(cordinate0)<-pi)+2*pi;



list = (X-x_center_down).*value_up +(x_center_up-X).*value_down;

% list = 0.5*value_up + 0.5 *value_down;


% ind = 1:length(list);
% data = [ind;list];
% [inner,k,b]=ransac(data,2,150,0.1,0.1);
% list(abs(list-list(8))>threthd) = [];
% cost =cov(list);


end

