簡易留言板:<br>
原先使用mysqli，此篇功能是改寫成PDO的方式。<br>
<br>
預處理：<a href="https://www.w3schools.com/php/php_mysql_prepared_statements.asp">PHP MySQL Prepared Statements</a>：<br>
官網<a href="https://www.php.net/manual/en/mysqli-stmt.bind-param">mysqli_stmt::bind_param</a>：<br>
kry：bind_param 和 bindParam<br>

~~~
try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // prepare sql and bind parameters
    $stmt = $conn->prepare("INSERT INTO MyGuests (name, email) VALUES (:name, :email)");
    $stmt->bindParam(':name', $firstname);
    $stmt->bindParam(':email', $email);

    $name = "John";
    $email = "john@example.com";
    $stmt->execute();
    echo "New records created successfully";
    }
catch(PDOException $e)
    {
    echo "Error: " . $e->getMessage();
    }
$conn = null;
~~~

異常處理：<br>
PHP：預設為直接報錯<br>
MYSQL：預設為靜默模式，錯就錯，不報錯<br>
PDO：預設為靜默模式，錯就錯，不報錯<br>
<br>
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_SILENT);<br>
pdo異常處理設定：<br>
設定PDO::ATTR_ERRMODE ，有以下三個值：<br>
PDO::ERRMODE_SILENT： 預設模式，不主動報錯，需要主動以 $pdo->errorInfo()的形式獲取錯誤資訊。<br>
PDO::ERRMODE_WARNING: 引發 E_WARNING 錯誤，主動報錯<br>
PDO::ERRMODE_EXCEPTION: 主動丟擲 exceptions 異常，需要以try{}cath(){}輸出錯誤資訊。<br>
<br>
來源：<br>
官方文件：<a href="https://www.php.net/manual/en/pdo.setattribute.php">PDO::setAttribute</a><br>
<a href="https://codertw.com/%E7%A8%8B%E5%BC%8F%E8%AA%9E%E8%A8%80/242753/">php PDO異常處理詳解</a><br>
<a href="https://blog.csdn.net/zhang197093/article/details/90384138">報錯資訊</a><br>
<a href="https://www.w3schools.com/php/php_mysql_connect.asp">PHP Connect to MySQL</a><br>
<br>
<br>
<br>
index.php：<a href="https://www.runoob.com/php/php-mysql-select.html">PHP MySQL 读取数据</a><br>
<br>
不懂：

~~~
        // while($row = $statement->fetch(PDO::FETCH_ASSOC)) {
        //     echo $row['user'] . ' ' . $row['pwd']."<br>";
        // }

        // $stmt = $conn->prepare("SELECT id, firstname, lastname FROM MyGuests");
        // $stmt->execute();
        // // set the resulting array to associative
        // $result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
        // foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) {
        //     echo $v;
        // }
~~~

未了解:<br>
array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));//PDO::MYSQL_ATTR_INIT_COMMAND 設定編碼<br>
<br>
參考資料:<br>
<a href="https://janet1.pixnet.net/blog/post/29054704-php-&-mysql-pdo-%E4%BD%BF%E7%94%A8%E6%96%B9%E6%B3%95">PHP & MYSQL PDO 使用方法</a><br>
<a href="https://medium.com/wetprogrammer/php-%E9%A8%99%E4%BD%A0-pdo-prepare-%E4%B8%A6%E6%B2%92%E6%9C%89%E6%BA%96%E5%82%99%E5%A5%BD-600e15cd4cfe">PHP 騙你，PDO prepare 並沒有準備好</a><br>
