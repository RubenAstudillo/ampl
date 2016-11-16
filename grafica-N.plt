set term png
set output "grafico.png"
set xlabel "K"
set title "% de error"
plot "datos.dat" using 1:2 title "Nuestro", \
     "datos.dat" using 1:3 title "Relajado"
