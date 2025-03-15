<?php

declare(strict_types=1);

namespace App\Repository;

trait ProductRepositoryTrait
{


    public function findProductImagesByTaxonCode(string $taxonCode)
    {
        // Création de la requête pour récupérer les images des produits associés au taxon
        $qb = $this->createQueryBuilder('p')
            ->innerJoin('p.productTaxons', 'pt')  // Jointure avec les taxons du produit
            ->innerJoin('pt.taxon', 't')          // Jointure avec la table des taxons
            ->innerJoin('p.images', 'pi')         // Jointure avec les images du produit
            ->where('t.code = :taxonCode')       // Filtrage par le code du taxon
            ->setParameter('taxonCode', $taxonCode)
            ->select('pi.path AS product_image'); // Sélectionne uniquement le chemin de l'image

        // Exécution de la requête et renvoi des résultats
        return $qb->getQuery()->getResult();
    }

}