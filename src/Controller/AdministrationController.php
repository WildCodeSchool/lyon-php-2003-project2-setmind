<?php


namespace App\Controller;

use App\Model\ItemManager;
use App\Model\PartManager;

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
        $partManager = new PartManager();
        $parts = $partManager->selectAll();
        var_dump($parts);
        return $this->twig->render('Administration/indexno.html.twig', ['parts' => $parts]);
    }

    public function showpart()
    {
        return $this->twig->render('Administration/indexno.html.twig');
    }
}
