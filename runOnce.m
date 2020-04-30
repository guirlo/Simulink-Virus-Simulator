R = 0.02;   % Agents radius, synonim to how infectious they are
Vmax = 0.3; % Agents maximum initial velocity, synonim to how much they respect social distancing
serverTime = 22;    % How long agents remain infected before becoming immune

out = runSim(R,Vmax,serverTime);
animateSim(R,out);

% Copyright 2020 The MathWorks, Inc.
