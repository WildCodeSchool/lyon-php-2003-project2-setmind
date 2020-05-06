<?php

namespace App\Controller;

use App\Model\EnvelopManager;

class EnvelopController extends AbstractController
{
    /**
     * Display envelops page
     *
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */

    public function envelops()
    {
        $envelopManager = new EnvelopManager();
        $envelops = $envelopManager->selectAllWithParts();

        return $this->twig->render('Envelop/envelops.html.twig', ['envelops' => $envelops]);
    }
}
