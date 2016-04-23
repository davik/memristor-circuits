Lab 1, Circuit 2

Vin n1 0 DC 0V AC 1 SIN(1V 2V 10k)

R1 n1 n2 10k
C1 n2 0 1n

.control
********** 
* Transient
********** 
tran 1u 1m
plot v(n2)
hardcopy circuit2_tran.ps v(n2)

**********
* AC
**********
ac dec 10 100 10e6

set units=degrees
plot vdb(n2)
plot vp(n2)
hardcopy magnitude_circuit2.ps vdb(n2)
hardcopy phase_circuit2.ps vp(n2)

meas ac y1 FIND vdb(n2) at=1k
meas ac y2 FIND vdb(n2) at=10k
meas ac y3 FIND vdb(n2) at=50k
meas ac f3db when vdb(n2)=-3
meas ac p3db FIND vp(n2) at $&f3db
echo The -3dB frequency is $&f3db Hz
echo with phase phi=$&p3db degrees
.endc
.end