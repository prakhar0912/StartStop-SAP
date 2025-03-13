import subprocess
import pyautogui
import keyboard
import time
import easyocr
from PIL import Image
import signal


def getPasscode():
    subprocess.Popen(['C:\\Program Files (x86)\\RSA SecurID Software Token\\SecurID.exe'])
    time.sleep(2)
    pyautogui.typewrite('070809', interval=0.2)
    pyautogui.press('Enter')
    time.sleep(2)
    pyautogui.screenshot('code.png', (1290, 720, 160, 35))
    img = Image.open('code.png').convert('L')
    img.save('code.png')
    time.sleep(2)
    reader = easyocr.Reader(['en'])
    result = reader.readtext('code.png', detail=0)
    code = ''
    if(len(result[0]) == 9):
        code = result[0].replace(" ", "")
    return code

p = subprocess.Popen( 'cmd', creationflags=subprocess.CREATE_NEW_CONSOLE )
time.sleep(2)
pyautogui.typewrite("ssh 81032426@peplis00081.corp.pep.pvt", interval=0.1)
pyautogui.press("Enter")
time.sleep(7)
pyautogui.typewrite("Oienh!0912", interval=0.2)
pyautogui.press("Enter")
time.sleep(2)
code = getPasscode()
print(code)
pyautogui.moveTo(500, 500, duration=0.5)
pyautogui.click()
time.sleep(0.5)
pyautogui.typewrite(code, interval=0.2)
pyautogui.press("Enter")
time.sleep(2)
