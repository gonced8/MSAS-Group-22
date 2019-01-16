%%%%%%%%%%%%% States %%%%%%%%%%%%%%%%
a = X(:, 1);            % major axis
e = X(:, 2);            % eccentricity
i = X(:, 3);            % inclination
Omega = X(:, 4);        % right assenction
w = X(:, 5);            % declination
f = X(:, 6);            % true anomaly

x_acc = X(:, 7);        % position of the mass in the accelerometer
v_acc = X(:, 8);        % velocity of the mass in the accelerometer
Vout = X(:, 9);         % output voltage

Vi = X(:, 10);          % integral of voltage
x_fcv = X(:, 11);       % position of the spool
v_fcv = X(:, 12);       % velocity of the spool
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%% Parameters %%%%%%%%%%%%%
mdot = parout(:, 1);  % mass flow rate of the xenon
Ib = parout(:, 2);
T = parout(:, 3);

D = parout(:, 4);
h = parout(:, 5);
r = parout(:, 6);
H = parout(:, 7);
v = parout(:, 8);
R = parout(:, 9:11);

C1 = parout(:, 12);
C2 = parout(:, 13);
Vc = parout(:, 14);
a1 = parout(:, 15);
a2 = parout(:, 16);

i_fcv = parout(:, 17);
f_fcv = parout(:, 18);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%