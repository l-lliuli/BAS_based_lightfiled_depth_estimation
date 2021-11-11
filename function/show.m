function [ out_image ] = show( img ,Min,Max)
%SHOW 此处显示有关此函数的摘要
%   此处显示详细说明
% Max = max(max(img));
% Max =231;
% Min =  min(min(img));
%  Min = 171;
out_image = 255/(Max-Min)*(img-Min);
out_image =uint8(out_image);
imshow(out_image,[0,255])

end



