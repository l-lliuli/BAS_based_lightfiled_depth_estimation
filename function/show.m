function [ out_image ] = show( img ,Min,Max)
%SHOW �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% Max = max(max(img));
% Max =231;
% Min =  min(min(img));
%  Min = 171;
out_image = 255/(Max-Min)*(img-Min);
out_image =uint8(out_image);
imshow(out_image,[0,255])

end



