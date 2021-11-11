function [ depth ] = gradient_EPI( EPI , deta ,mask)
%GRADIENT_EPI 此处显示有关此函数的摘要
%   此处显示详细说明
% 首先生产
% 首先用一维高斯核对EPI进行低通滤波，去除噪声或者其中的高频成分
% 然后对其求梯度
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

