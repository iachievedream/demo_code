# php
###### tags:`code`

[base](#base)<br>
* [計算字串數字量](##計算字串數字量)<br>
* [計算陣列數量](##計算陣列數量)<br>
* [list是陣列做變數分散](##list是陣列做變數分散)<br>
* [陣列用字串打印](##陣列用字串打印)<br>
* [explode是中間有何種數值做切開的函數](##explode是中間有何種數值做切開的函數)<br>
* [加解密](##加解密)<br>
* [other](##other)<br>

[session](#session)<br>
[time](#time)<br>
[php_array_sord](#php_array_sord)<br>
[funtion](#funtion)<br>
[class_object](#class_object)<br>
[php_unit_test](#php_unit_test)<br>


## base
### 計算字串數字量
~~~php
$a = "abcdef";
echo strlen($a)."<br>";
~~~

### 計算陣列數量
~~~php
$b = ["a","b","c","d"];
$length = count($b);
echo $length."<br>";
~~~

### list是陣列做變數分散
~~~php
$ab = array("12","34","56");
list($a,$b,$c) = $ab;
echo "a=".$a.",b=".$b."c=".$c."<br>";
$list = $a.$b.$c;
echo $list;
~~~

### 陣列用字串打印
~~~php
$a [a1]= "abc1";
$a [a2]= "abc2";
$a [a3]= "abc3";
$a [a4]= "abc4";
$abc = "";
foreach ($a as $k => $v) {
    $abc .= $k."=>".$v.",<br>";
}
echo $abc;
~~~

### explode是中間有何種數值做切開的函數
~~~php
list($abcd,$efgh) = explode("3",$list);
$aa=array($abcd,$efgh);
echo "<pre>";print_r($aa);echo "</pre>";

// 最佳應用:list($year,$month,$day) = explode("-",$born);
~~~

### 加解密
~~~php
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
~~~

### other
~~~php
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

正規表示
~~~

## session
~~~html
<br><br>
<form action="session.php" method="post">
<input type="text" name="inlogin" value="input_username">
<button id="login" name="login">login</button>
</form>

<?php
session_start();
$username = $_POST['inlogin'];
if(!empty( $username)) {
    $_SESSION['username'] = $username;
}

if(isset($_SESSION['username'])) {
    echo "登入成功";
?>

<form action="session.php" method="post">
<input type="text" name="inlogout" value="input_username">
<button id="login" name="logout">logout</button>
</form>

<?php
}
if($_POST['inlogout']) {
    unset($_SESSION['username']);
}
?>
~~~

## time
~~~php
/*
time()是時間戳
date是時間戳轉日期的函數
strtotime是日期轉時間戳的函數
*/

date('Y-m-d H:i:s');

strtotime(date('Y-m-d H:i:s'));
strtotime(date('Y-m-d 18:00:00'));
strtotime($date . ' ' . $time);
date('Y-m-d H:i:s', strtotime('+8 hours'));

//現在的時間戳
echo '現在 date strtotime +8 hours 的時間戳' . date('Y-m-d H:i:s', strtotime('+8 hours')) . '<br>';
$nowtime = time();
echo '<br>現在  time()  的時間戳' . $nowtime . '<br>';
echo '現在時間戳的date' . date('Y-m-d H:i:s', $nowtime) . '<br>';

//現在時間的表示語法
$a = '2020-08-16 10:10:25';
$b = strtotime($a);
echo '現在strtotime 的時間戳' . $b . '<br>';
$total = strtotime($b) - strtotime($a);
echo '現在strtotime的total時間戳' . date('Y-m-d H:i:s', $total) . '<br><br><br>';

echo '<br>現在nowtime的時間戳' . $nowtime . '<br>';
echo '現在 date的時間戳' . date('Y-m-d H:i:s', $nowtime) . '<br>';
$y = date('y', strtotime($nowtime));
$m = date('m', strtotime($nowtime));
$w = date('w', strtotime($nowtime));
$d = date('d', strtotime($nowtime));
echo '年為' . $y . '<br>月為' . $m . '<br>周為' . $w . '<br>日為' . $d . '<br>';
~~~

## php_array_sord
~~~php
// $arr = array(75,6,5,44,3);
// $arr = array(75,36,53,44,53,53);
$arr = array(75, 36, 34, 44, 53, 53, 67, 44, 12, 64);
echo "<br>";
// //列出陣列數值
// echo 5;die;
// echo count($arr);die;
//列出原陣列數值
for ($i = 0; $i < count($arr); $i++) {
    echo $i . ", " . $arr[$i] . "<br>";
}
//排列方式
for ($j = 1; $j < count($arr); $j++) {
    //    echo $j.", ".$arr[$j]."<br>";
    for ($i = 0; $i < $j; $i++) {
        // echo $i.", ".$arr[$i]."<br>";
        if ($arr[$i] > $arr[$j]) {
            $c = $arr[$i];
            $arr[$i] = $arr[$j];
            $arr[$j] = $c;
        }
    }
}
echo "<br>";
//列出排列後的陣列數值
for ($i = 0; $i < count($arr); $i++) {
    echo $i . ", " . $arr[$i] . "<br>";
}
// 之前錯誤地方：
// $字號要加，以及等號兩邊涵義要弄清楚，
// i與j變數前面也有$字號，已讓它成為變數。
~~~

## funtion
~~~php
$a = 12;
$b = 38;
$c = 1;
function total($a,$b){
    return $a+$b;
}
$d=total($b,$c);
echo "第一項顯示".$d;
echo "<br>";


//有下列兩行則無法顯示array的功能
// $aa = 741;
// echo "第二項顯示".$aa;

echo "<br>";

$aa[] = 123;
$aa[] = 456;
echo "第三項顯示".$aa[1];
for($i=0;$i<=2;$i++){
    echo "重複顯示".$aa[$i]."<br>";
}
echo "<br>";

$aa[5] = 123;
$aa[6] = 456;
$aa[7] = 789;
$aa[] = 147;
$aa[] = 258;
for($i=5;$i<=8;$i++){
    echo "重複測試顯示".$aa[$i]."<br>";
}
echo "<br>";

for($i=0;$i<=8;$i++){
    echo "全部測試顯示".$aa[$i]."<br>";
}
$ddd =array(1,3,5);
for($i=0;$i<=2;$i++){
    echo $ddd[$i]."<br>";
}
echo $ddd."<br>";
echo $ddd[2];
~~~

## class_object
~~~php
class Solution {
    /**
     * @param Integer[] $nums
     * @param Integer $target
     * @return Integer[]
     */
    // public $nums;
    public $target;
    public $nums = array(2,7,11,15);

    public function twoSum($target) {
    // public function twoSum($nums, $target) {
        // echo "第一個數字".$this->nums[0]."<br>";
        // echo "第二個數字為".$this->nums[1]."<br>";
        // // echo "目標數字".$this->target."<br>";//錯誤表示
        // echo "目標數字".$target."<br>"; 

        if($target==($this->nums[0]+$this->nums[1])){
            return 1;
        }else{
            return 0;
        }
    }
}

$abcd = new Solution();
echo "答案為".$abcd->twoSum(9);
// 正確的class以及this的使用方式(內涵array的部分)
// function外，class內的變數引用是使用this，如果是function裡面的則是直接使用變數。
~~~

## php_unit_test
~~~php

~~~

## mysql
## test

## class
## flie_upload
## msg_pure
## msg_PDO
## msg_pure_ajax
## user_pure_php
## frameworks
