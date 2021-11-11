
function GaussTemp = guass(r, sigma)
 
% ����һά��˹�˲�ģ��
GaussTemp = ones(1,r*2-1);
for i=1 : r*2-1
    GaussTemp(i) = exp(-(i-r)^2/(2*sigma^2))/(sigma*sqrt(2*pi));
end