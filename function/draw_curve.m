function draw_curve( data )
%DRAW_CURVE 此处显示有关此函数的摘要
%   此处显示详细说明
x = linspace(0,45,100);
y = linspace(0,2,100);
% 该函数用于对一些以为信号的画图，输入为一维度的列表数据，然后可以在内部进行相关参数的控制
% Min = min(data);
% Max = max(data);
% L = length(data);

 scatter(x,y,'.','linewidth',2);
 axis([0,45,0,2]);
 
 
set(gca,'XTick',0:5:45) %x轴范围1-6，间隔1
set(gca,'YTick',0:0.5:2) %x轴范围1-6，间隔1
set(gca,'linewidth',1,'fontsize',20,'fontname','Times');
grid on
xlabel('\theta','Fontname','Times','Fontsize',25)  %x轴坐标描述
ylabel('E','Fontname','Times','Fontsize',25) %y轴坐标描述

end

