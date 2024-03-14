#!/bin/bash
yum install nrpe nagios-plugins* -y
echo "allowed_hosts=127.0.0.1, 192.168.0.61" > /etc/nagios/nrpe.cfg
systemctl restart nrpe

