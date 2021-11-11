% 该文件用于剪切EPI、
function  result = shear_EPI(deta,a)
% deta = 0.3 ;  % 单位为像素值
% 向左平移1.5个像素点分成两步，后面的部分需要用到线性插值
deta_int = floor(deta);
deta_float = deta-floor(deta);
% a = [1,2,3,4,5];
L = length(a);
a = circshift(a',-deta_int)';
xishu_matrix = [zeros(1,L);deta_float*diag(ones(1,L))] + [(1-deta_float)*diag(ones(1,L));zeros(1,L)];
raw_matrix = [a,a(:,1)];
raw_matrix = double(raw_matrix);
result = raw_matrix * xishu_matrix;


% an0s;
end
