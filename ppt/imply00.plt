#set terminal X11 noenhanced
set title "imply input{0,0}"
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
plot '../ppt/imply00.data' using 1:2 with lines lw 5 title "P",\
'../ppt/imply00.data' using 3:4 with lines lw 5 title "Q"
set terminal push
set terminal pdf
set out '../ppt/imply00.pdf'
replot
