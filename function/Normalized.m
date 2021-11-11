function  y = Normalized(data,Max,Min)
data(data<Min) = Min;
data(data > Max) = Max;
X = double(data);
[h,w,c] = size(X);
out = zeros(h,w,3);

y = 1/(Max-Min)*(X-Min);
out(:,:,1) = y;
out(:,:,2) = y;
out(:,:,3) = y;


end