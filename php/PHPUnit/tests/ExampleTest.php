<?php

namespace Tests;

use PHPUnit\Framework\TestCase;

class ExampleTest extends TestCase
{
    /**
     * @test
     */
    public function smokeTest()
    {
        $shop = new shop(true);
    
        $this->assertInstanceOf(shop::class, $shop);
    }
}