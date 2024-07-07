*Part2
.protect
.lib 'cic018.l' TT
.unprotect
.temp 25
.option post
+ captab
+ runlvl=6
+ ABSTOL=1e-7 RELTOL=1e-7 ACCURATE=1
Ithn vdd vout DC=3u
*src
vdd vdd 0 dc=1.8
vss vss 0 0
vin vin 0 dc=0.47
*ckt
Mn vout vin vss vss n_18 w=5u l=5u  m=1
.dc vin 0 1.8 0.01
.probe V(Vout)
*analysis
.op
.tf v(vout) vin
.end
