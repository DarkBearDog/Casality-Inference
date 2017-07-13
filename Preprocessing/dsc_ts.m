function new_ts = dsc_ts(ts,num_slice)

% discrete the t.s.
% ts is the t.s.
% num_slice is the cardinality of domain of the discrete variable

[a,b] = size(ts);
if (a>b)
    ts = ts';
end

sup = max(ts);
inf = min(ts);
step = (sup - inf)/num_slice;

N = length(ts);
new_ts = zeros(1,N);
for i = 1:N
    class = ceil((ts(i) - inf)/step);
    if class == num_slice+1
        new_ts(i) = num_slice;
    elseif class == 0
        new_ts(i) = 1;
    else
        new_ts(i) = class;
    end
end