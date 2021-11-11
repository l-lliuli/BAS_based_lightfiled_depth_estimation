function depth = diff_gra(EPI)
mask_x = [-1, 1];
mask_y = [-1 ; 1];
x = imfilter(EPI,mask_x);
y = imfilter(EPI,mask_y);
depth_map= x./y;
depth  = abs(depth_map(8,:));
end