AIC_HW2_PART2
.protect
.lib 'cic018.l' TT
.unprotect
.temp 25
.param x = 0.5
.option
+ post
+ captab
+ ABSTOL=1e-7 RELTOL=1e-7 ACCURATE=1

*VOLTAGE
Vdd vdd 0 1.8 
Vin Vin 0 x 
Vb Vb 0 1

.param lsweep=1u
.param wsweep='5.3u'

*Resistor
RD vdd Vout 73500

*MOS
MMn Vout Vb Vin  Vin   n_18 w = wsweep l = lsweep  m = 1


*simulation setup
.op

*.DC wsweep 0.5u  5u  0.01u


.tf V(Vout) Vin

*.meas dc dc_gain FIND deriv('V(Vout)') WHEN V(Vin) = 0.9

.PROBE V(Vout)

*.PROBE Vth_n = LV9(ms)
*.PROBE gm_n = LX7(ms)
*.PROBE id_n = LX4(ms) 
*.PROBE Av = par('V(Vout)/V(Vin)')


.end
