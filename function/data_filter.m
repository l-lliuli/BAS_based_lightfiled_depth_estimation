function [index ] = data_filter( list )
%DATA_FILTER 此处显示有关此函数的摘要
%   此处显示详细说明
thread = 0.01;
a = abs((1:15)-8); 
dif = list - list(8);
k = abs(dif./a);
k(8) = k(7);
k = abs(k-k(7));
stem(k)
index = k<=thread;


end

