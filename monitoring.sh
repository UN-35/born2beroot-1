#!/bin/bash

wall "
	#Architecture	: $(uname -a)
	#CPU physical	: $(cat /proc/cpuinfo | grep processor | wc -l)
	#vCPU		: $(cat /proc/cpuinfo | grep processor | wc -l)
	#Memory Usage	: $(free -m | awk 'NR==2{printf "#Memory Usage: %s/%sMB (%.2f%%)", $3,$2,$3*100/$2 }')
	#Disk Usage	: 
	#CPU load	: 
	#Last boot	: 
	#LVM use	: 
	#Connexions TCP	: 
	#User log	: 
	#Network	: 
	#Sudo		: 
"
