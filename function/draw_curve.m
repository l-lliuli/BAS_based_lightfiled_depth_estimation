function draw_curve( data )
%DRAW_CURVE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
x = linspace(0,45,100);
y = linspace(0,2,100);
% �ú������ڶ�һЩ��Ϊ�źŵĻ�ͼ������Ϊһά�ȵ��б����ݣ�Ȼ��������ڲ�������ز����Ŀ���
% Min = min(data);
% Max = max(data);
% L = length(data);

 scatter(x,y,'.','linewidth',2);
 axis([0,45,0,2]);
 
 
set(gca,'XTick',0:5:45) %x�᷶Χ1-6�����1
set(gca,'YTick',0:0.5:2) %x�᷶Χ1-6�����1
set(gca,'linewidth',1,'fontsize',20,'fontname','Times');
grid on
xlabel('\theta','Fontname','Times','Fontsize',25)  %x����������
ylabel('E','Fontname','Times','Fontsize',25) %y����������

end

