% variables needed by model "propagationSimulator"
%
% Those are default values so we can do an update diagram. A
% Smulink.SimulationInput should be used to set realistic values for meaningful simulation 

R = 0.02;   % Radius of the balls
serverTime = 22; % Time to heal

ts = 0.1;   %Sample time for logging
N1 = 10;    % Number of points in X
N2 = 5;     % Number of points in Y
L = 2;      % Length of the box in X
W = 1;      % Length of the box in Y
N = N1*N2;
X = linspace(-L/2,L/2,N1);
Y = linspace(-W/2,W/2,N2);
maxSpacingRatio = 2; % How many radius by which initial posisiton can vary

% x0 = zeros(N1*N2,2);  % all at [0 0]
x0 = [linspace(-0.8, 0.8, N)' zeros(N,1)]; % equally spread at y=0;
v0 = zeros(N1*N2,2);


% Make one initial infected agent
% States definition are:
% 0 = never got infected
% 1 = contageous
% 2 = recovered/immune
state0id = 5;
state0 = zeros(N,1);
state0(state0id) = 1;