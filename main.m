% André Oliveira, Ernest Constantine, Gonçalo Raposo
%
% This script should be used to run the program.

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
off_nominal;


%% Optimization (about 13 min)
optimization;