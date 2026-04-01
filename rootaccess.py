from datetime import datetime
import time
import subprocess

def runScr():
    print('hehe')
    output = subprocess.check_output("master.sh", shell=True)
    print(output)


alarm_time = datetime(2025, 4, 9, 9, 30, 24, 0)
while True:
    print(datetime.now().strftime("%H:%M"))
    if (datetime.now() > alarm_time):
        runScr()
        break
    time.sleep(50)
