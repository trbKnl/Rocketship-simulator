#!/bin/bash

original_tty_state=$(stty -g)
message=""
filler="~\n~\n~\n~\n "
foo="~"
bow="::::::::::::::::::"
offset=1

returnMessage() {
    totalCols=$(tput cols)
    size=$(($totalCols-${#ship}))
    #size=30
    newMessage=$1$2
    if [ "${#newMessage}" -gt "$size" ]; then
        newMessage=$(printf "$newMessage" | cut -c1-"$size")
    fi

    printf "$newMessage"
} 


rocketship() {
    shiplength=$(( ( RANDOM % 10 ) + $offset ))
    ship="(_)_)"$(printf $bow | cut -c 1-"$shiplength")"D"
    keypress=""
    message=""
    while true ; do

        for ((x=1; x<=10; x++)) {
            if [ "x$keypress" != "x" ]; then
                printf "\n"
                rocketship "$foo"
            fi 
            fuel=$(printf "$filler" | sort -R | head -n 1)
            message=$(returnMessage "$fuel" "$message")
            printf "\r$ship$message"
            sleep 0.01
            keypress="`cat -v`"
        }

        for ((i=${#foo}; i>=0; i--)); do
            if [ "x$keypress" != "x" ]; then
                printf "\n"
                rocketship "$foo"
            fi 
            message=$(returnMessage "${foo:$i:1}" "$message")
            printf "\r$ship$message"
            sleep 0.01
            keypress="`cat -v`"
        done

        for ((x=1; x<=10; x++)) {
            if [ "x$keypress" != "x" ]; then
                printf "\n"
                rocketship "$foo"
            fi 
            fuel=$(printf "$filler" | sort -R | head -n 1)
            message=$(returnMessage "$fuel" "$message")
            printf "\r$ship$message"
            sleep 0.01

            keypress="`cat -v`"
        }
    done

}

trap "stty $original_tty_state" EXIT

while [ "$1" != "" ]; do
    case $1 in
        -m | --message )        shift
                                foo=$1
                                ;;
        -c | --chris )          offset=10
    esac
    shift
done


if [ -t 0 ]; then stty -echo -icanon -icrnl time 0 min 0; fi

rocketship "$foo"





