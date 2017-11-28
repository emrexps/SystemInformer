#!/bin/bash


displayCpu()
{
       	clear
	 cpu_model=`cat /proc/cpuinfo |  grep -m 1 name `
         processor=`cat /proc/cpuinfo |  grep -m 1 processor `
	 cores=`cat /proc/cpuinfo |  grep -m 1 cores`
         echo "CPU INFORMATION"
	 echo "_______________________"
	 echo "CPU MODEL:   ${cpu_model#*:}" 
	 echo "PROCESSOR:   ${processor#*:}" 
	 echo "CORES:       ${cores#*:} "
	 echo "________________________"
	 echo "(m) for Menu, alt+c to exit "

	 read chs

	 case "$chs" in
                "m")
		       	displayMenu;;
	 	    *)													                      displayCpu ;	
	    esac													
   }


 

displayRam()
{
        
	clear
	echo -e "${RED} RAM INFORMATION ${NC} "
	echo "___________________________"
	echo  Total Ram:  	`free -m |grep  Mem | awk {'print $2}' ` 
        echo  Used  Ram: 	`free -m |grep  Mem | awk {'print $3}' ` 
	echo  Available Ram:    `free -m |grep  Mem | awk {'print $7}' ` 
        echo "__________________________"
	echo "(m) for Menu,alt+c to exit"

        read chs

	case "$chs" in 
		"m")
			displayMenu;;
		*)
			displayRam;
	esac
}




displayMenu(){

RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'  
clear

echo -e "${YELLOW}Hello $USER  Welcome to dspl informer ${NC}"
echo "**************************************************"
echo -e "${BLUE} [1] Display Cpu Information"
echo -e "${BLUE} [2] Display Ram Information"
echo -e "${BLUE} [3] Display OS  Information"
echo "**************************************************"





read chs
case "$chs" in 
	"1")
		displayCpu;;
	"2")
		displayRam;;
	*)
		echo "wrong selection";;
esac



}
displayMenu
