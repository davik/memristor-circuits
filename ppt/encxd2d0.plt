#set terminal X11 noenhanced
set title "Encoder(4X2) d3=0 d2=1 d1=0 d0=1"
set xlabel "s (time)"
set ylabel "Ohms (resistance)"
set grid
unset logscale x 
set xrange [0.000000e+00:4.000000e-08]
unset logscale y 
set yrange [-5.000000e+02:1.050000e+04]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot '../ppt/encxd2d0.data' using 1:2 with lines lw 5 title "o1",\
'../ppt/encxd2d0.data' using 3:4 with lines lw 5 title "d0",\
'../ppt/encxd2d0.data' using 5:6 with lines lw 5 title "d1",\
'../ppt/encxd2d0.data' using 7:8 with lines lw 5 title "d2",\
'../ppt/encxd2d0.data' using 9:10 with lines lw 5 title "d3"
set terminal push
set terminal pdf
set out '../ppt/encxd2d0.pdf'
replot
