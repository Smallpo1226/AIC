**problem2_a**

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
VVb vb 0 0.55

Iref vdd vx 20u
MM1 A vx vss vss    n_18 W=50u L=1u
MM2 vx vb A vss     n_18 W=50u L=1u
MM3 B vx vss vss    n_18 W=60u L=1u m=5
MM4 vout vb B vss  n_18 W=60u L=1u m=5

********input******** 

*****************************

*********analysis***********
.op
.dc vout 0 1.8 0.01
.meas dc deriv find deriv('I(MM3)') at 300mV
.meas dc Rout PARAM='1/deriv '
****************************

.end
