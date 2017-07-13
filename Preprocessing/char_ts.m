function charSeq = char_ts(ts, charFun, step)

% characterize the t.s
% quickly select charFun: 1 for mean, 2 for var, 3 for std

[a,b] = size(ts);
if (a>b)
    ts = ts';
end

if isa(charFun,'double')
    if charFun == 1
        charFun = @(x) mean(x);
    elseif charFun == 2
        charFun = @(x) var(x);
    elseif charFun == 3
        charFun = @(x) std(x);
    end
end

length = max(a,b);
new_length = ceil(length/step);

charSeq = zeros(1,new_length);
for i = 1:new_length-1
    charSeq(i) = charFun(ts(step*(i-1)+1:step*i));
end
charSeq(new_length) = charFun(ts(step*(new_length-1)+1:length));

end