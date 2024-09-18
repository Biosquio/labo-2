#!/bin/bash
if [[$# -lt 2]]; then
	echo "Uso: $0 <nombre_proceso> <comando_para_ejecutarlo>"
	exit 1
fi

PROC_NAME=$1
COMMAND=$2

while true; do
	PID=$(pgrep $PROC_NAME)
	if [ -z "$PID"]; then
		echo "$PROC_NAME Apagado. Reiniciando..."
		$COMMAND &
	else
		echo "$PROC_NAME està corriendo con $PID"
	fi
	sleep 5
done

