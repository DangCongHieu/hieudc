#!/bin/bash

##### IPERF
echo " STARTING AT `date`"


echo "START iperf3 server"
iperf3 -s -p 10001 &

echo "START iperf3 flow"

cat list.txt | while read output ; do
RESULT_IPERF=RESULT_IPERF_$output.txt
RESULT_IPERF_UDP=RESULT_IPERF_UDP_$output.txt
for ip in $output; do
    echo "Start at `date`" >> $RESULT_IPERF
    iperf3 -c "$output" -p 10001 -i 1 -b 2M -t 10800 >> $RESULT_IPERF  | iperf3 -c "$output" -p 10001 -i 1 -b 2M -t 10800 >> $RESULT_IPERF_UDP
done
done

##### PING 

echo "PING start"
while true; do
cat list.txt | while read output
    do
        RESULT_PING=RESULT_PING_$output.txt
        for ip in $output ; do
              ping "$output" -c 1 -i 0.5 -W 2 &> /dev/null
                    if [ $? -ne 0 ]; then
                          echo " `date` > node $output is down"  >> $RESULT_PING
                    else
                          echo " `date` > node $output is up" >> $RESULT_PING
                    fi
        done
    done
    sleep 1
done