clear
close all

% Adding all folders to the path
addContainingDirAndSubDir();


%% Linearization and eigenvalues
linearization;


%% Stability domain of ODE solver
stability_domain;


%% System response - normal conditions
simulation;


%% System response - off-nominal conditions
simulation_off;


%% Optimization
optimization;