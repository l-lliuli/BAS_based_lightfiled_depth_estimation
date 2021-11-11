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
distant(distant > 0.4) = 0  ;  % 筛选内点，大于阈值的点就是外点，对于近似线性的函数不能能每一个数据都是零，所以对于全零的行
% 对其进行判断
extr = sum(distant,2);
extr = extr > 0.00001    ;    % 非零值逻辑判断

a = sum(distant,2)./sum(distant~=0,2);
a(~extr) = 0;
a(8) = 0;
index = a<mean(a);
index = index & extr;
index(8) = 1;
index = index';

end



