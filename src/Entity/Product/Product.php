<?php

declare(strict_types=1);

namespace App\Entity\Product;

use Doctrine\ORM\Mapping as ORM;
use Sylius\Component\Core\Model\Product as BaseProduct;
use Sylius\Component\Product\Model\ProductTranslationInterface;

/**
 * @ORM\Entity
 * @ORM\Table(name="sylius_product")
 */
#[ORM\Entity]
#[ORM\Table(name: 'sylius_product')]
class Product extends BaseProduct
{
    protected function createTranslation(): ProductTranslationInterface
    {
        return new ProductTranslation();
    }


    /**
 * @ORM\Column(name="is_perso", type="boolean", nullable=false, options={"default" : false})
 */
private bool $isPerso = false;

public function isPerso(): bool
{
    return $this->isPerso;
}

public function setPerso(bool $isPerso): void
{
    $this->isPerso = $isPerso;
}

}
