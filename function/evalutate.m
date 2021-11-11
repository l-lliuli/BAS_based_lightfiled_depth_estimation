function [y1 , y2 ] = evalutate(thetaset)
image = squeeze(thetaset(7,:,:));
image = image;
mask = 1/9*ones(3,3);
fil1 = imfilter(image,mask);

fil2 = imfilter(fil1,mask);

y1 = (233-171)/(366-260)*(fil1-260)   +171;
  
y2 = (233-171)/(366-260)*(fil2-260)   +171;
% evamap1 = y1(100:960-100,100:1280-100);
% evamap2 = y2(100:960-100,100:1280-100);
% depth = rgb2gray(imread('depthH.bmp'));
% evadepth = depth(100:960-100,100:1280-100);
% [h,w] =size(evamap1);
% scoremap1 = abs(evamap1-evadepth)./evadepth;
% scoremap2 = abs(evamap2-evadepth)./evadepth;
% score1 = sum(sum(scoremap1))/(h*w);
% score2 = sum(sum(scoremap2))/(h*w);
% subplot(1,2,1)
%  imshow(y2,[171,233])
%  title('立体匹配结果，RSME/perpix  =  0.0081,max = 0.2860')
%  subplot(1,2,2)
%  imshow(depth,[171,233])
%  title('深度真值')
%  max_RSME = max(max(scoremap2));
end


