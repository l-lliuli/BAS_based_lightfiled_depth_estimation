% debug a invalid point of an EPI;

phase_3D = squeeze(phase_4D(8,:,:,:));
raw_map = squeeze(phase_4D(8,8,:,:));
imshow(raw_map,[])
% raw = 372 ; 
% col = 365;
[x, y] = ginput();
% x = 300;
% y = 386
x = uint16(x);   y = uint16(y);
EPI  = funtion_to_generate_EPIMAP(phase_3D,y);
 % 首先看一下代价曲线是什么样子的

 

[ theta,show] = single_point_test(EPI,x);
%  fprintf(['遍历算法算出来的结果为',num2str(theta),'\n'])
%  pause(0.1)
%  figure;imshow(raw_map,[45,80]);
%  a = gradient_single_point(EPI,col,60);
%  fprintf(['优化算法算出来的结果为',num2str(a),'\n'])
theta_star =30;
theta_step = 0.1 ;
theta_end = 150;
 theta = theta_star:theta_step:theta_end;