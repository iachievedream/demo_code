<?PHP

//引入要測試的程式
require "../Math.php";
class MathTest extends \PHPUnit\Framework\TestCase
{
    //測試function的命名為test + function name
    public function testsum()
    {
        //assertEquals為判斷值是否相同，55為正確的結果，比對傳入sum(1,10)時，是否傳出55
        $this -> assertEquals(55,Math::sum(1,10));
        $this -> assertEquals(5050,Math::sum(1,100));
    }
}