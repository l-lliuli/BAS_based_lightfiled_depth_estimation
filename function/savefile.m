function [num, folder ] = savefile(  )
%SAVEFILE 检测当前文件夹下的reslut文件夹下的子文件夹 有没有日志文件，没有的话就创建一个
%   另外，检测这个文件夹里面有多少文件
today = date;
today = [today(4:6)  '_'  today(1:2) '_'  today(8:11)];
folder=['./result/'  today '/']; %%定义变量

files = dir([folder   '*.bmp']);%找格式为tif的文件
[path,'*.tif'];
class_num = size(files);
num = class_num(1);


if exist(folder)==0 %%判断文件夹是否存在

    mkdir(folder);  %%不存在时候，创建文件夹

else

    disp('dir is exist'); %%如果文件夹存在，输出:dir is exist

end


end

