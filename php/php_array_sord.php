<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>arrangement</title>
</head>

<body>
    <?php
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
    ?>
</body>

</html>

<!-- 之前錯誤地方：
$字號要加，以及等號兩邊涵義要弄清楚，
i與j變數前面也有$字號，已讓它成為變數。 -->