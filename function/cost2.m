function list_l = cost2(list)
l = length(list);
list_l = zeros(1,l);
for i = 1:l
    list_l(i) = measu(list(1:i));
end
end