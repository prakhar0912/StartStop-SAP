pbrun -u d35adm -h pepldr03100.pi.pvt SHELL <<"ENDPBRUN"
sqlplus -v | grep -Po "(?<=Version )[^ ]+"
echo okayy
ENDPBRUN
