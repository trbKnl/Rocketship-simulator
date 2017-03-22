#!/bin/bash

############################################
# Free rocketship simulator 
# Bringing you free rocketships since 2017
###########################################


function chrisMode {

tput sgr0
printf "(_)_):::::::::::D " 

keypress=''
while [ "x$keypress" = "x" ]; do		
			if [[ $* == *-rainbow* ]]; then
				tput setaf $(( 0 + $RANDOM % 6 )) 
			fi
			printf "~"
		sleep 0.01 
	 keypress="`cat -v`"
done

printf "\n"

chrisMode $*

}


##engage dangerous chris mode
if  [[ $* == *-chris* ]]; then

	if [ -t 0 ]; then stty -echo -icanon -icrnl time 0 min 0; fi

	chrisMode $*

	if [ -t 0 ]; then stty sane; fi

#normal mode
else 
	printf "(_)_)::::D " 

	for((i = 1; i < 31; i++)); do
		
		rand=$(( ( RANDOM % 9 )  + 1 ))
		if [ $rand -gt 2 ]; then 
			if [[ $* == *-rainbow* ]]; then
				tput setaf $(( 0 + $RANDOM % 6 )) 
			fi
			printf "~"
		else
			printf " "
		fi
		sleep 0.03s
	done
	printf "\n"
fi







