function img = setback( img,mask )
%SETBACK �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%%��һ��ͼƬ��mask����ȫ������Ϊ��ɫ
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

