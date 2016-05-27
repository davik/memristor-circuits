IMPLY DECODER


.param stime=25ns
.param vmax=3
.param cond = 10
.param sett=10.5
.param matn=8.5
.param a=10K
.param b=1K
.param r=10k
.param r1=1ns r2=5ns r3=9ns r4=13ns r5=17ns
.param f1=4ns f2=8ns f3=12ns f4=16ns f5=20ns

.csparam stime={stime}
.csparam vmax={vmax}

Xmem_H1R H1 R memristor Ron=1K Roff=10K Rinit='a' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H2R H2 R memristor Ron=1K Roff=10K Rinit='a' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H3R H3 R memristor Ron=1K Roff=10K Rinit='a' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H4R H4 R memristor Ron=1K Roff=10K Rinit='a' alpha=0 beta=20e3/stime Vt=1.6

Xmem_H1S H1 S memristor Ron=1K Roff=10K Rinit='b' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H2S H2 S memristor Ron=1K Toff=10K Rinit='b' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H3S H3 S memristor Ron=1K Roff=10K Rinit='b' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H4S H4 S memristor Ron=1K Roff=10K Rinit='b' alpha=0 beta=20e3/stime Vt=1.6

Xmem_H1T H1 T memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H2T H2 T memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H3T H3 T memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H4T H4 T memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6

Xmem_H1U H1 U memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H2U H2 U memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H3U H3 U memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H4U H4 U memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6

* * Xmem_H1V V H1 memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
* * Xmem_H2V V H2 memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
* Xmem_H3V H3 V memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
* Xmem_H4V H4 V memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6

* * Xmem_H1W W H1 memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
* Xmem_H2W H2 W memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
* * Xmem_H3W W H3 memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
* Xmem_H4W H4 W memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6

* Xmem_H1X H1 X memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
* Xmem_H2X H2 X memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
* * Xmem_H3X X H3 memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
* * Xmem_H4X X H4 memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6

* Xmem_H1Y H1 Y memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
* * Xmem_H2Y Y H2 memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
* Xmem_H3Y H3 Y memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
* * Xmem_H4Y Y H4 memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6

* Xmem_H1T H1 Z memriStor Ron=1K Soff=10K RinSt='r' alpha=0 beta=20e3/stime Vt=1.6
* Xmem_H2Z H2 Z memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
* Xmem_H3Z H3 Z memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6
* Xmem_H4Z H4 Z memristor Ron=1K Roff=10K Rinit='r' alpha=0 beta=20e3/stime Vt=1.6

