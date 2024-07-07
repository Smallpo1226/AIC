**problem2_b**

.protect
.lib 'cic018.l' TT
.unprotect
.temp 25
.option 
+ post			$output waveform to user
+ acout=0 runlvl=6	$increase simulation accuracy
+ captable		$list every node capacitance

Vdd vdd 0 1.8
Vss vss 0 0
Vout vout  0 300mV


Resistor
Iin1 Vdd vx 20u
Iin2 Vdd vb 20u

MM1 B vx vss vss    n_18 W=60u L=1u m=5
MM2 vout vb B vss  n_18 W=60u L=1u m=5
MM3 A vx vss vss    n_18 W=50u L=1u
MM4 vx vb A vss     n_18 W=50u L=1u
MM5 c vb vss vss    n_18 W=45u L=0.5u
MM6 vb vb c vss   n_18 W=45u L=3.5u


*********analysis***********
.op
****************************

.end
