<?php

declare(strict_types=1);

namespace App\Controller;

use App\Entity\Product\ProductVariant;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Sylius\Bundle\ResourceBundle\Controller\ResourceController;
use Sylius\Component\Resource\ResourceActions;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class ProductController extends ResourceController
{
    public function personalizedShowAction(
        string $slug,
        string $code,
        Request $request,
        ProductRepository $productRepository,
        EntityManagerInterface $em
    ): Response {
        $configuration = $this->requestConfigurationFactory->create($this->metadata, $request);
        $this->isGrantedOr403($configuration, ResourceActions::SHOW);
        $locale = $request->getLocale();

        // 🔍 1. Récupérer le produit via le slug
        $product = $productRepository->findBySlug($slug, $locale);

        // 🔍 2. Récupérer n'importe quel variant via son code
        /** @var ProductVariant|null $variant */
        $variant = $em->getRepository(ProductVariant::class)->findOneBy(['code' => $code]);
        if (!$variant) {
            return $this->redirectToRoute('sylius_shop_product_show', [
                'slug' => $slug,
                '_locale' => $request->getLocale(),
            ]);
        }

        $productAssocie = $variant->getProduct();
        $productAssocie->getName();

        if (!$product) {
            throw $this->createNotFoundException('Produit (slug) non trouvé.');
        }

        // if (!$variant) {
        //     throw $this->createNotFoundException('Produit (variant) non trouvé.');
        // }

        
        $productsAvecTableaux = $productRepository->findAllWithIsTableauVariant();


        // dd('Produit par slug:', $product, 'Produit associé du variant:', $productAssocie);
        // dd( 'Produit associé du variant:', $productAssocie);
        // dd( 'Produits tableaux:', $productsAvecTableaux);

        return $this->render('@SyliusShop/Product/Personalized/show.html.twig', [
            'product' => $product,               // celui du slug
            'variant' => $variant,
            'productAssocie' => $productAssocie, // celui du code
            'productsAvecTableaux' => $productsAvecTableaux,
            'resource' => $product,
            'configuration' => $configuration,
            'metadata' => $this->metadata,
            'productSlug' => $slug
        ]);
        
    }

    public function showAction(Request $request): Response
    {
        $configuration = $this->requestConfigurationFactory->create($this->metadata, $request);
        $this->isGrantedOr403($configuration, ResourceActions::SHOW);
    
        /** @var \App\Entity\Product\Product $product */
        $product = $this->findOr404($configuration);
        $this->eventDispatcher->dispatch(ResourceActions::SHOW, $configuration, $product);
    
        // ✅ Si c’est un produit perso et qu’on n’a pas de code de tableau dans l’URL → REDIRIGER
        if ($product->isPerso()) {
            // Vérifie si le code est déjà présent dans l’URL
            $currentUrl = $request->getRequestUri();
            $slug = $product->getSlug();
    
            // Redirige uniquement si l'URL ne contient pas déjà TABPERSO_CARREAU
            if (!str_contains($currentUrl, 'TABPERSO_CARREAU')) {
                return $this->redirectToRoute('app_product_personalized', [
                    'slug' => $slug,
                    'code' => 'TABPERSO_CARREAU',
                    '_locale' => $request->getLocale()
                ]);
            }
    
            // Sinon, comportement normal : afficher sans productAssocie
            $productsAvecTableaux = $this->get('sylius.repository.product')->findAllWithIsTableauVariant();
    
            return $this->render('@SyliusShop/Product/Personalized/show.html.twig', [
                'product' => $product,
                'productAssocie' => null,
                'productsAvecTableaux' => $productsAvecTableaux,
                'resource' => $product,
                'configuration' => $configuration,
                'metadata' => $this->metadata,
                'productSlug' => $slug,
            ]);
        }
    
        // Produit classique
        $variantTableau = $product->getVariants()
            ->filter(fn($v) => $v->getIsTableau())
            ->first();
    
        $currentTableauCode = $variantTableau instanceof ProductVariant ? $variantTableau->getCode() : null;
    
        return $this->render($configuration->getTemplate(ResourceActions::SHOW . '.html'), [
            'configuration' => $configuration,
            'metadata' => $this->metadata,
            'resource' => $product,
            'product' => $product,
            'currentTableauCode' => $currentTableauCode
        ]);
    }
    
    

}
