<?php

namespace App\Repository;

use Sylius\Bundle\TaxonomyBundle\Doctrine\ORM\TaxonRepository as BaseTaxonRepository;

class TaxonRepository extends BaseTaxonRepository
{
    public function findRootTaxonsSortedByProductCount(): array
    {
        return $this->createQueryBuilder('t')
            ->leftJoin('t.products', 'p')
            ->addSelect('COUNT(p) AS HIDDEN productCount')
            ->andWhere('t.parent IS NULL')
            ->groupBy('t.id')
            ->orderBy('productCount', 'DESC')
            ->getQuery()
            ->getResult();
    }
}
