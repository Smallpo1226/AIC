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
Iivy gnd vy dc=15u ac=1

*RESISTER
RS vy gnd 50000

*CAPACITOR
C1 vy gnd 1p 
C2 vout2 gnd 1p 

*MOS
mn vout2 vy gnd gnd n_18 w = 25u  l = 0.6u  m = 5
mp vout2 vy vdd vdd p_18 w = 25u  l = 0.2u  m = 8

*simulation setup
.op
.tf V(vout2) Iivy
.ac dec 10 1 100g
.probe vdb(vout2) vp(vout2) $ plot ac gain and phase response
.meas ac dcgain_in_db find Vdb(vout2) at=10k
.meas ac BW when Vdb(vout2) = 'dcgain_in_db-3' $ find bandwidth
.meas dc dc_gain FIND deriv('V(vout2)') WHEN I(Iin) = 10u 
.pz v(vout2) Iivy
.end
