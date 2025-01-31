<?php

namespace App\Controller;

use App\Entity\Product\ProductVariant;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

class TestController
{
    #[Route('/debug/product-variant/{code}', name: 'debug_product_variant')]
    public function debugVariant(string $code, EntityManagerInterface $entityManager): JsonResponse
    {
        $repository = $entityManager->getRepository(ProductVariant::class);
        $productVariant = $repository->findOneBy(['code' => $code]);

        if (!$productVariant) {
            return new JsonResponse(['error' => 'ProductVariant not found'], 404);
        }

        return new JsonResponse([
            'id' => $productVariant->getId(),
            'code' => $productVariant->getCode(),
            'ean' => $productVariant->getEan(),
        ]);
    }
}
