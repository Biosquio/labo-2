#!/bin/bash
if [ -z "$1" ]; then
    echo "Uso: $0 <ejecutable>"
    exit 1
fi

EXEC=$1
LOGFILE="monitor.log"

echo "CPU(%) MEM(%) TIME" > $LOGFILE

$EXEC &  # Ejecuta el ejecutable en segundo plano
PID=$!

while kill -0 $PID 2>/dev/null; do
    CPU=$(ps -p $PID -o %cpu=)
    MEM=$(ps -p $PID -o %mem=)
    TIME=$(date "+%Y-%m-%d %H:%M:%S")
    echo "$CPU $MEM $TIME" >> $LOGFILE
    sleep 5
done

# Generar la gráfica con gnuplot
gnuplot -e "
set terminal png size 800,600;
set output 'cpu_mem_usage.png';
set title 'Uso de CPU y Memoria';
set xlabel 'Tiempo';
set ylabel 'Porcentaje';
set grid;
plot '$LOGFILE' using 3:1 with lines title 'CPU (%)', \
     '$LOGFILE' using 3:2 with lines title 'MEM (%)';
"
