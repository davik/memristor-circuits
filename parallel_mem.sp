Parallel memristor test

.param a=10K
.param b=1K
.param r=10k
.param stime=40ns
.param vmax=3


.param cond = 10
.param sett=10.5
.param matn1=6
.param matn0=8.5

.param r1=1ns r2=10ns r3=19ns r4=28ns r5=17ns
.param f1=7ns f2=16ns f3=25ns f4=34ns f5=20ns

.param cond2=10
.param sett2= 10.5

.csparam stime={stime}
.csparam vmax={vmax}

Xmem_H1R H1 R memristor Ron=1K Roff=10K Rinit='a' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H2R H2 R memristor Ron=1K Roff=10K Rinit='a' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H3R H3 R memristor Ron=1K Roff=10K Rinit='a' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H4R H4 R memristor Ron=1K Roff=10K Rinit='a' alpha=0 beta=20e3/stime Vt=1.6

Xmem_H1S H1 S memristor Ron=1K Roff=10K Rinit='b' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H2S H2 S memristor Ron=1K Roff=10K Rinit='b' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H3S H3 S memristor Ron=1K Roff=10K Rinit='b' alpha=0 beta=20e3/stime Vt=1.6
Xmem_H4S H4 S memristor Ron=1K Roff=10K Rinit='b' alpha=0 beta=20e3/stime Vt=1.6

Xmem_H1T H1 T memristor
Xmem_H2T H2 T memristor
Xmem_H3T H3 T memristor
Xmem_H4T H4 T memristor

Xmem_H1U H1 U memristor
Xmem_H2U H2 U memristor
Xmem_H3U H3 U memristor
Xmem_H4U H4 U memristor

Xmem_H1V H1 V memristor
Xmem_H2V H2 V memristor
Xmem_H3V H3 V memristor
Xmem_H4V H4 V memristor

Xmem_H1W H1 W memristor
Xmem_H2W H2 W memristor
Xmem_H3W H3 W memristor
Xmem_H4W H4 W memristor



VR R 0 pwl(0 0 'r1' 0 'r1' 'cond' 'f1' 'cond' 'f1' 0 'r2' 0 'r2' 'matn0' 'f2' 'matn0' 'f2' 0 )
* 'r3' 0 'r3' 'matn' 'f3' 'matn' 'f3' 0 )

VS S 0 pwl(0 0 'r1' 0 'r1' 'matn1' 'f1' 'matn1' 'f1' 0 'r2' 0 'r2' 'cond2' 'f2' 'cond2' 'f2' 0 )

VT T 0 pwl(0 0 'r1' 0 'r1' 'sett' 'f1' 'sett' 'f1' 0 'r2' 0 'r2' 'matn1' 'f2' 'matn1' 'f2' 0 )

VU U 0 pwl(0 0 'r1' 0 'r1' 'matn0' 'f1' 'matn0' 'f1' 0 'r2' 0 'r2' 'sett2' 'f2' 'sett2' 'f2' 0 )

VV V 0 pwl(0 0 'r1' 0 'r1' 'sett' 'f1' 'sett' 'f1' 0 'r2' 0 'r2' 'matn1' 'f2' 'matn1' 'f2' 0 )

VW W 0 pwl(0 0 'r1' 0 'r1' 'matn0' 'f1' 'matn0' 'f1' 0 'r2' 0 'r2' 'sett2' 'f2' 'sett2' 'f2' 0 )

RgH1 H1 0 5k
RgH2 H2 0 5k
RgH3 H3 0 5k
RgH4 H4 0 5k
 

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
settype impedance Xmem_H1R.x1 Xmem_H2R.x1 Xmem_H3R.x1 Xmem_H4R.x1
settype impedance Xmem_H1S.x1 Xmem_H2S.x1 Xmem_H3S.x1 Xmem_H4S.x1
settype impedance Xmem_H1T.x1 Xmem_H2T.x1 Xmem_H3T.x1 Xmem_H4T.x1
settype impedance Xmem_H1U.x1 Xmem_H2U.x1 Xmem_H3U.x1 Xmem_H4U.x1
settype impedance Xmem_H1V.x1 Xmem_H2V.x1 Xmem_H3V.x1 Xmem_H4V.x1
settype impedance Xmem_H1W.x1 Xmem_H2W.x1 Xmem_H3W.x1 Xmem_H4W.x1
* settype impedance Xmem_H1X.x1 Xmem_H2X.x1 
* settype impedance Xmem_H1Y.x1 Xmem_H3Y.x1 
* settype impedance Xmem_H1Z.x1 Xmem_H2Z.x1 Xmem_H3Z.x1 Xmem_H4Z.x1

plot Xmem_H1R.x1 Xmem_H2R.x1 Xmem_H3R.x1 Xmem_H4R.x1
plot Xmem_H1S.x1 Xmem_H2S.x1 Xmem_H3S.x1 Xmem_H4S.x1
plot Xmem_H1T.x1 Xmem_H2T.x1 Xmem_H3T.x1 Xmem_H4T.x1
plot Xmem_H1U.x1 Xmem_H2U.x1 Xmem_H3U.x1 Xmem_H4U.x1
plot Xmem_H1V.x1 Xmem_H2V.x1 Xmem_H3V.x1 Xmem_H4V.x1
plot Xmem_H1W.x1 Xmem_H2W.x1 Xmem_H3W.x1 Xmem_H4W.x1
* plot Xmem_H1X.x1 Xmem_H2X.x1
* plot Xmem_H1Y.x1 Xmem_H3Y.x1
.endc