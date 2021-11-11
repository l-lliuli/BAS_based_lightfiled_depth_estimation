function a = lf2sub(LF)
scale= size(LF);
dimenionl = length(scale);
if dimenionl ==4
    a = squeeze(LF(8,8,:,:));
else
    a = squeeze(LF(8,8,:,:,2));
end
imshow(a,[]);
end