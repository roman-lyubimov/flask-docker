#!/bin/sh

uwsgi --plugins http,python3 --http 0.0.0.0:5000 --wsgi-file server.py --callable app -H /usr/src/app/venv
