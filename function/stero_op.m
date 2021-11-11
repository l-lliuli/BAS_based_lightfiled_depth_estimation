function [list ] =stero_op(EPI,i,L,num)
% 输出一ge 长度为L 的线性代价
%给出一张EPI，输出一张视差图

list =zeros(1,L);

for j = 1:L
    point = get_point(num,8,num+j-1,i);
    point_ = point-15;
    point_(point_<=0) = point(point<=0);
    deta = abs(EPI(point)-EPI(point_));
%     cost = measu(EPI(point));
%     list(j) = cost;
    plot(deta);
    axis([1,50,0,2])
   
    pause(0.5)
    
end



end