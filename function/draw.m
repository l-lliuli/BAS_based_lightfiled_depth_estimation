function draw(b)
[X,Y] = size(b);
% X = 434;
% Y = 625;
y=1:1:Y;
x=1:1:X;

z=b(x,y);
mesh(z);
% zlim([0 60])



