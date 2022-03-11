# Raspberry 

## 初次進去 Raspberry 的設定

## ubuntu ssh

>   sudo apt-get update
>   sudo apt-get install -y openssh-server
>   sudo service ssh status

參考資料：[在 Ubuntu 安裝 SSH](https://oranwind.org/post-post-10/)

## 設定wifi連線方式
> sudo vi /etc/netplan/50-cloud-init.yaml
~~~
# This file is generated from information provided by the datasource.  Changes
# to it will not persist across an instance reboot.  To disable cloud-init's
# network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    ethernets:
        eth0:
            dhcp4: true
            optional: true
    version: 2
    wifis:
        //wlp3s0:
       wlan0:
            optional: true
            access-points:
                "SSID-NAME-HERE":
                    password: "PASSWORD-HERE"
            dhcp4: true
~~~

參考資料：[Ubuntu 20.04: Connect to WiFi from command line](https://linuxconfig.org/ubuntu-20-04-connect-to-wifi-from-command-line)

> sudo netplan generate
> sudo netplan apply

參考資料：[How to Connect to WiFi from the Terminal in Ubuntu Linux](https://itsfoss.com/connect-wifi-terminal-ubuntu/)
