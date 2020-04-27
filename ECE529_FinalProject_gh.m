%parameter setting
q = 1.602177* (10^-19);
diff_ox = 3.9*8.854*10^-14;
X_ox = 2.2*10^-7 ; %A = 10^-8
C_ox = diff_ox/X_ox;
diff_si = 1.03594*(10^-12);
un_ch = 270;
Rload =10000;
VDD = 1.8;
VTN = 0.5;
rN = 0.3;
two_fb = 0.88;
E_cn = 60000;
E_cp = 240000;
vnsat = 10^7;
vpsat = 8*10^6;
vg = 1.8;
W3 = 2 * 180 *10^-7; %4»Î
L = 180*10^-7;

% From abcdef
t_read = 0.3674e-9;
C_bit = 358.4e-15;
delta_V = 4/5*VDD;

I_sat = C_bit*delta_V/t_read;
W_pulldown = I_sat/(vnsat*C_ox*(VDD-VTN)^2/(VDD-VTN+E_cn*L)); % W_13, W_14,W_15
W_pullup = 2*W_pulldown; %W_7, W_8