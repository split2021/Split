#!/bin/bash

# Start Gunicorn processes
echo Starting Gunicorn.
exec gunicorn split.wsgi:application \
    --bind 0.0.0.0:8000 \
    --workers 3
