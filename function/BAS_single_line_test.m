function theta_line = BAS_single_line_test(EPI)

[~,w] = size(EPI);
theta_line = zeros(1,w);

for i = 1:w

step = 89;
deta = 30;
x =90;
for j = 1:30

    
x_r  = x + step;
x_l  = x - step;

x = x + deta*sign(fitness(EPI,i,x_l) - fitness(EPI,i,x_r));
% list = [list,x];
deta = 0.8*deta;
step = step*0.85;


end
% list = [list,x];

theta_line(i) = x;
end

end