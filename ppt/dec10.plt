#set terminal X11 noenhanced
set title "Decoder with input {1,0}"
set xlabel "s (time)"
set ylabel "Ohms (resistance)"
set grid
unset logscale x 
set xrange [0.000000e+00:1.000000e-08]
unset logscale y 
set yrange [-5.000000e+02:1.050000e+04]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot '../ppt/dec10.data' using 1:2 with lines lw 5 title "z1",\
'../ppt/dec10.data' using 3:4 with lines lw 5 title "z2",\
'../ppt/dec10.data' using 5:6 with lines lw 5 title "z3",\
'../ppt/dec10.data' using 7:8 with lines lw 5 title "z4",\
'../ppt/dec10.data' using 9:10 with lines lw 5 title "x",\
'../ppt/dec10.data' using 11:12 with lines lw 5 title "y"
set terminal push
set terminal pdf
set out '../ppt/dec10.pdf'
replot

