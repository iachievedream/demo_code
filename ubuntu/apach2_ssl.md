# https設定

[使用acme](#使用acme)

[使用openssl](#使用openssl)

[使用Certbot(未嘗試)](#使用Certbot(未嘗試))

[用Caddy申請Let’s_Encrypt_Wildcard憑證](#用Caddy申請Let’s_Encrypt_Wildcard憑證)

[其他資源](#其他資源)

[Q&A](#Q&A)

[尚未練習](#尚未練習)

<img src="https://github.com/iachievedream/demo_code/blob/master/picture/ubuntu/ubuntu_https.png" width="50%" height="50%" />


## 使用acme
使用acme.sh 搭配 GoDaddy， Let's Encrypt 免費萬用憑證

~~~
//下列兩程式了解
acme.sh --help
export BRANCH=dev //輔助，查詢公用

//必須執行的指令，感覺像是更新，不然會沒有acme的指令集
source  ~/.bashrc 

//填入Godaddy API 的 Key
curl https://get.acme.sh | sh
export GD_Key="GD_Key_GD_Secret"
export GD_Secret="GD_Secret_GD_Secret"
acme.sh --issue --dns dns_gd -d fuwork.xyz -d *.fuwork.xyz
注意產生的憑證位置
查看godaddy的DNS也有新增兩個_acme-challenge的資料認證內容

更新apache2的設定
sudo nano /etc/apache2/sites-available/default-ssl.conf
--------------------------------------------------------------------------------------
SSLCertificateFile /home/other/.acme.sh/fuwork.xyz/fuwork.xyz.cer
SSLCertificateKeyFile /home/other/.acme.sh/fuwork.xyz/fuwork.xyz.key
//"~/無法使用家目錄的路徑位置"

//改用ssl設定檔 原本是啟用 000-default.conf
sudo a2ensite default-ssl.conf  
// 如須啟動default-ssl，則執行此程式碼
systemctl reload apache2 
sudo service apache2 restart
~~~

參考資料：<br>
<a href="https://magiclen.org/simple-ssl-acme-cloudflare/">如何在Linux作業系統上免費申請Let's Encrypt的SSL憑證，並實現自動化申請和套用？</a><br>
<a href="https://www.footmark.info/linux/centos/acmesh-godaddy-letsencrypt-wildcard/">acme.sh 搭配 GoDaddy 自動續期 Let's Encrypt 免費萬用憑證</a><br>
<br>

[回目錄](#https設定)

## 使用openssl
 <a href="https://ccnrz.wordpress.com/2017/05/04/%E5%9C%A8-ubuntu-apache-%E4%B8%8A%E5%95%9F%E7%94%A8-https-%E8%87%AA%E7%B0%BD%E6%86%91%E8%AD%89/">Ubuntu Apache 上用自簽憑證啟用 https 服務</a>

~~~
開啟 apache2 SSL mode，a2enmod算是一個模組的指令(?)
sudo a2enmod ssl  
//如果沒載入下面的指令，則會顯示下列指令讓你執行
sudo systemctl restart apache2
//啟用新的ssl設定
sudo a2enmod ssl 

//新增ssl的資料夾
sudo mkdir /etc/apache2/ssl
//執行openssl的指令
sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache2test.key -out /etc/apache2/ssl/apache2test.crt

參照差異(還不懂差別):
openssl req -new -newkey rsa:2048 -nodes -keyout yourdomain.key -out yourdomain.csr
openssl req -x509 -new -nodes -sha256 -utf8 -days 3650 -newkey rsa:2048 -keyout server.key -out server.crt -config ssl.conf

輸入下列資訊(以ab為例)
--------------------------------------------------------------------------------------
other@other-VirtualBox:~$ sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache2test.key -out /etc/apache2/ssl/apache2test.crt
Can't load /home/other/.rnd into RNG
139864867893696:error:2406F079:random number generator:RAND_load_file:Cannot open file:../crypto/rand/randfile.c:88:Filename=/home/other/.rnd
Generating a RSA private key
.............+++++         .........................................+++++
writing new private key to '/etc/apache2/ssl/apache2test.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:ab
State or Province Name (full name) [Some-State]:ab
Locality Name (eg, city) []:ab
Organization Name (eg, company) [Internet Widgits Pty Ltd]:ab
Organizational Unit Name (eg, section) []:ab
Common Name (e.g. server FQDN or YOUR name) []:ab
Email Address []:ab
--------------------------------------------------------------------------------------
最後會在/etc/apache2/ssl出現.ke以及.csr

編輯此default-ssl.conf檔案
sudo nano /etc/apache2/sites-available/default-ssl.conf 
--------------------------------------------------------------------------------------
//新增下列兩行程式碼
<ifmodule mod_ssl.c="">
     <virtualhost*:443>
        SSLEngine On
        //如果有下列兩行，需要保留
        SSLCertificateFile    /etc/ssl/certs/ssl-cert-snakeoil.pem
        SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key
       //新增下列兩行程式碼
        SSLCertificateFile    /etc/apache2/ssl/apache2test.crt
        SSLCertificateKeyFile /etc/apache2/ssl/apache2test.key
     </virtualhost>
</ifmodule>
--------------------------------------------------------------------------------------
註記：apache的檔案名稱(例：apache2test)要相同，否則無法順利載入。

//改用ssl設定檔 原本是使用 000-default.conf 這支檔案
sudo a2ensite default-ssl.conf
// 如須啟動default-ssl，則執行此程式碼，上列輸入後，如缺少套件，會顯示此行。
systemctl reload apache2
sudo service apache2 restart
~~~

[回目錄](#https設定)

## 使用Certbot(未嘗試)
<a href="https://medium.com/@rommelhong/%E5%9C%A8ubuntu-18-04-lts-apache-2%E4%B8%AD%E5%AE%89%E8%A3%9D%E4%BD%BF%E7%94%A8lets-encrypt-ssl%E6%86%91%E8%AD%89-d2957a0b070f">在Ubuntu 18.04 LTS + Apache 2中安裝使用Let’s Encrypt SSL憑證</a><br>防火牆須嘗試了解

~~~
為HTTPS開通防火牆設定
sudo ufw allow 'Apache Full'
sudo ufw delete allow 'Apache'
查看防火牆狀態：
sudo ufw status
~~~

[回目錄](#https設定)

## 用Caddy申請Let’s_Encrypt_Wildcard憑證
<a href="https://websiteforstudents.com/change-apache2-http-default-port-on-ubuntu-16-04-17-10-18-04/">Change Apache2 HTTP Default Port On Ubuntu 16.04 | 17.10 | 18.04</a><br>
<a href="https://www.webteach.tw/?p=903">LINUX – SSL 憑證 設定 (GoDaddy)</a><br>
<a href="https://blog.wu-boy.com/2018/07/caddy-lets-encrypt-wildcard-certificate/comment-page-1/">用 Caddy 申請 Let’s Encrypt Wildcard 憑證</a><br>
<br>
申請 Godaddy API Key<br>
下載 Caddy 執行檔<br>
Caddy 設定檔並啟動，<br>
之後還有待測試內容。

~~~
//下載 Caddy 執行檔
sudo curl https://getcaddy.com | bash -s personal http.cache,http.expires,tls.dns.godaddy

GODADDY_API_KEY=xxxx \
GODADDY_API_SECRET=xxxx \
CADDYPATH=/etc/caddy/ssl \
caddy -conf=/etc/caddy/Caddyfile
~~~

[回目錄](#https設定)

## 其他資源
<a href="https://chyuan3c.pixnet.net/blog/post/167336994">啟用Ubuntu的https</a><br>
google關鍵字；<br>
Let's Encrypt 憑證申請 apache godaddy API Key Management<br>

[回目錄](#https設定)

## Q&A
待認證的錯誤，副檔名要了解

~~~
SSLCertificateFile "/etc/apache2/ssl/fuwork.xyz/cert.pem"
SSLCertificateKeyFile "/etc/apache2/ssl/fuwork.xyz/key.pem"
SSLCertificateChainFile "/etc/apache2/ssl/fuwork.xyz/fullchain.pem"

SSLCertificateFile ~/.acme.sh/fuwork.xyz/certificate.crt
SSLCertificateKeyFile ~/.acme.sh/fuwork.xyz/private.key
SSLCertificateChainFile ~/.acme.sh/fuwork.xyz/ca_bundle.crt

其他安裝方式，未嘗試：
acme.sh --install-cert -d fuwork.xyz \
--cert-file      /etc/apache2/ssl/fuwork.xyz/cert.pem  \
--key-file       /etc/apache2/ssl/fuwork.xyz/key.pem \
--fullchain-file /etc/apache2/ssl/fuwork.xyz/fullchain.pem \
--reloadcmd     "service apache2 force-reload"
~~~

[回目錄](#https設定)

## 尚未練習
FreeSSL：<a href="https://ithelp.ithome.com.tw/articles/10228781">Nginx server 之 HTTPS(SSL) 設定</a><br>
<a href="https://www.imnobby.com/2017/09/20/%E6%96%BC-ubuntu-%E8%A8%AD%E5%AE%9A-lets-encrypt-%E5%85%8D%E8%B2%BB-ssl-%E7%B6%B2%E7%AB%99%E8%AD%89%E6%9B%B8/">於 Ubuntu 設定 Let’s Encrypt 免費 SSL 網站證書</a><br>
步驟六：安裝 Let’s Encrypt

~~~
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install python-certbot-apache

步驟七：為網站建立 SSL 證書
sudo certbot --apache -d fuwork.xyz
~~~

<a href="https://blog.miniasp.com/post/2019/02/25/Creating-Self-signed-Certificate-using-OpenSSL">如何使用 OpenSSL 建立開發測試用途的自簽憑證 (Self-Signed Certificate)</a><br>
待測試：<br>
<a href="https://www.latech.tw/2017/12/ssl-godaddy-aws-ubuntu-apache2.html">SSL 申請、安裝 (Godaddy + aws + ubuntu + apache2)</a><br>
<a href="https://blog.tonycube.com/2019/02/lets-encrypt-wildcard.html">Let's Encrypt Wildcard 申請流程</a><br>
<a href="https://blog.twshop.asia/%E5%9C%A8apache%E4%B8%8A%E5%AE%89%E8%A3%9Dssl%E6%86%91%E8%AD%89/">在Apache上安裝SSL憑證</a><br>
<a href=""></a><br>