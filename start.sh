RED="\033[0;31m"
NC="\033[0m"
GREEN="\033[0;32m"

sid=$(whoami)
sid="${sid^^}"
sid=${sid::-3}

print_err(){
    printf "\nFailure\n"
}

print_suc(){
    printf "\nSuccess\n"
}


checkcmd=$(startsap -c)

instances=$(echo "$checkcmd" | grep -oP "Instance \K\w+$")
instance_numbers=($(echo "$checkcmd" | grep -Po "\d+$"))
dbRunning=$(echo "$checkcmd" | grep -Po "Database is running")

# if [ -z "$dbRunning" ]; then
#     print_err "Database isn't Running"
# fi


startcmd=$(startsap)
for inst in "${instances[@]}"
do
    temp=$(echo "$startcmd" | grep -e "Instance ${inst} is running" -e "Instance on host $(hostname) started")
    if [ -z "$temp" ]; then
        print_err "Instances didn't start \n ${startcmd}"
        exit 0
    fi
done


for inst in "${instance_numbers[@]}"
do
    res=$(sapcontrol -nr $inst -function GetProcessList)

    if [ $(echo "$res" | grep -ic "GREY") -eq 1 ]; then
        print_err "Processes haven't started"
        exit 0
    elif [ $(echo "$res" | grep -ic "GREY") -gt 1 ]; then
        print_err "Processes haven't started"
        exit 0
    fi
done

print_suc
exit 0