#!/bin/bash
sudo nmap -sS --scanflags URGACKPSHRSTSYNFIN -p $2 $1 -n -oN custom_scan.txt > /dev/null 2>&1
