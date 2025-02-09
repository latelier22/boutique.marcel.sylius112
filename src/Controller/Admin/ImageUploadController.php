<?php

namespace App\Controller\Admin;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;
use Liip\ImagineBundle\Imagine\Cache\CacheManager;

#[Route('/api/v2/admin/images')]
class ImageUploadController extends AbstractController
{
    #[Route('/upload', name: 'admin_image_upload', methods: ['POST'])]
    public function uploadImage(Request $request, ParameterBagInterface $params, CacheManager $cacheManager): JsonResponse
    {
        $file = $request->files->get('image'); // Récupérer l’image envoyée

        if (!$file) {
            return new JsonResponse(['error' => 'Aucun fichier reçu.'], Response::HTTP_BAD_REQUEST);
        }

        // Définir le répertoire de stockage des images
        $uploadDir = $params->get('kernel.project_dir') . '/public/media/image';

        // Créer le dossier s'il n'existe pas
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0777, true);
        }

        // Générer un nom de fichier unique
        $fileName = uniqid() . '.' . $file->guessExtension();

        try {
            $file->move($uploadDir, $fileName);
        } catch (FileException $e) {
            return new JsonResponse(['error' => 'Erreur lors du déplacement du fichier.'], Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        // Chemin de l'image originale
        $imagePath = '/media/image/' . $fileName;

        // // 🔥 Générer l'URL optimisée avec LiipImagine (filtre Sylius "sylius_medium")
        // $optimizedImageUrl = $cacheManager->getBrowserPath($imagePath, 'sylius_medium');

        return new JsonResponse([
            'success' => true,
            // 'image_url' => $optimizedImageUrl,  // ✅ URL optimisée
            'original_url' => $imagePath         // URL brute si besoin
        ], Response::HTTP_OK);
    }
}
