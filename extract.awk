BEGIN { count = 0 }

# Problema original en indice 1, problema relajado en 2
$1 ~ /CPLEX/ && $0 ~ /.*objective.*/ {
    count++ ;
    arr[count] = $NF ;
}

# bola
$1 ~ /Gurobi/ {
    arr[3] = $NF ;
}

# loqo
$1 ~ /primal/ && $2 ~ /objective/ {
    arr[4] = $NF
}

END { printf "%f %f %f %f %d\n", arr[1], arr[2], arr[3], arr[4], (arr[4] <= arr[1]) }
