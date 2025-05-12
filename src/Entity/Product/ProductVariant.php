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
class ProductVariant extends BaseProductVariant
{
    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $ean;

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

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $flag;

    public function getFlag(): ?string
    {
        return $this->flag;
    }

    public function setFlag(?string $flag): void
    {
        $this->flag = $flag ?? ''; // Remplace null par une chaîne vide si nécessaire
    }


    /**
	* @ORM\Column(name="is_tableau", type="boolean", nullable=false, options={"default" : false})
	*/
	private  bool  $isTableau  =  false;

	/**
	* @return bool
	*/
	public  function getIsTableau(): bool
	{
		return  $this->isTableau;
	}

	/**
	* @param bool $isTableau
	*/
	public  function setIsTableau(bool  $isTableau): void
	{
	    $this->isTableau  =  $isTableau;
	}


    /**
	* @ORM\Column(name="is_private", type="boolean", nullable=false, options={"default" : false})
	*/
	private  bool  $isPrivate  =  false;

	/**
	* @return bool
	*/
	public  function getIsPrivate(): bool
	{
		return  $this->isPrivate;
	}

	/**
	* @param bool $isPrivate
	*/
	public  function setIsPrivate(bool  $isPrivate): void
	{
	    $this->isPrivate  =  $isPrivate;
	}

	 /**
	* @ORM\Column(name="is_front", type="boolean", nullable=false, options={"default" : false})
	*/
	private  bool  $isFront  =  false;

	/**
	* @return bool
	*/
	public  function getisFront(): bool
	{
		return  $this->isFront;
	}

	/**
	* @param bool $isFront
	*/
	public  function setisFront(bool  $isFront): void
	{
	    $this->isFront  =  $isFront;
	}
}