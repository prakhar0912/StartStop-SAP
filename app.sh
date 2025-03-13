
optionFlag=$2


declare -a eur_qa
eur_qa=(
"peplap07967.pi.pvt:Q21:APP CI"
"pepldr03113.pi.pvt:Q37:CIDB"
"peplap07428.pi.pvt:Q57:APP CI"
"peplap09224.pi.pvt:Q67:CI"
"peplgp01255.pi.pvt:QX5:DB"
"peplap09584.pi.pvt:QX5:APP"
)

declare -a eur_ua
eur_ua=(
"peplap07963.pi.pvt:U16:APP CI"
"peplap07968.pi.pvt:U16:APP"
"pepldr03117.pi.pvt:U32:CIDB"
"peplap09459.pi.pvt:U62:ERS"
"peplap09458.pi.pvt:U62:ASCS"
"peplap09489.pi.pvt:U62:CI"
"peplap09488.pi.pvt:U62:APP"
"peplgp01316.pi.pvt:UX6:DB"
"t01lap03580.pi.pvt:UX6:ASCS"
"peplap09587.pi.pvt:UX6:APP"
)

declare -a eur_sbx
eur_sbx=(
"peplap07883.pi.pvt:D21:APP CI"
"pepldr03037.pi.pvt:D37:CIDB"
"peplap07410:D57:APP CI"
"peplap09067.pi.pvt:D67:CI"
"peplgp01254.pi.pvt:DX5:CIDB"
"peplap08701.pi.pvt:S21:APPCI"
"pepldr02966.pi.pvt:S37:CIDB"
"peplap07491.pi.pvt:S57:APP CI"
"peplap08704:S67:APP CI"
"peplgp01273:SX6:CIDB"
)

declare -a pgcs_sbx
pgcs_sbx=(
"pepldr03103.pi.pvt:D22:CIDB"
"pepldr03100.pi.pvt:D35:CIDB"
"peplap09405.pi.pvt:D55:CI"
"PEPLAP08585.pi.pvt:DM2:CI"
"PEPLDR02690.pi.pvt:DS2:App / DB"
"PEPLDZ00345:DS2:Livecache"
"pepldr03116.pi.pvt:DXA:CIDB"
"pepldr03061.pi.pvt:S22:CIDB"
"pepldr03114.pi.pvt:SXA:CIDB"
)

declare -a pgcs_ua
pgcs_ua=(
"peplap08641.pi.pvt:U17:APP CI"
"peplap08640.pi.pvt:U17:APP"
"pepldr03375.pi.pvt:U17:DB"
"peplap08639.pi.pvt:U35:APP CI"
"PEPLAP08637.pi.pvt:U35:APP"
"pepldr03364.pi.pvt:U35:DB"
"peplap08591.pi.pvt:U55:APP CI"
"peplap08590.pi.pvt:U55:APP"
"PEPLDZ00346:US7:Livecache"
"PEPLAP05958:US7:APP01"
"PEPLAP05962:US7:APP02"
"PEPLAP05959:US7:ERS secondary"
"PEPLAP05960:US7:ASCS"
"PEPLDR02738:US7:DB Server Primary"
"PEPLDR02733:US7:DB Server Replica"
"PEPLAP05957:US7:DB Server Observer"
"PEPLAP08611.pi.pvt:UM7:ERS"
"peplap08636.pi.pvt:UM7:APP01"
"PEPLAP08583.pi.pvt:UM7:APP02"
"PEPLAP08582.pi.pvt:UM7:ASCS"
"peplap09595.pi.pvt:UX7:App"
"peplap09594.pi.pvt:UX7:App"
"peplap09592:UX7:ERS"
"peplap09591:UX7:SCS"
"pepldr03379.pi.pvt:UX7:DB"
"pepldr03380.pi.pvt:UX7:DB"
"peplap09598.pi.pvt:UX7:Observer"
)

