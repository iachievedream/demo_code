# nginx

index.html
~~~
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Docker nginx</title>
</head>
<body>
  Hello world!
</body>
</html>
~~~

docker pull nginx

docker run --name container名稱 -p 8080:80 -v index.html所在路徑:/usr/share/nginx/html -d nginx

docker run --name nginx-test -p 8080:80 -v /var/www/html/index.html:/usr/share/nginx/html -d nginx

docker run --name nginx-test -p 8080:80 -v /var/www/html/:/usr/share/nginx/html -d nginx

docker run --name nginx-test -p 8080:80 -d nginx

docker exec -it nginx-test bash

##  Dockerfile
sudo vi Dockerfile
~~~
FROM ubuntu:16.04

MAINTAINER jiahong

RUN apt-get update -y \
&&  apt-get install nginx -y

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
~~~
docker run -itd  --name nginx -p 8080:80 nginx-build
