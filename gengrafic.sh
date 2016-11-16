for n in {100,150,200,250}
do
  for k in $(seq 5 5 50)
  do
    dat=$(gawk -v N=${k} -f ../extract.awk log/res-N${n}-K${k}.txt)
    echo $dat >> datos.dat
  done
  gnuplot -c ../grafica-N.plt
  mv grafico.png graficos/N${n}.png
  mv datos.dat graficos/datos-${n}.dat
done
