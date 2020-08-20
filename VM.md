# VM

## windows

在VMware選單欄上選擇 虛擬機器
->安裝 VMware Tools

## ubuntu
在VMware選單欄上選擇 虛擬機器
->安裝 VMware Tools,點選ubuntu左側列表裡的DVD圖示,就會出現VMware Tools的安裝檔案VMwareTools-10.1.6-5214329.tar.gz:

拷貝並解壓VMwareTools-10.1.6-5214329.tar.gz

複製VMwareTools-10.1.6-5214329.tar.gz檔案到本地目錄,如下載資料夾,並解壓:

解壓出來可以看到有一個vmware-install.pl的檔案,這個檔案就是安裝VMware Tools的指令碼檔案:
使用指令為
sudo perl vmware-indatll.pl