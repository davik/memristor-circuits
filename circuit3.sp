Lab 1, Circuit 2

Vin 0 n1 SIN(0 2 2k)

C1 n1 n2 1n
R1 n2 0 10k

.control
tran 10us 2ms
plot v(n2)
hardcopy circuit3_n2trans.ps v(n2)
hardcopy circuit3_n1trans.ps v(n1)
.endc

.end