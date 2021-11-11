function weicai(img)
z=3;
[x ,y]=size(img);
imshow(img);
img=double(img);
img_cai=zeros(x,y,z);
Max=max(max(img));
Min=min(min(img));
img=(255/(Max-Min))*img-(255*Min)/(Max-Min);
figure,imshow(uint8(img));
r=1;
g=2;
b=3;

for i=1:x
    for j=1:y
        temp=(2*pi/(Max-Min))*img(i,j)-(2*pi*Min)/(Max-Min);       
       
        if temp<=pi/2
            img_cai(i,j,r)=0;
            img_cai(i,j,g)=0;
            img_cai(i,j,b)=255*(sin(temp));
        end
        
        if temp>pi/2 && temp<=pi
            img_cai(i,g,r)=0;
            img_cai(i,j,g)=255*(-cos(temp));
            img_cai(i,j,b)=255*(sin(temp));
        end
        
        if temp>pi && temp<=pi*3/2
            img_cai(i,j,r)=255*(-sin(temp));
            img_cai(i,j,g)=255*(-cos(temp));
            img_cai(i,j,b)=0;
        end
        
        if temp>pi*3/2
            img_cai(i,j,r)=255*(-sin(temp));
            img_cai(i,j,g)=0;
            img_cai(i,j,b)=0;     
        end
      
    end
end

figure,imshow(uint8(img_cai));
end