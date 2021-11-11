function result = cocu(map_set)
% lizi = squeeze(map_set(1,:,:));
[num , height , width] = size(map_set);
thetasum = zeros(height,width);

for s =1:num
    thetasum = squeeze(map_set(s,:,:))+thetasum;
end
result = thetasum./num;

W = fspecial('gaussian',[7,7],3); 
G = imfilter(result, W, 'replicate');
Max = max(max(result));
Min = min(min(result));
imshow(result',[])
title('立体匹配结果')