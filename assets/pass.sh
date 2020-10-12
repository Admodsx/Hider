#!/bin/bash
FILE=/sdcard/Android/data/com.hider/files/.res/.ps
psfile="$(cat /sdcard/Android/data/com.hider/files/.res/.ps 2>/dev/null)"

if test -f "$FILE"; then
    while 
    echo -e "\e[1;34m   Password:"
    read -r pass
    [[ $pass != $psfile ]] || [[ $pass = \x0a ]]
    do echo "Incorrect password, please try again" ; sleep 1 ; echo -e "\nPassword: $RANDOM" ; sleep 0.5 ; clear ; done
    clear
    echo "Loading" && sleep 0.15 && clear && echo "Loading." && sleep 0.35 && clear && echo "Loading.." && sleep 0.45 && clear && echo "Loading..." && sleep 0.55 && clear && echo "Loading... Complete" && sleep 1.05 && clear
    sh script.sh
else
    echo -e "\e[1;34m Enter a new password:"
    read pass
    cd /sdcard/Android/data/com.hider/files/.res/
    touch .ps
    echo $pass > .ps
    echo -e "\e[1;34m Password: *$pass*  ✓"
    echo "Press any key to continue..."
    read enter
    clear
    echo "Restarting" && sleep 0.$RANDOM && clear && echo "Restarting." && sleep 0.$RANDOM && clear && echo "Restarting.." && sleep 0.$RANDOM && clear && echo "Restarting..." && sleep 0.$RANDOM && clear && echo "Restarting... Complete" && sleep 1.$RANDOM && clear
    cd assets
    sh pass.sh
fi


