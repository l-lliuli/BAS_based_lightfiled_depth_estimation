% data = [1,2,3,4,5,6,7,8,9,12,13,14,15,16,17];
function index= RunSac(data)
x = 1:15;
deta_data = data-data(8);
deta_x = x-x(8);
k = deta_data./deta_x;
Norm = sqrt(k.*k+1);

distant =( -k./Norm)'*deta_x + (1./Norm)' *deta_data;
distant = abs(distant);
distant(8,:) = 0;
distant(distant > 0.4) = 0  ;  % ɸѡ�ڵ㣬������ֵ�ĵ������㣬���ڽ������Եĺ���������ÿһ�����ݶ����㣬���Զ���ȫ�����
% ��������ж�
extr = sum(distant,2);
extr = extr > 0.00001    ;    % ����ֵ�߼��ж�

a = sum(distant,2)./sum(distant~=0,2);
a(~extr) = 0;
a(8) = 0;
index = a<mean(a);
index = index & extr;
index(8) = 1;
index = index';

end



