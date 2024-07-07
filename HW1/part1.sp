*hw1_1
.protect
.lib "cic018.l" TT
.temp 25
.unprotect
.option post
+captab
+ABSTOL=1e-7 RELTOL=1e-7 ACCURATE=1

*source
VDD VDD 0 DC=1.8
VG   VG   0 DC=0
*parameters
.param lsweep=0.5u
.param wsweep='lsweep*3'

*mos
MMn VDD VG 0 0 n_18 w=wsweep l=lsweep m=1
MMp 0 VG VDD VDD p_18 w=wsweep l=lsweep m=1

*analysis
.DC VG 0 1.8 0.01 sweep lsweep 0.5u 5u 0.5u

.prob I(MMn)
.prob I(MMp)

.end
