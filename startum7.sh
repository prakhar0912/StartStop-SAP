RED="\033[0;31m"
NC="\033[0m"
GREEN="\033[0;32m"

sid=$(whoami)
sid="${sid^^}"
sid=${sid::-3}

print_err(){
    RED="\033[0;31m"
    NC="\033[0m"
    GREEN="\033[0;32m"
    echo -en "\n${RED}${RED}Stop FAILED: $(hostname) : ${sid} : ${1}${NC}\n"
}

print_suc(){
    RED="\033[0;31m"
    NC="\033[0m"
    GREEN="\033[0;32m"
    echo -en "\n${GREEN}Stop SUCCEEDED: $(hostname) : ${sid} ${NC}\n"
}


instance_numbers=(0 1 2)


for inst in "${instance_numbers[@]}"
do
    stopServiceOutput=$(sapcontrol -nr ${inst} -function Start)
    if [ -z "$(echo "$stopServiceOutput" | grep "OK")" ]; then
        print_err "Stop Service command failed \n ${stopServiceOutput}"
    fi
done

for inst in "${instance_numbers[@]}"
do
    cleanIpcOutput=$(cleanipc ${inst} remove all)
done

for inst in "${instance_numbers[@]}"
do
    processListOutput=$(sapcontrol -nr ${inst} -function GetProcessList)
    echo -en "$processListOutput"
    if [ -n "$(echo "$processListOutput" | grep "GREEN")" ]; then
        print_err "Some Process is still running \n ${processListOutput}"
        exit 0
    fi
done

print_suc
exit 0