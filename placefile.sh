declare -a servers
servers=(
"peplgp01315:D10"
"peplgp01274:D30"
"peplgp01312:DX0"
"peplgp01311:G70"
"peplgp01313:S10"
"peplgp01257:S35"
"peplgp01308:SX0"
)

run_scr() {
    IFS=: read -r host sid <<< "$1"
    sid=$(echo $sid | tr '[:upper:]' '[:lower:]')
    pbrun -u "$sid"adm -h $host mkdir /home/"$sid"adm/StartStopScripts
    cat stop.sh | pbrun -u "$sid"adm -h $host tee /home/"$sid"adm/StartStopScripts/stop.sh
    cat start.sh | pbrun -u "$sid"adm -h $host tee /home/"$sid"adm/StartStopScripts/start.sh
    echo $sid, $host, "Completed"
    echo -e "\n-------------------------------------------------------"
}

for str in "${servers[@]}"
do
    run_scr "$str" &
done