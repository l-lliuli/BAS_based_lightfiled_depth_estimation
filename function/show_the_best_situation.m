% for i = 1:434
%       EPI = funtion_to_generate_EPIMAP(phase_3D,i);
%     for j = 1:625
%         if ~invalid_mask(i,j)
%         theta = map(i,j);
%        list =  plot_the_point_line(EPI,i,theta);
%        plot(list);axis([0,15,-pi,pi])
%        pause(0.1)
%         end
%     end
% end

i = 280;
j = 356;
EPI = funtion_to_generate_EPIMAP(phase_3D,i);
EPI_col = funtion_to_generate_EPIMAP(phase_3D_col,j);

for theta = 30:0.1:100
   list =  plot_the_point_line(EPI,j,theta);
   list2 =  plot_the_point_line(EPI,i,theta);
   a  = [list,list2];
  
  
   plot(a); axis([0,30,-2*pi,2*pi])
   pause(0.02)
end





function list = plot_the_point_line(EPI,i,theta)
L = size(EPI,2);
n = (L-1)*15;
x0 = i-1+1/2;          % 
y0 = 7 + 1/2; 
cordinate0 = (i-1)*15+8;
k = tan(theta/360*2*pi);   
% Xs = linspace(x0-y0/k,x0+y0/k,n);         %小数部分的X坐标     
% threthd = 0.3;
%Xs = (y0-Ys)/k+x0;  

Y = (1:15) - 0.5;

X = (y0-Y)/k+x0;
x_center_down = floor(X-0.5)+0.5;
x_center_up = x_center_down +1;
index_down = ceil(x_center_down);
index_down = (index_down-1)*15 +(1:15);
index_up = ceil(x_center_up);
index_up = (index_up-1)*15 +(1:15);

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
value_down(value_down-EPI(cordinate0)>pi)  = value_down(value_down-EPI(cordinate0)>pi)-2*pi;
value_down(value_down-EPI(cordinate0)<-pi) = value_down(value_down-EPI(cordinate0)<-pi)+2*pi;



list = (X-x_center_down).*value_up +(x_center_up-X).*value_down;
end