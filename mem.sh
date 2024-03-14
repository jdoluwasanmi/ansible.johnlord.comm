#!/bin/bash
yum install wget -y
cd /usr/lib64/nagios/plugins/
wget https://raw.githubusercontent.com/justintime/nagios-plugins/master/check_mem/check_mem.pl
mv check_mem.pl check_mem
chmod +x check_mem
./check_mem -f -w 20 -c 10
