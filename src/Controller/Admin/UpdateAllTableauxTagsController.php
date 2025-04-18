<?php

namespace App\Controller\Admin;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

use Sylius\Component\Core\Model\ProductInterface;
use Sylius\Component\Core\Model\ProductTaxonInterface;
use Sylius\Component\Core\Model\TaxonInterface;
use Sylius\Component\Core\Repository\ProductRepositoryInterface;
use Sylius\Component\Taxonomy\Repository\TaxonRepositoryInterface;
use Sylius\Component\Resource\Factory\FactoryInterface;
use Doctrine\ORM\EntityManagerInterface;

use GuzzleHttp\Client;

class UpdateAllTableauxTagsController extends AbstractController
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

    /**
     * @Route("/admin/update-all-tableaux-tags", name="admin_update_all_tableaux_tags")
     */
    public function updateAll(): Response
    {
        $updatedProducts = [];
        $client = new Client();
        $baseUrl = $_ENV['NEXT_PUBLIC_URL'] ?? 'https://www.marcel-de-mayotte.fr';

        $products = $this->productRepository->findAll();
        foreach ($products as $product) {
            if (!$product instanceof ProductInterface) {
                continue;
            }

            $code = $product->getCode();
            if (!preg_match('/^TAB0*(\d+)$/', $code, $matches)) {
                continue;
            }

            $id = (int) $matches[1];
            $photoData = $this->fetchPhotoData($id, $client, $baseUrl);
            if (!$photoData || !isset($photoData['photo'])) {
                continue;
            }

            $photo = $photoData['photo'];
            $tags = $photo['tags'] ?? [];

            $addedTags = [];

            foreach ($tags as $tag) {
                $taxonCode = (string) $tag['id'];
                $taxon = $this->taxonRepository->findOneBy(['code' => $taxonCode]);

                if ($taxon instanceof TaxonInterface) {
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
                        $addedTags[] = $taxon->getName();
                    }
                }
            }

            if (!empty($addedTags)) {
                $this->entityManager->persist($product);

                $updatedProducts[] = [
                    'code' => $code,
                    'title' => $photo['title'] ?? '',
                    'url' => $this->getImageUrl($photo['url'] ?? ''),
                    'tags' => $addedTags,
                ];
            }
        }

        $this->entityManager->flush();

        return $this->render('@SyliusAdmin/Tableaux/update_all_tableaux_tags.html.twig', [
            'updatedProducts' => $updatedProducts,
        ]);
    }

    private function fetchPhotoData(int $id, Client $client, string $baseUrl): ?array
    {
        $url = rtrim($baseUrl, '/') . '/api/getPhoto/' . $id;
        try {
            $response = $client->get($url);
            return json_decode($response->getBody()->getContents(), true);
        } catch (\Exception $e) {
            return null;
        }
    }

    private function getImageUrl(string $url): string
    {
        if (!$url) return '';

        if (str_starts_with($url, 'catalogue')) {
            return 'https://marcel-de-mayotte.latelier22.fr/images/' . $url;
        }

        if (str_starts_with($url, '/uploads')) {
            return 'https://admin.marcel-de-mayotte.fr' . $url;
        }

        return $url;
    }
}
