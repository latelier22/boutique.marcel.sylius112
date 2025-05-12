<?php

namespace App\Controller\Admin;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

use Sylius\Component\Core\Model\ProductInterface;
use Sylius\Component\Core\Model\ProductVariantInterface;
use Sylius\Component\Core\Model\ProductTaxonInterface;
use Sylius\Component\Core\Model\TaxonInterface;
use Sylius\Component\Core\Model\ChannelInterface;
use Sylius\Component\Core\Model\ChannelPricingInterface;
use Sylius\Component\Core\Model\ProductImageInterface;
use Sylius\Component\Core\Repository\ProductRepositoryInterface;
use Sylius\Component\Taxonomy\Repository\TaxonRepositoryInterface;
use Sylius\Component\Channel\Repository\ChannelRepositoryInterface;
use Sylius\Component\Resource\Factory\FactoryInterface;
use Doctrine\ORM\EntityManagerInterface;

use GuzzleHttp\Client;
use Symfony\Component\HttpFoundation\File\UploadedFile;

class ImportTableauxController extends AbstractController
{
    private $productRepository;
    private $taxonRepository;
    private $channelRepository;
    private $productFactory;
    private $productVariantFactory;
    private $productTaxonFactory;
    private $channelPricingFactory;
    private $productImageFactory;
    private $entityManager;

    public function __construct(
        ProductRepositoryInterface $productRepository,
        TaxonRepositoryInterface $taxonRepository,
        ChannelRepositoryInterface $channelRepository,
        FactoryInterface $productFactory,
        FactoryInterface $productVariantFactory,
        FactoryInterface $productTaxonFactory,
        FactoryInterface $channelPricingFactory,
        FactoryInterface $productImageFactory,
        EntityManagerInterface $entityManager
    ) {
        $this->productRepository = $productRepository;
        $this->taxonRepository = $taxonRepository;
        $this->channelRepository = $channelRepository;
        $this->productFactory = $productFactory;
        $this->productVariantFactory = $productVariantFactory;
        $this->productTaxonFactory = $productTaxonFactory;
        $this->channelPricingFactory = $channelPricingFactory;
        $this->productImageFactory = $productImageFactory;
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/iadmin/tableaux/import/{de}/{a}", name="app_admin_import_tableaux")
     */
// ...

public function import(int $de, int $a): Response
{
    $client = new Client();
    $baseUrl = $_ENV['NEXT_PUBLIC_URL'] ?? 'https://www.marcel-de-mayotte.fr';
    $channel = $this->channelRepository->findOneBy(['code' => 'default']);
if (!$channel) {
    throw new \RuntimeException('Le canal avec le code "default" est introuvable.');
}

    $importedProducts = [];

    for ($id = $de; $id <= $a; $id++) {
        $code = 'TAB' . str_pad((string)$id, 4, '0', STR_PAD_LEFT);

        // Vérifier si le produit existe déjà
        $existingProduct = $this->productRepository->findOneBy(['code' => $code]);
        if ($existingProduct instanceof ProductInterface) {
            continue;
        }

        // Récupérer les données du tableau depuis l'API Next.js
        $url = rtrim($baseUrl, '/') . '/api/getPhoto/' . $id;
        try {
            $response = $client->get($url);
            $data = json_decode($response->getBody()->getContents(), true);
        } catch (\Exception $e) {
            continue;
        }

        if (!$data['success'] || !isset($data['photo'])) {
            continue;
        }

        $photo = $data['photo'];
        $tags = $photo['tags'] ?? [];

        // Créer le produit
        /** @var ProductInterface $product */
        $product = $this->productFactory->createNew();
        $product->setCode($code);
        $product->setName($photo['title'] ?? 'Tableau ' . $id);
        $product->setSlug($code);
        $product->setEnabled(true);

        // Créer la variante du produit
        /** @var ProductVariantInterface $variant */
        $variant = $this->productVariantFactory->createNew();
        $variant->setCode($code . '_variant');
        $variant->setProduct($product);
        $variant->setName($product->getName());

        // Définir le prix à 0 €
        /** @var ChannelPricingInterface $channelPricing */
        $channelPricing = $this->channelPricingFactory->createNew();
        $channelPricing->setChannelCode($channel->getCode());
        $channelPricing->setPrice(0);
        $variant->addChannelPricing($channelPricing);

        $product->addVariant($variant);

        // Associer les taxons
        foreach ($tags as $tag) {
            $taxonCode = (string) $tag['id'];
            $taxon = $this->taxonRepository->findOneBy(['code' => $taxonCode]);

            if ($taxon instanceof TaxonInterface) {
                /** @var ProductTaxonInterface $productTaxon */
                $productTaxon = $this->productTaxonFactory->createNew();
                $productTaxon->setProduct($product);
                $productTaxon->setTaxon($taxon);
                $product->addProductTaxon($productTaxon);
            }
        }

        // Télécharger et ajouter l'image
        if (isset($photo['url'])) {
            $imageUrl = $photo['url'];
            $source = (str_starts_with($imageUrl, '/uploads') || str_starts_with($imageUrl, '/converted'))
                ? ($_ENV['NEXT_PUBLIC_STRAPI_URL'] ?? 'https://admin.marcel-de-mayotte.fr') . $imageUrl
                : ($_ENV['VPS_SERVER'] ?? 'https://marcel-de-mayotte.latelier22.fr') . '/images/' . $imageUrl;
            
            $imageContents = @file_get_contents($source);
            if ($imageContents !== false) {
                $extension = pathinfo($imageUrl, PATHINFO_EXTENSION);
                $imagePath = sys_get_temp_dir() . '/' . $code . '.' . $extension;
                file_put_contents($imagePath, $imageContents);

                $file = new UploadedFile($imagePath, $code . '.' . $extension, null, null, true);

                /** @var ProductImageInterface $image */
                $image = $this->productImageFactory->createNew();
                $image->setFile($file);
                $image->setOwner($product);
                $image->setType('main');

                $product->addImage($image);
            }
        }

        // Enregistrer le produit
        $this->entityManager->persist($product);

        // Ajouter le produit à la liste des produits importés
        $importedProducts[] = $product;
    }

    // Sauvegarder toutes les modifications en base de données
    $this->entityManager->flush();

    return $this->render('@SyliusAdmin/Tableaux/import_tableaux_result.html.twig', [
        'message' => "Importation des tableaux de $de à $a terminée.",
        'products' => $importedProducts,
    ]);
}

}
