function [ EPI_img_raw ] = funtion_to_generate_EPIMAP( data_3D ,select_raw )
%UNTITLED3 
%   此处显示详细说明
s = size(data_3D,1);
% height = size(data_3D,2);
width = size(data_3D,3);
%ch = size(data_5D,5);
% if ch <= 2 
%      ch = 1;
%  else
%      ch =3 ;
%  end
ch = 1;
EPI_img_row = zeros(s,width,ch);

for row = 1:s
    for ch = 1:ch
        EPI_img_row(row,:,ch) = data_3D(row,select_raw,:,ch);
    end  
end
 EPI_img_raw = EPI_img_row;
%  save('EPI_img_raw');
%  imshow(EPI_img_raw(:,:,1:ch));
%  imwrite(EPI_img_raw,'./EPI_imag_raw.jpg');
%  
end


