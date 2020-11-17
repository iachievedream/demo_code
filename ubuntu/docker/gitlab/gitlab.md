# gitlab

## 透過 Docker 安裝 GitLab
~~~
sudo docker run --detach \
hostname gitlab.example.com \
publish 443:443 --publish 80:80 \
name gitlab \
restart always \
volume /gitlab/config:/etc/gitlab \
volume /gitlab/logs:/var/log/gitlab \
volume /gitlab/data:/var/opt/gitlab \
gitlab/gitlab-ce:latest
~~~

## 透過 Docker Compose 安裝 GitLab

~~~
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
~~~

使用docker-compose.yml

docker-compose up -d


[三秒教你用 Docker 安裝 GitLab](https://blog.toright.com/posts/5831/%E4%B8%89%E7%A7%92%E6%95%99%E4%BD%A0%E7%94%A8-docker-%E5%AE%89%E8%A3%9D-gitlab.html)