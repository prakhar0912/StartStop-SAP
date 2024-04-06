declare -A pirtDevSBX
pirtDevSBX=(["t01lap03296.pi.pvt"]="GC7" ["peplap10263.corp.pep.pvt"]="D5H" ["t01lap03868.pi.pvt"]="S5H" ["t01lap03299.pi.pvt"]="G60")


for host in "${!pirtDevSBX[@]}"
do
    sleep 1
    pbrun -u "${pirtDevSBX["$host"],,}"adm -h $host SHELL << ENDSHELL
    curl -o stopServ.sh https://raw.githubusercontent.com/prakhar0912/Deepshika-Portfolio/main/okay.sh
    chmod 777 stopServ.sh
    bash stopServ.sh
ENDSHELL
done