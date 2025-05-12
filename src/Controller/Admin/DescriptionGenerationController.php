<?php

namespace App\Controller\Admin;

use Doctrine\ORM\EntityManagerInterface;
use Sylius\Component\Core\Model\ProductInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;

class DescriptionGenerationController extends AbstractController
{
    private function callOpenAI(string $imageUrl): ?array
    {
        $prompt = <<<EOT
Voici une image d’une œuvre du peintre Marcel Séjour.

Marcel Séjour peint depuis plus de 30 ans à Mayotte et dans l’archipel des Comores. Il travaille exclusivement à la peinture à l’huile, sur toile, avec une technique raffinée et un style reconnaissable entre tous. Il est particulièrement reconnu pour ses œuvres en noir et blanc, aux contrastes puissants, qu’il rehausse parfois de touches de couleur parcimonieuses et expressives. D’autres œuvres sont entièrement en couleurs, ou explorent un subtil équilibre entre teintes et absence de couleur.

Recontextualise bien l’œuvre dans cette démarche artistique : lien à l’océan Indien, aux paysages de Mayotte ou des Comores, à la mémoire, à la lumière des îles, à la matière, à la texture.

Réponds uniquement dans ce format, sans autre texte :

### Description longue
(texte)

### Description courte
(texte)

### Mots-clés SEO
1. couleur principale 1
2. couleur principale 2
3. couleur principale 3
4. mot-clé 4
5. mot-clé 5
6. mot-clé 6
7. mot-clé 7
8. mot-clé 8
9. mot-clé 9
10. mot-clé 10
EOT;

        $payload = json_encode([
            'model' => 'gpt-4-turbo',
            'messages' => [[
                'role' => 'user',
                'content' => [
                    ['type' => 'text', 'text' => $prompt],
                    ['type' => 'image_url', 'image_url' => ['url' => $imageUrl]],
                ],
            ]],
            'max_tokens' => 1000,
        ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_URL => 'https://api.openai.com/v1/chat/completions',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => $payload,
            CURLOPT_HTTPHEADER => [
                'Authorization: Bearer ' . $_ENV['OPENAI_API_KEY'],
                'Content-Type: application/json',
            ],
        ]);

        $response = curl_exec($curl);
        $error = curl_error($curl);
        curl_close($curl);

        if ($error || !$response) {
            return null;
        }

        $data = json_decode($response, true);
        $raw = $data['choices'][0]['message']['content'] ?? null;
        if (!$raw) {
            return null;
        }

        $description = '';
        $shortDescription = '';
        $keywords = [];
        $colors = [];

        $parts = preg_split('/###\s*/', $raw);
        foreach ($parts as $part) {
            $partLower = mb_strtolower($part);
            if (str_starts_with($partLower, 'description longue')) {
                $description = trim(preg_replace('/^.*?\n/', '', $part));
            } elseif (str_starts_with($partLower, 'description courte')) {
                $shortDescription = trim(preg_replace('/^.*?\n/', '', $part));
            } elseif (str_contains($partLower, 'mots-clés seo')) {
                preg_match_all('/\d+\.\s*(.+)/', $part, $matches);
                $allKeywords = $matches[1] ?? [];
                $colors = array_slice($allKeywords, 0, 3);
                $keywords = array_slice($allKeywords, 3);
            }
        }

        return [
            'description' => $description,
            'short_description' => $shortDescription,
            'seo_keywords' => $allKeywords,
            'colors' => $colors,
        ];
    }


    

    #[Route('/admin/products/describe/{code}', name: 'admin_product_describe')]
    public function describe(string $code, EntityManagerInterface $em): Response
    {
        /** @var ProductInterface|null $product */
        $product = $em->getRepository(ProductInterface::class)->findOneBy(['code' => $code]);

        if (!$product || !$product->getImages()->first()) {
            return new Response("Produit ou image non trouvé", 404);
        }

        $imagePath = $product->getImages()->first()->getPath();
        $imageUrl = 'https://boutique.marcel-de-mayotte.fr/media/cache/sylius_shop_product_thumbnail/' . $imagePath;

        $response = $this->callOpenAI($imageUrl);
        if (!$response) {
            return new Response("Erreur API OpenAI", 500);
        }

        // dd($response);

        $description = $response['description'] ?? '';
        $shortDescription = $response['short_description'] ?? '';
        $keywords = $response['seo_keywords'] ?? [];
        $colors = $response['colors'] ?? [];

        // Tronquage pour Sylius
        $shortDescriptionTruncated = mb_substr($shortDescription, 0, 250);
        $shortDescriptionTruncated = $shortDescription;
        $keywordsString = implode(', ', $keywords);
        $keywordsTruncated = mb_substr($keywordsString, 0, 250);

        $product->getTranslation()->setDescription($description);
        $product->getTranslation()->setShortDescription($shortDescriptionTruncated);
        $product->getTranslation()->setMetaKeywords($keywordsTruncated);

        $em->flush();

        return $this->render('@SyliusAdmin/Tableaux/description/result.html.twig', [
            'product' => $product,
            'image_url' => $imageUrl,
            'description' => $description,
            'short_description' => $shortDescriptionTruncated,
            'seo_keywords' => $keywords,
            'colors' => $colors,
        ]);
    }


    #[Route('/admin/products/describe-range/{from}/{to}', name: 'admin_product_describe_range')]
public function describeRange(
    string $from,
    string $to,
    EntityManagerInterface $em
): JsonResponse {
    $updatedProducts = [];

    $start = (int) substr($from, 3);
    $end = (int) substr($to, 3);

    for ($i = $start; $i <= $end; $i++) {
        $code = sprintf('TAB%04d', $i);

        /** @var ProductInterface|null $product */
        $product = $em->getRepository(ProductInterface::class)->findOneBy(['code' => $code]);
        if (!$product || !$product->getImages()->first()) {
            continue;
        }

        $imagePath = $product->getImages()->first()->getPath();
        $imageUrl = 'https://boutique.marcel-de-mayotte.fr/media/cache/sylius_shop_product_thumbnail/' . $imagePath;

        // Appel OpenAI
        $result = $this->callOpenAI($imageUrl);
        if (!$result) {
            continue;
        }

        $description = $response['description'] ?? '';
        $shortDescription = $response['short_description'] ?? '';
        $keywords = $response['seo_keywords'] ?? [];
        $colors = $response['colors'] ?? [];

        // Tronquage pour Sylius
        $shortDescriptionTruncated = mb_substr($shortDescription, 0, 250);
        $shortDescriptionTruncated = $shortDescription;
        $keywordsString = implode(', ', $keywords);
        $keywordsTruncated = mb_substr($keywordsString, 0, 250);

        $product->getTranslation()->setDescription($description);
        $product->getTranslation()->setShortDescription($shortDescriptionTruncated);
        $product->getTranslation()->setMetaKeywords($keywordsTruncated);

        $updatedProducts[] = [
            'code' => $code,
            'image_url' => $imageUrl,
            'description' => $description,
            'short_description' => $shortDescriptionTruncated,
            'seo_keywords' => $keywords,
        ];
    }

    $em->flush();

    return new JsonResponse([
        'updated' => count($updatedProducts),
        'products' => $updatedProducts,
    ]);
}



}
