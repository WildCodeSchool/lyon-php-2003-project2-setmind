<?php


namespace App\Controller;

use App\Model\PartManager;

class AdministrationController extends AbstractController
{


    public function index()
    {
        $partManager = new PartManager();
        $parts = $partManager->selectAll();
        return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
    }



    //TODO migrer cet usage en $post plutot que en explode url !!!
    /**
     * supported param format : <table name>=ASD or DESD
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


    /**
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function filter()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $partManager = new PartManager();
            $column = $_POST["selectFilterParts"];
            $searchString = $_POST["searchFilterParts"];
            $parts = $partManager->filterBy($column, $searchString);
            return $this->twig->render('Administration/index.html.twig', ['parts' => $parts]);
        }
        return $this->twig->render('Administration/index.html.twig');
    }

    /** TODO work inprogress
     * @return string
     * @throws \Twig\Error\LoaderError
     * @throws \Twig\Error\RuntimeError
     * @throws \Twig\Error\SyntaxError
     */
    public function updateDataBySrcAjax()
    {
        //$partManager = new PartManager();
       // $values = $_POST["name"];
        return "success but impossible to read post";
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
