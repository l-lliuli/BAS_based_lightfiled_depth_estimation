function linear = measu(list)
a = diff(list);
b  =  cov(a);
if b > 0.2
    linear = 1;
else
    linear = 0;
end

end