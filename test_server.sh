#!/bin/bash

echo "Start server"
./iperf_server.sh &
./iperf_server1.sh &
