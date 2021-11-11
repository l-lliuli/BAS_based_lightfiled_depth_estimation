% function [theta, show] = single_point_test(EPI_new,i)
% figure;
% axis([1,15,-pi,pi])
% plot(data(1,:),data(2,:),'o');
%  hold on;
% theta的角度范围以及遍历的步长
tic
theta_star =10;
theta_step = 0.1 ;
theta_end = 150;
s= 15;
% theta_star = 5;
% theta_step = 1;
% theta_end = 15;
% 对于每一个theta值我们都要保存其对应的代价

i = 300;
show = zeros(1,length(theta_star:theta_step:theta_end));
all_point = zeros(1,30);
x0 = i-1+1/2;          % 
y0 = (s-1)/2 + 1/2;  
cordinate0 = (i-1)*s+(s+1)/2;
for theta = theta_star:theta_step:theta_end

% k = tan(theta/360*2*pi);   
% 
% % Xs = linspace(x0-y0/k,x0+y0/k,n);         %小数部分的X坐标     
% 
% %Xs = (y0-Ys)/k+x0;  
% 
% Y = (1:s) - 0.5;
% 
% X = (y0-Y)/k+x0;
% x_center_down = floor(X-0.5)+0.5;
% x_center_up = x_center_down +1;
% index_down = ceil(x_center_down);
% index_down = (index_down-1)*s +(1:s);
% index_up = ceil(x_center_up);
% index_up = (index_up-1)*s +(1:s);
% %a = [X;x_center_down;x_center_up;index_down;index_up;EPI(index_down);EPI(index_up)];
% % all_point(1:2:29) = EPI(index_down);
% % all_point(2:2:30) = EPI(index_up);
% value_up = EPI(index_up);
% value_up(value_up-EPI(cordinate0)>pi) = value_up(value_up-EPI(cordinate0)>pi)-2*pi;
% value_up(value_up-EPI(cordinate0)<-pi) = value_up(value_up-EPI(cordinate0)<-pi)+2*pi;
% value_down = EPI(index_down);
% value_down(value_down-EPI(cordinate0)>pi) = value_down(value_down-EPI(cordinate0)>pi)-2*pi;
% value_down(value_down-EPI(cordinate0)<-pi) = value_down(value_down-EPI(cordinate0)<-pi)+2*pi;
% list = (X-x_center_down).*value_up+(x_center_up-X).*value_down;
% 
% % subplot(2,1,1)
% % stem(list);
% % pause(1)
% % subplot(2,1,2)
% % new_list = list;
% % 
% %  li = RunSac( list );
% % 
% % new_list(~li) = 0;
% % stem(new_list);
% %  pause(1);
% %  title(theta);
% %  xlabel('点数');
% %  ylabel('相位值');
%  
[list] = get_list( theta,i,-EPI );
% cost = cov(list);
% 
% c1 = user_define(1:8,list(1:8));
% c2 = user_define(8:15,list(8:15));
% c = min(c1,c2);
% cost = user_define(1:15,list);
cost = cov(list);

show(int32((theta-theta_star)/theta_step+1)) = cost;
end
% plot(theta_star:theta_step:theta_end,show)
% pause(0.1)
toc
xlabel(i);
title(i)
ylabel('cost')

[Min, index ] = min(show);
plot(theta_star:theta_step:theta_end,show)
                                                                                                                                                                                                                                                 theta = (index-1)*theta_step+theta_star;
% 
% 
% %theta_line(i_star:i_end) = index_list;
% plot(theta_star:theta_step:theta_end,show-Min);
% 
% theta = theta_star:theta_step:theta_end;
% a = (cotd(theta) - cotd(81.9)).^2;
% hold on;plot(theta_star:theta_step:theta_end,9.3*a)




