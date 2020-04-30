function out = runSpeedStudy()

mdl = 'propagationSimulator';
load_system(mdl);
mdlWs = get_param(mdl,'ModelWorkspace');  % get model workspace file
run(mdlWs.FileName);   % run it

Nsim = 250; % number of simulation
in(1:Nsim) = Simulink.SimulationInput(mdl);%initialize array of simulation input objects
for i_sim = 1:Nsim
    Vmax = rand*0.3;    % random initial velocity
    cnt = 0; x0 = zeros(N1*N2,2); v0 = zeros(N1*N2,2);
    for i = 1:N1
        for j = 1:N2
            cnt = cnt+1;
            x0(cnt,:) = [ 0.9*X(i)+maxSpacingRatio*R*getRand 0.9*Y(j)+maxSpacingRatio*R*getRand];  
            v0(cnt,:) = [getRand*Vmax getRand*Vmax ];  
        end
    end
    in(i_sim) = in(i_sim).setVariable('Vmax',Vmax/0.3);
    in(i_sim) = in(i_sim).setVariable('v0',v0);
    in(i_sim) = in(i_sim).setVariable('x0',x0);

    % PostSimFcn to prepare the data to be displayed in the Simulation Manager
    in(i_sim) = in(i_sim).setPostSimFcn(@(x) getFinalStatus(x));
    % Useful to get the rapid accelerator and uptoDateCheckOff
    in(i_sim) = simulink.compiler.configureForDeployment(in((i_sim)));
end

% Loading a pre-configured session of the Simulation Manager
open SimManagerSession.mldatx
enableSimManagerWindowReuse;

out = parsim(in,'ShowSimulationManager','on');

% % If you prefer to run in background
% out = parsim(in,'ShowSimulationManager','on','RunInBackground','on');

% Copyright 2020 The MathWorks, Inc.
