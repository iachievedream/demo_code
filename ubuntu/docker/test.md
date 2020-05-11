
# composer
~~~
FROM php:7.3.3-apache
RUN apt-get update && apt-get upgrade -y
RUN docker-php-ext-install mysqli
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install
COPY src /var/www/html/

EXPOSE 80
~~~
sudo docker build -t php:v1 .

sudo docker images


sudo docker run --name apachetest -d -p 8000:80 6dd13a385dae

sudo docker exec -it apachetest bash
