IMPLY NAND


.param stime=10ns
.param vmax=3
.param cond = 10
.param set=10.5
.param maintain=8.5
.param p=10K
.param q=10k
** p, q are input to the nand gate
.param s=10k 
*S is the output memristor 
.param first_rising_edge=1ns
.param first_falling_edge=4ns
.param second_rising_edge=5ns
.param second_falling_edge=8ns



.csparam stime={stime}
.csparam vmax={vmax}

XinputP 4 1 memristor Ron=1K Roff=10K Rinit='p' alpha=0 beta=20e3/stime Vt=1.6
XinputQ 4 2 memristor Ron=1K Roff=10K Rinit='q' alpha=0 beta=20e3/stime Vt=1.6
XoutputS 4 3 memristor Ron=1K Roff=10K Rinit='s' alpha=0 beta=20e3/stime Vt=1.6
Vp 1 0 PWL(0 0 'first_rising_edge' 0 'first_rising_edge' 'cond' 'first_falling_edge' 'cond' 'first_falling_edge' 0 'second_rising_edge' 0 'second_rising_edge' 'maintain' 'second_falling_edge' 'maintain' 'second_falling_edge' 0)
Vq 2 0 PWL(0 0 'first_rising_edge' 0 'first_rising_edge' 'maintain' 'first_falling_edge' 'maintain' 'first_falling_edge' 0 'second_rising_edge' 0 'second_rising_edge' 'cond' 'second_falling_edge' 'cond' 'second_falling_edge' 0)
Vs 3 0 PWL(0 0 'first_rising_edge' 0 'first_rising_edge' 'set' 'first_falling_edge' 'set' 'first_falling_edge' 0 'second_rising_edge' 0 'second_rising_edge' 'set' 'second_falling_edge' 'set' 'second_falling_edge' 0)
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
* plot v(1), v(2), v(3)
settype impedance XinputP.x1 XinputQ.x1 XoutputS.x1
* plot XinputP.x1 XinputQ.x1 XoutputS.x1

set color0=white
set color1=black
set color2=rgb:f/0/0
set color3=rgb:0/0/f
set color4=rgb:0/f/f

set hcopydevtype=postscript
set hcopyscolor=0
* hardcopy ../epss/nandvolt.eps v(1), v(2), v(3)
* hardcopy ../epss/NAND00.eps XinputP.x1 XinputQ.x1 XoutputS.x1
set gnuplot_terminal=png

gnuplot image XinputP.x1 XinputQ.x1 XoutputS.x1 

.endc