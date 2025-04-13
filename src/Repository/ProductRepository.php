<?php

// src/Repository/ProductRepository.php
namespace App\Repository;

use Sylius\Bundle\CoreBundle\Doctrine\ORM\ProductRepository as BaseProductRepository;
use Sylius\Component\Core\Model\ProductInterface;

class ProductRepository extends BaseProductRepository implements ProductRepositoryInterface
{
    public function findBySlug(string $slug, string $locale): ?ProductInterface
    {
        return $this->createQueryBuilder('product')
            ->innerJoin('product.translations', 'translation', 'WITH', 'translation.locale = :locale')
            ->andWhere('translation.slug = :slug')
            ->setParameter('slug', $slug)
            ->setParameter('locale', $locale)
            ->getQuery()
            ->getOneOrNullResult();
    }

    public function findAllWithIsTableauVariant(): array
{
    return $this->createQueryBuilder('p')
        ->addSelect('v')
        ->leftJoin('p.variants', 'v')
        ->leftJoin('p.translations', 't')
        ->leftJoin('p.images', 'images')
        ->andWhere('v.isTableau = true')
        ->andWhere('p.enabled = true')
        ->getQuery()
        ->getResult();
}
}
