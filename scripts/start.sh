#!/bin/bash

nohup nodeos --config-dir ~/nodes/private --data-dir ~/nodes/private/data-dir  &> ~/nodes/private/output.log &
echo $! > ~/nodes/private/scripts/data/nodeos.pid
echo "Process started on $!"
