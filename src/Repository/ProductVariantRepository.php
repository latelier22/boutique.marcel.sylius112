<?php

declare(strict_types=1);

namespace App\Repository;

use Sylius\AdminOrderCreationPlugin\Doctrine\ORM\ProductVariantRepositoryInterface;
use Sylius\AdminOrderCreationPlugin\Doctrine\ORM\ProductVariantRepositoryTrait;
use Sylius\Bundle\CoreBundle\Doctrine\ORM\ProductVariantRepository as BaseProductVariantRepository;
use Sylius\Component\Channel\Model\ChannelInterface;

final class ProductVariantRepository extends BaseProductVariantRepository implements ProductVariantRepositoryInterface
{
    use ProductVariantRepositoryTrait;

    public function findProductsWithFrontVariants(ChannelInterface $channel): array
    {
        $results = $this->createQueryBuilder('v')
            ->innerJoin('v.product', 'p')
            ->innerJoin('p.channels', 'c')
            ->where('v.isFront = true')
            ->andWhere('v.enabled = true')
            ->andWhere('p.enabled = true')
            ->andWhere('c.code = :channelCode')
            ->setParameter('channelCode', $channel->getCode())
            ->groupBy('p.id')
            ->getQuery()
            ->getResult();

        return array_map(fn($variant) => $variant->getProduct(), $results);
    }

    public function findProductsWithTableauVariants(ChannelInterface $channel): array
    {
        $variants = $this->createQueryBuilder('v')
            ->innerJoin('v.product', 'p')
            ->innerJoin('p.channels', 'c')
            ->where('v.isTableau = true')
            ->andWhere('v.enabled = true')
            ->andWhere('p.enabled = true')
            ->andWhere('c.code = :channelCode')
            ->setParameter('channelCode', $channel->getCode())
            ->groupBy('p.id')
            ->getQuery()
            ->getResult();

        return array_unique(array_map(fn($variant) => $variant->getProduct(), $variants), SORT_REGULAR);
    }

    public function findVariantsByProductTaxonSlug(string $slug, string $locale, ChannelInterface $channel): array
    {
        return $this->createQueryBuilder('v')
            ->innerJoin('v.product', 'p')
            ->innerJoin('p.productTaxons', 'pt')
            ->innerJoin('pt.taxon', 't')
            ->innerJoin('t.translations', 'tt')
            ->innerJoin('v.channelPricings', 'cp')
            ->innerJoin('p.channels', 'c')
            ->andWhere('tt.slug = :slug')
            ->andWhere('tt.locale = :locale')
            ->andWhere('p.enabled = true')
            ->andWhere('v.enabled = true')
            ->andWhere('cp.channelCode = :channelCode')
            ->andWhere('c.code = :channelCode')
            ->setParameter('slug', $slug)
            ->setParameter('locale', $locale)
            ->setParameter('channelCode', $channel->getCode())
            ->addSelect('p', 'pt', 't', 'cp')
            ->orderBy('pt.position', 'ASC')
            ->getQuery()
            ->getResult();
    }
}
