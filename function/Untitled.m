% L  =length(List);
L = 51;
x=1:1:L;%x���ϵ����ݣ���һ��ֵ�������ݿ�ʼ���ڶ���ֵ��������������ֵ������ֹ

x1 = EPI(1,100:150);
x2 = EPI(3,100:150);
x3 = EPI(5,100:150);



 plot(x,x1,'-b','linewidth',2); hold on;
  plot(x,x2,'-r','linewidth',2)
   plot(x,x3,'-g','linewidth',2)
 %���ԣ���ɫ�����
axis([0,L,-pi,pi])  %ȷ��x����y���ͼ��С
set(gca,'XTick',0:5:L) %x�᷶Χ1-6�����1
set(gca,'linewidth',1,'fontsize',15,'fontname','Times');
grid on
% set(gca,'YTick',[0:90]) %y�᷶Χ0-700�����100
% legend('Cost-num');   %���ϽǱ�ע
xlabel('s','Fontname','Times','Fontsize',20)  %x����������
ylabel('\phi','Fontname','Times','Fontsize',20) %y����������
% axis image
legend('u=-1','u=0','u=1')

% 
%  EPI = funtion_to_generate_EPIMAP( phase_3D ,384 );
 