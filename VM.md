# VM

## windows

在VMware選單欄上選擇 虛擬機器
->安裝 VMware Tools

## ubuntu
在VMware選單欄上<br>
選擇->虛擬機器->安裝 VMware Tools,點選ubuntu左側列表裡的DVD圖示.

出現VMware Tools的安裝檔案VMwareTools-10.1.6-5214329.tar.gz,<br>
複製此檔案到本地目錄並解壓,<br>
解壓出來可以看到有一個vmware-install.pl的檔案,

這個檔案就是安裝VMware Tools的指令碼檔案,
使用指令為:
~~~
sudo perl vmware-indatll.pl
~~~
### Network
install server, setting Bridged to network.<br>
NAT is not network.
#### import:
~~~
Bridged networking This is for more advanced networking needs such as network simulations and running servers in a guest. When enabled, VirtualBox connects to one of your installed network cards and exchanges network packets directly, circumventing your host operating system’s network stack.
這個模式 繞過你的 host 直接對外溝通

Host-only networking This can be used to create a network containing the host and a set of virtual machines, without the need for the host’s physical network interface. Instead, a virtual network interface (similar to a loopback interface) is created on the host, providing connectivity among virtual machines and the host.
這個模式 只能與你的 host 連線 使用你 host 上的虛擬網卡 不使用 host 的實體網卡
不能直接對外溝通
~~~
參考資料:<br>
[用VirtualBox安裝ubuntu不能連區網 - Ubuntu安裝問題](https://www.ubuntu-tw.org/modules/newbb/viewtopic.php?post_id=215944)