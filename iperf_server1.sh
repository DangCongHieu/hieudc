#!/bin/bash
        
        FILE1=TCP_test_server_4.txt
        FILE2=UDP_test_server_4.txt

        touch $FILE1
        touch $FILE2
        DATE=$(date '+%d/%m/%Y %H:%M:%S')
        echo $DATE
        iperf3 -s -p 20019 >> $FILE1 | iperf3 -s -p 20020 >> $FILE2
