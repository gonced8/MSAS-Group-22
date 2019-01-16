% This script should be used to run the program. If you want to run a
% particular script separately, first run the file
% "addContainingDirAndSubDir.m", in order to add all the necessary paths.

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