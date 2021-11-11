function [ fi ] = get_fi1_fi2( x1,x2,EPI ,i)
%   GET_FI1_FI2 此处显示有关此函数的摘要
%   算出x1到x2之间的采样点的个数，那么对这些采样点进行直线拟合，用拟合的数据来求出x1 和x2处对应的相位
%   在进行直线拟合之前我们需要将直线局部结解包络，或者说局部展开
%   那么后面的思路是，我们对于每一个视点都可以求出一组fi1，fi2，求出所有的七组的fi1 和fi2后呢，我们可以得到局部的拟合相位直方图
%  前提是 x1  < x2;
X1 = ceil(x1 - 0.5)+0.5;
X2 = floor(x2 - 0.5)+0.5;
a = [floor(X1):floor(X2)] +0.5;
% 找出存在哪一些采样的点
sample_point = ceil(a);    % 注意sample_point是横坐标的值
index = (sample_point-1)*15+i;   % index 是绝对的索引值
% 进行局部解包裹
value = EPI(index);
value(value-value(1)<-pi) = value(value-value(1)<-pi)+2*pi;
value(value-value(1)> pi) = value(value-value(1)> pi)-2*pi;
% 进行直线拟合
[k,t] = user_define(sample_point,value);
x0 = (x1+x2)/2;
fi = k*x0 + t;




end

