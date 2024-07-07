**problem1**

.protect
.lib 'cic018.l' TT
.unprotect
.temp 25
.option 
+ post			$output waveform to user
+ acout=0 runlvl=6	$increase simulation accuracy
+ captable		$list every node capacitance


MM1 M12 Vin VSS VSS n_18 W=2u L=1u
MM2 Vout Vb1 M12 VSS n_18 W=2u L=1u
MM3 Vout Vb2 M34 VDD p_18 W=8u L=1u
MM4 M34 Vb3 VDD VDD p_18 W=8u L=1u


********define source********
Vb1 Vb1 0 0.55
Vb2 Vb2 0 1.12
Vb3 Vb3 0 1.24

VSS VSS 0 0
VDD VDD 0 1.8
Vin Vin 0 0.461
*****************************

*********analysis***********
.op
.tf v(Vout) vin
.dc Vin 0 1.8 10u
.probe gain=deriv('V(Vout)')
.probe V(Vout)
.meas DC output_swing_upper Find V(vout) when deriv('V(vout)')='-10^(45/20)' cross=1
.meas DC output_swing_lower Find V(vout) when deriv('V(vout)')='-10^(45/20)' cross=2
.meas DC output_swing param='output_swing_upper-output_swing_lower '
****************************

.end
