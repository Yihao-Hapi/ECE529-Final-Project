256SRAM_Integrated_Test

*include files
.include /winhomes/yh255/180nm.txt

*passive
Cbit 3 0 0.36p
Cbitbar 4 0 0.36p 

*voltage source 1n start 7n stop 
vdd pwr gnd 1.8
vpc 5 0 pwl 0 0 10p 0 11p 1.8 8n 1.8 8001p 0
vword 9 0 pwl 0 0 1n 0 1001p 1.8 8n 1.8 8001p 0
vwrite 6 0 dc 0
vwrite_bar 7 0 dc 0
*vcol 8 0 pwl 0 0 3n 0 3001p 1.8 8n 1.8 8001p 0
vcol 8 0 pwl 0 1.8 1n 1.8 1001p 0 8n 0 
vcs 17 0 dc 1.8

*SRAM subcircuit initialization
.subckt sram q qb b bb w vdd
m1 q qb 0 0 NMOS l=180n w=360n
m2 qb q 0 0 NMOS l=180n w=360n
m3 b w q 0 NMOS  l=180n w=360n
m4 bb w qb 0 NMOS  l=180n w=360n
m5 q qb vdd vdd PMOS l=180n w=180n
m6 qb q vdd vdd PMOS l=180n w=180n
.ends 

*SRAM column 
.include sram_code.txt
*xsram1 1 2 3 4 9 10 sram

*Write ckt
m7 3 5 10 10 PMOS l=180n w=2.52u
m8 4 5 10 10 PMOS l=180n w=2.52u
m9 3 6 11 0 NMOS l=180n w=1.26u
m10 4 7 11 0 NMOS  l=180n w=1.26u
m11 11 8 0 0 NMOS  l=180n w=1.26u

*Read ckt
m12 3 8 12 10 PMOS l=180n w=4.5u
m13 4 8 13 10 PMOS  l=180n w=4.5u
m14 14 12 16 0 NMOS l=180n w=100u
m15 15 13 16 0 NMOS l=180n w=100u
m16 14 14 10 10 PMOS l=180n w=77u
m17 15 14 10 10 PMOS l=180n w=77u
m18 16 17 0 0 NMOS l=180n w=180n
cout 15 0 0.05p 

*OPTION
.options post probe

*intial node set
.nodeset 3 1.8
.nodeset 4 1.8
.nodeset 1 0
.nodeset 2 1.8
.nodeset 14 0.9
.nodeset 15 0.9
.nodeset 12 1.8
.nodeset 13 1.8

*ANALYSIS
.tran 1p 10n uic

*OUTPUT
.probe tran V(1) V(2) V(3) V(4) V(5) V(6) V(7) V(8) V(9) V(10) V(11)  V(12) V(13) V(14) V(15) V(16)
 
.END