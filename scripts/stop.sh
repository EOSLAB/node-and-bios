#!/bin/bash

pid=`cat ~/nodes/private/scripts/data/nodeos.pid`
kill $pid
rm ~/nodes/private/scripts/data/nodeos.pid
echo "Killed process $pid"
