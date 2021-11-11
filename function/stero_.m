function depth =stero_(EPI,i,L)
%����һ��EPI�����һ���Ӳ�ͼ
[~,width] = size(EPI);
line_center = EPI(8,:);
line_stero = EPI(8+i,:);
depth = zeros(1,width);
for j = 1:width
    center_value = line_center(j);
    stero_begin = j;
    if stero_begin-L <= 0
        stero_end  = 1;
    else
        stero_end = stero_begin -L;
    end
    % �����������������Ŀ�ʼ���ĩλ��
    stero_list = line_stero(stero_begin:-1:stero_end);
    deta_stero = abs(stero_list - center_value);
    [~ , index ] = min(deta_stero);
%     depth(j) = atand((8-i)/index);
%     depth(j) = index;
%      depth(j ) = (8-i)/index;
      depth(j ) = i/index;
    
    
    
end

end