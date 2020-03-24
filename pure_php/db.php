<?php
//mysqli
// $db = mysqli_connect("localhost","root","password","dbname");
// if($db) {
//     echo "data connection successfully<br>";
// } else {
//     die("data connection failed<br>");
// }

require_once("password.php");
//PDO
// $host = 'localhost';
// $dbname = 'pure_php';
// $user = 'root';
// $pass = '12345678';
try{
    $connection = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
    // echo "連線成功";
} catch (PDOException $e) {
    echo $e->getMessage();
}
