set term png
set output "grafico.png"
set xlabel "N"
set title "Porcentaje de error K=25"
plot "datos.dat" using 1:2 title "Nuestro", \
     "datos.dat" using 1:3 title "Relajado"
