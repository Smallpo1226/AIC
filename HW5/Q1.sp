AIC_HW5_Feedback_Amplifier
.protect
.lib 'cic018.l' TT
.unprotect
.temp 25
.option
+ post
+ captab
+ ABSTOL=1e-7 RELTOL=1e-7 ACCURATE=1



*VOLTAGE
Vdd vdd gnd 1.5 0

*CURRENT
Iivx gnd vx dc=15u ac=1

*RESISTER
RS vx gnd 50000
RF vx Vout1 1000

*CAPACITOR
C1 vx gnd 1p 
C2 Vout1 gnd 1p 

*MOS
mn Vout1 vx gnd gnd n_18 w = 25u  l = 0.6u  m = 5
mp Vout1 vx vdd vdd p_18 w = 25u  l = 0.2u  m = 8

*Iivx gnd vx dc=10u ac=1
*mn Vout1 vx gnd gnd n_18 w = 45u  l = 0.6u  m = 1
*mp Vout1 vx vdd vdd p_18 w = 14u  l = 0.2u  m = 5

*Iivx gnd vx dc=10u ac=1
*mn Vout1 vx gnd gnd n_18 w = 15u  l = 0.2u  m = 1
*mp Vout1 vx vdd vdd p_18 w = 10u  l = 0.2u  m = 5

*Iivx gnd vx dc=10u ac=1
*mn Vout1 vx gnd gnd n_18 w = 32.7u  l = 0.5u  m = 1
*mp Vout1 vx vdd vdd p_18 w = 11u  l = 0.2u  m = 5

*Iivx gnd vx dc=10u ac=1
*mn Vout1 vx gnd gnd n_18 w = 13u  l = 0.18u  m = 1
*mp Vout1 vx vdd vdd p_18 w = 8u  l = 0.18u  m = 5

*Iivx gnd vx dc=10u ac=1
*mn Vout1 vx gnd gnd n_18 w = 13.3u  l = 0.18u  m = 1
*mp Vout1 vx vdd vdd p_18 w = 7.2u  l = 0.18u  m = 5


*simulation setup
.op
.tf V(Vout1) Iivx
.ac dec 10 1 100g
.probe vdb(Vout1) vp(Vout1) $ plot ac gain and phase response
.meas ac dcgain_in_db find Vdb(Vout1) at=10k
.meas ac BW when Vdb(Vout1) = 'dcgain_in_db-3' $ find bandwidth
.meas dc dc_gain FIND deriv('V(Vout1)') WHEN I(Iin) = 10u 
.pz v(Vout1) Iivx
.end


