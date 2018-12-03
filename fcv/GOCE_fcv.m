clc, clear, close all

data.fcv;

% parameters

pars = [data.fcv.kp,data.fcv.ki,data.fcv.m,data.fcv.Ki,...
    data.fcv.c,data.fcv.K,data.fcv.F0,data.fcv.d];
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