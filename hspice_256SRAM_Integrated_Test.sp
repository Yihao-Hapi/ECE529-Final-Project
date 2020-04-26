256SRAM_Integrated_Test

*include files
.include /winhomes/yh255/180nm.txt

*passive
Cbit 3 0 0.36p ic=1.8
Cbitbar 4 0 0.36p ic=1.8

*voltage source
*vw w gnd pwl 0 0 100p 0 100.01p 1.8 3n 1.8 3001p 0 
vdd pwr gnd 1.8
vpc 5 0
vword 9 0
vwrite 6 0
vwrite_bar 7 0
vcol 8 0
vcs 17 0

*SRAM subcircuit initialization
.subckt sram b bb
m1 1 2 0 0 NMOS l=180n w=360n
m2 2 1 0 0 NMOS l=180n w=360n
m3 b 9 1 0 NMOS  l=180n w=360n
m4 bb 9 2 0 NMOS  l=180n w=360n
m5 1 2 10 10 PMOS l=180n w=180n
m6 2 1 10 10 PMOS l=180n w=180n
.ends 

*SRAM column 
sram_cell1 3 4 sram

*Write ckt
m7 3 5 10 PMOS 
m8 4 5 10 PMOS 
m9 3 6 11 NMOS
m10 4 7 11 NMOS 
m11 11 8 0 NMOS 

*Read ckt
m12 12 10 3 PMOS
m13 13 10 4 PMOS 
m14 14 12 16 NMOS 
m15 15 13 16 NMOS 
m16 14 14 10 PMOS 
m17 15 14 10 PMOS 
m18 16 17 0 NMOS 

*OPTION
.options post probe

*intial node set 
.nodeset 

*ANALYSIS
.tran 0.1p 5n uic

*OUTPUT
.probe tran V(1) V(2)
 
.END