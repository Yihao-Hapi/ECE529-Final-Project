q2 vs_test
*include files
.include /winhomes/yh255/180nm.txt

*passive
Cb b gnd 0.36p ic=1.8
Cbbar bbar gnd 0.36p ic=1.8

*voltage source
vw w gnd pwl 0 0 10p 0 10.01p 1.8 5n 1.8 5001p 0 
vdd pwr gnd 1.8

*MOSFET ELEMENT
m1 q qbar gnd gnd NMOS l=180n w=360n
m2 qbar q gnd gnd NMOS l=180n w=360n
m3 b w q gnd NMOS  l=180n w=360n
m4 bbar w qbar gnd NMOS  l=180n w=360n
m5 q qbar pwr pwr PMOS l=180n w=180n
m6 qbar q pwr pwr PMOS l=180n w=180n

*OPTION
.options post probe

*intial node set 
.nodeset V(q)=0 V(qbar)=1.8

*ANALYSIS
.tran 0.1p 10n uic

*OUTPUT
.probe tran V(w) V(q) V(qbar) V(b) V(bbar)
 
.END