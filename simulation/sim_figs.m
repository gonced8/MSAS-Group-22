%%%% Orbit plots %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
subplot(2, 2, 1);
plot(t/3600, H);
title('Altitude of the spacecraft');
xlabel('t [h]');
ylabel('H [km]');
grid;
subplot(2, 2, 2);
plot(t/3600, w);
title('Argument of periapsis');
xlabel('t [h]');
ylabel('\omega [rad]');
grid;
subplot(2, 2, 3);
plot(t/3600, a);
title('Orbital semi-major axis');
xlabel('t [h]');
ylabel('a [km]');
grid;
subplot(2, 2, 4);
plot(t/3600, e);
title('Orbital eccentricity');
xlabel('t [h]');
ylabel('e');
grid;
%saveas(gcf, 'figs/orbit', 'epsc');


%%%% Accelerometer plots %%%%%%%%%%%%%%%%%%%%%%%%%%%
f_el = (a1 + a2)*data.accel.m; 
ts = find(t>400, 1);

figure;
subplot(4, 2, 1);
plot(t(1:ts), T(1:ts), t(1:ts), D(1:ts));
title('Zoom - Forces acting on the spacecraft');
xlabel('t [s]');
ylabel('Force [N]');
legend('Thrust','Drag', 'location', 'southeast');
grid;
subplot(4, 2, 2);
plot(t(ts:end)/3600, T(ts:end), t(ts:end)/3600, D(ts:end));
title('Forces acting on the spacecraft');
xlabel('t [h]');
ylabel('Force [N]');
legend('Thrust','Drag');
grid;
subplot(4, 2, 3);
plot(t(1:ts), f_el(1:ts));
title('Zoom - Elec. force acting on the seismic mass');
xlabel('t [s]');
ylabel('Force [N]');
grid;
subplot(4, 2, 4);
plot(t(ts:end)/3600, f_el(ts:end));
title('Elec. force acting on the seismic mass');
xlabel('t [h]');
ylabel('Force [N]');
grid;
subplot(4, 2, 5);
plot(t(1:ts), Vout(1:ts));
title('Zoom - Output voltage of the accel subsystem');
xlabel('t [s]');
ylabel('V_{out} [V]');
grid;
subplot(4, 2, 6);
plot(t(ts:end)/3600, Vout(ts:end));
title('Output voltage of the accel subsystem');
xlabel('t [h]');
ylabel('V_{out} [V]');
grid;
subplot(4, 2, 7);
plot(t(1:ts), x_acc(1:ts));
title('Zoom - Position of the seismic mass');
xlabel('t [s]');
ylabel('x_a [m]');
grid;
subplot(4, 2, 8);
plot(t(ts:end)/3600, x_acc(ts:end));
title('Position of the seismic mass');
xlabel('t [h]');
ylabel('x_a [m]');
grid;


%%%% Flow control valve plots %%%%%%%%%%%%%%%%%%%%%%%%%%%
ts = find(t>300, 1);
figure;
subplot(1,2,1);
plot(t(1:ts), x_fcv(1:ts));
title('Zoom - Position of the FCV spool');
xlabel('t [s]');
ylabel('x_{fcv} [m]');
grid;

subplot(1,2,2);
plot(t(ts:end)/3600, x_fcv(ts:end));
title('Position of the FCV spool');
xlabel('t [h]');
ylabel('x_{fcv} [m]');
grid;


