#!/bin/bash
        
        FILE1=TCP_test.txt
        FILE2=UDP_test.txt
        TARGET=172.25.240.61

        touch $FILE1
        touch $FILE2
        DATE=$(date '+%d/%m/%Y %H:%M:%S')
        echo $DATE
        iperf3 -c "$TARGET" -p 20000 -t 6000 >> $FILE1 | iperf3 -c "$TARGET" -p 20001 -t 6000 -u >> $FILE2
        