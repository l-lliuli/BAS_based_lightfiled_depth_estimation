
function  index = filter_runsac(data) 
stem(data);
dp = data(1:8);
ind = 1:length(dp);

[k1,t1] = user_define(ind,dp);
cost1 = norm(k1*ind+t1-dp);

dp = data(8:15);
ind = 1:length(dp);

[k2,t2] = user_define(ind,dp);
cost2 = norm(k2*ind+t2-dp);
if cost1 <cost2
    k = k1;
    t = t1;
    index = [1:8];
else
    k=k2;
    t =t2;
    index = [8:15];
end
% a =1:15;
% plot(a,k*a+t,'r-','LineWidth',2);
% hold;
% stem(1:15,data);
end