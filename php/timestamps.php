<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
<?php
//現在的時間戳
$nowtime = time();
//現在時間的表示語法
echo date('Y-m-d H:i:s', strtotime('+8 hours'));
//strtotime
echo "第一項顯示".$datatime;
echo "<br>";

$a = "2020-08-16 10:10:25";
$b = strtotime($a);
echo "第二項顯示".$b;
echo "<br>";
echo "第三項顯示".date('Y-m-d H:i:s',$b);
// echo "第三項顯示".date('Y-m-d H:i:s', strtotime($b));錯誤方式
echo "<br>";

$c = "2020-08-01 12:00:00";
$d = "2020-08-02 13:30:30";
echo "第四項顯示".$d;
echo "<br>";
$total = strtotime($b)-strtotime($a);

$day = $total/(60*60*24);
echo $day."天";

?>

</body>
</html>