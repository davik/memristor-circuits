#set terminal X11 noenhanced
set title "Current Vs Voltage plot, memristor with threshold"
set xlabel "V (voltage)"
set ylabel "A (current)"
set grid
unset logscale x 
set xrange [-4.998175e+00:4.998175e+00]
unset logscale y 
set yrange [-6.882404e-03:2.865581e-03]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot '../ppt/curvolt.data' using 1:2 with lines lw 5 title "i(v1) vs V(1)"
set terminal push
set terminal pdf
set out '../ppt/curvolt.pdf'
replot
