function newOut = getFinalStatus(out)
% Copyright 2020 The MathWorks, Inc.
newOut = out;
newOut.notImpacted = 100*sum(out.yout{2}.Values.Data(end,:)==0)/50;
newOut.recovered = 100*sum(out.yout{2}.Values.Data(end,:)==2)/50;
