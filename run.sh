#!/bin/bash

killall gunicorn
sleep 2
gunicorn -c gunicorn.conf optico:app -D