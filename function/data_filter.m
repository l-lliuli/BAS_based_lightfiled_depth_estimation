function [index ] = data_filter( list )
%DATA_FILTER �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
thread = 0.01;
a = abs((1:15)-8); 
dif = list - list(8);
k = abs(dif./a);
k(8) = k(7);
k = abs(k-k(7));
stem(k)
index = k<=thread;


end

