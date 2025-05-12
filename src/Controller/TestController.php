<?php

namespace App\Controller;

use App\Entity\Product\ProductVariant;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class TestController extends AbstractController
{
    #[Route('/debug/product-variant/{code}', name: 'debug_product_variant')]
    public function debugVariant(string $code, EntityManagerInterface $entityManager): JsonResponse
    {
        // Récupération du repository pour ProductVariant
        $repository = $entityManager->getRepository(ProductVariant::class);
        $productVariant = $repository->findOneBy(['code' => $code]);

        // Vérification si le ProductVariant existe
        if (!$productVariant) {
            return new JsonResponse(['error' => 'ProductVariant not found'], 404);
        }

        // Récupérer le produit associé au ProductVariant
        $product = $productVariant->getProduct();

        // Si le produit est trouvé, obtenir le slug
        $slug = $product ? $product->getSlug() : null;

        // Retourner les informations sous forme de JSON
        return new JsonResponse([
            'id' => $productVariant->getId(),
            'name' => $productVariant->getName(),
            'code' => $productVariant->getCode(),
            'flag' => $productVariant->getFlag(),
            'stock' => $productVariant->getOnHand(),
            'slug' => $slug, // Ajout du slug du produit associé
        ]);
    }

    #[Route('/redirect-to-product/{code}', name: 'redirect_to_product')]
    public function redirectToProduct(string $code, EntityManagerInterface $entityManager): RedirectResponse
    {
        // Récupération du repository pour ProductVariant
        $repository = $entityManager->getRepository(ProductVariant::class);
        $productVariant = $repository->findOneBy(['code' => $code]);

        // Vérification si le ProductVariant existe
        if (!$productVariant) {
            return new RedirectResponse('/');  // Redirection vers la page d'accueil si ProductVariant non trouvé
        }

        // Récupérer le produit associé au ProductVariant
        $product = $productVariant->getProduct();

        // Si le produit est trouvé, obtenir le slug
        $slug = $product ? $product->getSlug() : null;

        // Si le slug existe, rediriger vers la page produit
        if ($slug) {
            return $this->redirectToRoute('sylius_shop_product_show', ['slug' => $slug]);
        }

        // Si pas de slug, rediriger vers la page d'accueil
        return new RedirectResponse('/');
    }
}
