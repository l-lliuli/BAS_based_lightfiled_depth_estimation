% ���ļ����ڼ���EPI��
function  result = shear_EPI(deta,a)
% deta = 0.3 ;  % ��λΪ����ֵ
% ����ƽ��1.5�����ص�ֳ�����������Ĳ�����Ҫ�õ����Բ�ֵ
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
