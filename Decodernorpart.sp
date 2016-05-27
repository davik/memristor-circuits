Only NOR part of decoder

.param v=10k
.param w=10k
.param x=1k
.param y=1k
.param r=10k


.param cond = 10
.param sett=10.5

.param stime=10ns
.param vmax=3

.param r1=1ns
.param f1=7ns

.csparam stime={stime}
.csparam vmax={vmax}


Xmem_H3V H3 V memristor Ron=1K Roff=10K Rinit='v' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H4V H4 V memristor Ron=1K Roff=10K Rinit='v' alpha=0 beta=20e3/stime Vt=1.6

Xmem_H2W H2 W memristor Ron=1K Roff=10K Rinit='w' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H4W H4 W memristor Ron=1K Roff=10K Rinit='w' alpha=0 beta=20e3/stime Vt=1.6

Xmem_H1X H1 X memristor Ron=1K Roff=10K Rinit='x' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H2X H2 X memristor Ron=1K Roff=10K Rinit='x' alpha=0 beta=20e3/stime Vt=1.6

Xmem_H1Y H1 Y memristor Ron=1K Roff=10K Rinit='y' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H3Y H3 Y memristor Ron=1K Roff=10K Rinit='y' alpha=0 beta=20e3/stime Vt=1.6

Xmem_H1Z H1 Z memristor
Xmem_H2Z H2 Z memristor
Xmem_H3Z H3 Z memristor
Xmem_H4Z H4 Z memristor

RgH1 H1 0 5k
RgH2 H2 0 5k
RgH3 H3 0 5k
RgH4 H4 0 5k

Vv V 0 pwl(0 0 'r1' 0 'r1' 'cond' 'f1' 'cond' 'f1' 0)
Vw W 0 pwl(0 0 'r1' 0 'r1' 'cond' 'f1' 'cond' 'f1' 0)
Vx X 0 pwl(0 0 'r1' 0 'r1' 'cond' 'f1' 'cond' 'f1' 0)
Vy Y 0 pwl(0 0 'r1' 0 'r1' 'cond' 'f1' 'cond' 'f1' 0)
Vz Z 0 pwl(0 0 'r1' 0 'r1' 'sett' 'f1' 'sett' 'f1' 0)


 .subckt memristor plus minus PARAMS: Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
Bx 0 x I='((f1(V(plus)-V(minus))> 0) && (V(x) < Roff)) ? {f1(V(plus)-V(minus))}: ((((f1(V(plus)-V(minus)) < 0) && (V(x)>Ron)) ? {f1(V(plus)-V(minus))}: 0)) '
Vx x x1 dc 0
Cx x1 0 1 IC={Rinit} 
Rmem plus minus r={V(x)} 
.func f1(y)={beta*y+0.5*(alpha-beta)*(abs(y+Vt)-abs(y-Vt))} 
.ends

.control
let deltime = stime/10
let totaltime= stime
tran $&deltime $&totaltime uic

*plot i(vp), i(vq)
* settype impedance Xmem_H1R.x1 Xmem_H2R.x1 Xmem_H3R.x1 Xmem_H4R.x1
* settype impedance Xmem_H1S.x1 Xmem_H2S.x1 Xmem_H3S.x1 Xmem_H4S.x1
* settype impedance Xmem_H1T.x1 Xmem_H2T.x1 Xmem_H3T.x1 Xmem_H4T.x1
* settype impedance Xmem_H1U.x1 Xmem_H2U.x1 Xmem_H3U.x1 Xmem_H4U.x1
settype impedance Xmem_H3V.x1 Xmem_H4V.x1
settype impedance Xmem_H2W.x1 Xmem_H4W.x1
settype impedance Xmem_H1X.x1 Xmem_H2X.x1 
settype impedance Xmem_H1Y.x1 Xmem_H3Y.x1 
settype impedance Xmem_H1Z.x1 Xmem_H2Z.x1 Xmem_H3Z.x1 Xmem_H4Z.x1

* plot Xmem_H1R.x1 Xmem_H2R.x1 Xmem_H3R.x1 Xmem_H4R.x1
* plot Xmem_H1S.x1 Xmem_H2S.x1 Xmem_H3S.x1 Xmem_H4S.x1
* plot Xmem_H1T.x1 Xmem_H2T.x1 Xmem_H3T.x1 Xmem_H4T.x1
* plot Xmem_H1U.x1 Xmem_H2U.x1 Xmem_H3U.x1 Xmem_H4U.x1
* plot Xmem_H3V.x1 Xmem_H4V.x1
* plot Xmem_H2W.x1 Xmem_H4W.x1
* plot Xmem_H1X.x1 Xmem_H2X.x1
* plot Xmem_H1Y.x1 Xmem_H3Y.x1
* plot Xmem_H1X.x1 Xmem_H1Y.x1 Xmem_H1Z.x1 Xmem_H2Z.x1 Xmem_H3Z.x1 Xmem_H4Z.x1
* hardcopy ../epss/dec11.png Xmem_H1X.x1 Xmem_H1Y.x1 Xmem_H1Z.x1 Xmem_H2Z.x1 Xmem_H3Z.x1 Xmem_H4Z.x1
gnuplot ../ppt/dec11 Xmem_H1Z.x1 Xmem_H2Z.x1 Xmem_H3Z.x1 Xmem_H4Z.x1 Xmem_H1X.x1 Xmem_H1Y.x1 
.endc