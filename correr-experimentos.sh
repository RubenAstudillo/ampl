N=$1

for K in {5,10,15,20,25,30,35,40,45,50}
do
    archivo=res-N${N}-K${K}.txt
    printf "param N:= %d;\nparam K:= %d;\n" $N $K 1> CC.dat
    wine64 cmd /c 'clean.bat'
    \time zsh -c "wine64 cmd /c 'run.bat' 1> log/$archivo 2>&3" 2>>log/times 3>&1
done
