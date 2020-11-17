## Codeigniter

#### Q&A Codeigniter: fatal error call to undefined function mysqli_init()

Go to your php init and uncomment the following:
>extension=php_mysqli.dll

第894行左右
;   extension=mysqli
註解拿掉