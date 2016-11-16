function err(a, b) {
    temp = ((a - b) / b) * 100 ;
    return temp
}

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

# primero nuestra mejor, segundo el relajado
END { printf "%d %f %f", N, err(arr[1], arr[4]), err(arr[1], arr[2]) }
