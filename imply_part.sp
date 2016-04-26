IMPLY part

.param stime=10ns
.param vmax=3
.param cond = 10
.param set=10.5
.param p=1K
.param q=10K
.param rising_edge=1ns
.param falling_edge=3ns

.csparam stime={stime}
.csparam vmax={vmax}

Xmemp 3 1 memristorp
Xmemq 4 2 memristorq
Vcond 1 0 PWL(0 0 'rising_edge' 0 'rising_edge' 'cond' 'falling_edge' 'cond' 'falling_edge' 0)
Vset 2 0 PWL(0 0 'rising_edge' 0 'rising_edge' 'set' 'falling_edge' 'set' 'falling_edge' 0)
Rg 5 0 5k
Vp 3 5 0V
Vq 4 5 0V

** Memristor p subckt

.subckt memristorp plus minus PARAMS: Ron=1K Roff=10K Rinit='p' alpha=0 beta=20e3/stime Vt=1.6
Bx 0 x I='((f1(V(plus)-V(minus))> 0) && (V(x) < Roff)) ? {f1(V(plus)-V(minus))}: ((((f1(V(plus)-V(minus)) < 0) && (V(x)>Ron)) ? {f1(V(plus)-V(minus))}: 0)) '
Vx x x1 dc 0
Cx x1 0 1 IC={Rinit} 
Rmem plus minus r={V(x)} 
.func f1(y)={beta*y+0.5*(alpha-beta)*(abs(y+Vt)-abs(y-Vt))} 
.ends

** Memristor q subckt

.subckt memristorq plus minus PARAMS: Ron=1K Roff=10K Rinit='q' alpha=0 beta=20e3/stime Vt=1.6
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
settype impedance Xmemp.x1 Xmemq.x1
plot Xmemp.x1 Xmemq.x1
.endc