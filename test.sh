declare -A europeData
europeData=(["peplap07883.pi.pvt"]="D21" ["pepldr03037.pi.pvt"]="D37" ["peplap07410.pi.pvt"]="D57" ["peplap09067.pi.pvt"]="D67" ["peplgp01254.pi.pvt"]="DX5" ["peplap09066.pi.pvt"]="DC7" ["peplap07967.pi.pvt"]="Q21" ["pepldr03113.pi.pvt"]="Q37" ["peplap07428.pi.pvt"]="Q57" ["peplap09224.pi.pvt"]="Q67" ["peplgp01255.pi.pvt"]="QX5" ["peplap09584.pi.pvt"]="QX5" ["peplap09230.pi.pvt"]="QC7" ["peplap08701.pi.pvt"]="S21" ["pepldr02966.pi.pvt"]="S37" ["peplap07491.pi.pvt"]="S57" ["peplap08704.pi.pvt"]="S67" ["peplgp01273.pi.pvt"]="SX6" ["PEPLAP08703.pi.pvt"]="SC7" ["peplap07963.pi.pvt"]="U16" ["peplap07968.pi.pvt"]="U16" ["pepldr03117.pi.pvt"]="U32" ["peplap07896.pi.pvt"]="U52" ["peplap09459.pi.pvt"]="U62" ["peplap09458.pi.pvt"]="U62" ["peplap09489.pi.pvt"]="U62" ["peplap09488.pi.pvt"]="U62" ["peplgp01316.pi.pvt"]="UX6" ["t01lap03580.pi.pvt"]="UX6" ["peplap09587.pi.pvt"]="UX6" ["peplap09172.pi.pvt"]="UC2" ["peplap09173.pi.pvt"]="UC2" ["peplap09202.pi.pvt"]="UC2" ["peplap09185.pi.pvt"]="UC2")

declare -A latamData
latamData=(["peplgp01262.pi.pvt"]="D38" ["peplap07318.pi.pvt"]="D58" ["peplgp01263.pi.pvt"]="D63" ["peplap07413.pi.pvt"]="DE2" ["pepldr03056.pi.pvt"]="DX8" ["peplgp01268.pi.pvt"]="Q38" ["peplap07393.pi.pvt"]="Q58" ["peplgp01269.pi.pvt"]="Q63" ["peplap07882.pi.pvt"]="QE2" ["peplgp01301.pi.pvt"]="QE8" ["pepldr03057.pi.pvt"]="QX8" ["peplap10213.pi.pvt"]="QX8" ["peplap10212.pi.pvt"]="QX8" ["pepldr02930.pi.pvt"]="S38" ["t01lap01755.pi.pvt"]="S58" ["t01lgp00536.pi.pvt"]="S68" ["peplap07524.pi.pvt"]="SE2" ["pepldr03055.pi.pvt"]="SX8" ["pepldr03698.pi.pvt"]="QE9" ["peplgp01300.pi.pvt"]="U38" ["peplap07439.pi.pvt"]="U58" ["peplgp01299.pi.pvt"]="U63" ["peplap07448.pi.pvt"]="UE2" ["peplap07449.pi.pvt"]="UE2" ["peplap07450.pi.pvt"]="UE2" ["peplap07457.pi.pvt"]="UE2" ["peplap07456.pi.pvt"]="UE2" ["peplap07458.pi.pvt"]="UE2" ["peplap07474.pi.pvt"]="UE2" ["peplap07473.pi.pvt"]="UE2" ["peplap07485.pi.pvt"]="UE2" ["peplap07484.pi.pvt"]="UE2" ["peplap07489.pi.pvt"]="UE2" ["peplap07488.pi.pvt"]="UE2" ["pepldr03123.pi.pvt"]="UX3" ["peplap09079.pi.pvt"]="UX3" ["peplap09078.pi.pvt"]="UX3" ["peplap09142.pi.pvt"]="UX3" ["peplap09141.pi.pvt"]="UX3" ["peplap09140.pi.pvt"]="UX3" ["peplap09139.pi.pvt"]="UX3")

for host in "${!latamData[@]}"
do
    pbrun -u "${latamData["$host"],,}"adm -h $host SHELL <<- ENDPBRUN
    abap=$(sapcontrol -nr 00 -function GetSystemInstanceList | grep ABAP | grep -q GREEN)
    java=$(sapcontrol -nr 00 -function GetSystemInstanceList | grep JAVA | grep -q GREEN)

    if [ -n "$abap" ] && [ -n "$java" ]; then
        echo $host,"${latamData["$host"],,}",ABAP and JAVA
    elif [ -n "$abap" ]; then
        echo $host,"${latamData["$host"],,}",ABAP
    elif [ -n "$java" ]; then
        echo $host,"${latamData["$host"],,}",JAVA
    else
        echo $host,"${latamData["$host"],,}",Error,$abap,$java
    fi
ENDPBRUN
done




declare -A b
b=([hello]=world ["a b"]="c d")

for i in 1 2
do
    if [[ ${b["a b"]} == "c d" ]]; then
        echo $i: equals c d
    else
        echo $i: does not equal c d
    fi
    b["a b"]="c d"
done
for k in "${!b[@]}"
do
    echo "$k"
done
ENDPBRUN
