function out = runSim(R_in, Vmax_in, serverTime_in)
%
% typical parameter values:
% R = 0.02;   % Radius of the balls
% Vmax = 0.3; % Maximum iniital velocity of balls
% serverTime = 22; % Time to heal
%
% % Copyright 2020 The MathWorks, Inc.

mdl = 'propagationSimulator';
modelData;  % load default model workspace

% override with inputs
R = R_in;
Vmax = Vmax_in;
serverTime = serverTime_in;

clear x0 v0
cnt = 0;
for i = 1:N1
    for j = 1:N2
        cnt = cnt+1;
        x0(cnt,:) = [ 0.9*X(i)+maxSpacingRatio*R*getRand 0.9*Y(j)+maxSpacingRatio*R*getRand]; %#ok<AGROW>
        v0(cnt,:) = [getRand*Vmax getRand*Vmax ]; %#ok<AGROW>
    end
end

in = Simulink.SimulationInput(mdl);
in = in.setVariable('R',R);
in = in.setVariable('v0',v0);
in = in.setVariable('x0',x0);
in = in.setVariable('serverTime',serverTime);

% Convenient to run in rapid accelerator mode with uptodate to check off
in = simulink.compiler.configureForDeployment(in);
% 
out = sim(in);



