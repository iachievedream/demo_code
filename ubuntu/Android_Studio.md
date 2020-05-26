# Android Studio ubuntu
資料來源：<a href="https://www.cnblogs.com/jianhaoscnu/p/12915862.html">如何在ubuntu 上安装配置Android Studio</a>
~~~
wget https://dl.google.com/dl/android/studio/ide-zips/3.6.3.0/android-studio-ide-192.6392135-linux.tar.gz
cd /opt
sudo mkdir android_studio

cd ~/Downloads
sudo tar -zxvf android-studio-ide-192.6392135-linux.tar.gz -C /opt/android_studio 

cd /opt/android_studio/android-studio/bin

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
ubuntu@ubuntu-VirtualBox:/opt/android_studio/android-studio/bin$ ./studio.sh
Gtk-Message: 16:37:33.876: Failed to load module "canberra-gtk-module"
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
sudo apt install libcanberra-gtk-module libcanberra-gtk3-module

./studio.sh
~~~
virtualbox 開啟 Nested VT-x/AMD-V
~~~
cd C:\Program Files\Oracle\VirtualBox
.\VBoxManage.exe modifyvm <VM_NAME> --nested-hw-virt on
~~~

