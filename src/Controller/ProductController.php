<?php

declare(strict_types=1);

namespace App\Controller;

use App\Service\ProductService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;

class ProductController extends AbstractController
{
    /** @var ProductService */
    private $productService;

    public function __construct(ProductService $productService)
    {
        $this->productService = $productService;
    }

    /**
     * @Route("/product/images/by-category/{taxonCode}", name="product_images_by_category")
     */
    public function showProductImagesByTaxonCode(string $taxonCode): Response
    {
        // Récupérer les produits de la catégorie "TAB"
        $products = $this->productService->findProductImagesByTaxonCode($taxonCode);

        // dd($products);

        return $this->render('product/images_by_category.html.twig', [
            'products' => $products,
            'taxonCode' => $taxonCode
        ]);
    }

    /**
     * @Route("/api/v2/product/images/{taxonCode}", name="api_product_images", methods={"GET"})
     */
    public function getProductImagesAsJson(string $taxonCode): JsonResponse
    {
        // Récupérer les produits de la catégorie "TAB" ou autre catégorie par taxonCode
        $products = $this->productService->findProductImagesByTaxonCode($taxonCode);

        // Transformer les données des produits en un format adapté pour JSON
        

        return new JsonResponse($products);
    }
}

