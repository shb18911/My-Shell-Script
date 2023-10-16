#!/bin/bash
mem=`df -h . | awk -F " " 'NR==2 {print $(NF-1)}' | sed 's/%//g'`

if [ $mem -ge 30 ] ; then
        # echo "This is the email body." | mail -s "Subject of the email" bharathsh98@gmail.com sh
          echo "Disk Usage Alert !!!" | mail -s "Disk usage reached threshould value" bharathsh98@gmail.com
fi
