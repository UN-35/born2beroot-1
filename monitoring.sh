#!/bin/bash

tram=$(free -m | awk '$1 == "Mem:" {print $2}')
uram=$(free -m | awk '$1 == "Mem:" {print $3}')
pram=$(free | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')

wall "
	#Architecture	: $(uname -a)
	#CPU physical	: $(cat /proc/cpuinfo | grep processor | wc -l)
	#vCPU		: $(cat /proc/cpuinfo | grep processor | wc -l)
	#Memory Usage	: $uram/${tram}MB ($pram%)
	#Disk Usage	: $(df --total -h | awk '$1 == "total" {printf("%d/%dGb (%.2f%%)", $3 * 1024, $2, ($3 * 100) / $2)}')
	#CPU load	: $(top -bn1 | grep '^%Cpu' | awk '{printf("%.2f%%", $2 + $4)}')
	#Last boot	: $(who -b | awk '{print $3 " " $4}')
	#LVM use	: 
	#Connexions TCP	: 
	#User log	: 
	#Network	: 
	#Sudo		: 
"
