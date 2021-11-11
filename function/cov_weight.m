function cost = cov_weight(list)

% weight = [ 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 ];
h = [0    0    1   1   1  1   1   1   1  1  1   1    1    0   0];
% weight = weight.*h;
AVE = list(8);
cost = h .* ((list-AVE).^2)/15;
cost  = sum(cost);
% list(~weight) = [];
% cost = cov(list);
% cost = cov(list(3:13));

end