function img = cutImg(img,x1,x2,y1,y2)

X1 = min(x1,x2);
X2 = max(x1,x2);
Y1 =min(y1,y2);
Y2 = max(y1,y2);


dim = length(size(img));
if dim ==2
    img = img(x1:x2,y1:y2);
else
       img = img(x1:x2,y1:y2,:);
    
end
end