#!/bin/bash

while true
do
    read -p "Enter File Name OR Date : " VAL
    if [ -f ${VAL} ]
    then
      i=1
      for val1 in $(cat ${VAL}); do
        echo $i"] $val1"
        cd /var/spool/voipmonitor
        mkdir -p ${val1}
        cd ${val1}
        aws s3 cp s3://cap-cas/${val1} . --recursive
        i=$((i+1))
      done
    else
      echo "Date:" ${VAL}
      DATE=${VAL}
      cd /var/spool/voipmonitor
      mkdir -p ${DATE}
      cd ${DATE}
      aws s3 cp s3://cap-cas/${DATE} . --recursive
    fi
    read -p "Do You Want To Continue:[Y/N] " v1
    if [[ $v1 == [yY] ]]
    then
	 break
    fi
done
