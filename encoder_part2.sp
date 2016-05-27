Encoder(4*2) d3=0 d2=1 d1=0 d0=1

.param d3=10K
.param d2=1K
.param d1=10K
.param d0=1k
.param r=10K

.param stime=40ns
.csparam stime={stime}

.param r1=1ns r2=10ns r3=19ns r4=28ns r5=17ns
.param f1=7ns f2=16ns f3=25ns f4=34ns f5=20ns

.param cond = 10
.param sett=10.5
* .param matn1=6
.param matn=8.5
*  make the matn 8.5 when you need output 0, 6 when output 1, to get better results

XmemH1_D3 H1 D3 memristor Ron=1K Roff=10K Rinit='d3' alpha=0 beta=20e3/stime Vt=1.6
XmemH1_D2 H1 D2 memristor Ron=1K Roff=10K Rinit='d2' alpha=0 beta=20e3/stime Vt=1.6
XmemH1_D1 H1 D1 memristor Ron=1K Roff=10K Rinit='d1' alpha=0 beta=20e3/stime Vt=1.6
XmemH1_D1b H1 D1b memristor
XmemH1_D0 H1 D0 memristor Ron=1K Roff=10K Rinit='d0' alpha=0 beta=20e3/stime Vt=1.6

XmemH1_T1 H1 T1 memristor
XmemH1_T2 H1 T2 memristor
XmemH1_O1 H1 O1 memristor 

VD3 D3 0 pwl(0 0 'r1' 0 'r1' 'matn' 'f1' 'matn' 'f1' 0 'r2' 0 'r2' 'matn' 'f2' 'matn' 'f2' 0 'r3' 0 'r3' 'cond' 'f3' 'cond' 'f3' 0 'r4' 0 'r4' 'matn' 'f4' 'matn' 'f4' 0 )
VD2 D2 0 pwl(0 0 'r1' 0 'r1' 'matn' 'f1' 'matn' 'f1' 0 'r2' 0 'r2' 'cond' 'f2' 'cond' 'f2' 0 'r3' 0 'r3' 'matn' 'f3' 'matn' 'f3' 0 'r4' 0 'r4' 'matn' 'f4' 'matn' 'f4' 0 )
VD1 D1 0 pwl(0 0 'r1' 0 'r1' 'cond' 'f1' 'cond' 'f1' 0 'r2' 0 'r2' 'matn' 'f2' 'matn' 'f2' 0 'r3' 0 'r3' 'matn' 'f3' 'matn' 'f3' 0 'r4' 0 'r4' 'matn' 'f4' 'matn' 'f4' 0 )
VD1b D1b 0 pwl(0 0 'r1' 0 'r1' 'sett' 'f1' 'sett' 'f1' 0 'r2' 0 'r2' 'cond' 'f2' 'cond' 'f2' 0 'r3' 0 'r3' 'matn' 'f3' 'matn' 'f3' 0 'r4' 0 'r4' 'matn' 'f4' 'matn' 'f4' 0 )
VD0 D0 0 pwl(0 0 'r1' 0 'r1' 'matn' 'f1' 'matn' 'f1' 0 'r2' 0 'r2' 'matn' 'f2' 'matn' 'f2' 0 'r3' 0 'r3' 'matn' 'f3' 'matn' 'f3' 0 'r4' 0 'r4' 'matn' 'f4' 'matn' 'f4' 0 )
VT1 T1 0 pwl(0 0 'r1' 0 'r1' 'matn' 'f1' 'matn' 'f1' 0 'r2' 0 'r2' 'sett' 'f2' 'sett' 'f2' 0 'r3' 0 'r3' 'cond' 'f3' 'cond' 'f3' 0 'r4' 0 'r4' 'matn' 'f4' 'matn' 'f4' 0 )
VT2 T2 0 pwl(0 0 'r1' 0 'r1' 'matn' 'f1' 'matn' 'f1' 0 'r2' 0 'r2' 'matn' 'f2' 'matn' 'f2' 0 'r3' 0 'r3' 'sett' 'f3' 'sett' 'f3' 0 'r4' 0 'r4' 'cond' 'f4' 'cond' 'f4' 0 )
VO1 O1 0 pwl(0 0 'r1' 0 'r1' 'matn' 'f1' 'matn' 'f1' 0 'r2' 0 'r2' 'matn' 'f2' 'matn' 'f2' 0 'r3' 0 'r3' 'matn' 'f3' 'matn' 'f3' 0 'r4' 0 'r4' 'sett' 'f4' 'sett' 'f4' 0 )

Rg H1 0 3k


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


settype impedance XmemH1_D1b.x1 XmemH1_D1.x1 XmemH1_T1.x1 XmemH1_D2.x1 XmemH1_T2.x1 XmemH1_O1.x1
gnuplot ../ppt/encyd2d0 XmemH1_O1.x1 XmemH1_D0.x1 XmemH1_D1.x1  XmemH1_D2.x1 XmemH1_D3.x1
* hardcopy ../epss/encoderYd31.eps XmemH1_O1.x1 XmemH1_D0.x1 XmemH1_D1.x1  XmemH1_D2.x1 XmemH1_D3.x1 
plot XmemH1_O1.x1 XmemH1_D0.x1 XmemH1_D1.x1  XmemH1_D2.x1 XmemH1_D3.x1

.endc