% L  =length(List);
L = 51;
x=1:1:L;%x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止

x1 = EPI(1,100:150);
x2 = EPI(3,100:150);
x3 = EPI(5,100:150);



 plot(x,x1,'-b','linewidth',2); hold on;
  plot(x,x2,'-r','linewidth',2)
   plot(x,x3,'-g','linewidth',2)
 %线性，颜色，标记
axis([0,L,-pi,pi])  %确定x轴与y轴框图大小
set(gca,'XTick',0:5:L) %x轴范围1-6，间隔1
set(gca,'linewidth',1,'fontsize',15,'fontname','Times');
grid on
% set(gca,'YTick',[0:90]) %y轴范围0-700，间隔100
% legend('Cost-num');   %右上角标注
xlabel('s','Fontname','Times','Fontsize',20)  %x轴坐标描述
ylabel('\phi','Fontname','Times','Fontsize',20) %y轴坐标描述
% axis image
legend('u=-1','u=0','u=1')

% 
%  EPI = funtion_to_generate_EPIMAP( phase_3D ,384 );
 