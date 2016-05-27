IMPLY NOR


.param stime=10ns
.param vmax=3
.param cond = 10
.param set=10.5
.param a=1K
.param b=10K
.param r=10k
.param rising_edge=1ns
.param falling_edge=4ns

.csparam stime={stime}
.csparam vmax={vmax}

Xmema 4 1 memristor Ron=1K Roff=10K Rinit='a' alpha=0 beta=20e3/stime Vt=1.6
Xmemb 4 2 memristor Ron=1K Roff=10K Rinit='b' alpha=0 beta=20e3/stime Vt=1.6
Xmemr 4 3 memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
Va 1 0 PWL(0 0 'rising_edge' 0 'rising_edge' 'cond' 'falling_edge' 'cond' 'falling_edge' 0)
Vb 2 0 PWL(0 0 'rising_edge' 0 'rising_edge' 'cond' 'falling_edge' 'cond' 'falling_edge' 0)
Vr 3 0 PWL(0 0 'rising_edge' 0 'rising_edge' 'set' 'falling_edge' 'set' 'falling_edge' 0)
Rg 4 0 5k


** Memristor p subckt

.subckt memristor plus minus PARAMS: Ron=1K Roff=10K Rinit=7k alpha=0 beta=20e3/stime Vt=1.6
Bx 0 x I='((f1(V(plus)-V(minus))> 0) && (V(x) < Roff)) ? {f1(V(plus)-V(minus))}: ((((f1(V(plus)-V(minus)) < 0) && (V(x)>Ron)) ? {f1(V(plus)-V(minus))}: 0)) '
Vx x x1 dc 0
Cx x1 0 1 IC={Rinit} 
Rmem plus minus r={V(x)} 
.func f1(y)={beta*y+0.5*(alpha-beta)*(abs(y+Vt)-abs(y-Vt))} 
.ends


.control
let deltime = stime/100
let totaltime= stime
tran $&deltime $&totaltime uic

*plot i(vp), i(vq)
plot v(3), v(1), v(2)
settype impedance Xmema.x1 Xmemb.x1 Xmemr.x1
plot Xmema.x1 Xmemb.x1 Xmemr.x1
.endc