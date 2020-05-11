# Android Studio ubuntu

vi android.sh
~~~
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java8-set-default
java -version
~~~

sh android.sh


cd android-studio/bin/
./ studio.sh

sudo mv android-studio /usr/local/

sudo gedit ~/.profile

export ANDROID_HOME=/usr/local/android-studio/bin export PATH=$PATH:$ANDROID_HOME



open Android Studio,
click on Tools menu -> Create Desktop Entry.
This should create an entry on the dash.