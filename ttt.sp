test

V1 1 0 PWL(0 5 2ns 5 6ns 8)
R1 1 2 10k
V2 2 0 0V

.control
tran 10us 10ns
plot i(0 1), i(v2)
plot v(1)
.endc