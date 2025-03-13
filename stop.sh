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
    echo -en "\nFailure\n"
}

print_suc(){
    RED="\033[0;31m"
    NC="\033[0m"
    GREEN="\033[0;32m"
    echo -en "\nSuccess\n"
}



checkcmd=$(startsap -c)

instances=$(echo "$checkcmd" | grep -oP "Instance \K\w+$")
instance_numbers=($(echo "$checkcmd" | grep -Po "\d+$"))
profile="/sapmnt/${sid}/profile/DEFAULT.PFL"
sysType=$(cat $profile 2> /dev/null | awk "/system\/type/ {print \$3}")
stopCmdType=""

echo "$sysType"

if [ "$sysType" = "ABAP" ]; then
    stopCmdType="r3"
elif [ "$sysType" = "J2EE" ]; then
    stopCmdType="j2ee"
fi

echo "$stopCmdType"


stopcmd=$(stopsap $stopCmdType)

for inst in "${instance_numbers[@]}"
do
    stopServiceOutput=$(sapcontrol -nr ${inst} -function StopService)
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