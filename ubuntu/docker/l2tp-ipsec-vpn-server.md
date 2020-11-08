# 用docker快速搭建l2tp VPN伺服器

l2tp-ipsec-vpn-server

下載映象
~~~
docker pull fcojean/l2tp-ipsec-vpn-server
~~~
本機build映象
~~~
git clone https://github.com/fcojean/l2tp-ipsec-vpn-server.git
cd l2tp-ipsec-vpn-server
docker build -t fcojean/l2tp-ipsec-vpn-server 
~~~

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

docker logs l2tp-ipsec-vpn-server

　　如果有如下輸出，表示你的vpn正常工作了。
　　 Connect to your new VPN with these details:



https://www.itread01.com/content/1549850251.html