b = zeros(434,625);
for i = 1+4:434-4
    for j = 1+4:625-4
        dong = phase(i,j:j+4);
        dong = sum(abs(diff(dong)
        xi = sum(abs(diff(xi)));));
        xi = phase(i,j-4:j);
        nan = phase(i:i+4,j);
        nan = sum(abs(diff(nan)));
        bei = phase(i-4:i,j);
        bei = sum(abs(diff(bei)));
        a =min (min(min(dong,nan),xi),bei);
        
        b(i,j) = a;
    end
end