*Part 2
.protect
.lib 'cic018.l' tt
.unprotect
.temp 25
.option post
+ captab
+ runlvl=6
+ ABSTOL=1e-7 RELTOL=1e-7 ACCURATE=1

*src
vdd vdd 0 dc=1.8
vb vb 0 dc=1
vin vin 0 dc=0.5

*ckt
rd vdd vout 100000
Mn vout vb vin gnd n_18 w=20.8u l=2u m=1

*analysis
.op
.tf V(vout) vin
.end
