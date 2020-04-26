256SRAM_Integrated_Test

*include files
.include /winhomes/yh255/180nm.txt

*passive
Cb b gnd 0.36p ic=1.8
Cbbar bbar gnd 0.36p ic=1.8

*voltage source
vw w gnd pwl 0 0 100p 0 100.01p 1.8 3n 1.8 3001p 0 
vdd pwr gnd 1.8

*SRAM subcircuit initialization
.subckt sram b bb
m1 q qbar gnd gnd NMOS l=180n w=360n
m2 qbar q gnd gnd NMOS l=180n w=360n
m3 b w q gnd NMOS  l=180n w=360n
m4 bb w qbar gnd NMOS  l=180n w=360n
m5 q qbar pwr pwr PMOS l=180n w=180n
m6 qbar q pwr pwr PMOS l=180n w=180n
.ends 

*SRAM column 
sram1 2 3 sram

*Write ckt
m9 2 v_write 4 4 NMOS 
m10  3 v_write_bar 4 4 NMOS 
m11 4 col gnd gnd NMOS

*pull up ckt
m7 2 pc pwr pwr PMOS 
m8 3 pc pwr pwr PMOS 

*differential amplifier
m12 5 5 pwr pwr PMOS 
m13 15 5 pwr pwr PMOS 
m14 5 2 6 6 NMOS 
m15 15 3 6 6 NMOS 
m16 6 v_cs gnd gnd NMOS 

*OPTION
.options post probe

*intial node set 
.nodeset V(q)=0 V(qbar)=1.8

*ANALYSIS
.tran 0.1p 5n uic

*OUTPUT
.probe tran V(w) V(q) V(qbar) V(b) V(bbar)
 
.END