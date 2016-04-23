Lab 1, Circuit 1

Vin n1 0 SIN(0V 2V 2k)

R1 n1 n2 1k
R2 n2 0 10k

.control
tran 10us 2ms
plot v(n2)
hardcopy circuit1_tran.ps v(n2)
.endc

.end