declare -a pgcs_qa
pgcs_qa=(
"PEPLDR03104:Q22:CIDB"
"pepldr03101:Q3A:CIDB"
"peplap09406:Q5A:CIDB"
"peplap08584:QM2:CI"
"PEPLDZ00353:QS2:Live Cache"
"PEPLDR02795:QS2:App / DB"
"PEPLGP01241:QXA:CIDB"
)

declare -a global_sbx
global_sbx=(
"pepldr03048.pi.pvt:D24:CIDB"
"peplgp01280.pi.pvt:D25:CIDB"
"peplgp01305.pi.pvt:D36:CIDB"
"pepldr03034.pi.pvt:D39:CIDB"
"peplap07437.pi.pvt:D56:APP CI"
"pepldh00120.pi.pvt:D56:HANA DB"
"peplap07857.pi.pvt:D59:HANA DB"
"pepldh00148.pi.pvt:D61:HANA DB"
"peplap07533.pi.pvt:D61:CI"
"pepldr02979.pi.pvt:D71:CIDB"
"pepldh00148.pi.pvt:DC1:HANA DB"
"peplap09441.pi.pvt:DC1:CI"
"pepldz00640.pi.pvt:DL1:CIDB"
"peplgp01277.pi.pvt:DX2:CIDB"
"pepldr03047.pi.pvt:DX9:CIDB"
"peplgp01270.pi.pvt:S20:CIDB"
"peplap09490.pi.pvt:S61:HANA DB"
"pepldh00148.pi.pvt:SC1:HANA DB"
"peplap09442.pi.pvt:SC1:CI"
"pepldr03672.corp.pep.pvt:S65:CIDB"
"peplgp01309.corp.pep.pvt:S70:CIDB"
"peplgp01315.corp.pep.pvt:D10:CIDB"
"peplgp01274:D30:CIDB"
"peplap10263.corp.pep.pvt:D5H:APP CI"
"peplap07920.pi.pvt:DH0:APP CI"
"peplgp01312:DX0:CIDB"
"t01lap03299.pi.pvt:G60:CI"
"peplgp01283.corp.pep.pvt:G6S:CIDB"
"peplgp01311:G70:CIDB"
"t01lap03296.pi.pvt:GC7:"
"peplgp01313.corp.pep.pvt:S10:CIDB"
"peplgp01257.pi.pvt:S35:CIDB"
"t01lap03868.pi.pvt:S5H:APP CI"
"pepldr03673.corp.pep.pvt:S61:CIDB"
"peplap07880.pi.pvt:SH0:APP CI"
"peplgp01308.corp.pep.pvt:SX0:CIDB"
)

declare -a global_ua
global_ua=(
"peplgp01244.pi.pvt:U19:CIDB"
"peplgp01279.pi.pvt:U20:CIDB"
"pepldr03385.pi.pvt:U31:CIDB"
"peplgp01243.pi.pvt:U39:CIDB"
"peplap07933.pi.pvt:U51:APP CI"
"peplap07928.pi.pvt:U59:APP CI"
"peplap09465.pi.pvt:U61:CI"
"pepldr03377.pi.pvt:U71:CIDB"
"peplap09465.pi.pvt:UC1:CI"
"pepldz00642.pi.pvt:UL1:CIDB"
"peplap09476.pi.pvt:Ux2:APP"
"peplap09475.pi.pvt:Ux2:APP"
"peplap09515.pi.pvt:Ux2:ERS-Primary"
"peplap09481.pi.pvt:Ux2:ERS-Secondary/SCS"
"peplgp01276.pi.pvt:Ux2:DB-Primary"
"peplap09068.pi.pvt:UX9:APP"
"peplap09069.pi.pvt:UX9:APP"
"peplap09100.pi.pvt:UX9:ERS-Primary"
"peplap09074.pi.pvt:UX9:ERS-Secondary/SCS"
"pepldr03121.pi.pvt:UX9:DB-Primary"
)

declare -a servers

if [[ $1 == "pgcs_ua" ]];then
    servers=("${pgcs_ua[@]}")
elif [[ $1 == "pgcs_sbx" ]];then
    servers=("${pgcs_sbx[@]}")
elif [[ $1 == "pgcs_qa" ]];then
    servers=("${pgcs_qa[@]}")
