function [theta_line,C_line ]= k_line_test(EPI)
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
theta_star = 40;
theta_step = 0.1;
theta_end = 80;
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





