function  a = cov_dif(list)

a = diff(list);
a = abs(a);
a = sum(a/length(a));

end