function [k] = user_define(ind,dp)
% % ind 一般是指x轴的数据,dp 一般是y轴的数据
% if length(ind)~= length(dp)
%     disp('数组长度不等，请检查！');       % 要求 x,y 一一对应
% end
% 最小二乘法的系数设置，参考数学模型
    a = ind*ind';
    b = sum(ind);
    c = ind * dp';
    d = sum(dp);
% 求解斜率k
k = (length(ind).*c-b*d)./(length(ind).*a-b*b);
% 求解截距t
% t = (a.*d-c.*b)/(a*length(ind)-b.*b);
end
