<?php
// src/Controller/Admin/TaxonController.php

namespace App\Controller\Admin;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\ORM\EntityManagerInterface;
use Sylius\Component\Taxonomy\Model\TaxonInterface;

class TaxonController extends AbstractController
{
    public function customTree(Request $request, EntityManagerInterface $em): Response
    {
        /** @var \App\Repository\TaxonRepository $taxonRepository */
        $taxonRepository = $em->getRepository(TaxonInterface::class);

        $taxons = $taxonRepository->findRootTaxonsSortedByProductCount();

        return $this->render($request->get('template'), [
            'taxons' => $taxons,
        ]);
    }
}
