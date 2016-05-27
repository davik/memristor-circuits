Memristor with threshold


.param stime=10n
.param vmax = 5

* send parameters to the .control section
.csparam stime={stime}
.csparam vmax={vmax}

Xmem 1 0 memristor

V1 0 1 DC 0 sin(0 'vmax' '10/stime')


.subckt memristor plus minus PARAMS: Ron=1K Roff=10K Rinit=7.0K alpha=0 beta=20e3/stime Vt=1.6 
Bx 0 x I='((f1(V(plus)-V(minus))> 0) && (V(x) < Roff)) ? {f1(V(plus)-V(minus))}: ((((f1(V(plus)-V(minus)) < 0) && (V(x)>Ron)) ? {f1(V(plus)-V(minus))}: 0)) '
Vx x x1 dc 0
Cx x1 0 1 IC={Rinit} 
Rmem plus minus r={V(x)} 
.func f1(y)={beta*y+0.5*(alpha-beta)*(abs(y+Vt)-abs(y-Vt))} 
.ends

* transient simulation same programming voltage but rising frequencies
.control
*** first simulation ***
* approx. 100 simulation points
let deltime = stime/100
tran $&deltime $&stime uic

******************
*Avik EDIT
*******************

gnuplot ../ppt/curvolthigh i(v1) vs v(1)
* gnuplot ../ppt/current i(v1)
* gnuplot ../ppt/voltage v(1)

****************************************************************
* plot i(v1) vs v(1)
*** you may just stop here ***		
* * raise the frequency
* let newfreq = 1.1/stime
* let newstime = stime/1.1
* let deltime = newstime/100
* alter @V1[sin] [ 0 $&vmax $&newfreq ]
* tran $&deltime $&newstime uic
* * raise the frequency even more
* let newfreq = 1.4/stime
* let newstime = stime/1.4
* let deltime = newstime/100
* alter @V1[sin] [ 0 $&vmax $&newfreq ]
* tran $&deltime $&newstime uic
* * the 'programming' currents
* plot tran1.alli tran2.alli alli title 'Memristor with threshold: Internal Programming currents'
* hardcopy mem_new.ps tran1.alli tran2.alli alli title 'Memristor with threshold: Internal Programming currents'
* * resistance versus time plot
* settype impedance xmem.x1 tran1.xmem.x1 tran2.xmem.x1
* plot xmem.x1 tran1.xmem.x1 tran2.xmem.x1 title 'Memristor with threshold: resistance'
* * resistance versus voltage (change occurs only above threshold!)
* plot xmem.x1 vs v(1) tran1.xmem.x1 vs tran1.v(1) tran2.xmem.x1 vs tran2.v(1) title 'Memristor with threshold: resistance'
* * current through resistor for all plots versus voltage
* plot i(v1) vs v(1) tran1.i(v1) vs tran1.v(1) tran2.i(v1) vs tran2.v(1) title 'Memristor with threshold: external current loops'
.endc

.end
