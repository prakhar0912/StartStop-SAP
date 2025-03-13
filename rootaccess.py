from datetime import datetime
import time
import subprocess

def runScr():
    output = subprocess.check_output("bash app.sh pgcs_sbx stop", shell=True)
    print(output)


alarm_time = datetime(2025, 3, 12, 10, 18, 0)
while True:
    print(datetime.utcnow().strftime("%H:%M"))
    if (datetime.utcnow() > alarm_time):
        runScr()
        break
    time.sleep(50)
