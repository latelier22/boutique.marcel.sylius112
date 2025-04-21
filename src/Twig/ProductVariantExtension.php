<?php

// src/Twig/ProductVariantExtension.php

namespace App\Twig;

use Twig\Extension\AbstractExtension;
use Twig\TwigFunction;
use App\Repository\ProductVariantRepository;
use Sylius\Component\Channel\Context\ChannelContextInterface;

class ProductVariantExtension extends AbstractExtension
{
    public function __construct(
        private ProductVariantRepository $variantRepository,
        private ChannelContextInterface $channelContext
    ) {}

    public function getFrontProducts(): array
    {
        return $this->variantRepository->findProductsWithFrontVariants(
            $this->channelContext->getChannel()
        );
    }
    
    public function getTableauProducts(): array
    {
        return $this->variantRepository->findProductsWithTableauVariants(
            $this->channelContext->getChannel()
        );
    }
    
    public function getVariantsByProductTaxonSlug(string $slug, string $locale): array
    {
        return $this->variantRepository->findVariantsByProductTaxonSlug(
            $slug,
            $locale,
            $this->channelContext->getChannel()
        );
    }
    public function getFunctions(): array
    {
        return [
            new TwigFunction('front_products', [$this, 'getFrontProducts']),
            new TwigFunction('tableau_products', [$this, 'getTableauProducts']),
            new TwigFunction('variants_by_product_taxon_slug', [$this, 'getVariantsByProductTaxonSlug']),
        ];
    }    
}
