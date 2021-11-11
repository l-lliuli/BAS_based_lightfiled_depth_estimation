function depth =stero_(EPI,i,L)
%给出一张EPI，输出一张视差图
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
    % 这样就生成了搜索的开始点和末位点
    stero_list = line_stero(stero_begin:-1:stero_end);
    deta_stero = abs(stero_list - center_value);
    [~ , index ] = min(deta_stero);
%     depth(j) = atand((8-i)/index);
%     depth(j) = index;
%      depth(j ) = (8-i)/index;
      depth(j ) = i/index;
    
    
    
end

end