Encoder(4*2) d3=0 d2=1 d1=0 d0=1

.param d3=10K
.param d2=1K
.param d1=10K
.param d0=1K
.param r=10K

.param stime=40ns
.csparam stime={stime}

.param r1=1ns r2=10ns r3=19ns r4=28ns r5=17ns
.param f1=7ns f2=16ns f3=25ns f4=34ns f5=20ns

.param cond = 10
.param sett=10.5
* .param matn1=6
.param matn=6
*  make the matn 8.5 when you need output 0, 6 when output 1, to get better results

XmemH1_D3 H1 D3 memristor Ron=1K Roff=10K Rinit='d3' alpha=0 beta=20e3/stime Vt=1.6
XmemH1_D2 H1 D2 memristor Ron=1K Roff=10K Rinit='d2' alpha=0 beta=20e3/stime Vt=1.6
XmemH1_D1 H1 D1 memristor Ron=1K Roff=10K Rinit='d1' alpha=0 beta=20e3/stime Vt=1.6
XmemH1_D0 H1 D0 memristor Ron=1K Roff=10K Rinit='d0' alpha=0 beta=20e3/stime Vt=1.6

XmemH1_T1 H1 T1 memristor
XmemH1_O1 H1 O1 memristor 

VD3 D3 0 pwl(0 0 'r1' 0 'r1' 'cond' 'f1' 'cond' 'f1' 0 'r2' 0 'r2' 'matn' 'f2' 'matn' 'f2' 0 )
VD2 D2 0 pwl(0 0 'r1' 0 'r1' 'cond' 'f1' 'cond' 'f1' 0 'r2' 0 'r2' 'matn' 'f2' 'matn' 'f2' 0 )
VD1 D1 0 pwl(0 0 'r1' 0 'r1' 'matn' 'f1' 'matn' 'f1' 0 'r2' 0 'r2' 'matn' 'f2' 'matn' 'f2' 0 )
VD0 D0 0 pwl(0 0 'r1' 0 'r1' 'matn' 'f1' 'matn' 'f1' 0 'r2' 0 'r2' 'matn' 'f2' 'matn' 'f2' 0 )
VT1 T1 0 pwl(0 0 'r1' 0 'r1' 'sett' 'f1' 'sett' 'f1' 0 'r2' 0 'r2' 'cond' 'f2' 'cond' 'f2' 0 )
VO1 O1 0 pwl(0 0 'r1' 0 'r1' 'matn' 'f1' 'matn' 'f1' 0 'r2' 0 'r2' 'sett' 'f2' 'sett' 'f2' 0 )

Rg H1 0 5k


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
* set color0=white
* set color1=black
* set color2=rgb:f/0/0
* set color3=rgb:0/0/f
* set color4=rgb:0/f/f

* set hcopydevtype=postscript
* set hcopyscolor=0

settype impedance XmemH1_O1.x1 XmemH1_T1.x1 XmemH1_D1.x1  XmemH1_D2.x1 XmemH1_D3.x1 XmemH1_D0.x1 
gnuplot ../ppt/encxd2d0 XmemH1_O1.x1 XmemH1_D0.x1 XmemH1_D1.x1  XmemH1_D2.x1 XmemH1_D3.x1 
* hardcopy ../epss/encoderXd31.eps XmemH1_O1.x1 XmemH1_D0.x1 XmemH1_D1.x1  XmemH1_D2.x1 XmemH1_D3.x1 
.endc