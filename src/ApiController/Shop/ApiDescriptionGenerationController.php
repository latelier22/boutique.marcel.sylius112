<?php

namespace App\ApiController\Shop;

use GuzzleHttp\Client;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class ApiDescriptionGenerationController extends AbstractController
{


    private function setProductAttribute(ProductInterface $product, string $attributeCode, string $value, string $localeCode = 'fr_FR'): void
{
    foreach ($product->getAttributesByCodeAndLocale($attributeCode, $localeCode) as $attributeValue) {
        $attributeValue->setValue($value);
        return;
    }

    // Si l'attribut n'existe pas encore : à créer manuellement si nécessaire
    // Ou lever une erreur/log
}


    // #[Route('/api/v2/shop/generate-description', name: 'api_shop_generate_description', methods: ['POST'])]
    public function generate(Request $request): JsonResponse
    {
        $imageUrl = $request->request->get('image_url');

        if (!$imageUrl) {
            return new JsonResponse(['error' => 'Image URL manquante'], 400);
        }

        $prompt = "Voici une image d’une œuvre du peintre Marcel Séjour, qui peint depuis plus de 30 ans à Mayotte et aux Comores. Il travaille exclusivement à l’huile, et est particulièrement reconnu pour ses œuvres en noir et blanc, parfois rehaussées de touches de couleur. Certaines de ses œuvres sont entièrement en couleurs, d’autres en noir et blanc, ou un mélange des deux. Recontextualise bien l’œuvre dans cette démarche artistique. Rédige : Une description longue dans le style d’un cartel de galerie ou de musée, mettant en valeur la composition, le style, les choix chromatiques (ou leur absence), les émotions transmises, et les liens possibles avec Mayotte ou les Comores. Une description courte, synthétique et attrayante; Une liste de 10 mots-clés SEO pertinents en français pour référencer cette œuvre en ligne.";
        $client = new Client();

        try {
            $response = $client->post('https://api.openai.com/v1/chat/completions', [
                'headers' => [
                    'Authorization' => 'Bearer ' . $_ENV['OPENAI_API_KEY'],
                    'Content-Type' => 'application/json',
                ],
                'json' => [
                    'model' => 'gpt-4-turbo',
                    'messages' => [
                        [
                            'role' => 'user',
                            'content' => [
                                ['type' => 'text', 'text' => $prompt],
                                ['type' => 'image_url', 'image_url' => ['url' => $imageUrl]],
                            ],
                        ],
                    ],
                    'max_tokens' => 1000,
                ],
            ]);

            $data = json_decode($response->getBody()->getContents(), true);
            $rawContent = $data['choices'][0]['message']['content'];

            // 🧠 Parsing du texte renvoyé
            $description = '';
            $shortDescription = '';
            $keywords = [];

            $parts = preg_split('/###\s*/', $rawContent);

            foreach ($parts as $part) {
                $lowerPart = mb_strtolower($part);
            
                if (str_starts_with($lowerPart, 'description longue')) {
                    $description = trim(preg_replace('/^.*?\n/', '', $part)); // saute le titre
                } elseif (str_starts_with($lowerPart, 'description courte')) {
                    $shortDescription = trim(preg_replace('/^.*?\n/', '', $part));
                } elseif (str_contains($lowerPart, 'mots-clés seo')) {
                    preg_match_all('/\d+\.\s*(.+)/', $part, $matches);
                    $keywords = $matches[1] ?? [];
                }
            }

            return new JsonResponse([
                'image_url' => $imageUrl,
                'description' => $description,
                'short_description' => $shortDescription,
                'seo_keywords' => $keywords,
            ]);

        } catch (\Exception $e) {
            return new JsonResponse([
                'error' => 'Erreur API OpenAI : ' . $e->getMessage()
            ], 500);
        }
    }
}

