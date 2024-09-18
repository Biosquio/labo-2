#!/bin/bash
DIRECTORY="/ruta/al/directorio"
LOGFILE="changes.log"

inotifywait -m -e create -e modify -e delete $DIRECTORY |
while read path action file; do
    echo "$(date): Se ha detectado $action en $file" >> $LOGFILE
done
