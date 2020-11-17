<?php
class index {
    public function index1() {
        if($_SESSION['login_session'] = null && $_SESSION['username'] = null){
            echo "非法登入";
            // sleep(3);
            // header ("Location:login.php");
        } else {
            echo "登入模式12";
        }
    }

    public function index2() {
            echo "非法登入";
    }

}

// echo "abc";
$ab = new index;
$abc = $ab->index2;
echo $abc;