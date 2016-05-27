IMPly WITH PROVIDED MODEL

.param stime=10n
.param vmax = 3
.param p=10K
.param q=10K


* send parameters to the .control section
.csparam stime={stime}
.csparam vmax={vmax}

amemp 3 1 memristor_p
.MODEL memristor_p memristor(rmin=1k rmax=10k rinit='p'  alpha=0 beta=2e13 vt=1.6)
amemq 4 2 memristor_q
.MODEL memristor_q memristor(rmin=1k rmax=10k rinit='q'  alpha=0 beta=2e13 vt=1.6)
Vcond 1 0 PWL(0 0 1ns 0 1ns 8 2ns 8 2ns 0)
Vset 2 0 PWL(0 0 1ns 0 1ns 8.5 2ns 8.5 2ns 0)
Rg 5 0 5k



.control
let deltime = stime/100
let totaltime= stime*3
tran $&deltime $&totaltime uic
settype impedance amemp.x1 amemq.x1
plot amemp.x1 amemq.x1
.endc

