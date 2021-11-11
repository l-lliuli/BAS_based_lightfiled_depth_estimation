function phi = phi_wr_test2(name1,name2,name3) %function phi = phi_wr_test2(ImgNames, range)  
name1 = imread(name1) ; 
I1 = double(name1);    
I1 = I1(:,:,min(2,size(I1,3)));    % I1 = I1(range(1):range(3),range(2):range(4));
  % 如果图片是灰度的话就直接取原图，如果图片是彩色图片的话就取绿色通道的哪一个
  name2 = imread(name2) ; 
  I2 = double(name2);     
I2 = I2(:,:,min(2,size(I2,3)));    % I2 = I2(range(1):range(3),range(2):range(4));
  name3 = imread(name3) ;
  I3 = double(name3);    
 I3 = I3(:,:,min(2,size(I3,3)));    % I3 = I3(range(1):range(3),range(2):range(4));
phi = atan2(double(sqrt(3)*(I1-I3)),double(2*I2-I1-I3+0.0000001));