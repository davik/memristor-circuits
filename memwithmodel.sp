Memmristor model

.param stime=10n
.param vmax = 3

* send parameters to the .control section
.csparam stime={stime}
.csparam vmax={vmax}

Xmem 1 0 memristor
* amen 1 0  memr 
* .MODEL1 memr memristor(rmin=1k rmax=10k rinit=7k  alpha=0 beta=2e13 vt=1.6)
V1 0 1 DC 0 sin(0 'vmax' '1/stime')


.subckt memristor plus minus PARAMS: Ron=1K Roff=10K Rinit=7.0K alpha=0 beta=20e3/stime Vt=1.6 
Bx 0 x I='((f1(V(plus)-V(minus))> 0) && (V(x) < Roff)) ? {f1(V(plus)-V(minus))}: ((((f1(V(plus)-V(minus)) < 0) && (V(x)>Ron)) ? {f1(V(plus)-V(minus))}: 0)) '
Vx x x1 dc 0
Cx x1 0 1 IC={Rinit} 
Rmem plus minus r={V(x)} 
.func f1(y)={beta * y+0.5*(alpha-beta)*(abs(y+Vt)-abs(y-Vt))} 
.ends

.control
tran 1ns 10ns
plot i(V1) vs v(1)
.endc

