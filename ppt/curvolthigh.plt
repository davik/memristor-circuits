#set terminal X11 noenhanced
set title "Current Vs Voltage with High Frequency, memristor with threshold"
set xlabel "V (voltage)"
set ylabel "A (current)"
set grid
unset logscale x 
set xrange [-4.792609e+00:4.792609e+00]
unset logscale y 
set yrange [-9.009425e-04:8.943956e-04]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot '../ppt/curvolthigh.data' using 1:2 with lines lw 5  title "i(v1) vs v(1)"
set terminal push
set terminal pdf
set out '../ppt/curvolthigh.pdf'
replot
