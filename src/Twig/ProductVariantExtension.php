<?php

// src/Twig/ProductVariantExtension.php

namespace App\Twig;

use Twig\Extension\AbstractExtension;
use Twig\TwigFunction;
use App\Repository\ProductVariantRepository;

class ProductVariantExtension extends AbstractExtension
{
    public function __construct(private ProductVariantRepository $variantRepository) {}

    public function getFunctions(): array
    {
        return [
            new TwigFunction('front_products', [$this, 'getFrontProducts']),
            new TwigFunction('tableau_products', [$this, 'getTableauProducts']),
        ];
    }

    public function getFrontProducts(): array
    {
        return $this->variantRepository->findProductsWithFrontVariants();
    }

    public function getTableauProducts(): array
{
    return $this->variantRepository->findProductsWithTableauVariants();
}
}

