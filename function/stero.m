function depth =stero(EPI,i,L)
%给出一张EPI，输出一张视差图
[~,width] = size(EPI);
line_center = EPI(15,:); % 参
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
    % 这样就生成了搜索的开始点和末位点
    raw_list = line_stero(stero_begin:stero_end);
    stero_list  = interp1(stero_begin:stero_end,raw_list,stero_begin:0.1:stero_end);
    deta_stero = abs(stero_list - center_value);%这里只考虑了醉相似值优化，而没有
    [a , index ] = min(deta_stero);% 综合连续性优化和最值最接近优化，我们可以得出一个其他的结论
%     depth(j) = atand((8-i)/index);
%     index = (index - 1) * 0.5 + stero_begin;
%        depth(j) = index/(8-i);
       depth(j ) = index;
    
    
    
end

end