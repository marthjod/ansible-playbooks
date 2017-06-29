#!/bin/bash

PID_FILE={{ radicale_dir }}/radicale.pid

if [ -f $PID_FILE ]; then
    pgrep -F $PID_FILE
    if [ $? -eq 0 ]; then
        echo "Process already running."
        exit 0
    else
        rm -f $PID_FILE
    fi
fi

python3 -m radicale \
  --config {{ radicale_dir }}/radicale.conf \
  --pid $PID_FILE
