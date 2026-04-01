import multiprocessing
import subprocess

global_sbx=[
    'peplgp01270.pi.pvt:S20',
    'peplap07920.pi.pvt:DH0',
    'peplgp01279.pi.pvt:U20'
]

def run_scr(value):
    x = value.split(':')
    cmd = 'pbrun -u {}adm -h {} /bin/sh < check.sh'.format(x[1].lower(), x[0])
    print(cmd)
    proc = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    o, e = proc.communicate()

    print('Output: ' + o.decode('ascii'))
    print('Error: '  + e.decode('ascii'))
    print('code: ' + str(proc.returncode))


pool_obj = multiprocessing.Pool()
ans = pool_obj.map(run_scr,global_sbx)
print(ans)
pool_obj.close()

