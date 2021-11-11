function depth =stero(EPI,i,L)
%����һ��EPI�����һ���Ӳ�ͼ
[~,width] = size(EPI);
line_center = EPI(15,:); % ��
line_stero = EPI(i,:);
depth = zeros(1,width);
for j = 1:width-1
    center_value = line_center(j);
    stero_begin = j;
    if stero_begin+ L>width-1
        stero_end  = width;
    else
        stero_end = stero_begin +L;
    end
    % �����������������Ŀ�ʼ���ĩλ��
    raw_list = line_stero(stero_begin:stero_end);
    stero_list  = interp1(stero_begin:stero_end,raw_list,stero_begin:0.1:stero_end);
    deta_stero = abs(stero_list - center_value);%����ֻ������������ֵ�Ż�����û��
    [a , index ] = min(deta_stero);% �ۺ��������Ż�����ֵ��ӽ��Ż������ǿ��Եó�һ�������Ľ���
%     depth(j) = atand((8-i)/index);
%     index = (index - 1) * 0.5 + stero_begin;
%        depth(j) = index/(8-i);
       depth(j ) = index;
    
    
    
end

end