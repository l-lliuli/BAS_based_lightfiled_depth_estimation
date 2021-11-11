theta = 6;
i = 228;
x0 = i-1+1/2;          % 
y0 = 7 + 1/2; 

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
stem(list);axis([0,16,-2,2])
