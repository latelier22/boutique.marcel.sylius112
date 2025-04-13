<?php

// src/Repository/ProductRepositoryInterface.php
namespace App\Repository;

use Sylius\Component\Core\Repository\ProductRepositoryInterface as BaseInterface;
use Sylius\Component\Core\Model\ProductInterface;

interface ProductRepositoryInterface extends BaseInterface
{
    public function findBySlug(string $slug, string $locale): ?ProductInterface;
}
