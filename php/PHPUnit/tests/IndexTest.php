<?php
class IndexTest extends \PHPUnit\Framework\TestCase
{
    public function testHello()
    {
        $_GET['name'] = 'Wade';

        ob_start();
        include '../index.php';
        $content = ob_get_clean();

        $this->assertEquals('Hello Wade', $content);
    }
}