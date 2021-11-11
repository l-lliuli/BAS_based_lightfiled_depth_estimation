function value_list = find_valid(value_list)
center = value_list(8);

dif = abs(value_list - center);
value_list(dif>0.1*pi) = [];

end
