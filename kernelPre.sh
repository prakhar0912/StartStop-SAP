declare -A pirtDevSBX
pirtDevSBX=(["peplap07963.pi.pvt"]="U16" ["peplap07968.pi.pvt"]="U16" ["pepldr03117.pi.pvt"]="U32" ["peplap07896.pi.pvt"]="U52" ["peplap09459.pi.pvt"]="U62" ["peplap09458.pi.pvt"]="U62" ["peplap09489.pi.pvt"]="U62" ["peplap09488.pi.pvt"]="U62" ["peplgp01316.pi.pvt"]="UX6" ["t01lap03580.pi.pvt"]="UX6" ["peplap09587.pi.pvt"]="UX6")


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

for inst in "${instances[@]}"
do
    sapcontrol -nr $inst -function GetProcessList 
    echo "--------------------------------------"
done'
        echo -e "$script" > startScript.sh
        bash startScript.sh
ENDSHELL
done