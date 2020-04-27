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
%calculate Vbitline
Vb_equ = @(x) VDD-x-VTN-rN*(sqrt(two_fb+x)-sqrt(two_fb));
Vb = fzero(Vb_equ,1.5); %20.10

%calculate M1 size based on M3 and Vbitline
Vq=VTN;
M1_equ = @(y) (((y*un_ch*C_ox*((VDD-VTN)*Vq-((Vq*Vq)/2)))/(L*(1+Vq/(E_cn*L))))) - ((vnsat*C_ox*W3*(VDD-Vq-VTN)*(VDD-Vq-VTN))/(VDD-Vq-VTN+L*E_cn));
M1_result = fzero(M1_equ,0);
M1_lam =2* M1_result / L;

%optimize M1 based on siz e
M1_3lam = 0.75 *W3; % as minimal as possible so m1=3 lam
Vq_test_equ = @(vq_test) (((M1_3lam*un_ch*C_ox*((VDD-VTN)*vq_test-((vq_test*vq_test)/2)))/(L*(1+vq_test/(E_cn*L))))) - ((vnsat*C_ox*W3*(VDD-vq_test-VTN)*(VDD-vq_test-VTN))/(VDD-vq_test-VTN+L*E_cn));
Vq_test_result = fzero(Vq_test_equ,0.2);
M1_ans = M1_3lam;

%calculate M2 size based on write requirement, assume pull down the
%internal node to 0.5V check HW9 Q1
Vol=0.5;
M2_equ = @(M2_size) (W3/L)*(un_ch*C_ox/(1+(Vol/(E_cn*L))))*((VDD-VTN)*Vol-Vol*Vol*0.5) - ( (M2_size*vpsat*C_ox*(VDD-VTN)*(VDD-VTN)) / (E_cp*L+VDD-VTN) );
M2_result = fzero(M2_equ,0);

%optimize M2 based on size , decrase Vq, reduce the
%size of M2 dramatically, exp to minimum size 
Vq_test_equ2 = @(vq_test2) (W3/L)*(un_ch*C_ox/(1+(vq_test2/(E_cn*L))))*((VDD-VTN)*vq_test2-vq_test2*vq_test2*0.5) - ( (0.5*W3*vpsat*C_ox*(VDD-VTN)*(VDD-VTN)) / (E_cp*L+VDD-VTN) );
Vq_test_result2= fzero(Vq_test_equ2,0);
M2_ans = 0.5*W3;
%M2 = M1 = 3lambda is doable, so M1=M2 = 3lambda = 270nm   M5=M6 = 2lambda = 180nm
%M3=M4=4lambda = 360nm

%b) Vs calculation and simulation 
X = sqrt(M1_ans*E_cp/(M2_ans*E_cn));
Vs = (VDD+VTN*X)/(1+X);

%The requirement for a
% successful write operation is to swing the internal voltage of the cell past
% the switching voltage
% VS of the corresponding inverter. Once the cell
% switches its state, the wordline can be returned to its low value.

%After put it into HSPICE, it not working. We have to increase the size of
%the M1 M2 to the same with M3 M4 so the internal node will not exceed VTN,
%explanation will be included

%c)
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
C_bit = rnum*C_ds*W_acc + C_wire*256*40*lambda + C_contact*rnum/2;

delta_V = 180e-3; 
C_amp = 50e-15; 
I_bias = 300e-6; 
delta_V_amp = 0.9; 

% e) Discharge time
t_disc = C_bit * delta_V / I_ave; 

% f) Sense amp discharge
t_disc_amp = C_amp * delta_V_amp / I_bias; 

% From abcdef
t_read = 0.3674e-9;
C_bit = 358.4e-15;
delta_V = 4/5*VDD;

I_sat = C_bit*delta_V/t_read;
W_pulldown = I_sat/(vnsat*C_ox*(VDD-VTN)^2/(VDD-VTN+E_cn*L)); % W_13, W_14,W_15
W_pullup = 2*W_pulldown; %W_7, W_8