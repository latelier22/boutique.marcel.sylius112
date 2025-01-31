<?php

declare(strict_types=1);

namespace App\Entity\Product;

use Doctrine\ORM\Mapping as ORM;
use Sylius\Component\Core\Model\ProductVariant as BaseProductVariant;
use Sylius\Component\Product\Model\ProductVariantTranslationInterface;

/**
 * @ORM\Entity
 * @ORM\Table(name="sylius_product_variant")
 */
#[ORM\Entity]
#[ORM\Table(name: 'sylius_product_variant')]
class ProductVariant extends BaseProductVariant
{
    #[ORM\Column(type: "string", length: 255, nullable: true)]
    #[ApiProperty]
    private ?string $ean = null;

    public function getEan(): ?string
    {
        return $this->ean;
    }

    public function setEan(?string $ean): void
    {
        $this->ean = $ean;
    }

    protected function createTranslation(): ProductVariantTranslationInterface
    {
        return new ProductVariantTranslation();
    }

    /** @ORM\Column(type="string", nullable=true) */
    private $flag;

    public function getFlag(): ?string
    {
        return $this->flag;
    }

    public function setFlag(?string $flag): void
    {
        $this->flag = $flag ?? ''; // Remplace null par une chaîne vide si nécessaire
    }


}
