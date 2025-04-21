<?php

namespace App\Twig;

use Twig\Extension\AbstractExtension;
use Twig\TwigFunction;
use App\Repository\ProductRepositoryInterface;
use Sylius\Component\Channel\Context\ChannelContextInterface;

class ProductExtension extends AbstractExtension
{
    public function __construct(
        private ProductRepositoryInterface $productRepository,
        private ChannelContextInterface $channelContext
    ) {}

    public function getFunctions(): array
    {
        return [
            new TwigFunction('products_by_taxon_slug', [$this, 'getProductsByTaxonSlug']),
        ];
    }

    public function getProductsByTaxonSlug(string $slug, string $locale): array
    {
        $channel = $this->channelContext->getChannel();

        // Appelle le repo qui filtre déjà les produits par canal
        return $this->productRepository->findByTaxonSlug($slug, $locale, $channel);
    }
}
