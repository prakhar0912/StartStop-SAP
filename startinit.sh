declare -A pirtDevSBX
pirtDevSBX=(["peplgp01312.corp.pep.pvt"]="DX0")


for host in "${!pirtDevSBX[@]}"
do
    sleep 5
    echo ${pirtDevSBX["$host"]} $host
    echo
    pbrun -u "${pirtDevSBX["$host"],,}"adm -h $host SHELL << "ENDSHELL"
    sleep 1
    # curl -o start.sh https://raw.githubusercontent.com/prakhar0912/StartStop-SAP/main/start.sh
    cat > trial.sh << "EOT"
        echo "=========================================================="
        instances=($(startsap -c | grep -Po "\d+$"))
        abap=$(sapcontrol -nr ${instances[0]} -function GetSystemInstanceList | grep ABAP)
        java=$(sapcontrol -nr ${instances[0]} -function GetSystemInstanceList | grep J2EE)

        if [ -n "$abap" ] && [ -n "$java" ]; then
            output="ABAP and JAVA"
        elif [ -n "$abap" ]; then
            output="r3"
        elif [ -n "$java" ]; then
            output="j2ee"
        else
            output="Error"
        fi

        echo SID: $(whoami)
        echo System Type: $output
        echo Instance Numbers:
        for inst in "${instances[@]}"
        do
            echo $inst
        done
        echo "---------------------------------------------"
        startsap $output
        echo "---------------------------------------------"

        for inst in "${instances[@]}"
        do
            sapcontrol -nr $inst -function GetProcessList
            echo "--------------------------------------"
        done    
    EOT
ENDSHELL
    sleep 1
    chmod 777 trial.sh
    bash trial.sh | tee startData.txt
done