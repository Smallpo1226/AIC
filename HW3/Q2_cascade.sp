*Part 2
.protect
.lib 'cic018.l' tt
.unprotect
.temp 25
.option post
+ captab
+ runlvl=6
+ ABSTOL=1e-7 RELTOL=1e-7 ACCURATE=1

Ithn1 vdd v1 DC=3u
Ithn2 v1 vss DC=10u
*src
vdd vdd 0 dc=1.8
vss vss 0 0
vin vin 0 dc=0.47
vb vb 0 dc=1
*ckt
Mn1 v1 vin vss vss n_18 w=5u l=5u  m=1
rd vdd vout 100000
Mn2 vout vb v1 gnd n_18 w=20.8u l=2u m=1

*analysis
.op
.tf V(vout) vin
.end
