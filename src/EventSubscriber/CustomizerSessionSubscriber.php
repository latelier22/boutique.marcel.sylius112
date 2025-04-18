<?php
// src/EventSubscriber/CustomizerSessionSubscriber.php
declare(strict_types=1);

namespace App\EventSubscriber;

use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpKernel\Event\RequestEvent;
use Symfony\Component\HttpKernel\KernelEvents;

class CustomizerSessionSubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [
            KernelEvents::REQUEST => 'onKernelRequest',
        ];
    }

    public function onKernelRequest(RequestEvent $event)
    {
        $request = $event->getRequest();
        $session = $request->getSession();

        if (!$session->has('customizer_session_id')) {
            $session->set('customizer_session_id', uniqid('cust_', true));
        }
    }
}
