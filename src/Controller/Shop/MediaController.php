<?php

// src/Controller/Shop/MugUploadController.php
namespace App\Controller\Shop;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\Routing\Annotation\Route;

class MediaController extends AbstractController
{
    
        public function upload(Request $request): Response
        {
            /** @var UploadedFile|null $imageFile */
            $imageFile = $request->files->get('image');
            $imageId = $request->get('id');
            $type = strtoupper($request->get('type', 'UNKNOWN'));
            $uploadDir = $request->get('uploadDir', 'image');
    
            if (!$imageFile || !$imageId) {
                return new Response('Paramètres manquants.', Response::HTTP_BAD_REQUEST);
            }
    
            // Valider l'extension
            $validExtensions = ['jpg', 'jpeg', 'png', 'webp'];
            $extension = strtolower($imageFile->getClientOriginalExtension());
    
            if (!in_array($extension, $validExtensions)) {
                return new Response('Extension non valide. JPG, PNG, WEBP uniquement.', Response::HTTP_BAD_REQUEST);
            }
    
            // Nom du fichier : MUG_abc123.jpg
            $newFileName = $type . '_' . $imageId . '.' . ($extension === 'webp' ? 'webp' : 'jpg');
    
            // Dossier cible
            $targetDirectory = $this->getParameter('kernel.project_dir') . '/public/media/' . $uploadDir;
    
            // Vérification et création du dossier
            $filesystem = new Filesystem();
            if (!$filesystem->exists($targetDirectory)) {
                $filesystem->mkdir($targetDirectory, 0775);
            }
    
            try {
                $imageFile->move($targetDirectory, $newFileName);
    
                return new Response(json_encode([
                    'message' => 'Upload réussi',
                    'filename' => $newFileName,
                    'url' => "/media/$uploadDir/$newFileName"
                ]), Response::HTTP_OK, ['Content-Type' => 'application/json']);
    
            } catch (\Exception $e) {
                return new Response('Erreur lors de l\'upload : ' . $e->getMessage(), Response::HTTP_INTERNAL_SERVER_ERROR);
            }
        }
    
    
}

