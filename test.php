<?php 
echo "<br>Q:算出當天那周的請假人員以及後幾周的請假人員列表<br><br><br>";

/*
1給予今天或是某天的日期
2算出這周或某周的周一時間
3用陣列算列出當周的周一到周日日期(七個陣列)
4個別天數用sql搜尋出請假的人員


*/

// $thisday = time();
$thisday = "2020-08-22";
$r = weeknowday(1,$thisday);
echo $r;

function weeknowday ($nuber,$thisday){
    echo "今天日期".$thisday."<br>";
    // $today = date("Y-m-d",strtotime($thisday));
    $weeknowday = date("w",strtotime($thisday));
    // $today = date($thisday);
    echo "今天周".$weeknowday."<br>";

    $Sunday = date("Y-m-d", strtotime("$thisday-".$weeknowday." days"));
    $weekf = date("Y-m-d", strtotime("$Sunday+"."1 days"));
    echo "這周周一的日期".$weekf."<br>";
    //隔幾周的周一日期
    $thisweekf = date("Y-m-d", strtotime("$weekf+".($nuber*7)." days"));
    echo "隔幾周的周一的日期".$thisweekf."<br>";
    $r = week($thisweekf);
    return $r;
}

function week ($thisweekf){
    $week=array();
    for($i=0; $i<7; $i++) {
        // echo $i."<br>";
        $week[$i] = date("Y-m-d", strtotime("$thisweekf+"." ".$i." days"));
        // echo $week[$i]."<br>";
        }
    echo "<pre>";print_r($week);echo "</pre>";
    // $r =array();
    foreach($week as $k => $v) {
        // echo "<pre>";print_r($v);echo "</pre>";
        $r []= sqlday($v);
    }
    return $r;
}

function sqlday($week) {
    $sql = "SELECT name FROM vacation  AND off_date=".$week;
    echo $sql;
    return $sql;

    // $q = $this->db->query($sql);
    // $r = $q->result_array();
    // return $r;
}

?>