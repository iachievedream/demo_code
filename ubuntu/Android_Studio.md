# Android Studio ubuntu
## 安裝在ubuntu
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




## flutter报错 Gradle task assembleDebug failed with
### Q
資料來源：<a href="https://segmentfault.com/q/1010000019527353">flutter报错 Gradle task assembleDebug failed with</a>

~~~
Launching lib\main.dart on sdk gphone x86 arm in debug mode...
Running Gradle task 'assembleDebug'...
Checking the license for package Android SDK Build-Tools 28.0.3 in C:\Users\iachievedream\AppData\Local\Android\Sdk\licenses
Warning: License for package Android SDK Build-Tools 28.0.3 not accepted.
Checking the license for package Android SDK Platform 28 in C:\Users\iachievedream\AppData\Local\Android\Sdk\licenses
Warning: License for package Android SDK Platform 28 not accepted.

FAILURE: Build failed with an exception.

* What went wrong:
Could not determine the dependencies of task ':app:compileDebugJavaWithJavac'.
> Failed to install the following Android SDK packages as some licences have not been accepted.
     build-tools;28.0.3 Android SDK Build-Tools 28.0.3
     platforms;android-28 Android SDK Platform 28
  To build this project, accept the SDK license agreements and install the missing components using the Android Studio SDK Manager.
  Alternatively, to transfer the license agreements from one workstation to another, see http://d.android.com/r/studio-ui/export-licenses.html

  Using Android SDK: C:\Users\iachievedream\AppData\Local\Android\Sdk

* Try:
Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output. Run with --scan to get full insights.

* Get more help at https://help.gradle.org

BUILD FAILED in 10s
Exception: Gradle task assembleDebug failed with exit code 1
~~~
### A:解決方法
授權
~~~
flutter doctor --android-licenses
~~~
[Day 2：安裝 Flutter 開發環境](https://ithelp.ithome.com.tw/articles/10216013)
