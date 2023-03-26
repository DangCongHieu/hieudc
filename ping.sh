#!/bin/bash
        
        FILE=ping_test.txt
        TARGET=172.25.240.36

          touch $FILE
          while true;
          do
            DATE=$(date '+%d/%m/%Y %H:%M:%S')
            ping -c 1 $TARGET &> /dev/null
            if [[ $? -ne 0 ]]; then
              echo "ERROR "$DATE >> $FILE
            else
              echo "OK "$DATE >> $FILE
            fi
              sleep 1
          done
          


