%%  �ú���������ʱһ�����������ļ���pattern1 pattern2 pattern3 �Ĵ��ļ��� ������Ҳ��֪���ļ��������ж�����ͼƬ
%  �����������15�ź�225�ţ������15�ţ���ô����15��ͼƬ���������λ������������225�ţ���ô��
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

