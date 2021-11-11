function [C,theta_line] = gardient_theta(EPI,theta)

%%  �˲��������Ż������ݶ��½��������нǶȵ���theta_line = zeros(1,L);
L = size(EPI,2);
theta_line = zeros(1,L);
C = zeros(1,L);
i_star = 1;
i_end = L;
  % �������ǻ��Ƕ��ڵ�����в���
  theta_list = zeros(1,length(i_star:i_end));
for point = i_star:i_end   
k = 1;
% theta = theta;  % ������Ի�һ��theta;
alpha = 25;
counter = 0 ;
while abs(k)>0.0001  
[value_list] = get_list(theta,point,EPI);
L = length(value_list);
if L ==1
    break
end

[k,~] = user_define(1:L,value_list);
theta = theta - alpha*sign(k)*abs(k);
counter = counter+1;
if counter >1500 || theta<1  || theta>90  || L==1
    break;
end

end

theta_list(point-i_star+1) = theta;
C(point-i_star+1) = cov(value_list);

% pause(0.5)
end

theta_line(i_star:i_end) = theta_list;
end