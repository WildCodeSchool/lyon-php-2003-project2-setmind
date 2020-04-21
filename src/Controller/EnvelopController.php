<?php

namespace App\Controller;

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
        return $this->twig->render('Envelop/envelops.html.twig');
    }

}
