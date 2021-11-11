function [ list] = get_point( x1,y1,x2,y2 )
%GET_POINT 此处显示有关此函数的摘要
%   此处显示详细说明
x= floor(linspace(x1,x2,50));
y =floor(linspace(y1,y2,50));

juedui = y + (x-1) *15;
list = unique(juedui);




end

