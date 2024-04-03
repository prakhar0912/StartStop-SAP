declare -A europeData
europeData=(["peplap07883.pi.pvt"]="D21" ["pepldr03037.pi.pvt"]="D37" ["peplap07410.pi.pvt"]="D57" ["peplap09067.pi.pvt"]="D67" ["peplgp01254.pi.pvt"]="DX5" ["peplap09066.pi.pvt"]="DC7" ["peplap07967.pi.pvt"]="Q21" ["pepldr03113.pi.pvt"]="Q37" ["peplap07428.pi.pvt"]="Q57" ["peplap09224.pi.pvt"]="Q67" ["peplgp01255.pi.pvt"]="QX5" ["peplap09584.pi.pvt"]="QX5" ["peplap09230.pi.pvt"]="QC7" ["peplap08701.pi.pvt"]="S21" ["pepldr02966.pi.pvt"]="S37" ["peplap07491.pi.pvt"]="S57" ["peplap08704.pi.pvt"]="S67" ["peplgp01273.pi.pvt"]="SX6" ["PEPLAP08703.pi.pvt"]="SC7" ["peplap07963.pi.pvt"]="U16" ["peplap07968.pi.pvt"]="U16" ["pepldr03117.pi.pvt"]="U32" ["peplap07896.pi.pvt"]="U52" ["peplap09459.pi.pvt"]="U62" ["peplap09458.pi.pvt"]="U62" ["peplap09489.pi.pvt"]="U62" ["peplap09488.pi.pvt"]="U62" ["peplgp01316.pi.pvt"]="UX6" ["t01lap03580.pi.pvt"]="UX6" ["peplap09587.pi.pvt"]="UX6" ["peplap09172.pi.pvt"]="UC2" ["peplap09173.pi.pvt"]="UC2" ["peplap09202.pi.pvt"]="UC2" ["peplap09185.pi.pvt"]="UC2")

for host in "${!europeData[@]}"
do
    echo $host "${europeData["$host"],,}"
    pbrun -u "${europeData["$host"],,}"adm -h $host bash <<- ENDPBRUN
    echo Inside $host ${europeData["$host"]}
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
