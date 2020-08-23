<?php
// 計算字串數字量
$a = "abcdef";
echo strlen($a)."<br>";

// 計算陣列數量
$b = ["a","b","c","d"];
$length = count($b);
echo $length."<br>";

// list是陣列做變數分散
$ab = array("12","34","56");
list($a,$b,$c) = $ab;
echo "a=".$a.",b=".$b."c=".$c."<br>";
$list = $a.$b.$c;
echo $list;

// explode是中間有何種數值做切開的函數
list($abcd,$efgh) = explode("3",$list);
$aa=array($abcd,$efgh);
echo "<pre>";print_r($aa);echo "</pre>";

// 最佳應用:list($year,$month,$day) = explode("-",$born);

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

