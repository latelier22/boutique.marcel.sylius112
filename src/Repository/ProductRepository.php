<?php

declare(strict_types=1);

namespace App\Repository;

use App\Repository\ProductRepositoryInterface;
use App\Repository\ProductRepositoryTrait;
use Sylius\Bundle\CoreBundle\Doctrine\ORM\ProductRepository as BaseProductRepository;

final class ProductRepository extends BaseProductRepository implements ProductRepositoryInterface
{
    use ProductRepositoryTrait; // Inclure le trait pour ajouter des méthodes personnalisées
}
