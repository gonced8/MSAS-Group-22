% Load all data and initial conditions for simulation

data_thruster;
data_orbit;
data_accel;
data_fcv;

X0_orbit = [data.orbit.a0; 
            data.orbit.e0;
            data.orbit.i0;
            data.orbit.Omega0;
            data.orbit.w0;
            data.orbit.f0];
        
X0_accel = [data.accel.x0;
            data.accel.v0;
            data.accel.Vout0];
        
X0_fcv = [data.fcv.Vi0;
          data.fcv.x0;
          data.fcv.v0];
      
X0 = [X0_orbit;
      X0_accel;
      X0_fcv];
