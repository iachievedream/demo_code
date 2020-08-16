<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<?php
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
?>

</body>
</html>