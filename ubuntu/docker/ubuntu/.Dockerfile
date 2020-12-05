FROM ubuntu:18.04

MAINTAINER iachievedream iachievedream@gmail.com

RUN apt-get update -y\
    && apt-get -y install sudo -y\
    && apt install vim -y\
    # && apt-get update -y\
    && apt install yum -y\
    && apt-get install npm -y\
    && apt-get install nodejs -y\
    && apt-get install curl -y\
    && apt install composer -y\
    && apt install apache2 \
    && apt install php7.2-cli -y\
    && apt install hhvm -y\
    && apt-get install php7.2-xml -y\
    && apt-get install php-mbstring -y\
    && apt install libapache2-mod-php7.2 libapache2-mod-php -y\
    && service apache2 restart\
    # && apt-get install mysql-server -y\
    # && apt install mysql-client -y\
    && apt install libmysqlclient-dev -y
    # && apt-get install phpmyadmin -y\
    # && apt-get install ssh  -y

# WORKDIR /var/www/html/
RUN mv index.html index1.html\
    && sudo git clone https://github.com/iachievedream/CodeIgniter3.git\
    && sudo git clone https://github.com/iachievedream/demo_code\
    && sudo git clone https://github.com/iachievedream/blog-laravel-jwt.git\
    && sudo git clone https://github.com/iachievedream/blog-laravel.git\

EXPOSE 80
EXPOSE 3306
EXPOSE 8000
EXPOSE 8001
CMD ["/bin/bash"]