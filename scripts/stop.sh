#!/bin/bash

# vars
. settings.sh

pid=`cat $NODE_DIR/scripts/data/nodeos.pid`
kill $pid
rm $NODE_DIR/scripts/data/nodeos.pid
echo "Killed process $pid"
