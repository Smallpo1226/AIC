*hw1_part2
.protect
.lib "cic018.l" TT
.temp 25
.unprotect
.option post

*SOURCES
VDD VDD 0 DC=1.8
VSS VSS 0 DC=0
Vb Vb 0 DC=0
Ithn VDD Ithn DC=50u
Ithp Ithp 0 DC=50u

*PARAMETERS
.param lsweep=0.5u
.param wsweep='lsweep*3'

*MOS
Mthn Ithn Ithn VSS Vb n_18 l=lsweep w=wsweep m=1
Mthp Ithp Ithp VDD Vb p_18 l=lsweep w=wsweep m=1

*ANALYSIS
.DC Vb 0 1.8 0.01 sweep lsweep 0.5u 5u 0.5u
.probe Vth_n=VTH(Mthn) 
.probe Vth_p=VTH(Mthp) 

.probe Vgs_n=par('V(Ithn)-V(VSS)') 
.probe Vsg_p=par('V(VDD)-V(Ithp)') 

.probe Vgs_th=par('V(Ithn)-VTH(Mthn)') 
.probe Vsg_th=par('V(VDD)-V(Ithp)-VTH(Mthp)') 

.end
