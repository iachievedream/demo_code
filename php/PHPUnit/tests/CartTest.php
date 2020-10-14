<?php
/* tests/CartTest.php */

require __DIR__ . '/../Cart.php';

class CartTest extends PHPUnit_Framework_TestCase
{
    private $cart = null;

    private $products = [];

    public function setUp()
    {
        $this->cart = new Cart();
        $this->products = [
            new Product('紅標商品 1', 200, 'R'),
            new Product('紅標商品 2', 160, 'R'),
            new Product('綠標商品 1',  80, 'G'),
            new Product('綠標商品 2', 100, 'G'),
        ];
    }

    public function tearDown()
    {
        $this->cart = null;
        $this->products = [];
    }

    public function testAddOneRedProudct()
{
    $this->setExpectedException('CartException', '商品配對錯誤');
    $this->cart->addProduct($this->products[0]); // 紅標商品 1
    $this->cart->checkout();
}
}