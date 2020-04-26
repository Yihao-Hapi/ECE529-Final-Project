%% Obtained from part C&D
I_ave = 2.9679e-04; 
C_bit = 3.584e-13; 

%% Given values
delta_V = 180e-3; 
C_amp = 50e-15; 
I_bias = 300e-6; 
delta_V_amp = 0.9; 

%% e) Discharge time
t_disc = C_bit * delta_V / I_ave; 

%% f) Sense amp discharge
t_disc_amp = C_amp * delta_V_amp / I_bias; 

