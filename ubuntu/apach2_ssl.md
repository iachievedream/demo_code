## www

<a href="https://medium.com/@rommelhong/%E5%9C%A8ubuntu-18-04-lts-apache-2%E4%B8%AD%E5%AE%89%E8%A3%9D%E4%BD%BF%E7%94%A8lets-encrypt-ssl%E6%86%91%E8%AD%89-d2957a0b070f">在Ubuntu 18.04 LTS + Apache 2中安裝使用Let’s Encrypt SSL憑證</a><br>
有HTTPS開通防火牆設定的內容<br>
<a href="https://www.latech.tw/2017/12/ssl-godaddy-aws-ubuntu-apache2.html">SSL 申請、安裝 (Godaddy + aws + ubuntu + apache2)</a><br>
<a href="https://ccnrz.wordpress.com/2017/05/04/%E5%9C%A8-ubuntu-apache-%E4%B8%8A%E5%95%9F%E7%94%A8-https-%E8%87%AA%E7%B0%BD%E6%86%91%E8%AD%89/">Ubuntu Apache 上用自簽憑證啟用 https 服務</a>

~~~
開啟 apache2 SSL mode
sudo a2enmod ssl  //a2enmod是一個模組的指令
sudo systemctl restart apache2
sudo a2enmod ssl //啟用新的ssl設定

sudo mkdir /etc/apache2/ssl
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache2test.key -out /etc/apache2/ssl/apache2test.crt
參照差異:sudo openssl req -new -newkey rsa:2048 -nodes -keyout yourdomain.key -out yourdomain.csr

一直輸入資訊(以fu為例)
最後會在/etc/apache2/ssl出現.ke以及.csr

sudo nano /etc/apache2/sites-available/default-ssl.conf //插入下列兩列程式碼
-------------------------------------------
<ifmodule mod_ssl.c="">
     <virtualhost*:443>
        SSLEngine On
        SSLCertificateFile ~/Desktop/fuwork.xyz.csr
        SSLCertificateKeyFile ~/Desktop/fuwork.xyz.key

        SSLCertificateFile /etc/apache2/ssl/apache2test.crt
        SSLCertificateKeyFile /etc/apache2/ssl/apache2test.key
     </virtualhost>
</ifmodule>
-------------------------------------------
//apache的檔案名稱(例：apache2test)要相同
sudo a2ensite default-ssl.conf  //改用ssl設定檔 原本是啟用 000-default.conf
systemctl reload apache2 // 如須啟動default-ssl，則執行此程式碼
sudo service apache2 restart
~~~

<a href="https://www.webteach.tw/?p=903">LINUX – SSL 憑證 設定 (GoDaddy)</a><br>
godaddy後台還不知如何綁網域，<br>
<a href="https://blog.wu-boy.com/2018/07/caddy-lets-encrypt-wildcard-certificate/comment-page-1/">用 Caddy 申請 Let’s Encrypt Wildcard 憑證</a><br>

~~~
申請 Godaddy API Key
下載 Caddy 執行檔
sudo curl https://getcaddy.com | bash -s personal http.cache,http.expires,tls.dns.godaddy
Caddy 設定檔並啟動
之後完全疑惑狀態

$ GODADDY_API_KEY=xxxx \
GODADDY_API_SECRET=xxxx \
CADDYPATH=/etc/caddy/ssl \
caddy -conf=/etc/caddy/Caddyfile
~~~

<a href="">https://www.footmark.info/linux/centos/acmesh-godaddy-letsencrypt-wildcard/</a>acme.sh 搭配 GoDaddy 自動續期 Let's Encrypt 免費萬用憑證<br>
acme.sh的使用

~~~
curl https://get.acme.sh | sh
export GD_Key="xxxxxtpTEP3_xxxxxx9dn3Tdwv8PZxxxxx"
export GD_Secret="xxxxxtmxxxxxZwuWrxxxxx"
acme.sh --issue --dns dns_gd -d fuwork.xyz -d *.fuwork.xyz

SSLCertificateFile ~/.acme.sh/fuwork.xyz/fuwork.xyz.cer     //.cer
SSLCertificateKeyFile ~/.acme.sh/fuwork.xyz/fuwork.xyz.key
~~~

其他資源：
<a href="https://chyuan3c.pixnet.net/blog/post/167336994">啟用Ubuntu的https</a><br>
google關鍵字；<br>
Let's Encrypt 憑證申請 apache godaddy API Key Management<br>
網域備忘錄

~~~
fuwork.xyz
https://127.0.0.1/
vboxubuntu.fuwork.xyz
http://vboxubuntu.fuwork.xyz/
https://vboxubuntu.fuwork.xyz/
ping vboxubuntu.fuwork.xyz
~~~

Q&A:<br>
兩隻檔案個別人是什麼公用<br>
sudo nano /etc/apache2/sites-available/default-ssl.conf<br>
sudo nano /etc/apache2/sites-available/000-default.conf<br>
//sites-enabled與sites-available要了解，啟用以及默認<br>
<br>
這個指令是怎樣公用的<br>

~~~
sudo certbot --apache -d vboxubuntu.fuwork.xyz -d www.vboxubuntu.fuwork.xyz
sudo certbot --apache
~~~

尚未練習：<br>
FreeSSL：<a href="https://ithelp.ithome.com.tw/articles/10228781">[GCP] Nginx server 之 HTTPS(SSL) 設定</a><br>
<a href=""></a><br>
<a href=""></a><br>

