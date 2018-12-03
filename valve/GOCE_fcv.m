clc, clear, close all

%%%%%%%%%%%%%%%%%%%%%%%%%%% FCV DATA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data_fcv.A = 1e-5;   % m^2
data_fcv.m = 0.2;    % kg
data_fcv.Ki = 0.2;   % N/A
data_fcv.k_pv = 62500;   %
data_fcv.k_iv = 20000;   %
data_fcv.K = 7e3;    % N/m
data_fcv.c = 2;      % Ns/m
data_fcv.F0 = 10;    % N
data_fcv.d = sqrt(4*data_fcv.A/pi);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% parameters

pars = [data_fcv.k_pv,data_fcv.k_iv,data_fcv.m,data_fcv.Ki,...
    data_fcv.c,data_fcv.K,data_fcv.F0,data_fcv.d];
t = linspace(0,5000,100);

% Input
V0 = 6e-4         % volt

% Initial condition
x0 = [0,0,0]
% Integration
tic
options = odeset('Reltol',2.5e-4,'AbsTol',2.5e-5,'OutputFcn',@odeplot,'Stats','on');
[tt,ff] = ode113(@fcv,[t(1) t(end)],x0,options,pars,V0);
time=toc
figure
plot (tt,ff(:,2))
figure
plot (tt,ff(:,3))