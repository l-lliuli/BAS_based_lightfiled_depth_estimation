function [ fi ] = get_fi1_fi2( x1,x2,EPI ,i)
%   GET_FI1_FI2 �˴���ʾ�йش˺�����ժҪ
%   ���x1��x2֮��Ĳ�����ĸ�������ô����Щ���������ֱ����ϣ�����ϵ����������x1 ��x2����Ӧ����λ
%   �ڽ���ֱ�����֮ǰ������Ҫ��ֱ�߾ֲ������磬����˵�ֲ�չ��
%   ��ô�����˼·�ǣ����Ƕ���ÿһ���ӵ㶼�������һ��fi1��fi2��������е������fi1 ��fi2���أ����ǿ��Եõ��ֲ��������λֱ��ͼ
%  ǰ���� x1  < x2;
X1 = ceil(x1 - 0.5)+0.5;
X2 = floor(x2 - 0.5)+0.5;
a = [floor(X1):floor(X2)] +0.5;
% �ҳ�������һЩ�����ĵ�
sample_point = ceil(a);    % ע��sample_point�Ǻ������ֵ
index = (sample_point-1)*15+i;   % index �Ǿ��Ե�����ֵ
% ���оֲ������
value = EPI(index);
value(value-value(1)<-pi) = value(value-value(1)<-pi)+2*pi;
value(value-value(1)> pi) = value(value-value(1)> pi)-2*pi;
% ����ֱ�����
[k,t] = user_define(sample_point,value);
x0 = (x1+x2)/2;
fi = k*x0 + t;




end

