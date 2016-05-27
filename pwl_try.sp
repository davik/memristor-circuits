* hello

V1 1 0 PWL(0 5 10.4us 5 10.4us 8 14us 8 15us -6)
* V1 1 0 PULSE(-1 1 2ns 2ns 2ns 50ns 100ns)
R1 1 0 10k

.control
tran 1us 20us
plot v(1)
.endc

.end