#!/bin/bash
set -e

if [ "$ENV" = 'DEV' ]; then
  echo "Running in dev mode"
  exec python "ident.py"
else
  echo "Running in prod mode"
  exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/ident.py --callable app --stats 0.0.0.0:9191
fi
