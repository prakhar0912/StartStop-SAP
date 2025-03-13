echo ""
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
    echo -en "\n${RED}${RED}Check FAILED: $(hostname) : ${sid} : ${1}${NC}\n"
}

print_suc(){
    RED="\033[0;31m"
    NC="\033[0m"
    GREEN="\033[0;32m"
    echo -en "\n${GREEN}Check SUCCEEDED: $(hostname) : ${sid} ${NC}\n"
}

checkcmd=$(startsap -c)

instances=$(echo "$checkcmd" | grep -oP "Instance \K\w+$")
instance_numbers=($(echo "$checkcmd" | grep -Po "\d+$"))
echo -en "$checkcmd"
echo "-----------------------------------------------------------------------------------"
for inst in "${instance_numbers[@]}"
do
    sapcontrol -nr $inst -function GetSystemInstanceList
    echo "---------------------------------------------------------------------------"
done

print_suc
exit
