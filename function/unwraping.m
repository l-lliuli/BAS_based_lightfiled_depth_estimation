%%  该函数的输入时一个含有三个文件夹pattern1 pattern2 pattern3 的大文件夹 ，我们也不知道文件夹里面有多少张图片
%  有两种情况，15张和225张，如果是15张，那么把这15张图片解包裹的相位求出来，如果是225张，那么把
function [phi_3D,phi_3D_2] = unwraping(pathname,para)
% pathname = 'shui_960';
if para  ==1
    head = 'c_';
else
    head = 'c';
end
lizi = imread([ './data/' pathname '/pattern1/' head  '10000.bmp']);
[height, width,~] = size(lizi);
phi_3D = zeros(15,height,width);
phi_3D_2 = zeros(15,width,height);

for i = 1:15
    pattern1_path =[ './data/' pathname '/pattern1/'  head   mat2str(i) '0000.bmp'];
%     pattern1 = imread(pattern1_path);
    pattern2_path =[ './data/' pathname '/pattern2/'  head  mat2str(i) '0000.bmp'];
%     pattern2 = imread(pattern2_path)
    pattern3_path =[ './data/' pathname '/pattern3/'  head  mat2str(i) '0000.bmp'];
%     pattern3 = imread(pattern3_path);
    phi = phi_wr_test2(pattern1_path,pattern2_path,pattern3_path);
    phi_3D(i,:,:) = phi;
    phi_3D_2(i,:,:) = phi';

end
EPI =zeros(15,width);
imshow(phi,[-pi,pi])
for i = 1:15
    
    image = squeeze(phi_3D(i,:,:));
    imshow(image,[-pi,pi]);
    pause(0.5)
%     subplot(2,1,2);
%     plot(image(217,:));
EPI(i,:) = image(1,:);
%     pause(1);
end
% imshow(EPI,[-pi,pi]);
end

