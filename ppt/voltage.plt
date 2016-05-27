#set terminal X11 noenhanced
set title "Sine Voltage source"
set xlabel "s (Time)"
set ylabel "V (Voltage)"
set grid
unset logscale x 
set xrange [0.000000e+00:1.000000e-08]
unset logscale y 
set yrange [-5.497993e+00:5.497993e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot '../ppt/voltage.data' using 1:2 with lines lw 5 title "v(1)"
set terminal push
set terminal pdf
set out '../ppt/voltage.pdf'
replot
