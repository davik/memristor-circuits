Lab 1, Circuit 2


.param r1=1ns r2=5ns r3=9ns r4=13ns r5=17ns
.param f1=4ns f2=8ns f3=12ns f4=16ns f5=20ns
.param cond = 10
.param set=10.5
.param matn=9

Vin n1 0 pwl(0 0 'r1' 0 'r1' 'cond' 'f1' 'cond' 'f1' 0 'r2' 0 'r2' 'matn' 'f2' 'matn' 'f2' 0 'r3' 0 'r3' 'matn' 'f3' 'matn' 'f3' 0 'r4' 0 'r4' 'matn' 'f4' 'matn' 'f4' 0 'r5' 0 'r5' 'matn' 'f5' 'matn' 'f5' 0)

R1 n1 0 10k

.control
tran .5ns 25ns
plot v(n1)
hardcopy circuit3_n2trans.ps v(n2)
hardcopy circuit3_n1trans.ps v(n1)
.endc

.end