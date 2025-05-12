<?php
// src/Controller/Shop/UploadImageController.php
namespace App\Controller\Shop;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\Routing\Annotation\Route;

class UploadImageController extends AbstractController
{
    /**
     * @Route("/api/v2/shop/upload-image", name="shop_upload_image", methods={"POST"})
     */
    public function uploadImage(Request $request): Response
    {
        $imageUrl = $request->request->get('image_url');
        $code = $request->request->get('code'); 

        if (!$imageUrl || !$code) {
            return new Response('Paramètres manquants.', Response::HTTP_BAD_REQUEST);
        }

        // Déterminer la base URL en fonction du chemin de l'image
        if (str_starts_with($imageUrl, 'catalogue')) {
            $baseUrl = $_ENV['VPS_SERVER'] ?? 'https://marcel-de-mayotte.latelier22.fr';
            $source = $baseUrl . $imageUrl;
        } elseif (str_starts_with($imageUrl, '/uploads') || str_starts_with($imageUrl, '/converted')) {
            $baseUrl = $_ENV['NEXT_PUBLIC_STRAPI_URL'] ?? 'https://admin.marcel-de-mayotte.fr';
            $source = $baseUrl . $imageUrl;
        } elseif (str_starts_with($imageUrl, 'http://') || str_starts_with($imageUrl, 'https://')) {
            $source = $imageUrl;
        } else {
            return new Response('Chemin d\'image non reconnu.', Response::HTTP_BAD_REQUEST);
        }

        // Télécharger l'image
        $imageContents = @file_get_contents($source);
        if ($imageContents === false) {
            return new Response('Impossible de télécharger l\'image.', Response::HTTP_BAD_REQUEST);
        }

        $extension = pathinfo($imageUrl, PATHINFO_EXTENSION) ?: 'jpg';
        $filename = $code . '.' . $extension;
        $uploadDir = $this->getParameter('kernel.project_dir') . '/public/media/image/TAB';

        $filesystem = new Filesystem();
        if (!$filesystem->exists($uploadDir)) {
            $filesystem->mkdir($uploadDir, 0775);
        }

        $filePath = $uploadDir . '/' . $filename;
        file_put_contents($filePath, $imageContents);

        return new Response(json_encode([
            'message' => 'Image téléchargée avec succès.',
            'url' => "/media/image/TAB/$filename"
        ]), Response::HTTP_OK, ['Content-Type' => 'application/json']);
    }
}
