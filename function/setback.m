function img = setback( img,mask )
%SETBACK 此处显示有关此函数的摘要
%   此处显示详细说明
%%对一张图片的mask部分全部设置为黑色
dim = length(size(img));
if dim ==2
    img(mask) =0;
else
    temp = img;
    r = img(:,:,1);
   g = img(:,:,2);
    b = img(:,:,3);
    r(mask) = 0;
      g(mask) = 0;
        b(mask) = 0;
        temp(:,:,1) = r;
        temp(:,:,2) = g;
        temp(:,:,3) = b;
        img = temp;
    
end
end

