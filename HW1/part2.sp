*hw1_part2
.protect
.lib "cic018.l" TT
.temp 25
.unprotect
.option post

*SOURCES
VDD VDD 0 DC=1.8
VSS VSS 0 DC=0
Ithn VDD Ithn DC=50u
Ithp Ithp 0 DC=50u

*PARAMETERS
.param lsweep=0.18u
.param wsweep='lsweep*3'

*MOS
Mthn Ithn Ithn VSS VSS n_18 l=lsweep w=wsweep m=1
Mthp Ithp Ithp VDD VDD p_18 l=lsweep w=wsweep m=1

*ANALYSIS
.DC lsweep 0.18u 10u 0.01u
.probe Vth_n=VTH(Mthn) 
.probe Vth_p=VTH(Mthp)
.probe gds_n=GDSO(Mthn)
.probe gds_p=GDSO(Mthp)
.probe gm_n=GMO(Mthn) 
.probe gm_p=GMO(Mthp)
.probe gm_cg_n=par('GMO(Mthn)/CGGBO(Mthn)')
.probe gm_cg_p=par('GMO(Mthp)/CGGBO(Mthp)')
.probe cg_n = CGGBO(Mthn)
.probe cg_p = CGGBO(Mthp)


.end
