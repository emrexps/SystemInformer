#!/bin/bash

#author emre
displayCpu()
{
       	clear
	 cpu_model=`cat /proc/cpuinfo |  grep -m 1 name `
         model=`cat /proc/cpuinfo |  grep -m 1 model `
	 cores=`cat /proc/cpuinfo |  grep -m 1 cores`
         echo -e "${BLUE}CPU INFORMATION"
	 echo "_______________________"
	 echo "CPU :  ${cpu_model#*:}" 
	 echo "MODEL:  ${model#*:}" 
	 echo "CORES:  ${cores#*:} "
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
	echo  Total Ram:  	`free -m |grep  Mem | awk {'print $2'} ` 
        echo  Used  Ram: 	`free -m |grep  Mem | awk {'print $3'} ` 
	echo  Available Ram:    `free -m |grep  Mem | awk {'print $7'} ` 
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



displayOS()
{
clear
os=`lsb_release -cd | grep Description`
codename=`lsb_release -cd | grep Codename`
echo -e "${YELLOW} OS INFORMATION ${NC}"
echo "_________________________________"
echo OS:${os#*:}
echo Codename:${codename#*:}
echo Architecture: ` uname -m`
echo "_______________________________"
echo  "(m) for Menu,alt+c to exit"

read chs

case "$chs" in 
	"m")
		displayMenu;;
	*) displayOS;
esac

}


displayStorage(){
clear
total_size=`df -h --total  | grep total | awk {'print$2'}`
used=`df -h --total  | grep total | awk {'print$3'}`
available=`df -h --total  | grep total | awk {'print$4'}`


echo -e "${CYAN}STORAGE INFORMATION"
echo "____________________"
echo "total size:" ${total_size}
echo "used:" ${used}
echo "available:"${available}
echo "_____________________________"
echo  "(m) for Menu,alt+c to exit"

read chs

case "$chs" in 
	        "m")
	           displayMenu;;
	        *) displayStorage;
	esac



}

displayMenu(){

RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m' 
REDU='\033[4;31m'
clear

echo -e "${YELLOW}Hello $USER  Welcome to dspl informer ${NC}"
echo -e "${REDU}Programmed by Emre Eker"
echo -e "${YELLOW}**************************************************"
echo -e "${BLUE} [1] Display Cpu Information"
echo -e "${BLUE} [2] Display Ram Information"
echo -e "${BLUE} [3] Display OS  Information"
echo -e "${BLUE} [4] Dislay Storage Information ${NC}"
echo -e "${YELLOW}**************************************************${NC}"
echo "alt-c to exit"





read chs
case "$chs" in 
	"1")
		displayCpu;;
	"2")
		displayRam;;
	"3")   displayOS;;
        "4") displayStorage;;	
	*)
		echo "wrong selection";;
esac



}
displayMenu
