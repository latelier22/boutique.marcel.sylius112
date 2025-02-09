<?php

declare(strict_types=1);

namespace App\Controller\Admin;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;
use Sylius\Component\Core\Repository\ProductVariantRepositoryInterface;
use Sylius\Component\Core\Model\ProductVariant;

#[Route('/admin/product-variants')]
class ProductVariantFlagController extends AbstractController
{
    #[Route('/flag', name: 'admin_product_variant_flag', methods: ['POST'])]
    public function flagProductVariant(
        Request $request, 
        ProductVariantRepositoryInterface $productVariantRepository
    ): JsonResponse {
        $data = json_decode($request->getContent(), true);

        // Vérifie si un flag est fourni
        if (!isset($data['flag']) || empty($data['flag'])) {
            return new JsonResponse(['error' => 'Flag manquant'], Response::HTTP_BAD_REQUEST);
        }

        $flag = $data['flag'];

        // Recherche du produit variant par son flag
        /** @var ProductVariant|null $productVariant */
        $productVariant = $productVariantRepository->findOneBy(['flag' => $flag]);

        // Récupère tous les variants sans flag
        $variantsWithoutFlag = $productVariantRepository->findBy(['flag' => null]);

        // Formatage des données pour le JSON
        $response = [
            'product_variant' => $productVariant ? [
                'id' => $productVariant->getId(),
                'code' => $productVariant->getCode(),
                'name' => $productVariant->getTranslation('fr_FR')->getName() ?? 'Nom non disponible',
                'ean' => $productVariant->getEan() ?? 'Non défini',
                'Stock' => $productVariant->getOnHand() ?? 'Non suivi',
                'price' => $productVariant->getChannelPricings()['default']->getPrice() / 100 ?? 'Prix non défini',
            ] : null,
            'variants_without_flag' => array_map(fn(ProductVariant $variant) => [
                'id' => $variant->getId(),
                'code' => $variant->getCode(),
                'name' => $variant->getTranslation('fr_FR')->getName() ?? 'Nom non disponible',
            ], $variantsWithoutFlag),
        ];

        return new JsonResponse($response);
    }
}
