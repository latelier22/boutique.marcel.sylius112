<?php
// src/Twig/TableauxExtension.php

namespace App\Twig;

use Twig\Extension\AbstractExtension;
use Twig\TwigFunction;

class AppExtension extends AbstractExtension
{
    public function getFunctions()
    {
        return [
            new TwigFunction('get_image_url', [$this, 'getImageUrl']),
        ];
    }

    public function getImageUrl(string $url): string
    {
        if (str_starts_with($url, '/uploads') || str_starts_with($url, '/converted')) {
            return $_ENV['NEXT_PUBLIC_STRAPI_URL'] . $url;
        }

        return 'https://marcel-de-mayotte.latelier22.fr/images/' . $url;
    }
}
