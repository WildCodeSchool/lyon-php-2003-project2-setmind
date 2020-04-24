<?php


namespace App\Controller;

use App\Model\ItemManager;

class AdministrationController extends AbstractController
{
    /**
     * Display administration page
     *
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function index()
    {
        return $this->twig->render('Administration/index.html.twig');
    }

    public function indexno()
    {
        return $this->twig->render('Administration/indexno.html.twig');
    }
}
