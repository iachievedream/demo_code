# MySQL8

[service_mysql_status](#service_mysql_status)<br>
[sudo_mysql_secure_installation](#sudo_mysql_secure_installation)<br>
[查詢檢視密碼的狀態](#查詢檢視密碼的狀態)<br>
[在mysql資料庫的user表中檢視當前root使用者的相關資訊](#在mysql資料庫的user表中檢視當前root使用者的相關資訊)<br>
[新增其他的使用者](#新增其他的使用者)<br>
[遠端連線環境設定](#遠端連線環境設定)<br>
[MySQL8實務練習](#MySQL8實務練習)<br>
* [QA_mysql無法順利登入](###QA_mysql無法順利登入)<br>
[other](#other)<br>
* [防火牆](#防火牆)<br>
* [索引](#索引)<br>


## service_mysql_status

## sudo_mysql_secure_installation
初始化
~~~
y安裝密碼強度驗證插件 Plugin
0置密碼強度安全等級
y修改 root 訪問權限
y移除匿名用戶
y移除測試數據庫
y設置完成重新載入安全表
~~~
[回目錄](#MySQL8)

## 查詢檢視密碼的狀態
[參考資料](https://www.opencli.com/mysql/fix-mysql-error-1819)
~~~
SHOW VARIABLES LIKE 'validate_password%';
~~~
[回目錄](#MySQL8)

## 在mysql資料庫的user表中檢視當前root使用者的相關資訊
~~~
use mysql;
select host, user, authentication_string, plugin from user; 
~~~
[回目錄](#MySQL8)

## 新增其他的使用者
以新增otheruser為例
~~~
# 新增 MySQL 本機帳號和密碼
CREATE USER 'otheruser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'otheruser'@'localhost';
FLUSH PRIVILEGES;

刪除帳號
drop user 'otheruser'@'localhost'; 

# 新增 MySQL 遠端帳號和密碼
CREATE USER 'otheruser'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'otheruser'@'%';
FLUSH PRIVILEGES;

刪除帳號
drop user 'otheruser'@'%'; 

## %以及localhost都要對應到才可以順利刪除

# 新的認證方式
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'password'; 
# 修改加密規則
ALTER USER 'root'@'localhost' IDENTIFIED BY 'password' PASSWORD EXPIRE NEVER; 

兩個是什麼(未完全清楚)
WITH mysql_native_password 使用本機密碼
PASSWORD EXPIRE NEVER; 密碼永遠不會過期

兩個差哪裡?
GRANT ALL PRIVILEGES ON *.* TO 'otheruser'@'%';
GRANT ALL ON *.* TO 'otheruser'@'%';
~~~
[回目錄](#MySQL8)

## 遠端連線環境設定
~~~
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf 

bind-address = 127.0.0.1
改為
bind-address = 0.0.0.0 

重新啟動
sudo systemctl restart mysql
sudo service apache2 restart

遠端連線
mysql -u otheruser -h 127.0.0.1 -p
~~~
[回目錄](#MySQL8)

## MySQL8實務練習
下載docker上面的mysql
~~~
docker pull mysql/mysql-server:8.0
docker run --name=mysql8 -d -p 3306:3306 --env MYSQL_ROOT_PASSWORD=password mysql/mysql-server:8.0

logs 命令可查看容器是否正常运行
docker logs mysql8

直接進入container裡面
docker exec -it mysql8 mysql -uroot -p

進入容器後再登入mysql
docker exec -it mysql /bin/bash 
mysql -u root -p


# 新增 MySQL 遠端帳號和密碼
CREATE USER 'otheruser'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'otheruser'@'%';
FLUSH PRIVILEGES;

# 認證連線授權
ALTER USER 'otheruser'@'%' IDENTIFIED WITH mysql_native_password BY 'password';

# 連線方式
mysql -u otheruser -h 127.0.0.1 -p
~~~
[回目錄](#MySQL8)

### QA_mysql無法順利登入
可以 sudo mysql -u root -p
不行 mysql -u root -p
~~~
mysql -u root -pEnter password: 
>ERROR 1698 (28000): Access denied for user 'root'@'localhost'
~~~

使用sudo mysql -u root -p去修改root的初始值密碼()
~~~
use mysql;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
FLUSH PRIVILEGES;
~~~
可以順利使用sudo mysql -u root -p

[回目錄](#MySQL8)

## other
[防火牆](https://www.jishuwen.com/d/pmp7/zh-tw)

https://blog.vvtitan.com/2018/04/mysql%E6%9B%B4%E6%94%B9%E5%AF%86%E7%A2%BC%E9%A1%AF%E7%A4%BA%E3%80%8Cerror-1819-hy000-password-satisfy-current-policy-requirements%E3%80%8D%E9%8C%AF%E8%AA%A4%E8%A8%8A%E6%81%AF%E7%9A%84%E8%99%95/

[Host 'xxx.xx.xxx.xxx' is not allowed to connect to this MySQL server](https://stackoverflow.com/questions/1559955/host-xxx-xx-xxx-xxx-is-not-allowed-to-connect-to-this-mysql-server)

[Docker 玩轉 MySQL](https://myapollo.com.tw/zh-tw/docker-mysql/)

[如何在 Ubuntu 18.04 安裝 MySQL 8.0](https://leadingtides.com/article/%E6%95%99%E5%AD%B8-%E5%A6%82%E4%BD%95%E5%9C%A8-Ubuntu-18.04-%E5%AE%89%E8%A3%9D-MySQL-8.0)

[回目錄](#MySQL8)


## 索引
~~~
建立表格的時建立索引：
CREATE TABLE member (
id      INT UNSIGNED PRIMARY KEY,
name    VARCHAR(20),
email   VARCHAR(36) UNIQUE KEY,
)

或者

CREATE TABLE member (
id,
name,
email,
PRIMARY KEY(id),
UNIQUE KEY(email),
)

直接建立索引：
(CREATE INDEX 建立單個索引)
CREATE INDEX email_index ON member(email);

(ALTER TABLE 建立多個索引，不另外顯出外鍵名稱)
ALTER TABLE member ADD INDEX(email);
ALTER TABLE member ADD PRIMARY KEY (Id), ADD INDEX (LastName,FirstName);

刪除索引：
DROP INDEX email ON member;
DROP INDEX 'PRIMARY' on member;

複合索引:
CREATE INDEX email_tel_index ON member(email, tel);
ALTER TABLE member ADD INDEX email_tel_index (email, tel);
~~~