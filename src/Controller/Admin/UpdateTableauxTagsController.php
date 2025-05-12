<?php

namespace App\Controller\Admin;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use Sylius\Component\Core\Model\ProductInterface;
use Sylius\Component\Core\Model\ProductTaxonInterface;
use Sylius\Component\Core\Model\TaxonInterface;
use Sylius\Component\Core\Repository\ProductRepositoryInterface;
use Sylius\Component\Taxonomy\Repository\TaxonRepositoryInterface;
use Sylius\Component\Resource\Factory\FactoryInterface;
use Doctrine\ORM\EntityManagerInterface;

use GuzzleHttp\Client;

class UpdateTableauxTagsController extends AbstractController
{
    private $productRepository;
    private $taxonRepository;
    private $productTaxonFactory;
    private $entityManager;

    public function __construct(
        ProductRepositoryInterface $productRepository,
        TaxonRepositoryInterface $taxonRepository,
        FactoryInterface $productTaxonFactory,
        EntityManagerInterface $entityManager
    ) {
        $this->productRepository = $productRepository;
        $this->taxonRepository = $taxonRepository;
        $this->productTaxonFactory = $productTaxonFactory;
        $this->entityManager = $entityManager;
    }

    public function index(Request $request, string $code): Response
    {
        // Extraire l'ID de la référence de tableau
        if (!preg_match('/^TAB0*(\d+)$/', $code, $matches)) {
            throw $this->createNotFoundException('Code invalide.');
        }
        $id = (int) $matches[1];

        // Récupérer les données de la photo depuis l'application Next.js
        $photoData = $this->fetchPhotoData($id);
        if (!$photoData || !isset($photoData['photo'])) {
            throw $this->createNotFoundException('Photo non trouvée.');
        }
        $photo = $photoData['photo'];
        $tags = $photo['tags'] ?? [];

        // Rechercher le produit Sylius correspondant
        $product = $this->productRepository->findOneBy(['code' => $code]);

        if ($product instanceof ProductInterface) {
            // Associer les taxons correspondant aux tags
            foreach ($tags as $tag) {
                $taxonCode = (string) $tag['id'];
                $taxon = $this->taxonRepository->findOneBy(['code' => $taxonCode]);

                if ($taxon instanceof TaxonInterface) {
                    // Vérifier si le produit est déjà associé à ce taxon
                    $alreadyAssociated = false;
                    foreach ($product->getProductTaxons() as $productTaxon) {
                        if ($productTaxon->getTaxon() === $taxon) {
                            $alreadyAssociated = true;
                            break;
                        }
                    }

                    if (!$alreadyAssociated) {
                        /** @var ProductTaxonInterface $productTaxon */
                        $productTaxon = $this->productTaxonFactory->createNew();
                        $productTaxon->setProduct($product);
                        $productTaxon->setTaxon($taxon);
                        $product->addProductTaxon($productTaxon);
                    }
                }
            }

            $this->entityManager->flush();
        }

        // Rendre la vue avec les informations de la photo et les tags
        return $this->render('@SyliusAdmin/Tableaux/update_tableaux_tags.html.twig', [
            'photo' => $photo,
            'product' => $product,
            'tags' => $tags,
            'code' => $code,
            'id' => $id,
        ]);
    }

    private function fetchPhotoData(int $id): ?array
    {
        $baseUrl = $_ENV['NEXT_PUBLIC_URL'] ?? 'https://www.marcel-de-mayotte.fr';
        $url = rtrim($baseUrl, '/') . '/api/getPhoto/' . $id;

        try {
            $client = new Client();
            $response = $client->get($url);
            $data = json_decode($response->getBody()->getContents(), true);
            return $data;
        } catch (\Exception $e) {
            // Gérer les erreurs de requête HTTP
            return null;
        }
    }
}
