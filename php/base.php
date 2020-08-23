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
