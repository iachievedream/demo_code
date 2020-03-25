<?php
require_once("password.php");
try{
    $connection = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
    // echo "連線成功";
} catch (PDOException $e) {
    echo $e->getMessage();
}