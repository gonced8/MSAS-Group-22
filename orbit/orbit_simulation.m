clear
close all

addContainingDirAndSubDir
data_orbit;

speed = 100000;
animate = false;

X0 = [data.orbit.a0; data.orbit.e0; data.orbit.i0; data.orbit.Omega0; data.orbit.w0; data.orbit.f0];
%tf = 2*ceil(4*pi/sqrt(data.orbit.u/data.orbit.a0^3));
tf = 1*24*3600;
tspan = [0, tf];
options = odeset('AbsTol', 1e-8, 'RelTol', 1e-6);

if animate
   options = odeset(options, 'MaxStep', speed);
end

collision = true;
if collision
   options = odeset(options, 'Events', @orbit_stop); 
end

tic;
disp('Simulation started');
[t, X] = ode113(@orbit, tspan, X0, options, 0, data.orbit);
disp('Simulation ended');
toc

% tic;
% disp('Calculating parameters');
% [~, parout] = orbit(0, X0, 0, data.orbit);
% parout = zeros(length(t), length(parout));
% for k = 1:length(t)
%     [~, parout(k, :)] = orbit(t(k), X(k, :), 0, data.orbit);
% end
% toc
% disp('Calculation finished');

a = X(:, 1);
e = X(:, 2);
i = X(:, 3);
Omega = X(:, 4);
w = X(:, 5);
f = X(:, 6);

% H = parout(:, 4);
% R = parout(:, 6:8);

figure;
plot(t, w);
title('w');

figure;
plot(t, Omega);
title('Omega');

figure;
plot(t, i);
title('i');
% 
% figure;
% plot(t, R(:, 1), t, R(:, 2), t, R(:, 3));
% title('R');
% legend('Rx', 'Ry', 'Rz');
% 
% figure;
% plot(t, H);
% title('H');

figure;
plot(t, e);
title('e');

if animate
    d = @(x, y, z) sqrt(x.^2+y.^2+z.^2);        % distance to center

    T = zeros(3, length(t));
    for i = 1:length(t)
       T(:, i) = get_R(X(i, :)); 
    end
    dT = d(T(1,:).', T(2,:).', T(3,:).');

    [Ex, Ey, Ez] = ellipsoid(0, 0, 0, data.orbit.Ra, data.orbit.Ra, data.orbit.Rb);  % Earth Surface
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
        s = 1.2*max([data.orbit.Ra, max(dR), max(dT(1:i))]);
        axis([-s s -s s -s s]);

        % Pause frame
        pause(dt(i)/speed);

        if ~ishghandle(fig)     % check if window was closed
            break
        end 
    end
end
