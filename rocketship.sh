#!/bin/bash

############################################
# Free rocketship simulator 
# Bringing you free rocketships since 2017
###########################################

#engage dangerous chris mode
if  [[ $* == *-chris* ]]; then
 
	printf "(_)_):::::::::::D " 
	
	while :; do
		
		if [[ $* == *-rainbow* ]]; then
			tput setaf $(( 1 + $RANDOM % 6 )) 
		fi
		printf "~"
		sleep 0.03s
	done
#normal mode
else 
	printf "(_)_)::::D " 

	loop=1;
	while [ $loop -lt 30 ]; do
		
		rand=$(( ( RANDOM % 10 )  + 1 ))
		if [ $rand -gt 3 ]; then 
			if [[ $* == *-rainbow* ]]; then
				tput setaf $(( 1 + $RANDOM % 6 )) 
			fi
			printf "~"
		else
			printf " "
		fi
		sleep 0.1s
    	let loop=loop+1
	done
	printf "\n"
fi






 
