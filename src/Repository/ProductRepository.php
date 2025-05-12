<?php

namespace App\Repository;

use Sylius\Bundle\CoreBundle\Doctrine\ORM\ProductRepository as BaseProductRepository;
use Sylius\Component\Core\Model\ProductInterface;
use Sylius\Component\Taxonomy\Model\TaxonInterface;
use Sylius\Component\Channel\Model\ChannelInterface;

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

    public function findAllWithIsTableauVariant(ChannelInterface $channel): array
    {
        return $this->createQueryBuilder('p')
            ->addSelect('v', 'cp')
            ->join('p.variants', 'v')
            ->join('v.channelPricings', 'cp')
            ->leftJoin('p.translations', 't')
            ->leftJoin('p.images', 'images')
            ->andWhere('v.isTableau = true')
            ->andWhere('p.enabled = true')
            ->andWhere('v.enabled = true')
            ->andWhere('cp.channelCode = :channelCode')
            ->setParameter('channelCode', $channel->getCode())
            ->getQuery()
            ->getResult();
    }

    public function findAllTableauxWithTaxons(ChannelInterface $channel): array
    {
        return $this->createQueryBuilder('p')
            ->join('p.variants', 'v')
            ->join('v.channelPricings', 'cp')
            ->leftJoin('p.productTaxons', 'pt')
            ->leftJoin('pt.taxon', 't')
            ->addSelect('v', 'cp', 'pt', 't')
            ->where('v.isTableau = true')
            ->andWhere('p.enabled = true')
            ->andWhere('v.enabled = true')
            ->andWhere('cp.channelCode = :channelCode')
            ->setParameter('channelCode', $channel->getCode())
            ->getQuery()
            ->getResult();
    }

    public function findByTaxonForChannel(TaxonInterface $taxon, ChannelInterface $channel): array
    {
        return $this->createQueryBuilder('p')
            ->join('p.productTaxons', 'pt')
            ->join('pt.taxon', 't')
            ->join('p.variants', 'v')
            ->join('v.channelPricings', 'cp')
            ->andWhere('t = :taxon')
            ->andWhere('v.isTableau = true')
            ->andWhere('p.enabled = true')
            ->andWhere('v.enabled = true')
            ->andWhere('cp.channelCode = :channelCode')
            ->setParameter('taxon', $taxon)
            ->setParameter('channelCode', $channel->getCode())
            ->addSelect('v', 'cp', 'pt', 't')
            ->getQuery()
            ->getResult();
    }

    public function findByTaxonSlug(string $slug, string $locale, ChannelInterface $channel): array
{
    return $this->createQueryBuilder('p')
        ->join('p.productTaxons', 'pt')
        ->join('pt.taxon', 't')
        ->join('t.translations', 'tt')
        ->join('p.channels', 'c') // ✅ Ici on filtre bien les produits par canal
        ->join('p.variants', 'v')
        ->join('v.channelPricings', 'cp')
        ->andWhere('tt.slug = :slug')
        ->andWhere('tt.locale = :locale')
        ->andWhere('p.enabled = true')
        ->andWhere('v.enabled = true')
        ->andWhere('cp.channelCode = :channelCode')
        ->andWhere('c.code = :channelCode')
        ->setParameter('slug', $slug)
        ->setParameter('locale', $locale)
        ->setParameter('channelCode', $channel->getCode())
        ->addSelect('v', 'cp', 'pt', 't')
        ->orderBy('pt.position', 'ASC')
        ->getQuery()
        ->getResult();
}
    
}
