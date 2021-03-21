
## 三秒教你用 Docker 安裝 GitLab
~~~
sudo docker run --detach \
   --hostname gitlab.example.com \
   --publish 443:443 --publish 80:80 \
   --name gitlab \
   --restart always \
   --volume /gitlab/config:/etc/gitlab \
   --volume /gitlab/logs:/var/log/gitlab \
   --volume /gitlab/data:/var/opt/gitlab \
   gitlab/gitlab-ce:latest
~~~

sudo curl -L https://github.com/docker/compose/releasesdownload/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

~~~
version: '3.2'
services:
 
  gitlab:
    image: gitlab/gitlab-ce:latest
    hostname: gitlab.example.com
    container_name: gitlab
    restart: always
    volumes:
      - /gitlab/config:/etc/gitlab
      - /gitlab/logs:/var/log/gitlab
      - /gitlab/data:/var/opt/gitlab
    ports:
      - 443:443
      - 80:80
    networks:
      - devel-net
 
networks:
  devel-net:
~~~

docker-compose up -d


https://blog.toright.com/posts/5831/%E4%B8%89%E7%A7%92%E6%95%99%E4%BD%A0%E7%94%A8-docker-%E5%AE%89%E8%A3%9D-gitlab.html