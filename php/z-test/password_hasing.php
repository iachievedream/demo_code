<?php
// $passwd = password_hash(,password_bcrypt);
// password_verify();


$hash = password_hash('memem', PASSWORD_DEFAULT);
// 註冊的時候
if (password_verify('memem', $hash)) {
  echo 'Password is valid!';
} else {
  echo 'Invalid password.';
} // 登入的時候


//     // 產生長度為32的鹽值
//     function salt() {
//         return md5(substr(uniqid(rand()), -6));
//     }

//     // 密碼加密 
//     function hashPassword($password, $salt) {
//         return hash('sha256', $password . $salt);
//     }
// echo hashPassword(123,1);

?>
