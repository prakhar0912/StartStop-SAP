
declare -a ascs
ascs=()


declare -a ers
ers=( )

declare -a app_ci
app_ci=(
"peplgp01308.corp.pep.pvt:SX0"
"peplgp01312:DX0"
"peplgp01313.corp.pep.pvt:S10"
"peplgp01257.pi.pvt:S35"
"pepldr03673.corp.pep.pvt:S61"
"peplgp01315.corp.pep.pvt:D10"
"peplgp01274:D30"
"peplgp01283.corp.pep.pvt:G6S"
"peplgp01311:G70"
"peplap07920.pi.pvt:DH0"
"peplap07880.pi.pvt:SH0"
"peplap10263.corp.pep.pvt:D5H"
"t01lap03868.pi.pvt:S5H"
"t01lap03299.pi.pvt:G60"
)

declare -a suc
declare -a fail
suc=()
fail=()


run_scr() {
    host="${1%:*}"
    sid="${1#*:}"
    response=$(pbrun -u "${sid,,}"adm -h $host /bin/sh < stop.sh)
    echo "$sid" "$host"
    echo -en "$response"
    if [ -n "$(echo "$response" | grep "SUCCEEDED")" ]; then
        suc+="${host} ${sid}"
    fi
    if [ -n "$(echo "$response" | grep "FAILED")" ]; then
        fail+="${host} ${sid}"
    fi
    echo -e "\n-------------------------------------------------------"
}

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

typeset -p suc
typeset -p fail

echo "SUCCESSES"
printf '%s\n' "${suc[@]}"
echo "FAILURES"
printf '%s\n' "${fail[@]}"
