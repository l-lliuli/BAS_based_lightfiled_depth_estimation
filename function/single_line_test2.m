function [theta_line,C_line ]= single_line_test2(EPI)
%% ��ʾ��ÿһ����ѷֲ�ʱ�����λֵ�����Ұ���ѷֲ�����λplot����
L = size(EPI,2);
theta_line = zeros(1,L);
C_line = zeros(1,L);
% ���ȵ�һ����ȷ��16���߽���ֵ
% threthd =0.3;
% s = 15;

% ������ʼ����������ʼ��
i_star = 15;
% �������һ������
i_end = L-15; 
% theta�ĽǶȷ�Χ�Լ������Ĳ���
theta_star = 8;
theta_step = 0.1;
theta_end = 15;
% theta_star = 5;
% theta_step = 1;
% theta_end = 15;
% ����ÿһ��thetaֵ���Ƕ�Ҫ�������Ӧ�Ĵ���
index_list = zeros(1,length(i_star:i_end));
axis([1,15,-pi,pi])
for i = i_star:i_end
show = zeros(1,length(theta_star:theta_step:theta_end));
% x0 = i-1+1/2;          % 
% y0 = (s-1)/2 + 1/2;  
for theta = theta_star:theta_step:theta_end

c = cost(EPI,i,theta);
show(int32((theta-theta_star)/theta_step+1)) = c;
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





