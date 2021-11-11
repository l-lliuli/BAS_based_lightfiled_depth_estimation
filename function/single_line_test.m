function [theta_line ,C_line]= single_line_test(EPI)
%% ��ʾ��ÿһ����ѷֲ�ʱ�����λֵ�����Ұ���ѷֲ�����λplot����
L = size(EPI,2);
theta_line = zeros(1,L);
C_line = zeros(1,L);
% ���ȵ�һ����ȷ��16���߽���ֵ
threthd =0.3;
s = 15;

% ������ʼ����������ʼ��
i_star = 50;
% �������һ������
i_end = L-15; 
% theta�ĽǶȷ�Χ�Լ������Ĳ���
theta_star =7;
theta_step = 0.1;
theta_end = 20;
% theta_star = 5;
% theta_step = 1;
% theta_end = 15;
% ����ÿһ��thetaֵ���Ƕ�Ҫ�������Ӧ�Ĵ���
index_list = zeros(1,length(i_star:i_end));
% axis([1,15,-pi,pi])
for i = i_star:i_end
show = zeros(1,length(theta_star:theta_step:theta_end));
x0 = i-1+1/2;          % 
y0 = (s-1)/2 + 1/2;  
for theta = theta_star:theta_step:theta_end

k = tan(theta/360*2*pi);   
% Xs = linspace(x0-y0/k,x0+y0/k,n);         %С�����ֵ�X����     

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





