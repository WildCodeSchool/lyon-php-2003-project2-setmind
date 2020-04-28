<?php

namespace App\Controller;

class LoginController extends AbstractController
{

    /**
     * Display item listing
     *
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function connexion()
    {
        return $this->twig->render('Login/connexion.html.twig');
    }
}
