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


%c) Current Estimation
Vq_0 = 0;
I_0 = 0;
Vq_ss = VTN;
I_ss = (vnsat*C_ox*W3*(VDD-Vq_ss-VTN)*(VDD-Vq_ss-VTN))/(VDD-Vq_ss-VTN+L*E_cn);
I_ave = (I_0+I_ss)/2;

%d) Capacitance Calculation
C_ds = 0.5*10^-15/10^-6; %unit cap per length
C_wire = 0.2*10^-15/10^-6; %unit cap per length
C_contact = 1*10^-15; %unit cap
rnum = 256;
lambda = 180/2*10^-9;
W_acc = 4*lambda;
W_pullup = 50*lambda;
C_bit = rnum*C_ds*W_acc + 2*C_ds*W_pullup + C_wire*256*40*lambda + C_contact*rnum/2;