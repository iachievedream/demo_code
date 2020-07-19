# MySQL8
## service mysql status

## sudo mysql_secure_installation

y安裝密碼強度驗證插件 Plugin
0置密碼強度安全等級
y修改 root 訪問權限
y移除匿名用戶
y移除測試數據庫
y設置完成重新載入安全表

[查詢檢視密碼的狀態](https://www.opencli.com/mysql/fix-mysql-error-1819)
SHOW VARIABLES LIKE 'validate_password%';

在 mysql 資料庫的 user 表中檢視當前 root 使用者的相關資訊
~~~
use mysql;
select host, user, authentication_string, plugin from user; 

可以 sudo mysql -u root -p
不行 mysql -u root -p

iachievedream@iachievedream-Lenovo-Legion-Y530-15ICH:~/Desktop$ mysql -u root -pEnter password: 
ERROR 1698 (28000): Access denied for user 'root'@'localhost'
~~~
使用sudo mysql -u root -p去修改root的初始值密碼()
~~~
use mysql;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
FLUSH PRIVILEGES;

drop user 'root'@'localhost'; 
~~~
可以
sudo mysql -u root -p

新增其他的使用者
~~~
## 新增 MySQL 本機帳號和密碼
CREATE USER 'fu'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'fu'@'localhost';

## 新增 MySQL 遠端帳號和密碼
CREATE USER 'fu'@'%' IDENTIFIED BY 'qazWSX3edc';
GRANT ALL PRIVILEGES ON *.* TO 'fu'@'%';

GRANT ALL ON *.* TO 'fu'@'%';
FLUSH PRIVILEGES;

%以及localhost都要對應到才可以順利刪除
drop user 'fu'@'%'; 
drop user 'fu'@'localhost'; 


# 新的認證方式
# ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'password'; 
# 修改加密規則ALTER USER 'root'@'localhost' IDENTIFIED BY 'password' PASSWORD EXPIRE NEVER; 
兩個是什麼
WITH mysql_native_password 使用本機密碼
PASSWORD EXPIRE NEVER; 密碼永遠不會過期
~~~


遠端連線設定
~~~
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf 

bind-address = 127.0.0.1
改為
bind-address = 0.0.0.0 

重新啟動
sudo systemctl restart mysql

遠端連線
mysql -u fu -h 127.0.0.1 -p
~~~

重要
[防火牆](https://www.jishuwen.com/d/pmp7/zh-tw)


https://blog.vvtitan.com/2018/04/mysql%E6%9B%B4%E6%94%B9%E5%AF%86%E7%A2%BC%E9%A1%AF%E7%A4%BA%E3%80%8Cerror-1819-hy000-password-satisfy-current-policy-requirements%E3%80%8D%E9%8C%AF%E8%AA%A4%E8%A8%8A%E6%81%AF%E7%9A%84%E8%99%95/



## other
[Host 'xxx.xx.xxx.xxx' is not allowed to connect to this MySQL server](https://stackoverflow.com/questions/1559955/host-xxx-xx-xxx-xxx-is-not-allowed-to-connect-to-this-mysql-server)

[Docker 玩轉 MySQL](https://myapollo.com.tw/zh-tw/docker-mysql/)

[如何在 Ubuntu 18.04 安裝 MySQL 8.0](https://leadingtides.com/article/%E6%95%99%E5%AD%B8-%E5%A6%82%E4%BD%95%E5%9C%A8-Ubuntu-18.04-%E5%AE%89%E8%A3%9D-MySQL-8.0)


docker pull mysql/mysql-server:8.0

docker run --name=mysql8 -d -p 3306:3306 --env MYSQL_ROOT_PASSWORD=ab123456 mysql/mysql-server:8.0

sudo docker exec -it mysql8 mysql -uroot -p


CREATE USER 'fu'@'%' IDENTIFIED BY 'qazWSX3edc';
GRANT ALL PRIVILEGES ON *.* TO 'fu'@'%';
FLUSH PRIVILEGES;

ALTER USER 'fu'@'%' IDENTIFIED WITH mysql_native_password BY 'qazWSX3edc';

mysql -u fu -h 172.17.0.1 -p
