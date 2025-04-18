<?php

namespace App\Controller\Admin;

use App\Message\DescribeProductMessage;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Messenger\MessageBusInterface;
use Symfony\Component\Routing\Annotation\Route;

class ProductDescriptionQueueController extends AbstractController
{
    #[Route('/admin/products/queue-descriptions/{from}/{to}', name: 'admin_products_queue_descriptions')]
    public function queueDescriptions(string $from, string $to, MessageBusInterface $bus): JsonResponse
    {
        $start = (int) substr($from, 3); // Extrait 12 de TAB0012
        $end = (int) substr($to, 3);     // Extrait 20 de TAB0020

        $queued = [];

        for ($i = $start; $i <= $end; $i++) {
            $code = sprintf('TAB%04d', $i);
            $bus->dispatch(new DescribeProductMessage($code));
            $queued[] = $code;
        }

        return new JsonResponse([
            'message' => 'Produits envoyés à la queue Messenger',
            'queued' => $queued,
        ]);
    }
}
