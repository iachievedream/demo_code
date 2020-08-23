<?php
//現在的時間戳
$nowtime = time();
echo date('Y-m-d H:i:s', strtotime('+8 hours'));
echo "<br>現在  time()  的時間戳".$nowtime."<br>";
echo "現在 date的時間戳".date('Y-m-d H:i:s', $nowtime)."<br>";
echo "現在 date strtotime +8 hours 的時間戳".date('Y-m-d H:i:s', strtotime('+8 hours'))."<br>";

//現在時間的表示語法
$a = "2020-08-16 10:10:25";
$b = strtotime($a);
echo "現在strtotime 的時間戳".$b."<br>";
$total = strtotime($b)-strtotime($a);
echo "現在strtotime的total時間戳".date('Y-m-d H:i:s',$total)."<br><br><br>";

echo "<br>現在nowtime的時間戳".$nowtime."<br>";
echo "現在 date的時間戳".date('Y-m-d H:i:s', $nowtime)."<br>";
$y = date("y", strtotime($nowtime));
$m = date("m", strtotime($nowtime));
$w = date("w", strtotime($nowtime));
$d = date("d", strtotime($nowtime));
echo "年為".$y."<br>月為".$m."<br>周為".$w."<br>日為".$d."<br>";

/*
time()是時間戳
date是時間戳轉日期的函數
strtotime是日期轉時間戳的函數

list($year,$month,$day) = explode("-",$born);
list是陣列做變數分散
explode是中間有何種數值做切開的函數
*/
$ab = array("12","34","56");
list($a,$b,$c) = $ab;
echo "a=".$a.",b=".$b."c=".$c."<br>";
$list = $a.$b.$c;
echo $list;
list($abcd,$efgh) = explode("3",$list);
$aa=array($abcd,$efgh);
echo "<pre>";print_r($aa);echo "</pre>";

?>