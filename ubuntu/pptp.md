# VPN
## pptp
install
~~~
sudo apt-get install pptpd
~~~
sudo vi /etc/ppp/pptpd-options
~~~
Find the following line:
#ms-dns 10.0.0.1
#ms-dns 10.0.0.2

Change them to(自己的電腦IP位置)
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

5. Enable IP Forwarding 開啟核心IP轉發
In order for the VPN server to route packets between VPN client and the outside world, we need to enable IP forwarding. Thus, the VPN server becomes a router.

sudo vi /etc/sysctl.conf
~~~
取消註解
net.ipv4.ip_forward = 1
~~~
執行:
sudo sysctl -p

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

參考資料:
[Ubuntu 架設VPN Server with pptp](https://carl830.pixnet.net/blog/post/68143721)<BR>
[Set up Your Own PPTP VPN Server On Debian, Ubuntu, CentOS](https://www.linuxbabe.com/linux-server/setup-your-own-pptp-vpn-server-on-debian-ubuntu-centos)<br>
[ubuntu 16.04 搭建 pptp vpn](https://codertw.com/%E7%A8%8B%E5%BC%8F%E8%AA%9E%E8%A8%80/621310/)
[PPTPServer](https://help.ubuntu.com/community/PPTPServer)


l2tp vpn server

參考資料:
[Ubuntu 架設 L2TP IPSec VPN Server (Mac 相容)](https://blog.toright.com/posts/5176/ubuntu-%E6%9E%B6%E8%A8%AD-l2tp-ipsec-vpn-server-mac-%E7%9B%B8%E5%AE%B9.html)<BR>