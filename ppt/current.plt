#set terminal X11 noenhanced
set title "Current through the memristor(with threshold)"
set xlabel "s (Time)"
set ylabel "A (Current)"
set grid
unset logscale x 
set xrange [0.000000e+00:1.000000e-08]
unset logscale y 
set yrange [-6.882404e-03:2.865581e-03]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot '../ppt/current.data' using 1:2 with lines lw 5 title "i(v1)"
set terminal push
set terminal pdf
set out '../ppt/current.pdf'
replot
