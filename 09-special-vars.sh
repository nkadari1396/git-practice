#!/bin/bash

echo "All variables passed to the script: $@"


echo "How many variables passed to the script: $#"

echo "name of the script: $0"

echo "current working directory: $PWD"

echo "home directory of current user: $HOME"

echo "process id of the present script: $$"

sleep 100 &

echo "PID of last background command: $!"