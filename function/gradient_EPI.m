function [ depth ] = gradient_EPI( EPI , deta ,mask)
%GRADIENT_EPI �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% ��������
% ������һά��˹�˶�EPI���е�ͨ�˲���ȥ�������������еĸ�Ƶ�ɷ�
% Ȼ��������ݶ�
gar_x = [1,0,-1];
gar_y = [1;0;-1];
guas = guass(13, deta);
EPI = imfilter(EPI,guas);

EPI_x = imfilter(EPI,gar_x);
EPI_x(EPI_x > pi ) = EPI_x(EPI_x > pi ) -2*pi;
EPI_x(EPI_x < -  pi ) = EPI_x(EPI_x <- pi ) +2*pi;
EPI_y = imfilter(EPI,gar_y);
EPI_y(EPI_y > pi ) = EPI_y(EPI_y > pi ) -2*pi;
EPI_y(EPI_y < -  pi ) = EPI_y(EPI_y <- pi ) +2*pi;
depth_EPI = EPI_y./EPI_x;
depth = depth_EPI(8,:);
%plot(depth_EPI(8,:));

end

