for n in {100,150,200,250,300,350}
do
  for k in $(seq 5 5 50)
  do
    dat=$(gawk -v N=${k} -f ../extract.awk log/res-N${n}-K${k}.txt)
    echo $dat >> datos.dat
  done
  gnuplot -c ../grafica-N.plt
  mv grafico.png graficos/N${n}.png
  mv datos.dat graficos/datos-N${n}.dat
done

k=25
for n in {100,150,200,250,300,350}
do
  dat=$(gawk -v N=${n} -f ../extract.awk log/res-N${n}-K${k}.txt)
  echo $dat >> datos.dat
done
gnuplot -c ../grafica-K.plt
mv grafico.png graficos/K${k}.png
mv datos.dat graficos/datos-K${k}.dat
