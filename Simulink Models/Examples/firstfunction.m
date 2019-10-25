function [max_val,max_loc] = firstfunction(v)
n = length(v);
max_val = -inf;
for ii = 1:n
    if v(ii) > max_val
        max_val = v(ii);
        max_loc = ii;
    end
end