RED="\033[0;31m"
NC="\033[0m"
GREEN="\033[0;32m"

sid="$1"
host="$2"
type="$3"



# Split the string at the first ':' to separate the name and the numbers part
IFS=':' read -r name_part numbers_part <<< "$input_string"

# Now, split the numbers_part by ',' into an array of integers
IFS=',' read -r -a integer_array <<< "$numbers_part"

print_err(){
    echo "$sid" "$host" "$type"
    printf "${RED}Start FAILED: $(hostname) : ${sid} : ${1}${NC}\n"
    exit 1
}

print_suc(){
    echo "$sid" "$host" "$type"
    printf "${GREEN}Start Initiated: $(hostname) : ${sid} : ${NC}\n"\
    exit 0
}

startcmd=$(startsap)
dbRunning=$(echo "$startcmd" | grep -Po "Database is running")

if [ -z "$dbRunning" ]; then
    echo "$startcmd"
    print_err "Database isn't Running"
fi



# for inst in "${instances[@]}"
# do
#     temp=$(echo "$startcmd" | grep -e "Instance ${inst} is running" -e "Instance on host $(hostname) started")
#     if [ -z "$temp" ]; then
#         print_err "Instances didn't start \n ${startcmd}"
#         exit 0
#     fi
# done


# for inst in "${instance_numbers[@]}"
# do
#     res=$(sapcontrol -nr $inst -function GetProcessList)

#     if [ $(echo "$res" | grep -ic "GREY") -eq 1 ]; then
#         print_err "Processes haven't started"
#         exit 0
#     elif [ $(echo "$res" | grep -ic "GREY") -gt 1 ]; then
#         print_err "Processes haven't started"
#         exit 0
#     fi
# done

print_suc
exit 0