elif [[ $1 == "eur_sbx" ]];then
    servers=("${eur_sbx[@]}")
elif [[ $1 == "eur_qa" ]];then
    servers=("${pgcs_qa[@]}")
elif [[ $1 == "eur_ua" ]];then
    servers=("${pgcs_ua[@]}")
elif [[ $1 == "global_sbx" ]];then
    servers=("${global_sbx[@]}")
fi

declare -a ascs
ascs=()


declare -a ers
ers=()

declare -a app_ci
app_ci=()

declare -a live
live=()


for str in "${servers[@]}"
do
    if [[ $str == *"APP"* || $str == *"CI"* || $str == *"DB"* || $str == *"App"* ]]; then
        app_ci+=("$str")
    elif [[ $str == *"SCS"* ]]; then
        ascs+=("$str")
    elif [[ $str == *"ERS"* ]]; then
        ers+=("$str")
    elif [[ $str == *"Live"* || $str == *"live"* ]];then
        live+=("$str")
    else
        echo "$str" "was left out of classification!"
    fi
done



declare -a suc
declare -a fail
suc=()
fail=()


run_scr() {
    IFS=: read -r host sid type <<< "$1"
    sid=$(echo $sid | tr '[:upper:]' '[:lower:]')
    if [[ $optionFlag == "start" ]]; then
        response=$(pbrun -u "$sid"adm -h $host /bin/sh < start.sh)
    elif [[ $optionFlag == "stop" ]]; then
        response=$(pbrun -u "$sid"adm -h $host /bin/sh < stop.sh)
    elif [[ $optionFlag == "check" ]]; then
        response=$(pbrun -u "$sid"adm -h $host /bin/sh < check.sh)
    fi
    echo ""
    echo "$sid" "$host" "$type"
    echo -en "$response"
    if [ -n "$(echo "$response" | grep "SUCCEEDED")" ]; then
        suc+="${host} ${sid}"
    fi
    if [ -n "$(echo "$response" | grep "FAILED")" ]; then
        fail+="${host} ${sid}"
    fi
    echo -e "\n-------------------------------------------------------"
}

live_action() {
    IFS=: read -r host sid type <<< "$1"
    sid=$(echo $sid | tr '[:upper:]' '[:lower:]')
    if [[ $optionFlag == "start" ]]; then
        response=$(pbrun -u "$sid"adm -h $host /bin/sh < startLive.sh)
    elif [[ $optionFlag == "stop" ]]; then
        response=$(pbrun -u "$sid"adm -h $host /bin/sh < stopLive.sh)
    fi
    echo ""
    echo "$sid" "$host" "$type"
    echo -en "$response"
    echo -e "\n-------------------------------------------------------"
}


if [[ $optionFlag == "start" ]]; then
    echo "in start"

    for str in "${live[@]}"
    do
        live_action "$str" &
    done

    wait

    for str in "${ascs[@]}"
    do
        run_scr "$str" &
    done

    wait

    echo "=========================================================================="

    for str in "${ers[@]}"
    do
        run_scr "$str" &
    done

    wait

    echo "=========================================================================="


    for str in "${app_ci[@]}"
    do
        run_scr "$str" &
    done

    wait
elif [[ $optionFlag == "stop" ]]; then

    for str in "${live[@]}"
    do
        live_action "$str" &
    done

    wait

    for str in "${app_ci[@]}"
    do
        run_scr "$str" &
    done

    wait

    echo "=========================================================================="


    for str in "${ers[@]}"
    do
        run_scr "$str" &
    done

    wait

    echo "=========================================================================="


    for str in "${ascs[@]}"
    do
        run_scr "$str" &
    done

    wait

    echo "=========================================================================="
elif [[ $optionFlag == "check" ]]; then
    for str in "${servers[@]}"
    do
        run_scr "$str" &
    done

    wait
fi



    

typeset -p suc
typeset -p fail

echo "SUCCESSES"
printf '%s\n' "${suc[@]}"
echo "FAILURES"
printf '%s\n' "${fail[@]}"
