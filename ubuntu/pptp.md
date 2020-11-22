# VPN
## pptp
install
~~~
sudo apt-get update 
sudo apt-get install pptpd
~~~
sudo vi /etc/ppp/pptpd-options
~~~
Find the following line:
#ms-dns 10.0.0.1
#ms-dns 10.0.0.2

Change them to(自己的電腦IP位置，hostname -I)
ms-dns 8.8.8.8
ms-dns 8.8.4.4
~~~
上方有name的名稱是下方server的內容

sudo vi /etc/ppp/chap-secrets
~~~
# Secrets for authentication using CHAP
# client        server  secret                  IP addresses
user1 pptpd user1-password *
user2 pptpd user2-password *
~~~

sudo vi /etc/pptpd.conf
~~~
logwtmp一般沒註解
下方兩個取消註解
localip 192.168.0.1
remoteip 192.168.0.128-255
~~~

### Enable IP Forwarding 開啟核心IP轉發
In order for the VPN server to route packets between VPN client and the outside world, we need to enable IP forwarding. Thus, the VPN server becomes a router.

sudo vi /etc/sysctl.conf
~~~
取消註解
net.ipv4.ip_forward = 1

執行:
sudo sysctl -p
~~~

### Configure Firewall for IP Masquerading
~~~
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
~~~

### Start PPTPD Daemon
~~~
sudo /etc/init.d/pptpd restart

sudo systemctl start pptpd
sudo service pptpd start
~~~

待確認內容:
AWS需要開TCP/1723

### VPN連線
~~~
   IP   :8.8.8.8
account :user1
password:user1-password
~~~


參考資料:
[Ubuntu 架設VPN Server with pptp](https://carl830.pixnet.net/blog/post/68143721)<BR>
[Set up Your Own PPTP VPN Server On Debian, Ubuntu, CentOS](https://www.linuxbabe.com/linux-server/setup-your-own-pptp-vpn-server-on-debian-ubuntu-centos)<br>
[ubuntu 16.04 搭建 pptp vpn](https://codertw.com/%E7%A8%8B%E5%BC%8F%E8%AA%9E%E8%A8%80/621310/)
[PPTPServer](https://help.ubuntu.com/community/PPTPServer)


## google關鍵字
Q&A pptp 無法連線網路<br>

操作方式:<br>
控制台 > 網路和網際網路 > 網路連線 > <br>
滑鼠右鍵去點選你的VPN > 內容 > 網路功能 > <br>
開啟TCP/IP v4 > <br>
進階 > 使用遠端網路預設閘道 ，不要去勾選此項目

參考來源:[VPN撥通後就無法連線外網怎麼辦!?](https://ithelp.ithome.com.tw/questions/10059309)


## 待測試內容
## l2tp vpn server ubuntu
[Ubuntu下搭建L2TP VPN Server](https://www.itread01.com/content/1493815334.html)
~~~
apt-get install ppp xl2tpd -y
*openswan*
sudo apt-get install strongswan
~~~
vim /etc/ipsec.conf
~~~
config setup
    dumpdir=/var/run/pluto/
    nat_traversal=yes
    virtual_private=%v4:10.0.0.0/8,%v4:192.168.0.0/16,%v4:172.16.0.0/12,%v4:25.0.0.0/8,%v6:fd00::/8,%v6:fe80::/10
    oe=off
    protostack=netkey
    force_keepalive=yes
    keep_alive=1800
conn L2TP-PSK-NAT
    rightsubnet=vhost:%priv
    also=L2TP-PSK-noNAT
    leftnexthop=%defaultroute
    rightnexthop=%defaultroute
conn L2TP-PSK-noNAT
    authby=secret
    pfs=no
    auto=add
    keyingtries=3
    rekey=no
    ikelifetime=8h
    keylife=1h
    type=transport
    left=172.16.0.61//設置為服務端的外網ip地址
    leftprotoport=17/1701
    right=%any
    rightprotoport=17/%any
    dpddelay=40
    dpdtimeout=130
    dpdaction=clear
~~~
:/etc# sudo vi ipsec.secrets
~~~
#include /var/lib/openswan/ipsec.secrets.inc  #註意這一行要註釋掉
172.25.11.223%any:PSK"1110005440"  //設置為服務器內網的地址，並設置密碼（可以自定義設置）
include /var/lib/openswan/ipsec.secrets.inc

172.25.11.223%any:PSK"123"  //設置為服務器內網的地址，並設置密碼（可以自定義設置）
~~~
vi /etc/sysctl.conf 
~~~
# /etc/sysct.conf
# only values specific for ipsec/l2tp functioning are shown here. merge with 
#  existing file
net.ipv4.ip_forward = 1
net.ipv4.conf.default.rp_filter = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.icmp_ignore_bogus_error_responses = 1
~~~

for vpn in /proc/sys/net/ipv4/conf/*; do echo 0 > $vpn/accept_redirects; echo 0 >
 $vpn/send_redirects; done
sysctl -p //使修改生效

~~~
for vpn in /proc/sys/net/ipv4/conf/*; do echo 0 > $vpn/accept_redirects; echo 0 
 vpn/send_redirects; done
sysctl -p //使修改生效
~~~

參考資料:
[Ubuntu 架設 L2TP IPSec VPN Server (Mac 相容)](https://blog.toright.com/posts/5176/ubuntu-%E6%9E%B6%E8%A8%AD-l2tp-ipsec-vpn-server-mac-%E7%9B%B8%E5%AE%B9.html)<BR>


[openswan   包不適用於Ubuntu 16.04，但（非常相似） strongswan   包裝可用。](https://t.codebug.vip/questions-384778.htm)
https://danielhuang030.pixnet.net/blog/post/268697168

[Ubuntu下搭建L2TP VPN Server](https://www.itread01.com/content/1493815334.html)