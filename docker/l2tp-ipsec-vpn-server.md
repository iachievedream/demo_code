# 用docker快速搭建l2tp VPN伺服器

Docker VPN 

l2tp-ipsec-vpn-server

下載映象
~~~
docker pull fcojean/l2tp-ipsec-vpn-server
~~~
本機build映象
~~~
git clone https://github.com/fcojean/l2tp-ipsec-vpn-server.git
cd l2tp-ipsec-vpn-server
docker build -t fcojean/l2tp-ipsec-vpn-server .
~~~

vpn.env

~~~
VPN_IPSEC_PSK=xindoo.me
VPN_USER_CREDENTIAL_LIST=[{"login":"Test1","password":"test1"},{"login":"Test2","password":"test2"}]
~~~

啟動l2tp映象

sudo modprobe af_key

~~~
docker run \
    --name l2tp-ipsec-vpn-server \
    --env-file ./vpn.env \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -v /lib/modules:/lib/modules:ro \
    -d --privileged \
    fcojean/l2tp-ipsec-vpn-server
~~~

驗證

你可以在伺服器上執行下面這條命令驗證下。
~~~
docker logs l2tp-ipsec-vpn-server
~~~
如果有如下輸出，表示你的vpn正常工作了。
~~~
Connect to your new VPN with these details:
~~~

[用docker快速搭建l2tp VPN伺服器](https://www.itread01.com/content/1549850251.html)

sudo docker exec -it l2tp-ipsec-vpn-server /bin/bash

cat /etc/ipsec.conf
vi /etc/ipsec.conf


編輯 VPN 服務器上的 /etc/ipsec.conf。找到 phase2alg=... 
一行並在末尾加上
~~~
aes256-sha2_256
~~~
然後找到 
~~~
sha2-truncbug=yes
並將它替換爲
sha2-truncbug=no。
~~~
保存修改並運行 
~~~
service ipsec restart。
~~~

~~~
docker run \
    --name l2tp-ipsec-vpn-server \
    --env-file ./vpn.env \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -v /mydata/ipsec_vpn:/lib/modules:ro \
    -v /mydata/ipsec_vpn/etc:/etc \
    -d --privileged \
    fcojean/l2tp-ipsec-vpn-server
~~~

[Docker搭建L2TP-VPN服務器](https://www.xuehua.us/a/5ebb6cd686ec4d140fea10ab?lang=zh-tw)

vi docker-compose.yml
~~~
version: '2.3'
services:
  vpn-service:
    image: hwdsl2/ipsec-vpn-server:latest
    container_name: vpn-service
    privileged: true
    restart: always
    mem_limit: 64M
    logging:
      driver: "json-file"
      options:
        max-size: "1k"
        max-file: "3"
    ports:
     - "500:500/udp"
     - "4500:4500/udp"
    networks:
      - vpn-service
    environment:
      VPN_IPSEC_PSK: <your_key>
      VPN_USER: <your_user_name>
      VPN_PASSWORD: <your_password>
      VPN_DNS_SRV1: 94.140.14.14
      VPN_DNS_SRV2: 94.140.14.15

networks:
  vpn-service:
    name: vpn-service-network
    driver: bridge
======================================
version: '2.3'
services:
  vpn-service:
    image: hwdsl2/ipsec-vpn-server:latest
    container_name: vpn-service
    privileged: true
    restart: always
    mem_limit: 64M
    logging:
      driver: "json-file"
      options:
        max-size: "1k"
        max-file: "3"
    ports:
     - "500:500/udp"
     - "4500:4500/udp"
    networks:
      - vpn-service
    environment:
      VPN_IPSEC_PSK: test
      VPN_USER: test1
      VPN_PASSWORD: test1
      VPN_DNS_SRV1: 94.140.14.14
      VPN_DNS_SRV2: 94.140.14.15

networks:
  vpn-service:
    name: vpn-service-network
    driver: bridge
~~~

sudo apt  install docker-compose
docker-compose up -d
sudo docker-compose up

[十分鐘架設自己的 VPN server](https://danielhuang030.pixnet.net/blog/post/268697168)
