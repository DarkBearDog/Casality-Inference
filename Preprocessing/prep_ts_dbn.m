function ts = prep_ts_dbn(ts,dscNum, charStep, charFun)

% discrete and characterize the t.s.
% dscNum is the number of cardinality of domain as discrete variable
% charStep and charFun is the step and function of characterization
% if you do not need to characterize, set both para to 1

if charStep == charFun == 1
    ts = dsc_ts (ts, dscNum);
else
    ts = char_ts(ts, charFun, charStep);
    ts = dsc_ts (ts, dscNum);
end