<?php

declare(strict_types=1);

namespace App\Service;

use App\Repository\ProductRepositoryInterface;

class ProductService
{
    /** @var ProductRepositoryInterface */
    private $productRepository;

    public function __construct(ProductRepositoryInterface $productRepository)
    {
        $this->productRepository = $productRepository;
    }

    /**
     * Récupère les produits de la catégorie "TAB"
     */
    public function findProductImagesByTaxonCode(string $taxonCode)
    {
        return $this->productRepository->findProductImagesByTaxonCode($taxonCode);
    }
}
