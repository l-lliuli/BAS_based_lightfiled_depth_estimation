function [k] = user_define(ind,dp)
% % ind һ����ָx�������,dp һ����y�������
% if length(ind)~= length(dp)
%     disp('���鳤�Ȳ��ȣ����飡');       % Ҫ�� x,y һһ��Ӧ
% end
% ��С���˷���ϵ�����ã��ο���ѧģ��
    a = ind*ind';
    b = sum(ind);
    c = ind * dp';
    d = sum(dp);
% ���б��k
k = (length(ind).*c-b*d)./(length(ind).*a-b*b);
% ���ؾ�t
% t = (a.*d-c.*b)/(a*length(ind)-b.*b);
end
