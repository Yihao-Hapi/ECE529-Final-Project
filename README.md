# ECE529 Final Project
 SRAM DESIGN

Current Progress: a, b, c, d, e, f :)
	W1 = W2 = W3 = W4 = 360nm
	W5 = W6 = 180nm
	Cbit = 358.4fF
  Total discharge time = 0.3674ns


 The problem explores cell and IO design issues for a 64K SRAM based on the previous problem.

180nm technology Minimal L/W 2 lambda(lam) = 180nm

 1) First consider the cell design.
 	Access transistor of SRAM cell was given as 4 lam, set the rest of the transistors to satify the following req
 		1) During a read, the internal voltage should not rise above VTN
 		2) During a write, the acces transistor must be able to pull the internal node to at least 0.8V or VS.
 		3) Make the design as small as possible -> Assumption : bitline is around 0V during write operation. For the read, assume the bitline has supply voltage at VDD.

2) Estimate Vs of the inverters and explain why its important in the cell design. HSPICE simulation verify it. NEED Vol for read operation and Vs

3) Using hand calculations, estimate the current that the cell can draw from
the bitline when the wordline goes high. Use an average between the initial
value and the steady-state value to estimate this current.

4) Next, calculate the capacitance of the bitline. There are 256 rows of cells
and, from Design Problem 1, each cell is 40A x 40A.The column pull-up
transistors are each 50A. Assume that each contact has a capacitance of 1 fF.

5) Next compute the time required to discharge one of the bitlines by 180 mV.

6) The last part of the read cycle involves the sense amplifier. The design of
the sense amp has been provided in P8.8 using Figure 8.20. Compute the
discharge time assuming that the bias current is 300/zA and the output
capacitance is 50 fF. Assume a voltage swing at the output of the sense amp
of 0.9 V.

7) The next step of the design is the write circuit of Figure 8.18. To write the cell, the bitline has to be driven low enough so that the cell switches. Ideally, the write time should be about the same speed as the read time. If we work to make it faster, we are wasting our effort because the read will be the limiting factor. If it is slower than the read, then the write is in the critical path and that is not desirable etiher. Using the simple RC model, determine the effective resistance needed to get the bitlines to swing down to VDD/5 in the same amount of time it takes to do the read. Size M13 M14 M15 so that they have this effective resistance.

8) As a last step,we need to set the values of the column pull-up transistors of Figure 8.18. They need to pull the bitlines up after a write but before the end of the precharge phase. How big do they need to be? The final difference of the btlines should be less than 10% of the desired read swings to avoid confusing the sense amp. Typically, we make them twice the size of the pull-down devices for a fast precharge. Size these transistors accordingly.

9) CHECK YOUR RESULTS USING SPICE.
