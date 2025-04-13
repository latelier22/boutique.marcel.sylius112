<?php

declare(strict_types=1);

namespace App\Repository;

use Sylius\AdminOrderCreationPlugin\Doctrine\ORM\ProductVariantRepositoryInterface;
use Sylius\AdminOrderCreationPlugin\Doctrine\ORM\ProductVariantRepositoryTrait;
use Sylius\Bundle\CoreBundle\Doctrine\ORM\ProductVariantRepository as BaseProductVariantRepository;

// src/Repository/ProductVariantRepository.php

final class ProductVariantRepository extends BaseProductVariantRepository implements ProductVariantRepositoryInterface
{
    use ProductVariantRepositoryTrait;

    public function findProductsWithFrontVariants(): array
{
    $results = $this->createQueryBuilder('v')
        ->innerJoin('v.product', 'p')
        ->where('v.isFront = true')
        ->andWhere('p.enabled = true')
        ->groupBy('p.id')
        ->getQuery()
        ->getResult();

    // on récupère les produits liés aux variants
    return array_map(fn($variant) => $variant->getProduct(), $results);
}

public function findProductsWithTableauVariants(): array
{
    $variants = $this->createQueryBuilder('v')
        ->innerJoin('v.product', 'p')
        ->where('v.isTableau = true')
        ->andWhere('p.enabled = true')
        ->groupBy('p.id')
        ->getQuery()
        ->getResult();

    // Retourne les produits uniques
    return array_unique(array_map(fn($variant) => $variant->getProduct(), $variants), SORT_REGULAR);
}

}
