<?php


namespace App\Controller;

use App\Model\PartManager;

class AdministrationController extends AbstractController
{

    /**
     * suported parma format : <table name>=ASD or DESD
     * @param string $sortTableOrder
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function sort($sortTableOrder)
    {
        $parts = [];
        $explode = explode("=", $sortTableOrder);
        $column = $explode[0];
        $orderBy = $explode[1];
        $method = "selectBy" . $column . $orderBy;
        $partManager = new PartManager();
        if (method_exists($partManager, $method)) {
            $parts = $partManager->{$method}();
        } else {
            //TODO return 404
        }
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    public function index()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectAll();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    public function sortPartsByNameAsc()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectByNameAsc();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    public function sortPartsByNameDesc()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectByNameDesc();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    public function sortPartsByTypeAsc()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectByTypeAsc();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    public function sortPartsByTypeDesc()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectByTypeDesc();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    public function sortPartsByStrenghtAsc()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectByStrenghtAsc();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    public function sortPartsByStrenghtDesc()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectByStrenghtDesc();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    public function sortPartsBySpeedAsc()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectBySpeedAsc();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }

    public function sortPartsBySpeedDesc()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectByTypeDesc();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }
}
