<?php
class index {
    public function index() {
        if($_SESSION['login_session'] = null && $_SESSION['username'] = null){
            echo "非法登入";
            // sleep(3);
            // header ("Location:login.php");
        } else {
            echo "登入模式";
        }
    }


}

echo "abc";
$ab = new index;
echo $ab;