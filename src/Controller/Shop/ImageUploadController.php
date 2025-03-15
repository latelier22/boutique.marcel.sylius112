<?php
// src/Controller/ImageUploadController.php

namespace App\Controller\Shop;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\Routing\Annotation\Route;

class ImageUploadController extends AbstractController
{
    
    public function uploadImage(Request $request)
    {
        // Récupérer l'image de la requête
        $imageFile = $request->files->get('image');
        $imageId = $request->get('id'); // Récupérer l'ID de l'image

        // Vérifier si un fichier est présent
        if (!$imageFile) {
            return new Response('Aucun fichier trouvé.', Response::HTTP_BAD_REQUEST);
        }

        // Vérifier l'extension et les types MIME
        $validExtensions = ['jpg', 'jpeg', 'png', 'webp'];
        $extension = $imageFile->getClientOriginalExtension();

        if (!in_array(strtolower($extension), $validExtensions)) {
            return new Response('Format de fichier non valide. Utilisez JPG, JPEG, PNG ou WebP.', Response::HTTP_BAD_REQUEST);
        }

        // Renommer le fichier avec le format souhaité (tab_ + id + extension)
        $newFileName = 'tab_' . $imageId . '.' . (strtolower($extension) === 'webp' ? 'webp' : 'jpg');

        // Déplacer le fichier vers le dossier public/media/image
        $targetDirectory = $this->getParameter('kernel.project_dir') . '/public/media/image';

        // Vérifiez si le dossier existe
        $filesystem = new Filesystem();
        if (!$filesystem->exists($targetDirectory)) {
            $filesystem->mkdir($targetDirectory);
        }

        try {
            // Déplacer le fichier téléchargé
            $imageFile->move($targetDirectory, $newFileName);

            // Retourner la réponse avec le nom du fichier et l'URL d'accès
            return new Response(
                json_encode(['message' => 'Fichier téléchargé avec succès', 'filename' => $newFileName, 'url' => '/media/image/' . $newFileName]),
                Response::HTTP_OK,
                ['Content-Type' => 'application/json']
            );
        } catch (\Exception $e) {
            return new Response('Erreur lors de l\'upload de l\'image.', Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
