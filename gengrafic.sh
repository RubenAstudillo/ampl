for n in {100,150,200,250}
do
  for k in $(seq 5 5 50)
  do
    dat=$(gawk -f ../extract.awk log/res-N${n}-K${k}.txt)
    echo $k $dat >> datos.dat
  done
  gnuplot -c ../grafica.plt
  mv grafico.png graficos/N${n}.png
  rm datos.dat
done