VR R 0 pwl(0 0 'r1' 0 'r1' 'cond' 'f1' 'cond' 'f1' 0 'r2' 0 'r2' 'matn' 'f2' 'matn' 'f2' 0 'r3' 0 'r3' 'matn' 'f3' 'matn' 'f3' 0 'r4' 0 'r4' 'matn' 'f4' 'matn' 'f4' 0 'r5' 0 'r5' 'matn' 'f5' 'matn' 'f5' 0)
VS S 0 pwl(0 0 'r1' 0 'r1' 'matn' 'f1' 'matn' 'f1' 0 'r2' 0 'r2' 'cond' 'f2' 'cond' 'f2' 0 'r3' 0 'r3' 'matn' 'f3' 'matn' 'f3' 0 'r4' 0 'r4' 'matn' 'f4' 'matn' 'f4' 0 'r5' 0 'r5' 'matn' 'f5' 'matn' 'f5' 0)
VT T 0 pwl(0 0 'r1' 0 'r1' 'sett' 'f1' 'sett' 'f1' 0 'r2' 0 'r2' 'matn' 'f2' 'matn' 'f2' 0 'r3' 0 'r3' 'cond' 'f3' 'cond' 'f3' 0 'r4' 0 'r4' 'matn' 'f4' 'matn' 'f4' 0 'r5' 0 'r5' 'matn' 'f5' 'matn' 'f5' 0)
VU U 0 pwl(0 0 'r1' 0 'r1' 'matn' 'f1' 'matn' 'f1' 0 'r2' 0 'r2' 'sett' 'f2' 'sett' 'f2' 0 'r3' 0 'r3' 'matn' 'f3' 'matn' 'f3' 0 'r4' 0 'r4' 'cond' 'f4' 'cond' 'f4' 0 'r5' 0 'r5' 'matn' 'f5' 'matn' 'f5' 0)
* VV V 0 pwl(0 0 'r1' 0 'r1' 'sett' 'f1' 'sett' 'f1' 0 'r2' 0 'r2' 'matn' 'f2' 'matn' 'f2' 0 'r3' 0 'r3' 'matn' 'f3' 'matn' 'f3' 0 'r4' 0 'r4' 'matn' 'f4' 'matn' 'f4' 0 'r5' 0 'r5' 'cond' 'f5' 'cond' 'f5' 0)
* VW W 0 pwl(0 0 'r1' 0 'r1' 'matn' 'f1' 'matn' 'f1' 0 'r2' 0 'r2' 'sett' 'f2' 'sett' 'f2' 0 'r3' 0 'r3' 'matn' 'f3' 'matn' 'f3' 0 'r4' 0 'r4' 'matn' 'f4' 'matn' 'f4' 0 'r5' 0 'r5' 'cond' 'f5' 'cond' 'f5' 0)
* VX X 0 pwl(0 0 'r1' 0 'r1' 'matn' 'f1' 'matn' 'f1' 0 'r2' 0 'r2' 'matn' 'f2' 'matn' 'f2' 0 'r3' 0 'r3' 'sett' 'f3' 'sett' 'f3' 0 'r4' 0 'r4' 'matn' 'f4' 'matn' 'f4' 0 'r5' 0 'r5' 'cond' 'f5' 'cond' 'f5' 0)
* VY Y 0 pwl(0 0 'r1' 0 'r1' 'matn' 'f1' 'matn' 'f1' 0 'r2' 0 'r2' 'matn' 'f2' 'matn' 'f2' 0 'r3' 0 'r3' 'matn' 'f3' 'matn' 'f3' 0 'r4' 0 'r4' 'sett' 'f4' 'sett' 'f4' 0 'r5' 0 'r5' 'cond' 'f5' 'cond' 'f5' 0)
* VZ Z 0 pwl(0 0 'r1' 0 'r1' 'matn' 'f1' 'matn' 'f1' 0 'r2' 0 'r2' 'matn' 'f2' 'matn' 'f2' 0 'r3' 0 'r3' 'matn' 'f3' 'matn' 'f3' 0 'r4' 0 'r4' 'matn' 'f4' 'matn' 'f4' 0 'r5' 0 'r5' 'sett' 'f5' 'sett' 'f5' 0)


RgH1 H1 0 5k
RgH2 H2 0 5k
RgH3 H3 0 5k
RgH4 H4 0 5k
 

** Memristor p subckt

.subckt memristor plus minus PARAMS: Ron=1K Roff=10K Rinit=7k alpha=0 beta=20e3/stime Vt=1.6
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

set color0=white
set color1=black
set color2=rgb:f/0/0
set color3=rgb:0/0/f
set color4=rgb:0/f/0

* plot i(vp), i(vq)
plot v(R), v(S), v(T), v(U)
* , v(U), v(V), v(W), v(X), v(Y), v(Z)
settype impedance Xmem_H1R.x1 Xmem_H2R.x1 Xmem_H3R.x1 Xmem_H4R.x1
settype impedance Xmem_H1S.x1 Xmem_H2S.x1 Xmem_H3S.x1 Xmem_H4S.x1
settype impedance Xmem_H1T.x1 Xmem_H2T.x1 Xmem_H3T.x1 Xmem_H4T.x1
settype impedance Xmem_H1U.x1 Xmem_H2U.x1 Xmem_H3U.x1 Xmem_H4U.x1 

plot Xmem_H1T.x1 Xmem_H2T.x1 Xmem_H3T.x1 Xmem_H4T.x1
plot Xmem_H1U.x1 Xmem_H2U.x1 Xmem_H3U.x1 Xmem_H4U.x1
plot Xmem_H1S.x1 Xmem_H2S.x1 Xmem_H3S.x1 Xmem_H4S.x1
plot Xmem_H1R.x1 Xmem_H2R.x1 Xmem_H3R.x1 Xmem_H4R.x1
.endc