function [num, folder ] = savefile(  )
%SAVEFILE ��⵱ǰ�ļ����µ�reslut�ļ����µ����ļ��� ��û����־�ļ���û�еĻ��ʹ���һ��
%   ���⣬�������ļ��������ж����ļ�
today = date;
today = [today(4:6)  '_'  today(1:2) '_'  today(8:11)];
folder=['./result/'  today '/']; %%�������

files = dir([folder   '*.bmp']);%�Ҹ�ʽΪtif���ļ�
[path,'*.tif'];
class_num = size(files);
num = class_num(1);


if exist(folder)==0 %%�ж��ļ����Ƿ����

    mkdir(folder);  %%������ʱ�򣬴����ļ���

else

    disp('dir is exist'); %%����ļ��д��ڣ����:dir is exist

end


end

