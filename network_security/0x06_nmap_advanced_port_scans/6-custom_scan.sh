#!/bin/bash
sudo nmap --scanflags URG,ACK,PSH,RST,SYN,FIN -p $2 $1 -oN custom_scan.txt > /dev/null 2>&1
