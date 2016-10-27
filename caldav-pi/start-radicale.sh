#!/bin/bash

PID_FILE={{ radicale_dir }}/radicale.pid

pgrep -F $PID_FILE
if [ $? -eq 0 ]; then
    echo "Process already running."
    exit 0
else
    rm -f $PID_FILE
fi

source /home/{{ radicale_user }}/radicale-venv/bin/activate
radicale \
  --config {{ radicale_dir }}/radicale.conf \
  --pid $PID_FILE

