
錯誤出現
~~~
# ImportError: No module named 'selenium'
# https://stackoverflow.com/questions/31147660/importerror-no-module-named-selenium
~~~

104求職自動登入
~~~
#安裝模組
pip install selenium
#導入模組
from selenium import webdriver
#輸入下列代碼
driver = webdriver.Chrome(r"C:\selenium_driver_chrome\chromedriver.exe")
#控制瀏覽器輸入網址列
driver.get("https://www.104.com.tw/jobs/main/")

# code xpath
elem_login=driver.find_element_by_xpath('/html/body/header/div[1]/nav/ul[2]/li[1]/a/span[2]')
elem_login.click()

# code selector
elem_user=driver.find_element_by_id('username')
# elem_user=driver.find_element_by_xpath('/html/body/main/div/div/div[1]/form/div[1]/div[1]/div[1]/input')
elem_user.clear()
elem_user.send_keys('username')

elem_pass=driver.find_element_by_id('password')
elem_pass.clear()
elem_pass.send_keys('password')

elem_login=driver.find_element_by_id('submitBtn')
elem_login.click()
# 進入會員中心按鍵
elem_login=driver.find_element_by_id('myName')
elem_login.click()
# 會員中心
elem_login=driver.find_element_by_xpath('/html/body/div[1]/div/div/ul/li[2]/ul/li[4]/ul/li/div/dl/dt[1]/a')
elem_login.click()

elem_login=driver.find_element_by_id('myName')
elem_login.click()

driver.get("https://pda.104.com.tw/my104/applyRecord/index")

driver.close()#關閉瀏覽器

~~~



參考資料：
<a href="https://www.itread01.com/article/1524361590.html">selenium+python實現自動登入指令碼</a>

<a href="https://freelancerlife.info/zh/blog/python%E7%B6%B2%E8%B7%AF%E7%88%AC%E8%9F%B2%E6%95%99%E5%AD%B8-selenium%E5%9F%BA%E6%9C%AC%E6%93%8D%E4%BD%9C/">python網路爬蟲教學-Selenium基本操作</a>


