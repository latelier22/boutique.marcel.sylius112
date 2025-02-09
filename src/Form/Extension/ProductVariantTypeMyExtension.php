<?php

declare(strict_types=1);

namespace App\Form\Extension;

use Sylius\Bundle\ProductBundle\Form\Type\ProductVariantType;
use Symfony\Component\Form\AbstractTypeExtension;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;

final class ProductVariantTypeMyExtension extends AbstractTypeExtension
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            // Ajout du champ flag
            ->add('flag', TextType::class, [
                'required' => false,
                'label' => 'app.form.product_variant.flag',
            ])
            // Permet de gérer des modifications dynamiques sur les données du formulaire
            ->addEventListener(FormEvents::PRE_SET_DATA, function (FormEvent $event) {
                $productVariant = $event->getData();
                
                if (!$productVariant) {
                    return;
                }

                $event->getForm()->add('flag', TextType::class, [
                    'required' => false,
                    'label' => 'app.form.product_variant.flag',
                ]);
            });
    }

    public static function getExtendedTypes(): iterable
    {
        return [ProductVariantType::class];
    }
}
