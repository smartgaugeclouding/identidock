#!/bin/bash
set -e

if [ "$ENV" = 'DEV' ]; then
  echo "Arrancando desde el servidor de Desarollo-SmartQuail"
  exec python "identidock.py"
elif [ "$ENV" = 'UNIT' ]; then
  echo "Corriendo unidad de prueba"
  exec python "test.py"
else
  echo "Arrancando desde el servidor de Produccion-SmartQuail"
  exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identidock.py --callable app --stats  0.0.0.0:9191
fi