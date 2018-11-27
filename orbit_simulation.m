clear
close all

speed = 10000;

par.Ra = 6378.16;           % [km]
par.Rb = 6356.778;          % [km]
par.R = (par.Ra+par.Rb)/2;  % [km]
par.u = 3.986e5;            % [km^3/s^2]
par.tol = 1e-6;             % tolerance in altitude determination newton method
par.m = 300;                % [kg]
par.A = 1.1;                % [m^2]
par.B = 300;                % ballistic coefficient
par.Cd = par.m/(par.A*par.B);   % Drag coefficient
par.J2 = 0.00108263;        

h0 = 254.9;                 % [km]

a0 = par.R+h0;              
e0 = 0.0045;                % Singularity for e=0
i0 = deg2rad(90);           % [rad] Singularity for i=0
Omega0 = 0;
w0 = 0;
f0 = 0;                     % body starts at periapsis

X0 = [a0; e0; i0; Omega0; w0; f0];
tf = 2*ceil(2*pi/sqrt(par.u/a0^3));
tspan = [0, tf];
options = odeset('AbsTol', 1e-9, 'RelTol', 1e-6, 'MaxStep', speed);

collision = true;
if collision
   options = odeset(options, 'Events', @orbit_stop); 
end

tic;
disp('Simulation started');
[t, X] = ode113(@orbit, tspan, X0, options, par);
disp('Simulation ended');
toc

d = @(x, y, z) sqrt(x.^2+y.^2+z.^2);        % distance to center

T = zeros(3, length(t));
for i = 1:length(t)
   T(:, i) = get_R(X(i, :)); 
end
dT = d(T(1,:).', T(2,:).', T(3,:).');

[Ex, Ey, Ez] = ellipsoid(0, 0, 0, par.Ra, par.Ra, par.Rb);  % Earth Surface
dE = d(Ex, Ey, Ez);

dt = diff(t);
dt = [dt; 0];

fig = figure();
ax = axes();
hold(ax, 'on');
grid on;
xlabel('x [km]');
ylabel('y [km]');
zlabel('z [km]');
% colormap winter;
c = colorbar();
c.Label.String = 'd [km]';
view(3);

for i = 1:length(dt)
    cla(ax);
    delete(findall(fig,'type','annotation'));
    
    % Earth
    surf(ax, Ex, Ey, Ez, dE);
    
    % Orbit
    R = get_orbit_3d(X(i, :), []);
    dR = d(R(1,:), R(2,:), R(3,:));
    patch(ax, R(1,:), R(2,:), R(3,:), dR, ...
          'FaceColor', 'none', 'EdgeColor', 'interp', 'LineWidth', 1, 'LineStyle', '--');
      
    % Trajectory
    patch(ax, [T(1, 1:i) nan], [T(2, 1:i) nan], [T(3, 1:i) nan], [dT(1:i); nan], ...
          'FaceColor', 'none', 'EdgeColor', 'interp', 'LineWidth', 2);
    
    % Body
    plot3(ax, T(1, i), T(2, i), T(3, i), '.r', 'MarkerSize', 20);
    
    % Time
    annotation('textbox',[0.8 0.8 .2 .2],'String',sprintf('t = %d [s]', t(i)), 'FitBoxToText','on');    
    
    % Axis
    s = 1.2*max([par.Ra, max(dR), max(dT(1:i))]);
    axis([-s s -s s -s s]);
    
    % Pause frame
    pause(dt(i)/speed);
    
    if ~ishghandle(fig)     % check if window was closed
        break
    end 
end
