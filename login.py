from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.keys import Keys
import time

service = Service(executable_path="chromedriver.exe")
driver = webdriver.Chrome(service=service)

driver.get("https://app.scaleft.com/t/prod-pepsico/user/servers")

# input_elm = driver.get_element()
WebDriverWait(driver, 20).until(
    EC.presence_of_all_elements_located((By.ID, "userid"))
)
input_elem = driver.find_element(By.ID, "userid")
input_elem.clear()
input_elem.send_keys("81032426" + Keys.ENTER)

WebDriverWait(driver, 20).until(
    EC.presence_of_all_elements_located((By.XPATH, '//div[@data-se="okta_verify-push"]'))
)

outerBtn = driver.find_element(By.XPATH, '//div[@data-se="okta_verify-push"]')
oktaBtn = outerBtn.find_element(By.CSS_SELECTOR, 'a')
oktaBtn.click()

time.sleep(20)

driver.quit()