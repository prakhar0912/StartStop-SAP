pbrun -u d35adm -h pepldr03100.pi.pvt SHELL <<"ENDPBRUN"
stopsap j2ee
sapcontrol -nr 00 -function StopService
sapcontrol -nr 01 -function StopService
cleanipc 00 remove all
cleanipc 01 remove all
ENDPBRUN
