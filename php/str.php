<?php

?>
字串分隔合併


查詢

擷取以及取代

格式化

分析

轉換


對比

加密

str_rot13($ab)
crypt($ab)

md5($ab)

sha1($ab,)

<?php
$in="abc123";
$md5=md5($in);
echo "MD5:".$md5."<br>";
echo "MD5解密:".md5($md5)."<br>";

$crypt=crypt($in,$in);
echo "crypt:".$crypt."<br>";
echo "crypt解密:".crypt($crypt,$crypt)."<br>";

$base64_encode=base64_encode($in);
echo "base64_encode:".$base64_encode."<br>";
echo "base64_encode解密:".base64_decode($base64_encode)."<br>";

$urlencode=urlencode($in);
echo "urlencode:".$urlencode."<br />";
echo "urlencode解密:".urldecode($urlencode)."<br /><hr />";

?>


正規表示

