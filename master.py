import subprocess
cmd = 'pbrun -u dx9adm -h pepldr03047 /bin/sh < check.sh'
proc = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

o, e = proc.communicate()

print('Output: ' + o.decode('ascii'))
print('Error: '  + e.decode('ascii'))
print('code: ' + str(proc.returncode))