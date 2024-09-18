#!/bin/bash

if [ -z "$1" ]; then
	echo "Ingrese un ID para el proceso"
	exit 1
fi

PID=$1
NAME_PRO=$(ps -p $PID -o comm=)
IDPP=$(ps -p $PID -o ppid=)
USER=$(ps -p $PID -o user=)
CPU=$(ps -p $PID -o %cpu=)
MEM=$(ps -p $PID -o %mem=)
STATUS=$(ps -p $PID -o stat=)
EXEC_PATH=$(readlink -f /proc/$PID/exe)

echo "Nombre del proceso: $NAME_PRO"
echo "ID del proceso: $PID"
echo "ID del proceso papà: $IDPP"
echo "Usuario propietario: $USER"
echo "Uso del CPU: $CPU%"
echo "Consumo de memoria: $MEM%"
echo "Estado: $STATUS"
echo "Ruta al ejecutable: $EXEC_PATH"

