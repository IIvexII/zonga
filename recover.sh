read -p "Interface: " int
ifconfig $int down 
iwconfig $int mode managed
ifconfig $int up
service network-manager restart
