Lab 1, Circuit 1

Vin n1 0 DC 5V

R1 n1 n2 1k
R2 n2 0 10k

.control
dc Vin 0V 5V 0.1V
plot v(n2)
hardcopy circuit1_dc.ps v(n2)
meas dc y FIND v(n2) AT=1
echo Solution: vout = vin*$&y
.endc

.end