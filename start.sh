echo "=========================================================="

instances=($(startsap -c | grep -Po "\d+$"))
abap=$(sapcontrol -nr ${instances[0]} -function GetSystemInstanceList | grep ABAP)
java=$(sapcontrol -nr ${instances[0]} -function GetSystemInstanceList | grep J2EE)

if [ -n "$abap" ] && [ -n "$java" ]; then
    output="ABAP and JAVA"
elif [ -n abap ]; then
    output="r3"
elif [ -n java ]; then
    output="j2ee"
else
    output="Error"
fi

echo SID: $(whoami)
echo System Type: $output
echo Instance Numbers:
for inst in "${instances[@]}"
do
    echo $inst
done


echo "---------------------------------------------"
startsap $output
echo "---------------------------------------------"

for inst in "${instances[@]}"
do
    sapcontrol -nr $inst -function GetProcessList
    echo "--------------------------------------"
done