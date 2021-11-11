function a = myBF(raw_map,Min,Max)



min = Min;
max = Max;
% Image_normalized = Normalized(raw_map,140,120);
Image_normalized = Normalized(raw_map,max,min);
w = 3;      %窗口大小
sigma = [3 0.1];    %方差
Image_bf = bfilter2(Image_normalized,w,sigma);
% phase_3D_new(i,:,:) = Image_bf;
% 
% imshow(Image_bf,[])
% Image_bf =medfilt2(Image_bf,[3,3]);



a = (max-min)*Image_bf +min;
a = medfilt2(a ,[3,3]);

end