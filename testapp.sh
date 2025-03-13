declare -a servers
servers=(
"pepldr03064.pi.pvt:D19"
"peplgp01285.pi.pvt:D20"
"pepldr03048.pi.pvt:D24"
"peplgp01280.pi.pvt:D25"
"peplgp01334.pi.pvt:D31"
"pepldr03065.pi.pvt:D34"
"peplgp01305.pi.pvt:D36"
"pepldr03034.pi.pvt:D39"
"pepldr02979.pi.pvt:D71"
"peplgp01333.pi.pvt:D76"
"peplgp01284.pi.pvt:DEV"
"peplgp01277.pi.pvt:DX2"
"peplgp01246.pi.pvt:DX4"
"pepldr03047.pi.pvt:DX9"
"peplgp01286.pi.pvt:DxB"
)

run_scr() {
    IFS=: read -r host sid <<< "$1"
    sid=$(echo $sid | tr '[:upper:]' '[:lower:]')
    response=$(pbrun -u "$sid"adm -h $host /bin/sh < check.sh)
    echo ""
    echo "$sid" "$host"
    echo -en "$response"
    echo -e "\n-------------------------------------------------------"
}

for str in "${servers[@]}"
do
    run_scr "$str" &
done

wait