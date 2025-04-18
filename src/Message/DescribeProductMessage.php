<?php

// src/Message/DescribeProductMessage.php
namespace App\Message;

class DescribeProductMessage
{
    private string $productCode;

    public function __construct(string $productCode)
    {
        $this->productCode = $productCode;
    }

    public function getCode(): string
    {
        return $this->productCode;
    }
}
