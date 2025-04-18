<?php

namespace App\MessageHandler;

use App\Message\DescribeProductMessage;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Messenger\Attribute\AsMessageHandler;
use Sylius\Component\Core\Model\ProductInterface;
use Sylius\Component\Core\Model\ProductTranslationInterface;

#[AsMessageHandler]
class DescribeProductMessageHandler
{
    public function __construct(private EntityManagerInterface $em) {}

    public function __invoke(DescribeProductMessage $message): void
    {
        $product = $this->em->getRepository(ProductInterface::class)->findOneBy(['code' => $message->getCode()]);

        if (!$product || !$product->getImages()->first()) {
            return;
        }


        
        $translation = $product->getTranslation('fr_FR', false);
        if (!$translation || !$translation->getName()) {
            return;
        }

        $imagePath = $product->getImages()->first()->getPath();
        $imageUrl = 'https://boutique.marcel-de-mayotte.fr/media/cache/sylius_shop_product_thumbnail/' . $imagePath;

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
            return;
        }

        $data = json_decode($response, true);
        $raw = $data['choices'][0]['message']['content'] ?? null;
        if (!$raw) {
            return;
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
                $keywords = $allKeywords;
            }
        }

        $shortDescriptionTruncated = mb_substr($shortDescription, 0, 500);
        $keywordsTruncated = mb_substr(implode(', ', $keywords), 0, 250);

        $translation->setDescription($description);
        $translation->setShortDescription($shortDescriptionTruncated);
        $translation->setMetaKeywords($keywordsTruncated);

        $this->em->flush();
    }
}
