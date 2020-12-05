# QA_note

## composer
### 解决composer install遇到：Your requirements could not be resolved to an installable set of packages

~~~
composer install --ignore-platform-reqs
~~~


## apache2 AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.3. Set the 'ServerName' directive globally to suppress this message

### 處理方式:
vi /etc/apache2/apache2.conf
~~~
ServerName "a.fuwork.tk"
~~~
service apache2 restart

尚未了解
~~~
echo "ServerName a.fuwork.tk" >> /etc/apache2/httpd.conf
http://a.fuwork.tk/
vi /etc/hosts
~~~

