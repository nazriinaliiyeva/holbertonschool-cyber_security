#!/bin/bash
sudo nmap --scanflags URGACKPSHRSTSYNFIN -p $2 -vv $1 > custom_scan.txt 2>&1
