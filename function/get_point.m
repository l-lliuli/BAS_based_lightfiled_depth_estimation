function [ list] = get_point( x1,y1,x2,y2 )
%GET_POINT �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
x= floor(linspace(x1,x2,50));
y =floor(linspace(y1,y2,50));

juedui = y + (x-1) *15;
list = unique(juedui);




end

