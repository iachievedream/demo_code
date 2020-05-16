# Android Studio ubuntu
cd newfile/

sudo vi Android.sh
~~~
wget https://dl.google.com/dl/android/studio/ide-zips/3.1.3.0/android-studio-ide-173.4819257-linux.zip

sudo mv android-studio-ide-*-linux.zip /opt/
cd /opt/
sudo unzip /opt/android-studio-ide-*-linux.zip

sudo chown -R raj:raj android-studio

cd /opt/android-studio/bin/

./studio.sh

sudo ln -sf /opt/android-studio/bin/studio.sh /bin/android-studio
~~~

資料來源：<a href="https://www.itzgeek.com/how-tos/linux/ubuntu-how-tos/how-to-install-android-studio-on-ubuntu-18-04-lts-bionic-beaver.html">How To Install Android Studio on Ubuntu 18.04 LTS (Bionic Beaver)</a>
