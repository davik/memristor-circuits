set terminal X11 noenhanced
set title "imply nand"
set xlabel "s"
set ylabel "Ohms"
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
plot '../epss/gnunand.data' using 1:2 with lines lw 1 title "xinputp.x1",\
'../epss/gnunand.data' using 3:4 with lines lw 1 title "xinputq.x1",\
'../epss/gnunand.data' using 5:6 with lines lw 1 title "xoutputs.x1"
set terminal push
set terminal postscript eps color noenhanced
set out '../epss/gnunand.eps'
replot
set term pop
replot
