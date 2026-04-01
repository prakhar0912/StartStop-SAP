echo $3
sft login
sft ssh unixjump << EOF
    bash app.sh $1 $2 $3
EOF