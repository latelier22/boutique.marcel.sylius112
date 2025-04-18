<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="app_media")
 */
class Media
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=180)
     */
    private $type; // 'TEXTURE', 'PREVIEW', etc.

    /**
     * @ORM\Column(type="string")
     */
    private $path;

    /**
     * @ORM\Column(type="datetime")
     */
    private $createdAt;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $relatedId; // par exemple le code variant ou slug du produit

    public function __construct()
    {
        $this->createdAt = new \DateTimeImmutable();
    }

    // getters / setters...
}
