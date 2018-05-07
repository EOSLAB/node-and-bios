#!/bin/bash

NODE_DIR="$HOME/nodes/private"

RESYNC=$1

if [[ (-n "$RESYNC") && "$RESYNC" == "resync" ]]
then
nohup nodeos --resync --config-dir $NODE_DIR --data-dir $NODE_DIR/data-dir  &> $NODE_DIR/output.log &
else
nohup nodeos --config-dir $NODE_DIR --data-dir $NODE_DIR/data-dir  &> $NODE_DIR/output.log &
fi

echo $! > $NODE_DIR/scripts/data/nodeos.pid
echo "Process started on $!"
