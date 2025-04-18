<?php

// src/Repository/ProductRepository.php
namespace App\Repository;

use Sylius\Bundle\CoreBundle\Doctrine\ORM\ProductRepository as BaseProductRepository;
use Sylius\Component\Core\Model\ProductInterface;
use Sylius\Component\Taxonomy\Model\TaxonInterface;


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

// src/Repository/ProductRepository.php

public function findAllTableauxWithTaxons(): array
{
    $qb = $this->createQueryBuilder('p')
        ->join('p.variants', 'v')
        ->leftJoin('p.productTaxons', 'pt')
        ->leftJoin('pt.taxon', 't')
        ->addSelect('v', 'pt', 't')
        ->where('v.isTableau = true')
        ->andWhere('p.enabled = true');

    return $qb->getQuery()->getResult();
}

public function findByTaxon(TaxonInterface $taxon): array
{
    return $this->createQueryBuilder('p')
        ->join('p.productTaxons', 'pt')
        ->join('pt.taxon', 't')
        ->join('p.variants', 'v')
        ->andWhere('t = :taxon')
        ->andWhere('v.isTableau = true')
        ->andWhere('p.enabled = true')
        ->setParameter('taxon', $taxon)
        ->addSelect('v', 'pt', 't')
        ->getQuery()
        ->getResult();
}


}
