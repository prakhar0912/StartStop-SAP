declare -A pirtDevSBX
pirtDevSBX=(["PEPLDR03104.pi.pvt"]="Q22" ["pepldr03101.pi.pvt"]="Q3A" ["peplap09406.pi.pvt"]="Q5A" ["peplap08584.pi.pvt"]="QM2" ["PEPLDZ00353.pi.pvt"]="QS2" ["PEPLDR02795.pi.pvt"]="QS2" ["PEPLGP01241.pi.pvt"]="QXA" ["pepldr03062.pi.pvt"]="T17" )


for host in "${!pirtDevSBX[@]}"
do
    echo ${pirtDevSBX["$host"]} $host
    pbrun -u "${pirtDevSBX["$host"],,}"adm -h $host /bin/sh << "ENDSHELL"
        script='
echo "=========================================================="

instances=($(startsap -c | grep -Po "\d+$"))
abap=$(sapcontrol -nr ${instances[0]} -function GetSystemInstanceList | grep ABAP)
java=$(sapcontrol -nr ${instances[0]} -function GetSystemInstanceList | grep J2EE)

if [ -n "$abap" ] && [ -n "$java" ]; then
    output="all"
elif [ -n "$abap" ]; then
    output="r3"
elif [ -n "$java" ]; then
    output="j2ee"
else
    output=""
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
done'
        echo -e "$script" > startScript.sh
        bash startScript.sh
ENDSHELL
done