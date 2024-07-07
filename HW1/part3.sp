*hw1_part3
.protect
.lib "cic018.l" TT
.temp 25
.unprotect
.option post

*SOURCES
VDD VDD 0 DC=0
VSS VSS 0 DC=0
VG VG VSS DC=0  


*PARAMETERS
.param lsweep=0.2u
.param wsweep=1.5u

*MOS
Mthn 0 VG 0 0 n_18 w=1.5u l=0.2u m=1

*ANALYSIS
.DC  VG   -1.8 1.8 0.01 
.probe Cgs=par('CGSBO(Mthn)*-1') 
.probe Cgd=par('CGDBO(Mthn)*-1') 
.probe Cgb=par('CBGBO(Mthn)*-1')
.probe Cg_total=CGGBO(Mthn) 

.end

