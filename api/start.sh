#!/usr/bin/env bash

if [[ "$DEBUG" = "0" ]]; then
  gunicorn split.wsgi:application --bind 0.0.0.0:8000 --workers 3
elif [[ "$DEBUG" = "1" ]]; then
  python manage.py runserver
fi
