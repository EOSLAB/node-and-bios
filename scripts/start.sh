#!/bin/bash

NODE_DIR="$HOME/nodes/private"

nohup nodeos --config-dir $NODE_DIR --data-dir $NODE_DIR/data-dir  &> $NODE_DIR/output.log &
echo $! > $NODE_DIR/scripts/data/nodeos.pid
echo "Process started on $!"
