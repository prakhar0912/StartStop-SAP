declare -A europeData
europeData=(["peplap07883.pi.pvt"]="D21" ["pepldr03037.pi.pvt"]="D37" ["peplap07410.pi.pvt"]="D57" ["peplap09067.pi.pvt"]="D67" ["peplgp01254.pi.pvt"]="DX5" ["peplap09066.pi.pvt"]="DC7" ["peplap07967.pi.pvt"]="Q21" ["pepldr03113.pi.pvt"]="Q37" ["peplap07428.pi.pvt"]="Q57" ["peplap09224.pi.pvt"]="Q67" ["peplgp01255.pi.pvt"]="QX5" ["peplap09584.pi.pvt"]="QX5" ["peplap09230.pi.pvt"]="QC7" ["peplap08701.pi.pvt"]="S21" ["pepldr02966.pi.pvt"]="S37" ["peplap07491.pi.pvt"]="S57" ["peplap08704.pi.pvt"]="S67" ["peplgp01273.pi.pvt"]="SX6" ["PEPLAP08703.pi.pvt"]="SC7" ["peplap07963.pi.pvt"]="U16" ["peplap07968.pi.pvt"]="U16" ["pepldr03117.pi.pvt"]="U32" ["peplap07896.pi.pvt"]="U52" ["peplap09459.pi.pvt"]="U62" ["peplap09458.pi.pvt"]="U62" ["peplap09489.pi.pvt"]="U62" ["peplap09488.pi.pvt"]="U62" ["peplgp01316.pi.pvt"]="UX6" ["t01lap03580.pi.pvt"]="UX6" ["peplap09587.pi.pvt"]="UX6" ["peplap09172.pi.pvt"]="UC2" ["peplap09173.pi.pvt"]="UC2" ["peplap09202.pi.pvt"]="UC2" ["peplap09185.pi.pvt"]="UC2")

declare -A latamData
latamData=(["peplgp01262.pi.pvt"]="D38" ["peplap07318.pi.pvt"]="D58" ["peplgp01263.pi.pvt"]="D63" ["peplap07413.pi.pvt"]="DE2" ["pepldr03056.pi.pvt"]="DX8" ["peplgp01268.pi.pvt"]="Q38" ["peplap07393.pi.pvt"]="Q58" ["peplgp01269.pi.pvt"]="Q63" ["peplap07882.pi.pvt"]="QE2" ["peplgp01301.pi.pvt"]="QE8" ["pepldr03057.pi.pvt"]="QX8" ["peplap10213.pi.pvt"]="QX8" ["peplap10212.pi.pvt"]="QX8" ["pepldr02930.pi.pvt"]="S38" ["t01lap01755.pi.pvt"]="S58" ["t01lgp00536.pi.pvt"]="S68" ["peplap07524.pi.pvt"]="SE2" ["pepldr03055.pi.pvt"]="SX8" ["pepldr03698.pi.pvt"]="QE9" ["peplgp01300.pi.pvt"]="U38" ["peplap07439.pi.pvt"]="U58" ["peplgp01299.pi.pvt"]="U63" ["peplap07448.pi.pvt"]="UE2" ["peplap07449.pi.pvt"]="UE2" ["peplap07450.pi.pvt"]="UE2" ["peplap07457.pi.pvt"]="UE2" ["peplap07456.pi.pvt"]="UE2" ["peplap07458.pi.pvt"]="UE2" ["peplap07474.pi.pvt"]="UE2" ["peplap07473.pi.pvt"]="UE2" ["peplap07485.pi.pvt"]="UE2" ["peplap07484.pi.pvt"]="UE2" ["peplap07489.pi.pvt"]="UE2" ["peplap07488.pi.pvt"]="UE2" ["pepldr03123.pi.pvt"]="UX3" ["peplap09079.pi.pvt"]="UX3" ["peplap09078.pi.pvt"]="UX3" ["peplap09142.pi.pvt"]="UX3" ["peplap09141.pi.pvt"]="UX3" ["peplap09140.pi.pvt"]="UX3" ["peplap09139.pi.pvt"]="UX3")

declare -A pirtDevSBX
pirtDevSBX=(["peplgp01308.corp.pep.pvt"]="SX0" ["peplgp01312.corp.pep.pvt"]="DX0" ["peplgp01313.corp.pep.pvt"]="S10" ["peplgp01257.pi.pvt"]="S35" ["pepldr03673.corp.pep.pvt"]="S61" ["peplgp01315.corp.pep.pvt"]="D10" ["peplgp01274.corp.pep.pvt"]="D30" ["peplgp01283.corp.pep.pvt"]="G6S" ["peplgp01311.corp.pep.pvt"]="G70" ["peplap07920.pi.pvt"]="DH0" ["peplap07880.pi.pvt"]="SH0" ["t01lap03296.pi.pvt"]="GC7" ["peplap10263.corp.pep.pvt"]="D5H" ["t01lap03868.pi.pvt"]="S5H" ["t01lap03299.pi.pvt"]="G60")



for host in "${!pirtDevSBX[@]}"
do
    sleep 5
    echo ${pirtDevSBX["$host"]} $host
    echo
    pbrun -u "${pirtDevSBX["$host"],,}"adm -h $host SHELL << ENDSHELL
    sleep 1
    curl -o stopServ.sh https://raw.githubusercontent.com/prakhar0912/Deepshika-Portfolio/main/okay.sh
    sleep 1
    chmod 777 stopServ.sh
    bash stopServ.sh
ENDSHELL
done
